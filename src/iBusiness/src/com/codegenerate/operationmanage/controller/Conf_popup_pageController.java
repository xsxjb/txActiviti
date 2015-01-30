package com.codegenerate.operationmanage.controller;

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

import com.codegenerate.operationmanage.entity.Conf_popup_pageEntity;
import com.codegenerate.operationmanage.service.Conf_popup_pageService;

/**   
 * @Title: Controller
 * @Description: PLC弹出页面页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("conf_popup_page")
public class Conf_popup_pageController {

    private MessageHelper messageHelper;
    private Conf_popup_pageService conf_popup_pageService;
   /**
     * 列表
     */
    @RequestMapping("conf_popup_page-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = conf_popup_pageService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/operationmanage/conf_popup_page-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("conf_popup_page-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Conf_popup_pageEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = conf_popup_pageService.get(id);
        } else {
            entity = new Conf_popup_pageEntity();
        }
        
        // 默认值公式
        entity = (Conf_popup_pageEntity) new FormulaCommon().defaultValue(entity, "IB_CONF_POPUP_PAGE");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> pagetypeFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_CONF_POPUP_PAGE", "plcConfPopupPage");List<com.ibusiness.common.model.ConfSelectItem> pagetypeItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(pagetypeFTCMap.get("PAGETYPE").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("pagetypeItems", pagetypeItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> mainpageidFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_CONF_POPUP_PAGE", "plcConfPopupPage");JSONObject mainpageidJsonObj = JSONObject.fromObject(mainpageidFTCMap.get("MAINPAGEID").getConfSelectInfo());String mainpageidSql = mainpageidJsonObj.getString("sql");List<Map<String,Object>> mainpageidList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(mainpageidSql);List<ConfSelectItem> mainpageidItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : mainpageidList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    mainpageidItems.add(confSelectItem);}model.addAttribute("mainpageidItems", mainpageidItems);
        return "codegenerate/operationmanage/conf_popup_page-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("conf_popup_page-save")
    public String save(@ModelAttribute Conf_popup_pageEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            conf_popup_pageService.insert(entity);
        } else {
            conf_popup_pageService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/conf_popup_page/conf_popup_page-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("conf_popup_page-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Conf_popup_pageEntity> entitys = conf_popup_pageService.findByIds(selectedItem);
        for (Conf_popup_pageEntity entity : entitys) {
            conf_popup_pageService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/conf_popup_page/conf_popup_page-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("conf_popup_page-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = conf_popup_pageService.pagedQuery(page, propertyFilters);
        List<Conf_popup_pageEntity> beans = (List<Conf_popup_pageEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("PLC弹出页面页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("pagename", "pagetitle", "popuptype", "pageurl", "pagetype", "mainpageid", "pagehight", "pagewidth", "id");
        tableModel.setTableName("IB_CONF_POPUP_PAGE");
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
    @RequestMapping("conf_popup_page-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("pagename", "pagetitle", "popuptype", "pageurl", "pagetype", "mainpageid", "pagehight", "pagewidth", "id");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.operationmanage.entity.Conf_popup_pageEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/conf_popup_page/conf_popup_page-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setConf_popup_pageService(Conf_popup_pageService conf_popup_pageService) {
        this.conf_popup_pageService = conf_popup_pageService;
    }
    
}
