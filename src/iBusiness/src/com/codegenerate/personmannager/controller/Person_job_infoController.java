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

import com.codegenerate.personmannager.entity.Person_job_infoEntity;
import com.codegenerate.personmannager.service.Person_job_infoService;

/**   
 * @Title: Controller
 * @Description: 人员就职页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("person_job_info")
public class Person_job_infoController {

    private MessageHelper messageHelper;
    private Person_job_infoService person_job_infoService;
   /**
     * 列表
     */
    @RequestMapping("person_job_info-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = person_job_infoService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/person_job_info-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("person_job_info-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Person_job_infoEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = person_job_infoService.get(id);
        } else {
            entity = new Person_job_infoEntity();
        }
        
        // 默认值公式
        entity = (Person_job_infoEntity) new FormulaCommon().defaultValue(entity, "IB_PERSON_JOB_INFO");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> adminlevelFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_JOB_INFO", "personWork");List<com.ibusiness.common.model.ConfSelectItem> adminlevelItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(adminlevelFTCMap.get("ADMINLEVEL").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("adminlevelItems", adminlevelItems);
        return "codegenerate/personmannager/person_job_info-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("person_job_info-save")
    public String save(@ModelAttribute Person_job_infoEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            person_job_infoService.insert(entity);
        } else {
            person_job_infoService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/person_job_info/person_job_info-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("person_job_info-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Person_job_infoEntity> entitys = person_job_infoService.findByIds(selectedItem);
        for (Person_job_infoEntity entity : entitys) {
            person_job_infoService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/person_job_info/person_job_info-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("person_job_info-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = person_job_infoService.pagedQuery(page, propertyFilters);
        List<Person_job_infoEntity> beans = (List<Person_job_infoEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("人员就职页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("name", "department", "post", "posttitle", "obtaindate", "identity", "adminlevel", "salarystandard", "enterdate", "remark", "id", "scopeid");
        tableModel.setTableName("IB_PERSON_JOB_INFO");
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
    @RequestMapping("person_job_info-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("name", "department", "post", "posttitle", "obtaindate", "identity", "adminlevel", "salarystandard", "enterdate", "remark", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Person_job_infoEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/person_job_info/person_job_info-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setPerson_job_infoService(Person_job_infoService person_job_infoService) {
        this.person_job_infoService = person_job_infoService;
    }
    
}
