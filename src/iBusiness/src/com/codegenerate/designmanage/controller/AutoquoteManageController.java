package com.codegenerate.designmanage.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codegenerate.designmanage.entity.AutoquoteBathEntity;
import com.codegenerate.designmanage.entity.AutoquoteBedroomEntity;
import com.codegenerate.designmanage.entity.AutoquoteManageEntity;
import com.codegenerate.designmanage.entity.AutoquoteHallEntity;
import com.codegenerate.designmanage.entity.AutoquoteKitchenEntity;
import com.codegenerate.designmanage.entity.AutoquoteVerandaEntity;
import com.codegenerate.designmanage.service.AutoquoteBathService;
import com.codegenerate.designmanage.service.AutoquoteBedroomService;
import com.codegenerate.designmanage.service.AutoquoteHallService;
import com.codegenerate.designmanage.service.AutoquoteKitchenService;
import com.codegenerate.designmanage.service.AutoquoteService;
import com.codegenerate.designmanage.service.AutoquoteVerandaService;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.core.spring.MessageHelper;

/**   
 * @Title: Controller
 * @Description: 自动报价页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("autoquote")
public class AutoquoteManageController {

    private MessageHelper messageHelper;
    private AutoquoteService autoquoteService;
        private AutoquoteBathService autoquoteBathService;
        private AutoquoteBedroomService autoquoteBedroomService;
        private AutoquoteHallService autoquoteHallService;
        private AutoquoteKitchenService autoquoteKitchenService;
        private AutoquoteVerandaService autoquoteVerandaService;
   /**
     * 列表
     */
    @RequestMapping("autoquote-list")
    public String list(@ModelAttribute Page page,  @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = autoquoteService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/designmanage/autoquote-list.jsp";
    }
    /**
     * 进入主表表单编辑页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("autoquote-input")
    public String input(@ModelAttribute Page page,  @RequestParam(value = "id", required = false) String id, Model model) {
        // 吊顶面积
    	Double ceilingarea=0.0;
    	// 瓷砖面积
    	Double tilearea=0.0;
    	// 地板面积
    	Double floorarea=0.0;
    	// 涂料面积
    	Double paintarea=0.0;
    	// 总使用面积
    	Double totaluserarea=0.0;
    	
    	// 计算数据
        AutoquoteManageEntity entity = new AutoquoteManageEntity();
    	List<AutoquoteManageEntity> list = autoquoteService.getAll();
    	if (null != list && list.size() > 0) {
    		entity = list.get(0);
    	} else {
    		// 初始化数据
    		entity.setCeilingUPrice(100.0);
    		entity.setTileUPrice(100.0);
    		entity.setFloorUPrice(400.0);
    		entity.setPaintUPrice(30.0);
    	}
        // 子表信息
        // 浴室/洗手间
        List<AutoquoteBathEntity> bathList = autoquoteBathService.getAll();
        for (AutoquoteBathEntity bathEntity : bathList) {
        	// 使用面积
        	totaluserarea = totaluserarea + bathEntity.getBathArea();
        	// 吊顶面积
        	ceilingarea = ceilingarea + bathEntity.getBathArea();
        	// 瓷砖面积
        	Double areaBy4wall = bathEntity.getBathDepth() * bathEntity.getBathHeight()*2 + bathEntity.getBathWidth() * bathEntity.getBathHeight()*2 + bathEntity.getBathWidth() * bathEntity.getBathDepth();
        	tilearea = tilearea + CommonUtils.formatDoubleBy2Decimal(areaBy4wall) - bathEntity.getDoorArea();
        }
        model.addAttribute("autoquote_bathPage", bathList);
        
        // 卧室
        List<AutoquoteBedroomEntity> bedroomList= autoquoteBedroomService.getAll();
        for (AutoquoteBedroomEntity bedroomEntity : bedroomList) {
        	// 使用面积
        	totaluserarea = totaluserarea + bedroomEntity.getBedroomarea();
        	// 地板面积
        	floorarea = floorarea + bedroomEntity.getBedroomarea();
        	// 涂料面积
        	Double areaBy4wall = bedroomEntity.getBedroomdepth() * bedroomEntity.getBedroomheight()*2 + bedroomEntity.getBedroomwidth() * bedroomEntity.getBedroomheight()*2 + bedroomEntity.getBedroomwidth() * bedroomEntity.getBedroomdepth();
        	paintarea = paintarea + CommonUtils.formatDoubleBy2Decimal(areaBy4wall) - bedroomEntity.getDoorArea();
        }
        model.addAttribute("autoquote_bedroomPage", bedroomList);
        
        // 客厅
        List<AutoquoteHallEntity> hallList = autoquoteHallService.getAll();
        for (AutoquoteHallEntity hallEntity : hallList) {
        	// 使用面积
        	totaluserarea = totaluserarea + hallEntity.getHallarea();
        	// 地板面积
        	floorarea = floorarea + hallEntity.getHallarea();
        	// 涂料面积
        	Double areaBy4wall = hallEntity.getHalldepth() * hallEntity.getHallheight()*2 + hallEntity.getHallwidth() * hallEntity.getHallheight()*2 + hallEntity.getHallwidth() * hallEntity.getHalldepth();
        	paintarea = paintarea + CommonUtils.formatDoubleBy2Decimal(areaBy4wall) - hallEntity.getDoorArea();
        }
        model.addAttribute("autoquote_hallPage", hallList);
        
        // 厨房
        List<AutoquoteKitchenEntity> kitchenList = autoquoteKitchenService.getAll();
        for (AutoquoteKitchenEntity kitchenEntity : kitchenList) {
        	// 使用面积
        	totaluserarea = totaluserarea + kitchenEntity.getKitchenarea();
        	// 吊顶面积
        	ceilingarea = ceilingarea + kitchenEntity.getKitchenarea();
        	// 瓷砖面积
        	Double areaBy4wall = kitchenEntity.getKitchendepth() * kitchenEntity.getKitchenheight()*2 + kitchenEntity.getKitchenwidth() * kitchenEntity.getKitchenheight()*2 + kitchenEntity.getKitchenwidth() * kitchenEntity.getKitchendepth();
        	tilearea = tilearea + CommonUtils.formatDoubleBy2Decimal(areaBy4wall) - kitchenEntity.getDoorArea();
        }
        model.addAttribute("autoquote_kitchenPage", kitchenList);
        
        // 阳台
        List<AutoquoteVerandaEntity> verandaList = autoquoteVerandaService.getAll();
        for (AutoquoteVerandaEntity verandaEntity : verandaList) {
        	// 使用面积
        	totaluserarea = totaluserarea + verandaEntity.getVerandaarea();
        	// 吊顶面积
        	ceilingarea = ceilingarea + verandaEntity.getVerandaarea();
        	// 瓷砖面积
        	Double areaBy4wall = verandaEntity.getVerandadepth() * verandaEntity.getVerandaheight()*2 + verandaEntity.getVerandawidth() * verandaEntity.getVerandaheight()*2 + verandaEntity.getVerandawidth() * verandaEntity.getVerandadepth();
        	tilearea = tilearea + CommonUtils.formatDoubleBy2Decimal(areaBy4wall) - verandaEntity.getDoorArea();
        }
        model.addAttribute("autoquote_verandaPage", verandaList);
        
        // 计算数据
        // 吊顶面积
        entity.setCeilingarea(CommonUtils.formatDoubleBy2Decimal(ceilingarea));
        // 吊顶金额
        if (null == entity.getCeilingUPrice()) {entity.setCeilingUPrice(1.0);}
        entity.setCeilingamount(entity.getCeilingarea() * entity.getCeilingUPrice());
        // 瓷砖面积
    	entity.setTilearea(CommonUtils.formatDoubleBy2Decimal(tilearea));
    	// 瓷砖金额
    	if (null == entity.getTileUPrice()) {entity.setTileUPrice(1.0);}
    	entity.setTileamount(entity.getTilearea() * entity.getTileUPrice());
    	// 地板面积
    	entity.setFloorarea(CommonUtils.formatDoubleBy2Decimal(floorarea));
    	if (null == entity.getFloorUPrice()) {entity.setFloorUPrice(1.0);}
    	entity.setFlooramount(entity.getFloorarea()*entity.getFloorUPrice());
    	// 墙漆/涂料面积
    	entity.setPaintarea(CommonUtils.formatDoubleBy2Decimal(paintarea));
    	if (null == entity.getPaintUPrice()) {entity.setPaintUPrice(1.0);}
    	entity.setPaintamount(entity.getPaintarea()*entity.getPaintUPrice());
    	// 总建筑面积
    	entity.setTotalbuildarea(0.0);
    	// 总使用面积
    	entity.setTotaluserarea(totaluserarea);
    	// 总金额
    	if (null == entity.getArtificialAmount()) {entity.setArtificialAmount(0.0);}
    	entity.setTotalamount(entity.getCeilingamount()+entity.getTileamount()+entity.getFlooramount()+entity.getPaintamount()+entity.getArtificialAmount());
    	
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/designmanage/autoquoteInput.jsp";
    }
    /**
     * 计算----保存主表
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("autoquote-save")
    public String saveDraft(@ModelAttribute AutoquoteManageEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            autoquoteService.insert(entity);
            id = entity.getId();
        } else {
            autoquoteService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/autoquote/autoquote-input.do?id=" + id;
    }
    /**
     * 子表新建
     */
    @RequestMapping("autoquote_bath-input")
    public String autoquote_bathInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        AutoquoteBathEntity entity = autoquoteBathService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/designmanage/autoquote_bath-input.jsp";
    }
    /**
     * 子表新建
     */
    @RequestMapping("autoquote_bedroom-input")
    public String autoquote_bedroomInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        AutoquoteBedroomEntity entity = autoquoteBedroomService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/designmanage/autoquote_bedroom-input.jsp";
    }
    /**
     * 子表新建
     */
    @RequestMapping("autoquote_hall-input")
    public String autoquote_hallInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        AutoquoteHallEntity entity = autoquoteHallService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/designmanage/autoquote_hall-input.jsp";
    }
    /**
     * 子表新建
     */
    @RequestMapping("autoquote_kitchen-input")
    public String autoquote_kitchenInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        AutoquoteKitchenEntity entity = autoquoteKitchenService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/designmanage/autoquote_kitchen-input.jsp";
    }
    /**
     * 子表新建
     */
    @RequestMapping("autoquote_veranda-input")
    public String autoquote_verandaInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        AutoquoteVerandaEntity entity = autoquoteVerandaService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/designmanage/autoquote_veranda-input.jsp";
    }
    /**
     * 子表保存
     */
    @RequestMapping("autoquote_bath-save")
    public String subSave(@ModelAttribute AutoquoteBathEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            autoquoteBathService.insert(entity);
        } else {
            autoquoteBathService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/autoquote/autoquote-input.do?id=" + entity.getParentid();
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("autoquote_bath-remove")
    public String autoquote_bathRemove(@RequestParam("autoquote_bathSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<AutoquoteBathEntity> entitys = autoquoteBathService.findByIds(selectedItem);
        String parentid = null;
        for (AutoquoteBathEntity entity : entitys) {
            parentid = entity.getParentid();
            autoquoteBathService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/autoquote/autoquote-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("autoquote_bedroom-save")
    public String subSave(@ModelAttribute AutoquoteBedroomEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            autoquoteBedroomService.insert(entity);
        } else {
            autoquoteBedroomService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/autoquote/autoquote-input.do?id=" + entity.getParentid();
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("autoquote_bedroom-remove")
    public String autoquote_bedroomRemove(@RequestParam("autoquote_bedroomSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<AutoquoteBedroomEntity> entitys = autoquoteBedroomService.findByIds(selectedItem);
        String parentid = null;
        for (AutoquoteBedroomEntity entity : entitys) {
            parentid = entity.getParentid();
            autoquoteBedroomService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/autoquote/autoquote-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("autoquote_hall-save")
    public String subSave(@ModelAttribute AutoquoteHallEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            autoquoteHallService.insert(entity);
        } else {
            autoquoteHallService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/autoquote/autoquote-input.do?id=" + entity.getParentid();
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("autoquote_hall-remove")
    public String autoquote_hallRemove(@RequestParam("autoquote_hallSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<AutoquoteHallEntity> entitys = autoquoteHallService.findByIds(selectedItem);
        String parentid = null;
        for (AutoquoteHallEntity entity : entitys) {
            parentid = entity.getParentid();
            autoquoteHallService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/autoquote/autoquote-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("autoquote_kitchen-save")
    public String subSave(@ModelAttribute AutoquoteKitchenEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            autoquoteKitchenService.insert(entity);
        } else {
            autoquoteKitchenService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/autoquote/autoquote-input.do?id=" + entity.getParentid();
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("autoquote_kitchen-remove")
    public String autoquote_kitchenRemove(@RequestParam("autoquote_kitchenSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<AutoquoteKitchenEntity> entitys = autoquoteKitchenService.findByIds(selectedItem);
        String parentid = null;
        for (AutoquoteKitchenEntity entity : entitys) {
            parentid = entity.getParentid();
            autoquoteKitchenService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/autoquote/autoquote-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("autoquote_veranda-save")
    public String subSave(@ModelAttribute AutoquoteVerandaEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            autoquoteVerandaService.insert(entity);
        } else {
            autoquoteVerandaService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/autoquote/autoquote-input.do?id=" + entity.getParentid();
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("autoquote_veranda-remove")
    public String autoquote_verandaRemove(@RequestParam("autoquote_verandaSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<AutoquoteVerandaEntity> entitys = autoquoteVerandaService.findByIds(selectedItem);
        String parentid = null;
        for (AutoquoteVerandaEntity entity : entitys) {
            parentid = entity.getParentid();
            autoquoteVerandaService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/autoquote/autoquote-input.do?id=" + parentid;
    }
    /**
     * 删除一条主表信息
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("autoquote-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) {
        List<AutoquoteManageEntity> entitys = autoquoteService.findByIds(selectedItem);
        for (AutoquoteManageEntity entity : entitys) {
            autoquoteService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/autoquote/autoquote-list.do?flowId=" + flowId;
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setAutoquoteService(AutoquoteService autoquoteService) {
        this.autoquoteService = autoquoteService;
    }
        @Resource
	    public void setAutoquote_bathService(AutoquoteBathService autoquote_bathService) {
	        this.autoquoteBathService = autoquote_bathService;
	    }
        @Resource
	    public void setAutoquote_bedroomService(AutoquoteBedroomService autoquote_bedroomService) {
	        this.autoquoteBedroomService = autoquote_bedroomService;
	    }
        @Resource
	    public void setAutoquote_hallService(AutoquoteHallService autoquote_hallService) {
	        this.autoquoteHallService = autoquote_hallService;
	    }
        @Resource
	    public void setAutoquote_kitchenService(AutoquoteKitchenService autoquote_kitchenService) {
	        this.autoquoteKitchenService = autoquote_kitchenService;
	    }
        @Resource
	    public void setAutoquote_verandaService(AutoquoteVerandaService autoquote_verandaService) {
	        this.autoquoteVerandaService = autoquote_verandaService;
	    }
}
