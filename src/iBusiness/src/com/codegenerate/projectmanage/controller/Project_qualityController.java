package com.codegenerate.projectmanage.controller;

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

import com.codegenerate.projectmanage.entity.Project_qualityEntity;
import com.codegenerate.projectmanage.service.Project_qualityService;

/**   
 * @Title: Controller
 * @Description: 产品质监任务表
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("project_quality")
public class Project_qualityController {

    private MessageHelper messageHelper;
    private Project_qualityService project_qualityService;
   /**
     * 列表
     */
    @RequestMapping("project_quality-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = project_qualityService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/projectmanage/project_quality-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("project_quality-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Project_qualityEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = project_qualityService.get(id);
        } else {
            entity = new Project_qualityEntity();
        }
        
        // 默认值公式
        entity = (Project_qualityEntity) new FormulaCommon().defaultValue(entity, "IB_PROJECT_QUALITY");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/projectmanage/project_quality-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("project_quality-save")
    public String save(@ModelAttribute Project_qualityEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            project_qualityService.insert(entity);
        } else {
            project_qualityService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_quality/project_quality-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("project_quality-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Project_qualityEntity> entitys = project_qualityService.findByIds(selectedItem);
        for (Project_qualityEntity entity : entitys) {
            project_qualityService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/project_quality/project_quality-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("project_quality-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = project_qualityService.pagedQuery(page, propertyFilters);
        List<Project_qualityEntity> beans = (List<Project_qualityEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("产品质监任务表"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("projectno", "batchno", "producttype", "productflowid", "productno", "productname", "productmodel", "materialnum", "qualitydate", "qualityresult", "qualityuser", "qualityreport", "id");
        tableModel.setTableName("IB_PROJECT_QUALITY");
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
    @RequestMapping("project_quality-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("projectno", "batchno", "producttype", "productflowid", "productno", "productname", "productmodel", "materialnum", "qualitydate", "qualityresult", "qualityuser", "qualityreport", "id");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.projectmanage.entity.Project_qualityEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_quality/project_quality-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setProject_qualityService(Project_qualityService project_qualityService) {
        this.project_qualityService = project_qualityService;
    }
    
}
