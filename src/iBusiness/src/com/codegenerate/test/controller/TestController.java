package com.codegenerate.test.controller;

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

import com.codegenerate.test.entity.TestEntity;
import com.codegenerate.test.service.TestService;
import com.codegenerate.test.entity.Test_sEntity;
import com.codegenerate.test.service.Test_sService;
import com.codegenerate.test.entity.Test_s2Entity;
import com.codegenerate.test.service.Test_s2Service;

/**   
 * @Title: Controller
 * @Description: 测试表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("test")
public class TestController {

    private MessageHelper messageHelper;
    private TestService testService;
        private Test_sService test_sService;
        private Test_s2Service test_s2Service;
   /**
     * 列表
     */
    @RequestMapping("test-list")
    public String list(@ModelAttribute Page page,  @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = testService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/test/test-list.jsp";
    }
    /**
     * 进入主表表单编辑页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("test-input")
    public String input(@ModelAttribute Page page,  @RequestParam(value = "id", required = false) String id, Model model) {
        TestEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = testService.get(id);
        } else {
            entity = new TestEntity();
        }
        // 默认值公式
        entity = (TestEntity) new FormulaCommon().defaultValue(entity, "IB_TEST");
        
        model.addAttribute("model", entity);
        // 子表信息
        Map<String, Object> map = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(map);
        propertyFilters.add(new PropertyFilter("EQS_parentid", id));
        // 根据条件查询数据
	        page = test_sService.pagedQuery(page, propertyFilters);
	        model.addAttribute("test_sPage", page);
	        page = test_s2Service.pagedQuery(page, propertyFilters);
	        model.addAttribute("test_s2Page", page);
        
        // 在controller中设置页面控件用的数据
                Map<String, Object> nameParameterMap = new java.util.HashMap<String, Object>();List<PropertyFilter> namePropertyFilters = PropertyFilter.buildFromMap(nameParameterMap);Page namePage = new Page();namePage = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.codegenerate.productmanage.service.MaterialsService.class).pagedQuery(namePage, namePropertyFilters);model.addAttribute("namePage", namePage);
        return "codegenerate/test/test-input.jsp";
    }
    
    /**
     * 子表新建
     */
    @RequestMapping("test_s-input")
    public String test_sInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Test_sEntity entity = test_sService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/test/test_s-input.jsp";
    }
    /**
     * 子表新建
     */
    @RequestMapping("test_s2-input")
    public String test_s2Input(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Test_s2Entity entity = test_s2Service.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/test/test_s2-input.jsp";
    }
    /**
     * 保存主表
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("test-save")
    public String saveDraft(@ModelAttribute TestEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            testService.insert(entity);
            id = entity.getId();
        } else {
            testService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/test/test-input.do?id=" + id;
    }
    /**
     * 子表保存
     */
    @RequestMapping("test_s-save")
    public String subSave(@ModelAttribute Test_sEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            test_sService.insert(entity);
        } else {
            test_sService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/test/test-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("test_s-export")
    public void excelTest_sExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = test_sService.pagedQuery(page, propertyFilters);
        List<Test_sEntity> beans = (List<Test_sEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("测试表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "email");
        tableModel.setTableName("IB_TEST");
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
    @RequestMapping("test_s-importExcel")
    public String importTest_sExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "email");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.test.entity.Test_sEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/test/test-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("test_s-remove")
    public String test_sRemove(@RequestParam("test_sSelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Test_sEntity> entitys = test_sService.findByIds(selectedItem);
        String parentid = null;
        for (Test_sEntity entity : entitys) {
            parentid = entity.getParentid();
            test_sService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/test/test-input.do?id=" + parentid;
    }
    /**
     * 子表保存
     */
    @RequestMapping("test_s2-save")
    public String subSave(@ModelAttribute Test_s2Entity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            test_s2Service.insert(entity);
        } else {
            test_s2Service.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/test/test-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("test_s2-export")
    public void excelTest_s2Export(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = test_s2Service.pagedQuery(page, propertyFilters);
        List<Test_s2Entity> beans = (List<Test_s2Entity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("测试表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "parentid", "name", "email");
        tableModel.setTableName("IB_TEST");
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
    @RequestMapping("test_s2-importExcel")
    public String importTest_s2Export(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "parentid", "name", "email");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.test.entity.Test_s2Entity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/test/test-input.do?id=" + parentid;
    }
    /**
     * 删除子表信息
     */
    @RequestMapping("test_s2-remove")
    public String test_s2Remove(@RequestParam("test_s2SelectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Test_s2Entity> entitys = test_s2Service.findByIds(selectedItem);
        String parentid = null;
        for (Test_s2Entity entity : entitys) {
            parentid = entity.getParentid();
            test_s2Service.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        
        return "redirect:/test/test-input.do?id=" + parentid;
    }
    /**
     * 删除一条主表信息
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("test-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) {
        List<TestEntity> entitys = testService.findByIds(selectedItem);
        for (TestEntity entity : entitys) {
            testService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/test/test-list.do?flowId=" + flowId;
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setTestService(TestService testService) {
        this.testService = testService;
    }
        @Resource
	    public void setTest_sService(Test_sService test_sService) {
	        this.test_sService = test_sService;
	    }
        @Resource
	    public void setTest_s2Service(Test_s2Service test_s2Service) {
	        this.test_s2Service = test_s2Service;
	    }
}
