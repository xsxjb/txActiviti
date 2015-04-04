package com.codegenerate.designmanage.controller;

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

import com.codegenerate.designmanage.entity.Contract_manageEntity;
import com.codegenerate.designmanage.service.Contract_manageService;

/**   
 * @Title: Controller
 * @Description: 合同管理页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("contract_manage")
public class Contract_manageController {

    private MessageHelper messageHelper;
    private com.ibusiness.doc.store.StoreConnector storeConnector;
    private Contract_manageService contract_manageService;
   /**
     * 列表
     */
    @RequestMapping("contract_manage-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = contract_manageService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/designmanage/contract_manage-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("contract_manage-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Contract_manageEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = contract_manageService.get(id);
        } else {
            entity = new Contract_manageEntity();
        }
        
        // 默认值公式
        entity = (Contract_manageEntity) new FormulaCommon().defaultValue(entity, "IB_CONTRACT_MANAGE");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> typeflagFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_CONTRACT_MANAGE", "CONTRACTMANAGE");List<com.ibusiness.common.model.ConfSelectItem> typeflagItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(typeflagFTCMap.get("TYPEFLAG").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("typeflagItems", typeflagItems);
        return "codegenerate/designmanage/contract_manage-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("contract_manage-save")
    public String save(@ModelAttribute Contract_manageEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            contract_manageService.insert(entity);
        } else {
            contract_manageService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/contract_manage/contract_manage-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("contract_manage-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Contract_manageEntity> entitys = contract_manageService.findByIds(selectedItem);
        for (Contract_manageEntity entity : entitys) {
            contract_manageService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/contract_manage/contract_manage-list.do";
    }
    /**
     * 控件添加的方法 ========
     */
	@ResponseBody
	@RequestMapping("contracturl-upload")
	public String contracturlUpload(
			@org.springframework.beans.factory.annotation.Qualifier("attachment") MultipartFile attachment,
			HttpServletResponse response) {
		com.ibusiness.doc.store.StoreDTO storeDTO = null;
		if (null != attachment && attachment.getSize() > 0) {
			try {
				storeDTO = storeConnector.save("contract",
						attachment.getInputStream(),
						attachment.getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null == storeDTO ? "" : storeDTO.getKey();
	}

	@RequestMapping("contracturl-download")
	public void contracturlDownload(@RequestParam("path") String path,
			@RequestParam("filename") String filename,
			HttpServletResponse response) throws Exception {
		java.io.InputStream is = null;
		try {
			com.ibusiness.core.util.ServletUtils.setFileDownloadHeader(
					response, filename);
			is = storeConnector.get("contract", path).getInputStream();
			com.ibusiness.core.util.IoUtils.copyStream(is,
					response.getOutputStream());
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
    @RequestMapping("contract_manage-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = contract_manageService.pagedQuery(page, propertyFilters);
        List<Contract_manageEntity> beans = (List<Contract_manageEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("合同管理页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("contractname", "customername", "projectname", "contracturl", "address", "customerphone", "remark", "id", "scopeid", "typeflag");
        tableModel.setTableName("IB_CONTRACT_MANAGE");
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
    @RequestMapping("contract_manage-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("contractname", "customername", "projectname", "contracturl", "address", "customerphone", "remark", "id", "scopeid", "typeflag");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.designmanage.entity.Contract_manageEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/contract_manage/contract_manage-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setContract_manageService(Contract_manageService contract_manageService) {
        this.contract_manageService = contract_manageService;
    }
    @Resource
	public void setStoreConnector(com.ibusiness.doc.store.StoreConnector storeConnector) {
	    this.storeConnector = storeConnector;
	}
}
