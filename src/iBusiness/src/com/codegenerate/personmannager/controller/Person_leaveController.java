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

import com.codegenerate.personmannager.entity.Person_leaveEntity;
import com.codegenerate.personmannager.service.Person_leaveService;

/**   
 * @Title: Controller
 * @Description: 员工离职页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("person_leave")
public class Person_leaveController {

    private MessageHelper messageHelper;
    private Person_leaveService person_leaveService;
   /**
     * 列表
     */
    @RequestMapping("person_leave-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = person_leaveService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/person_leave-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("person_leave-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Person_leaveEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = person_leaveService.get(id);
        } else {
            entity = new Person_leaveEntity();
        }
        
        // 默认值公式
        entity = (Person_leaveEntity) new FormulaCommon().defaultValue(entity, "IB_PERSON_LEAVE");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> leavesortFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_LEAVE", "personLeave");List<com.ibusiness.common.model.ConfSelectItem> leavesortItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(leavesortFTCMap.get("LEAVESORT").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("leavesortItems", leavesortItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> leavestateFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_LEAVE", "personLeave");List<com.ibusiness.common.model.ConfSelectItem> leavestateItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(leavestateFTCMap.get("LEAVESTATE").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("leavestateItems", leavestateItems);
        return "codegenerate/personmannager/person_leave-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("person_leave-save")
    public String save(@ModelAttribute Person_leaveEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            person_leaveService.insert(entity);
        } else {
            person_leaveService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/person_leave/person_leave-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("person_leave-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Person_leaveEntity> entitys = person_leaveService.findByIds(selectedItem);
        for (Person_leaveEntity entity : entitys) {
            person_leaveService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/person_leave/person_leave-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("person_leave-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = person_leaveService.pagedQuery(page, propertyFilters);
        List<Person_leaveEntity> beans = (List<Person_leaveEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("员工离职页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("name", "leavesort", "leavestate", "leavesection", "leavejob", "leavedate", "stopdate", "remark", "id", "scopeid");
        tableModel.setTableName("IB_PERSON_LEAVE");
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
    @RequestMapping("person_leave-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("name", "leavesort", "leavestate", "leavesection", "leavejob", "leavedate", "stopdate", "remark", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Person_leaveEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/person_leave/person_leave-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setPerson_leaveService(Person_leaveService person_leaveService) {
        this.person_leaveService = person_leaveService;
    }
    
}
