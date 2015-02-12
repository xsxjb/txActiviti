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

import com.codegenerate.personmannager.entity.Rewards_punishmentsEntity;
import com.codegenerate.personmannager.service.Rewards_punishmentsService;

/**   
 * @Title: Controller
 * @Description: 奖惩记录页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("rewards_punishments")
public class Rewards_punishmentsController {

    private MessageHelper messageHelper;
    private Rewards_punishmentsService rewards_punishmentsService;
   /**
     * 列表
     */
    @RequestMapping("rewards_punishments-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = rewards_punishmentsService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/rewards_punishments-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("rewards_punishments-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Rewards_punishmentsEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = rewards_punishmentsService.get(id);
        } else {
            entity = new Rewards_punishmentsEntity();
        }
        
        // 默认值公式
        entity = (Rewards_punishmentsEntity) new FormulaCommon().defaultValue(entity, "IB_REWARDS_PUNISHMENTS");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> typeFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_REWARDS_PUNISHMENTS", "rewardAndPunishments");List<com.ibusiness.common.model.ConfSelectItem> typeItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(typeFTCMap.get("TYPE").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("typeItems", typeItems);
        return "codegenerate/personmannager/rewards_punishments-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("rewards_punishments-save")
    public String save(@ModelAttribute Rewards_punishmentsEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            rewards_punishmentsService.insert(entity);
        } else {
            rewards_punishmentsService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/rewards_punishments/rewards_punishments-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("rewards_punishments-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Rewards_punishmentsEntity> entitys = rewards_punishmentsService.findByIds(selectedItem);
        for (Rewards_punishmentsEntity entity : entitys) {
            rewards_punishmentsService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/rewards_punishments/rewards_punishments-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("rewards_punishments-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = rewards_punishmentsService.pagedQuery(page, propertyFilters);
        List<Rewards_punishmentsEntity> beans = (List<Rewards_punishmentsEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("奖惩记录页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("name", "date", "type", "num", "salary", "assess", "motionman", "remark", "id", "scopeid");
        tableModel.setTableName("IB_REWARDS_PUNISHMENTS");
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
    @RequestMapping("rewards_punishments-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("name", "date", "type", "num", "salary", "assess", "motionman", "remark", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Rewards_punishmentsEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/rewards_punishments/rewards_punishments-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setRewards_punishmentsService(Rewards_punishmentsService rewards_punishmentsService) {
        this.rewards_punishmentsService = rewards_punishmentsService;
    }
    
}
