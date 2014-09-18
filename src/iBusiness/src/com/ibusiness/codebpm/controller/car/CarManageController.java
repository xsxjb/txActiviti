package com.ibusiness.codebpm.controller.car;

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

import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;

import com.ibusiness.codebpm.entity.car.CarManageEntity;
import com.ibusiness.codebpm.service.car.CarManageService;

/**   
 * @Title: Controller
 * @Description: 车辆管理
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("carManage")
public class CarManageController {

    private MessageHelper messageHelper;
    private CarManageService carManageService;
   /**
     * 列表
     */
    @RequestMapping("carManage-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = carManageService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codebpm/car/carManage-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("carManage-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        CarManageEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = carManageService.get(id);
        } else {
            entity = new CarManageEntity();
        }
        model.addAttribute("model", entity);
        
        return "codebpm/car/carManage-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("carManage-save")
    public String save(@ModelAttribute CarManageEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            carManageService.insert(entity);
        } else {
            carManageService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/carManage/carManage-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("carManage-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<CarManageEntity> entitys = carManageService.findByIds(selectedItem);
        for (CarManageEntity entity : entitys) {
            carManageService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/carManage/carManage-list.do";
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setCarManageService(CarManageService carManageService) {
        this.carManageService = carManageService;
    }
    
}
