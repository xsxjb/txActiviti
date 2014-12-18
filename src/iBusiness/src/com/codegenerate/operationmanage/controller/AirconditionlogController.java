package com.codegenerate.operationmanage.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codegenerate.operationmanage.entity.AirconditionlogEntity;
import com.codegenerate.operationmanage.service.AirconditionlogService;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.service.FormulaCommon;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.core.spring.MessageHelper;

/**   
 * @Title: Controller
 * @Description: 空调控制记录
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("airconditionlog")
public class AirconditionlogController {

    private MessageHelper messageHelper;
    private AirconditionlogService airconditionlogService;
   /**
     * 列表
     */
    @RequestMapping("airconditionlog-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = airconditionlogService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/operationmanage/airconditionlog-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("airconditionlog-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        AirconditionlogEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = airconditionlogService.get(id);
        } else {
            entity = new AirconditionlogEntity();
        }
        
        // 默认值公式
        entity = (AirconditionlogEntity) new FormulaCommon().defaultValue(entity, "IB_AIRCONDITIONLOG");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/operationmanage/airconditionlog-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("airconditionlog-save")
    public String save(@ModelAttribute AirconditionlogEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            airconditionlogService.insert(entity);
        } else {
            airconditionlogService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/airconditionlog/airconditionlog-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("airconditionlog-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<AirconditionlogEntity> entitys = airconditionlogService.findByIds(selectedItem);
        for (AirconditionlogEntity entity : entitys) {
            airconditionlogService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/airconditionlog/airconditionlog-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("airconditionlog-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = airconditionlogService.pagedQuery(page, propertyFilters);
        List<AirconditionlogEntity> beans = (List<AirconditionlogEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("空调控制记录"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "eventtime", "controlinfo", "controluser");
        tableModel.setTableName("IB_AIRCONDITIONLOG");
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
    @RequestMapping("airconditionlog-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "eventtime", "controlinfo", "controluser");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.operationmanage.entity.AirconditionlogEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/airconditionlog/airconditionlog-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setAirconditionlogService(AirconditionlogService airconditionlogService) {
        this.airconditionlogService = airconditionlogService;
    }
    
}
