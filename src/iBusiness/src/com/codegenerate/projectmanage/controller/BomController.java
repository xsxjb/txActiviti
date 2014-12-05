package com.codegenerate.projectmanage.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.task.Task;
import org.apache.commons.io.IOUtils;

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
 * @Description: 原料BOM分解表
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
        // 根据条件查询数据
        page = bomService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/projectmanage/bom-list.jsp";
    }
    /**
     * 新建一条流程, 进入流程表单信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("bom-input")
    public String input(@ModelAttribute Page page, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "id", required = false) String id, Model model) {
        BomEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = bomService.get(id);
        } else {
            entity = new BomEntity();
        }
        model.addAttribute("model", entity);
        // 子表信息
        Map<String, Object> map = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(map);
        propertyFilters.add(new PropertyFilter("EQS_parentid", id));
        // 根据条件查询数据
	        page = bom_materialsService.pagedQuery(page, propertyFilters);
	        model.addAttribute("page", page);
        
        // 流程ID
        model.addAttribute("flowId", flowId);
        
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
        return "redirect:/bom/bom-input.do?flowId=" + flowId + "&id=" + entity.getParentid();
    }
    /**
     * 删除一条流程信息
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
