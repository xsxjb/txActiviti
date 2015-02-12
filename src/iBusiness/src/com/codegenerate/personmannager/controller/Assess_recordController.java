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

import com.codegenerate.personmannager.entity.Assess_recordEntity;
import com.codegenerate.personmannager.service.Assess_recordService;

/**   
 * @Title: Controller
 * @Description: 考核记录页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("assess_record")
public class Assess_recordController {

    private MessageHelper messageHelper;
    private Assess_recordService assess_recordService;
   /**
     * 列表
     */
    @RequestMapping("assess_record-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = assess_recordService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/assess_record-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("assess_record-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Assess_recordEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = assess_recordService.get(id);
        } else {
            entity = new Assess_recordEntity();
        }
        
        // 默认值公式
        entity = (Assess_recordEntity) new FormulaCommon().defaultValue(entity, "IB_ASSESS_RECORD");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> checkrankFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_ASSESS_RECORD", "assessRecord");List<com.ibusiness.common.model.ConfSelectItem> checkrankItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(checkrankFTCMap.get("CHECKRANK").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("checkrankItems", checkrankItems);
        return "codegenerate/personmannager/assess_record-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("assess_record-save")
    public String save(@ModelAttribute Assess_recordEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            assess_recordService.insert(entity);
        } else {
            assess_recordService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/assess_record/assess_record-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("assess_record-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Assess_recordEntity> entitys = assess_recordService.findByIds(selectedItem);
        for (Assess_recordEntity entity : entitys) {
            assess_recordService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/assess_record/assess_record-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("assess_record-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = assess_recordService.pagedQuery(page, propertyFilters);
        List<Assess_recordEntity> beans = (List<Assess_recordEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("考核记录页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("name", "checktime", "job", "checkproject", "checkrank", "checkscore", "checkassess", "checker", "id", "scopeid");
        tableModel.setTableName("IB_ASSESS_RECORD");
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
    @RequestMapping("assess_record-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("name", "checktime", "job", "checkproject", "checkrank", "checkscore", "checkassess", "checker", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Assess_recordEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/assess_record/assess_record-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setAssess_recordService(Assess_recordService assess_recordService) {
        this.assess_recordService = assess_recordService;
    }
    
}
