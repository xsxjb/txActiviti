package com.codegenerate.designmanage.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
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

import com.codegenerate.designmanage.entity.Project_progressEntity;
import com.codegenerate.designmanage.service.Project_progressService;
import com.codegenerate.designmanage.entity.Pp_demolition_imgEntity;
import com.codegenerate.designmanage.service.Pp_demolition_imgService;
import com.codegenerate.designmanage.entity.Pp_design_imgEntity;
import com.codegenerate.designmanage.service.Pp_design_imgService;
import com.codegenerate.designmanage.entity.Pp_done_imgEntity;
import com.codegenerate.designmanage.service.Pp_done_imgService;
import com.codegenerate.designmanage.entity.Pp_floor_imgEntity;
import com.codegenerate.designmanage.service.Pp_floor_imgService;
import com.codegenerate.designmanage.entity.Pp_metal_imgEntity;
import com.codegenerate.designmanage.service.Pp_metal_imgService;
import com.codegenerate.designmanage.entity.Pp_surface_imgEntity;
import com.codegenerate.designmanage.service.Pp_surface_imgService;
import com.codegenerate.designmanage.entity.Pp_tile_imgEntity;
import com.codegenerate.designmanage.service.Pp_tile_imgService;
import com.codegenerate.designmanage.entity.Pp_wall_imgEntity;
import com.codegenerate.designmanage.service.Pp_wall_imgService;
import com.codegenerate.designmanage.entity.Pp_water_imgEntity;
import com.codegenerate.designmanage.service.Pp_water_imgService;

/**   
 * @Title: Controller
 * @Description: 装饰进度管理表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("project_progress")
public class Project_progressController {

    private MessageHelper messageHelper;
    private com.ibusiness.doc.store.StoreConnector storeConnector;
    private Project_progressService project_progressService;
        private Pp_demolition_imgService pp_demolition_imgService;
        private Pp_design_imgService pp_design_imgService;
        private Pp_done_imgService pp_done_imgService;
        private Pp_floor_imgService pp_floor_imgService;
        private Pp_metal_imgService pp_metal_imgService;
        private Pp_surface_imgService pp_surface_imgService;
        private Pp_tile_imgService pp_tile_imgService;
        private Pp_wall_imgService pp_wall_imgService;
        private Pp_water_imgService pp_water_imgService;
   /**
     * 列表
     */
    @RequestMapping("project_progress-list")
    public String list(@ModelAttribute Page page,  @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = project_progressService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/designmanage/project_progress-list.jsp";
    }
    /**
     * 进入主表表单编辑页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("project_progress-input")
    public String input(@ModelAttribute Page page,  @RequestParam(value = "id", required = false) String id, Model model) {
        Project_progressEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = project_progressService.get(id);
        } else {
            entity = new Project_progressEntity();
        }
        // 默认值公式
        entity = (Project_progressEntity) new FormulaCommon().defaultValue(entity, "IB_PROJECT_PROGRESS");
        
        model.addAttribute("model", entity);
        // 子表信息
        Map<String, Object> map = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(map);
        propertyFilters.add(new PropertyFilter("EQS_parentid", id));
        // 根据条件查询数据
	        page = pp_demolition_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_demolition_imgPage", page);
	        page = pp_design_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_design_imgPage", page);
	        page = pp_done_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_done_imgPage", page);
	        page = pp_floor_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_floor_imgPage", page);
	        page = pp_metal_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_metal_imgPage", page);
	        page = pp_surface_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_surface_imgPage", page);
	        page = pp_tile_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_tile_imgPage", page);
	        page = pp_wall_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_wall_imgPage", page);
	        page = pp_water_imgService.pagedQuery(page, propertyFilters);
	        model.addAttribute("pp_water_imgPage", page);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> currentprogressFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PROJECT_PROGRESS", "projectprogress");List<com.ibusiness.common.model.ConfSelectItem> currentprogressItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(currentprogressFTCMap.get("CURRENTPROGRESS").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("currentprogressItems", currentprogressItems);
        return "codegenerate/designmanage/project_progress-input.jsp";
    }
    /**
     * 控件添加的方法 ========
     */
                @ResponseBody @RequestMapping("customername-list")public String ajaxroomlist(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap) {List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);page = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.codegenerate.crmmanage.service.Customer_infoService.class).pagedQuery(page, propertyFilters);List list = (java.util.ArrayList)page.getResult();return CommonUtils.getJsonFromList(list, null).toString();}
        
    /**
     * 添加子表控件的方法 ========
     */
	@ResponseBody
	@RequestMapping("imgurl-upload")
	public String imgurlUpload(
			@org.springframework.beans.factory.annotation.Qualifier("attachment") MultipartFile attachment,
			HttpServletResponse response) {
		com.ibusiness.doc.store.StoreDTO storeDTO = null;
		if (null != attachment && attachment.getSize() > 0) {
			try {
				storeDTO = storeConnector.save("progress",
						attachment.getInputStream(),
						attachment.getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null == storeDTO ? "" : storeDTO.getKey();
	}


	/**
     * 子表新建
     */
    @RequestMapping("pp_demolition_img-input")
    public String pp_demolition_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_demolition_imgEntity entity = pp_demolition_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_demolition_img-input.jsp";
    }
    /**
     * 添加子表控件的方法 ========
     */
    /**
     * 子表新建
     */
    @RequestMapping("pp_design_img-input")
    public String pp_design_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_design_imgEntity entity = pp_design_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_design_img-input.jsp";
    }

 /**
     * 子表新建
     */
    @RequestMapping("pp_done_img-input")
    public String pp_done_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_done_imgEntity entity = pp_done_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_done_img-input.jsp";
    }
    /**
     * 添加子表控件的方法 ========
     */
    /**
     * 子表新建
     */
    @RequestMapping("pp_floor_img-input")
    public String pp_floor_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_floor_imgEntity entity = pp_floor_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_floor_img-input.jsp";
    }
    /**
     * 添加子表控件的方法 ========
     */
    /**
     * 子表新建
     */
    @RequestMapping("pp_metal_img-input")
    public String pp_metal_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_metal_imgEntity entity = pp_metal_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_metal_img-input.jsp";
    }
    /**
     * 添加子表控件的方法 ========
     */
    /**
     * 子表新建
     */
    @RequestMapping("pp_surface_img-input")
    public String pp_surface_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_surface_imgEntity entity = pp_surface_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_surface_img-input.jsp";
    }
    /**
     * 添加子表控件的方法 ========
     */
    /**
     * 子表新建
     */
    @RequestMapping("pp_tile_img-input")
    public String pp_tile_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_tile_imgEntity entity = pp_tile_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_tile_img-input.jsp";
    }
    /**
     * 添加子表控件的方法 ========
     */
    /**
     * 子表新建
     */
    @RequestMapping("pp_wall_img-input")
    public String pp_wall_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_wall_imgEntity entity = pp_wall_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_wall_img-input.jsp";
    }
    /**
     * 添加子表控件的方法 ========
     */
    /**
     * 子表新建
     */
    @RequestMapping("pp_water_img-input")
    public String pp_water_imgInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Pp_water_imgEntity entity = pp_water_imgService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/pp_water_img-input.jsp";
    }
    /**
     * 保存主表
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("project_progress-save")
    public String saveDraft(@ModelAttribute Project_progressEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            project_progressService.insert(entity);
            id = entity.getId();
        } else {
            project_progressService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + id;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_demolition_img-save")
    public String subSave(@ModelAttribute Pp_demolition_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_demolition_imgService.insert(entity);
        } else {
            pp_demolition_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_demolition_img-export")
    public void excelPp_demolition_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_demolition_imgService.pagedQuery(page, propertyFilters);
        List<Pp_demolition_imgEntity> beans = (List<Pp_demolition_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_demolition_img-importExcel")
    public String importPp_demolition_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_demolition_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_demolition_img-remove")
    public String pp_demolition_imgRemove(@RequestParam("pp_demolition_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_demolition_imgEntity> entitys = pp_demolition_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_demolition_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_demolition_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_design_img-save")
    public String subSave(@ModelAttribute Pp_design_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_design_imgService.insert(entity);
        } else {
            pp_design_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_design_img-export")
    public void excelPp_design_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_design_imgService.pagedQuery(page, propertyFilters);
        List<Pp_design_imgEntity> beans = (List<Pp_design_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_design_img-importExcel")
    public String importPp_design_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_design_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_design_img-remove")
    public String pp_design_imgRemove(@RequestParam("pp_design_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_design_imgEntity> entitys = pp_design_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_design_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_design_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_done_img-save")
    public String subSave(@ModelAttribute Pp_done_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_done_imgService.insert(entity);
        } else {
            pp_done_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_done_img-export")
    public void excelPp_done_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_done_imgService.pagedQuery(page, propertyFilters);
        List<Pp_done_imgEntity> beans = (List<Pp_done_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_done_img-importExcel")
    public String importPp_done_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_done_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_done_img-remove")
    public String pp_done_imgRemove(@RequestParam("pp_done_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_done_imgEntity> entitys = pp_done_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_done_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_done_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_floor_img-save")
    public String subSave(@ModelAttribute Pp_floor_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_floor_imgService.insert(entity);
        } else {
            pp_floor_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_floor_img-export")
    public void excelPp_floor_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_floor_imgService.pagedQuery(page, propertyFilters);
        List<Pp_floor_imgEntity> beans = (List<Pp_floor_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_floor_img-importExcel")
    public String importPp_floor_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_floor_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_floor_img-remove")
    public String pp_floor_imgRemove(@RequestParam("pp_floor_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_floor_imgEntity> entitys = pp_floor_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_floor_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_floor_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_metal_img-save")
    public String subSave(@ModelAttribute Pp_metal_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_metal_imgService.insert(entity);
        } else {
            pp_metal_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_metal_img-export")
    public void excelPp_metal_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_metal_imgService.pagedQuery(page, propertyFilters);
        List<Pp_metal_imgEntity> beans = (List<Pp_metal_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imginfo", "imgurl");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_metal_img-importExcel")
    public String importPp_metal_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imginfo", "imgurl");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_metal_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_metal_img-remove")
    public String pp_metal_imgRemove(@RequestParam("pp_metal_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_metal_imgEntity> entitys = pp_metal_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_metal_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_metal_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_surface_img-save")
    public String subSave(@ModelAttribute Pp_surface_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_surface_imgService.insert(entity);
        } else {
            pp_surface_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_surface_img-export")
    public void excelPp_surface_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_surface_imgService.pagedQuery(page, propertyFilters);
        List<Pp_surface_imgEntity> beans = (List<Pp_surface_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_surface_img-importExcel")
    public String importPp_surface_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_surface_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_surface_img-remove")
    public String pp_surface_imgRemove(@RequestParam("pp_surface_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_surface_imgEntity> entitys = pp_surface_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_surface_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_surface_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_tile_img-save")
    public String subSave(@ModelAttribute Pp_tile_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_tile_imgService.insert(entity);
        } else {
            pp_tile_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_tile_img-export")
    public void excelPp_tile_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_tile_imgService.pagedQuery(page, propertyFilters);
        List<Pp_tile_imgEntity> beans = (List<Pp_tile_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_tile_img-importExcel")
    public String importPp_tile_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_tile_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_tile_img-remove")
    public String pp_tile_imgRemove(@RequestParam("pp_tile_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_tile_imgEntity> entitys = pp_tile_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_tile_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_tile_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_wall_img-save")
    public String subSave(@ModelAttribute Pp_wall_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_wall_imgService.insert(entity);
        } else {
            pp_wall_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_wall_img-export")
    public void excelPp_wall_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_wall_imgService.pagedQuery(page, propertyFilters);
        List<Pp_wall_imgEntity> beans = (List<Pp_wall_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_wall_img-importExcel")
    public String importPp_wall_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_wall_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_wall_img-remove")
    public String pp_wall_imgRemove(@RequestParam("pp_wall_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_wall_imgEntity> entitys = pp_wall_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_wall_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_wall_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("pp_water_img-save")
    public String subSave(@ModelAttribute Pp_water_imgEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            pp_water_imgService.insert(entity);
        } else {
            pp_water_imgService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/project_progress/project_progress-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("pp_water_img-export")
    public void excelPp_water_imgExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = pp_water_imgService.pagedQuery(page, propertyFilters);
        List<Pp_water_imgEntity> beans = (List<Pp_water_imgEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("装饰进度管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
        tableModel.setTableName("IB_PROJECT_PROGRESS");
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
    @RequestMapping("pp_water_img-importExcel")
    public String importPp_water_imgExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "imgurl", "imginfo");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Pp_water_imgEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("pp_water_img-remove")
    public String pp_water_imgRemove(@RequestParam("pp_water_imgSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Pp_water_imgEntity> entitys = pp_water_imgService.findByIds(selectedItem);
        String parentid = null;
        for (Pp_water_imgEntity entity : entitys) {
            parentid = entity.getParentid();
            pp_water_imgService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/project_progress/project_progress-input.do?id=" + parentid;
    }
    /**
     * 删除一条主表信息
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("project_progress-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) {
        List<Project_progressEntity> entitys = project_progressService.findByIds(selectedItem);
        for (Project_progressEntity entity : entitys) {
            project_progressService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/project_progress/project_progress-list.do?flowId=" + flowId;
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setProject_progressService(Project_progressService project_progressService) {
        this.project_progressService = project_progressService;
    }
    @Resource
	public void setStoreConnector(com.ibusiness.doc.store.StoreConnector storeConnector) {
	    this.storeConnector = storeConnector;
	}
        @Resource
	    public void setPp_demolition_imgService(Pp_demolition_imgService pp_demolition_imgService) {
	        this.pp_demolition_imgService = pp_demolition_imgService;
	    }
        @Resource
	    public void setPp_design_imgService(Pp_design_imgService pp_design_imgService) {
	        this.pp_design_imgService = pp_design_imgService;
	    }
        @Resource
	    public void setPp_done_imgService(Pp_done_imgService pp_done_imgService) {
	        this.pp_done_imgService = pp_done_imgService;
	    }
        @Resource
	    public void setPp_floor_imgService(Pp_floor_imgService pp_floor_imgService) {
	        this.pp_floor_imgService = pp_floor_imgService;
	    }
        @Resource
	    public void setPp_metal_imgService(Pp_metal_imgService pp_metal_imgService) {
	        this.pp_metal_imgService = pp_metal_imgService;
	    }
        @Resource
	    public void setPp_surface_imgService(Pp_surface_imgService pp_surface_imgService) {
	        this.pp_surface_imgService = pp_surface_imgService;
	    }
        @Resource
	    public void setPp_tile_imgService(Pp_tile_imgService pp_tile_imgService) {
	        this.pp_tile_imgService = pp_tile_imgService;
	    }
        @Resource
	    public void setPp_wall_imgService(Pp_wall_imgService pp_wall_imgService) {
	        this.pp_wall_imgService = pp_wall_imgService;
	    }
        @Resource
	    public void setPp_water_imgService(Pp_water_imgService pp_water_imgService) {
	        this.pp_water_imgService = pp_water_imgService;
	    }
}
