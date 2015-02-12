package com.codegenerate.personmannager.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import java.io.File;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.security.util.SpringSecurityUtils;
import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.component.form.entity.ConfFormTableColumn;
import com.ibusiness.common.service.FormulaCommon;

import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;

import com.codegenerate.personmannager.entity.Person_moveEntity;
import com.codegenerate.personmannager.service.Person_moveService;

/**   
 * @Title: Controller
 * @Description: 人员调动页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("person_move")
public class Person_moveController {

    private MessageHelper messageHelper;
    private Person_moveService person_moveService;
   /**
     * 列表
     */
    @RequestMapping("person_move-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = person_moveService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/person_move-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("person_move-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Person_moveEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = person_moveService.get(id);
        } else {
            entity = new Person_moveEntity();
        }
        
        // 默认值公式
        entity = (Person_moveEntity) new FormulaCommon().defaultValue(entity, "IB_PERSON_MOVE");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> categoryFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_MOVE", "personMove");List<com.ibusiness.common.model.ConfSelectItem> categoryItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(categoryFTCMap.get("CATEGORY").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("categoryItems", categoryItems);
        return "codegenerate/personmannager/person_move-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("person_move-save")
    public String save(@ModelAttribute Person_moveEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            person_moveService.insert(entity);
        } else {
            person_moveService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/person_move/person_move-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("person_move-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Person_moveEntity> entitys = person_moveService.findByIds(selectedItem);
        for (Person_moveEntity entity : entitys) {
            person_moveService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/person_move/person_move-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("person_move-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = person_moveService.pagedQuery(page, propertyFilters);
        List<Person_moveEntity> beans = (List<Person_moveEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("人员调动页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("name", "category", "beforesection", "nowsection", "beforejob", "nowjob", "oldstandard", "newstandard", "movedate", "remark", "id", "scopeid");
        tableModel.setTableName("IB_PERSON_MOVE");
        tableModel.setData(beans);
        try {
            new ExcelCommon().exportExcel(response, tableModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * excel导入
     */
    @RequestMapping("person_move-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("name", "category", "beforesection", "nowsection", "beforejob", "nowjob", "oldstandard", "newstandard", "movedate", "remark", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Person_moveEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/person_move/person_move-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setPerson_moveService(Person_moveService person_moveService) {
        this.person_moveService = person_moveService;
    }
    
}
