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

import com.codegenerate.personmannager.entity.Salary_enterEntity;
import com.codegenerate.personmannager.service.Salary_enterService;

/**   
 * @Title: Controller
 * @Description: 工资录入页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("salary_enter")
public class Salary_enterController {

    private MessageHelper messageHelper;
    private Salary_enterService salary_enterService;
   /**
     * 列表
     */
    @RequestMapping("salary_enter-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = salary_enterService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/salary_enter-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("salary_enter-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Salary_enterEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = salary_enterService.get(id);
        } else {
            entity = new Salary_enterEntity();
        }
        
        // 默认值公式
        entity = (Salary_enterEntity) new FormulaCommon().defaultValue(entity, "IB_SALARY_ENTER");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/personmannager/salary_enter-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("salary_enter-save")
    public String save(@ModelAttribute Salary_enterEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            salary_enterService.insert(entity);
        } else {
            salary_enterService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/salary_enter/salary_enter-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("salary_enter-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Salary_enterEntity> entitys = salary_enterService.findByIds(selectedItem);
        for (Salary_enterEntity entity : entitys) {
            salary_enterService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/salary_enter/salary_enter-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("salary_enter-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = salary_enterService.pagedQuery(page, propertyFilters);
        List<Salary_enterEntity> beans = (List<Salary_enterEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("工资录入页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("name", "time", "basicsalary", "postsalary", "yearssalary", "performancesalary", "awardsalary", "outworksalary", "countssalary", "finalamounts", "deductsalary", "premium", "incometax", "deductamounts", "actualsalary", "id", "scopeid");
        tableModel.setTableName("IB_SALARY_ENTER");
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
    @RequestMapping("salary_enter-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("name", "time", "basicsalary", "postsalary", "yearssalary", "performancesalary", "awardsalary", "outworksalary", "countssalary", "finalamounts", "deductsalary", "premium", "incometax", "deductamounts", "actualsalary", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Salary_enterEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/salary_enter/salary_enter-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setSalary_enterService(Salary_enterService salary_enterService) {
        this.salary_enterService = salary_enterService;
    }
    
}
