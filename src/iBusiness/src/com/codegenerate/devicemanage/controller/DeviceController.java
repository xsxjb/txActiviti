package com.codegenerate.devicemanage.controller;

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

import com.codegenerate.devicemanage.entity.DeviceEntity;
import com.codegenerate.devicemanage.service.DeviceService;

/**
 * @Title: Controller
 * @Description: 设备表页面
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("device")
public class DeviceController {

	private MessageHelper messageHelper;
	private com.ibusiness.doc.store.StoreConnector storeConnector;
	private DeviceService deviceService;

	/**
	 * 列表
	 */
	@RequestMapping("device-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 查询条件Filter过滤器
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		// 添加当前公司(用户范围)ID查询
		propertyFilters = CommonBusiness.getInstance().editPFByScopeId(
				propertyFilters);
		// 根据条件查询数据
		page = deviceService.pagedQuery(page, propertyFilters);
		model.addAttribute("page", page);
		// 返回JSP
		return "codegenerate/devicemanage/device-list.jsp";
	}

	/**
	 * 插入
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("device-input")
	public String input(
			@RequestParam(value = "id", required = false) String id, Model model) {
		DeviceEntity entity = null;
		if (!CommonUtils.isNull(id)) {
			entity = deviceService.get(id);
		} else {
			entity = new DeviceEntity();
		}

		// 默认值公式
		entity = (DeviceEntity) new FormulaCommon().defaultValue(entity,
				"IB_DEVICE");

		model.addAttribute("model", entity);

		// 在controller中设置页面控件用的数据
		Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> devicetypenoFTCMap = CommonBusiness
				.getInstance().getFormTableColumnMap("IB_DEVICE", "device");
		JSONObject devicetypenoJsonObj = JSONObject
				.fromObject(devicetypenoFTCMap.get("DEVICETYPENO")
						.getConfSelectInfo());
		String devicetypenoSql = devicetypenoJsonObj.getString("sql");
		List<Map<String, Object>> devicetypenoList = com.ibusiness.core.spring.ApplicationContextHelper
				.getBean(com.ibusiness.common.service.CommonBaseService.class)
				.getJdbcTemplate().queryForList(devicetypenoSql);
		List<ConfSelectItem> devicetypenoItems = new java.util.ArrayList<ConfSelectItem>();
		for (Map<String, Object> mapBean : devicetypenoList) {
			ConfSelectItem confSelectItem = new ConfSelectItem();
			confSelectItem.setKey(mapBean.get("vKey").toString());
			confSelectItem.setValue(mapBean.get("vValue").toString());
			devicetypenoItems.add(confSelectItem);
		}
		model.addAttribute("devicetypenoItems", devicetypenoItems);
		return "codegenerate/devicemanage/device-input.jsp";
	}

	/**
	 * 保存
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("device-save")
	public String save(@ModelAttribute DeviceEntity entity,
			RedirectAttributes redirectAttributes) throws Exception {
		// 先进行校验
		// 再进行数据复制
		String id = entity.getId();
		if (CommonUtils.isNull(id)) {
			entity.setId(UUID.randomUUID().toString());
			deviceService.insert(entity);
		} else {
			deviceService.update(entity);
		}
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");
		return "redirect:/device/device-list.do";
	}

	/**
	 * 删除
	 * 
	 * @param selectedItem
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping("device-remove")
	public String remove(
			@RequestParam("selectedItem") List<String> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<DeviceEntity> entitys = deviceService.findByIds(selectedItem);
		for (DeviceEntity entity : entitys) {
			deviceService.remove(entity);
		}
		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/device/device-list.do";
	}

	/**
	 * 控件添加的方法 ========
	 */

	/**
	 * excel导出
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("device-export")
	public void excelExport(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		// 根据当前公司(用户范围)ID进行查询
		propertyFilters = CommonBusiness.getInstance().editPFByScopeId(
				propertyFilters);
		page = deviceService.pagedQuery(page, propertyFilters);
		List<DeviceEntity> beans = (List<DeviceEntity>) page.getResult();

		TableModel tableModel = new TableModel();
		// excel文件名
		tableModel.setExcelName("设备表页面"
				+ CommonUtils.getInstance().getCurrentDateTime());
		// 列名
		tableModel.addHeaders("deviceno", "devicename", "deviceprice",
				"devicetypeno", "deviceunit", "model", "id", "scopeid");
		tableModel.setTableName("IB_DEVICE");
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
	@RequestMapping("device-importExcel")
	public String importExport(
			@RequestParam("attachment") MultipartFile attachment,
			HttpServletResponse response) {
		try {
			File file = new File("test.xls");
			attachment.transferTo(file);
			//
			TableModel tableModel = new TableModel();
			// 列名
			tableModel.addHeaders("deviceno", "devicename", "deviceprice",
					"devicetypeno", "deviceunit", "model", "id", "scopeid");
			// 导入
			new ExcelCommon().uploadExcel(file, tableModel,
					"com.codegenerate.devicemanage.entity.DeviceEntity");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/device/device-list.do";
	}

	// ======================================================================
	@Resource
	public void setMessageHelper(MessageHelper messageHelper) {
		this.messageHelper = messageHelper;
	}

	@Resource
	public void setDeviceService(DeviceService deviceService) {
		this.deviceService = deviceService;
	}

	@Resource
	public void setStoreConnector(
			com.ibusiness.doc.store.StoreConnector storeConnector) {
		this.storeConnector = storeConnector;
	}
}
