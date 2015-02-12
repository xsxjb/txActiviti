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

import com.codegenerate.personmannager.entity.Person_infoEntity;
import com.codegenerate.personmannager.service.Person_infoService;

/**   
 * @Title: Controller
 * @Description: 人事档案管理页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("person_info")
public class Person_infoController {

    private MessageHelper messageHelper;
    private Person_infoService person_infoService;
   /**
     * 列表
     */
    @RequestMapping("person_info-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = person_infoService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/person_info-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("person_info-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Person_infoEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = person_infoService.get(id);
        } else {
            entity = new Person_infoEntity();
        }
        
        // 默认值公式
        entity = (Person_infoEntity) new FormulaCommon().defaultValue(entity, "IB_PERSON_INFO");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, Object> nameParameterMap = new java.util.HashMap<String, Object>();List<PropertyFilter> namePropertyFilters = PropertyFilter.buildFromMap(nameParameterMap);Page namePage = new Page();namePage = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.codegenerate.personmannager.service.Person_infoService.class).pagedQuery(namePage, namePropertyFilters);model.addAttribute("namePage", namePage);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> genderFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_INFO", "personInfo");List<com.ibusiness.common.model.ConfSelectItem> genderItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(genderFTCMap.get("GENDER").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("genderItems", genderItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> politicsstatusFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_INFO", "personInfo");List<com.ibusiness.common.model.ConfSelectItem> politicsstatusItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(politicsstatusFTCMap.get("POLITICSSTATUS").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("politicsstatusItems", politicsstatusItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> maritalstatusFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_INFO", "personInfo");List<com.ibusiness.common.model.ConfSelectItem> maritalstatusItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(maritalstatusFTCMap.get("MARITALSTATUS").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("maritalstatusItems", maritalstatusItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> culturestandardFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PERSON_INFO", "personInfo");List<com.ibusiness.common.model.ConfSelectItem> culturestandardItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(culturestandardFTCMap.get("CULTURESTANDARD").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("culturestandardItems", culturestandardItems);
        return "codegenerate/personmannager/person_info-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("person_info-save")
    public String save(@ModelAttribute Person_infoEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            person_infoService.insert(entity);
        } else {
            person_infoService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/person_info/person_info-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("person_info-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Person_infoEntity> entitys = person_infoService.findByIds(selectedItem);
        for (Person_infoEntity entity : entitys) {
            person_infoService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/person_info/person_info-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("person_info-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = person_infoService.pagedQuery(page, propertyFilters);
        List<Person_infoEntity> beans = (List<Person_infoEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("人事档案管理页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("jobnum", "name", "gender", "birth", "birthplace", "politicsstatus", "idcard", "maritalstatus", "culturestandard", "graduateschool", "major", "graduatedate", "phone", "address", "tel", "hkadr", "zipcode", "origanizationcode", "post", "posttitle", "enterdate", "fulldate", "leavedate", "contracttype", "treatment", "originalworkunit", "bondsman", "resume", "remark", "id", "scopeid");
        tableModel.setTableName("IB_PERSON_INFO");
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
    @RequestMapping("person_info-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("jobnum", "name", "gender", "birth", "birthplace", "politicsstatus", "idcard", "maritalstatus", "culturestandard", "graduateschool", "major", "graduatedate", "phone", "address", "tel", "hkadr", "zipcode", "origanizationcode", "post", "posttitle", "enterdate", "fulldate", "leavedate", "contracttype", "treatment", "originalworkunit", "bondsman", "resume", "remark", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Person_infoEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/person_info/person_info-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setPerson_infoService(Person_infoService person_infoService) {
        this.person_infoService = person_infoService;
    }
    
}
