package com.tx.${bussiPackage}.controller.${entityPackage};
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import com.tx.common.model.json.AjaxJson;
import com.tx.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import com.tx.common.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import com.tx.common.util.MyBeanUtils;

import com.tx.${bussiPackage}.entity.${entityPackage}.${entityName}Entity;
import com.tx.${bussiPackage}.service.${entityPackage}.${entityName}Service;

/**   
 * @Title: Controller
 * @Description: ${ftl_description}
 * @author JiangBo
 * @date ${ftl_create_time}
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/${entityName?uncap_first}Controller")
public class ${entityName}Controller {
	/**
	 * Logger for this class
	 */
	private static Logger logger = LoggerFactory.getLogger(${entityName}Controller.class);

	@Autowired
	private ${entityName}Service ${entityName?uncap_first}Service;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * ${ftl_description}列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "${entityName?uncap_first}")
	public ModelAndView ${entityName?uncap_first}(HttpServletRequest request) {
		return new ModelAndView("${bussiPackage?replace(".","/")}/${entityPackage}/${entityName?uncap_first}List");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(${entityName}Entity ${entityName?uncap_first},HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
//		CriteriaQuery cq = new CriteriaQuery(${entityName}Entity.class, dataGrid);
//		//查询条件组装器
//		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ${entityName?uncap_first}, request.getParameterMap());
//		this.${entityName?uncap_first}Service.getDataGridReturn(cq, true);
//		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除${ftl_description}
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(${entityName}Entity ${entityName?uncap_first}, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		message = "${ftl_description}删除成功";
		${entityName?uncap_first}Service.delete(${entityName?uncap_first});
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加${ftl_description}
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(${entityName}Entity ${entityName?uncap_first}, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(${entityName?uncap_first}.getId())) {
			message = "${ftl_description}更新成功";
			${entityName}Entity t = ${entityName?uncap_first}Service.get(${entityName}Entity.class, ${entityName?uncap_first}.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(${entityName?uncap_first}, t);
				${entityName?uncap_first}Service.saveOrUpdate(t);
			} catch (Exception e) {
				e.printStackTrace();
				message = "${ftl_description}更新失败";
			}
		} else {
			message = "${ftl_description}添加成功";
			${entityName?uncap_first}Service.save(${entityName?uncap_first});
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * ${ftl_description}列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(${entityName}Entity ${entityName?uncap_first}, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(${entityName?uncap_first}.getId())) {
			${entityName?uncap_first} = ${entityName?uncap_first}Service.getEntity(${entityName}Entity.class, ${entityName?uncap_first}.getId());
			req.setAttribute("${entityName?uncap_first}Page", ${entityName?uncap_first});
		}
		return new ModelAndView("${bussiPackage?replace(".","/")}/${entityPackage}/${entityName?uncap_first}");
	}
}
