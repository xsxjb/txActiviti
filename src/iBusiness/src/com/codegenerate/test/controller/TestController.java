package com.codegenerate.test.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

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

import com.codegenerate.test.entity.TestEntity;
import com.codegenerate.test.service.TestService;

/**
 * @Title: Controller
 * @Description: 测试练习表页面
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("test")
public class TestController {

    private MessageHelper messageHelper;
    private com.ibusiness.doc.store.StoreConnector storeConnector;
    private TestService testService;

    /**
     * 列表
     */
    @RequestMapping("test-list")
    public String list(@ModelAttribute
    Page page, @RequestParam
    Map<String, Object> parameterMap, Model model) {
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
     * 插入
     * 
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("test-input")
    public String input(@RequestParam(value = "id", required = false)
    String id, Model model) {
        TestEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = testService.get(id);
        } else {
            entity = new TestEntity();
        }

        // 默认值公式
        entity = (TestEntity) new FormulaCommon().defaultValue(entity, "IB_TEST");

        model.addAttribute("model", entity);

        // 在controller中设置页面控件用的数据
        return "codegenerate/test/test-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("test-save")
    public String save(@ModelAttribute
    TestEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            testService.insert(entity);
        } else {
            testService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/test/test-list.do";
    }

    /**
     * 删除
     * 
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("test-remove")
    public String remove(@RequestParam("selectedItem")
    List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<TestEntity> entitys = testService.findByIds(selectedItem);
        for (TestEntity entity : entitys) {
            testService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/test/test-list.do";
    }

    /**
     * 控件添加的方法 ========
     */
    @ResponseBody
    @RequestMapping("name-upload")
    public String nameUpload(@org.springframework.beans.factory.annotation.Qualifier("attachment")
    MultipartFile attachment, HttpServletResponse response) {
        com.ibusiness.doc.store.StoreDTO storeDTO = null;
        if (null != attachment && attachment.getSize() > 0) {
            try {
                storeDTO = storeConnector.save("ibfile", attachment.getInputStream(), attachment.getOriginalFilename());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null == storeDTO ? "" : storeDTO.getKey();
    }

    @RequestMapping("name-download")
    public void nameDownload(@RequestParam("path")
    String path, @RequestParam("filename")
    String filename, HttpServletResponse response) throws Exception {
        java.io.InputStream is = null;
        try {
            com.ibusiness.core.util.ServletUtils.setFileDownloadHeader(response, filename);
            is = storeConnector.get("ibfile", path).getInputStream();
            com.ibusiness.core.util.IoUtils.copyStream(is, response.getOutputStream());
        } finally {
            if (is != null) {
                is.close();
            }
        }
    }

    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("test-export")
    public void excelExport(@ModelAttribute
    Page page, @RequestParam
    Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
        propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = testService.pagedQuery(page, propertyFilters);
        List<TestEntity> beans = (List<TestEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("测试练习表页面" + CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "scopeid", "name", "remark");
        tableModel.setTableName("IB_TEST");
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
    @RequestMapping("test-importExcel")
    public String importExport(@RequestParam("attachment")
    MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls");
            attachment.transferTo(file);
            //
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "scopeid", "name", "remark");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.test.entity.TestEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/test/test-list.do";
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
    public void setStoreConnector(com.ibusiness.doc.store.StoreConnector storeConnector) {
        this.storeConnector = storeConnector;
    }
}
