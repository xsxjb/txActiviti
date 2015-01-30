package com.codegenerate.projectmanage.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;
import com.ibusiness.common.service.FormulaCommon;
import com.ibusiness.common.service.CommonBusiness;

import com.ibusiness.security.util.SpringSecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.task.Task;
import org.apache.commons.io.IOUtils;

import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.bpm.cmd.ProcessInstanceDiagramCmd;
import com.ibusiness.bpm.service.BpmComBusiness;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.security.util.SpringSecurityUtils;

import com.codegenerate.projectmanage.entity.BomEntity;
import com.codegenerate.projectmanage.service.BomService;
import com.codegenerate.projectmanage.entity.Bom_materialsEntity;
import com.codegenerate.projectmanage.service.Bom_materialsService;

/**   
 * @Title: Controller
 * @Description: 原料BOM分解表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("bom")
public class BomController {

    private MessageHelper messageHelper;
    private BomService bomService;
        private Bom_materialsService bom_materialsService;
   /**
     * 列表
     */
    @RequestMapping("bom-list")
    public String list(@ModelAttribute Page page,  @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = bomService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/projectmanage/bom-list.jsp";
    }
    /**
     * 进入主表表单编辑页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("bom-input")
    public String input(@ModelAttribute Page page,  @RequestParam(value = "id", required = false) String id, Model model) {
        BomEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = bomService.get(id);
        } else {
            entity = new BomEntity();
        }
        // 默认值公式
        entity = (BomEntity) new FormulaCommon().defaultValue(entity, "IB_BOM");
        
        model.addAttribute("model", entity);
        // 子表信息
        Map<String, Object> map = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(map);
        propertyFilters.add(new PropertyFilter("EQS_parentid", id));
        // 根据条件查询数据
	        page = bom_materialsService.pagedQuery(page, propertyFilters);
	        model.addAttribute("bom_materialsPage", page);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/projectmanage/bom-input.jsp";
    }
    
    /**
     * 子表新建
     */
    @RequestMapping("bom_materials-input")
    public String bom_materialsInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Bom_materialsEntity entity = bom_materialsService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/projectmanage/bom_materials-input.jsp";
    }
    /**
     * 保存主表
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("bom-save")
    public String saveDraft(@ModelAttribute BomEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            bomService.insert(entity);
            id = entity.getId();
        } else {
            bomService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/bom/bom-input.do?id=" + id;
    }
    /**
     * 子表保存
     */
    @RequestMapping("bom_materials-save")
    public String subSave(@ModelAttribute Bom_materialsEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            bom_materialsService.insert(entity);
        } else {
            bom_materialsService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/bom/bom-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("bom_materials-export")
    public void excelBom_materialsExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = bom_materialsService.pagedQuery(page, propertyFilters);
        List<Bom_materialsEntity> beans = (List<Bom_materialsEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("原料BOM分解表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("comments", "id", "materialname", "materialno", "materialnum", "materialprice", "materialtypeno", "materialunit", "model", "parentid", "stocktype");
        tableModel.setTableName("IB_BOM");
        tableModel.setData(beans);
        try {
            new ExcelCommon().exportExcel(response, tableModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 子表 excel导入
     */
    @RequestMapping("bom_materials-importExcel")
    public String importBom_materialsExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("comments", "id", "materialname", "materialno", "materialnum", "materialprice", "materialtypeno", "materialunit", "model", "parentid", "stocktype");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.projectmanage.entity.Bom_materialsEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/bom/bom-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("bom_materials-remove")
    public String bom_materialsRemove(@RequestParam("bom_materialsSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Bom_materialsEntity> entitys = bom_materialsService.findByIds(selectedItem);
        String parentid = null;
        for (Bom_materialsEntity entity : entitys) {
            parentid = entity.getParentid();
            bom_materialsService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/bom/bom-input.do?id=" + parentid;
    }
    /**
     * 删除一条主表信息
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("bom-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) {
        List<BomEntity> entitys = bomService.findByIds(selectedItem);
        for (BomEntity entity : entitys) {
            bomService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/bom/bom-list.do?flowId=" + flowId;
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setBomService(BomService bomService) {
        this.bomService = bomService;
    }
        @Resource
	    public void setBom_materialsService(Bom_materialsService bom_materialsService) {
	        this.bom_materialsService = bom_materialsService;
	    }
}
