package com.tx.${bussiPackage}.service.${entityPackage};

import com.tx.${bussiPackage}.entity.${entityPackage}.${entityName}Entity;
import com.tx.${bussiPackage}.page.${entityPackage}.${entityName}Page;
import java.util.List;
import com.tx.common.dao.CommonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

<#include "/include/serviceInclude.ftl">

/**   
 * @Title: Service
 * @Description: ${ftl_description}
 * @author JiangBo
 * @date ${ftl_create_time}
 * @version V1.0   
 *
 */
public class ${entityName}Service {

    /**
	 * 实例化DAO
	 */
	@Autowired  
	@Qualifier("commonDao")  
	private CommonDao dao;
	
	/**
	 * 获得数据表格
	 * 
	 * @param bug
	 * @return
	 */
	public DataGrid datagrid(${entityName}Page ${entityName?uncap_first}Page) {
		DataGrid j = new DataGrid();
		j.setRows(getPagesFromEntitys(find(${entityName?uncap_first}Page)));
		j.setTotal(total(${entityName?uncap_first}Page));
		return j;
	}
	
	/**
	 * 添加
	 * 
	 * @param ${entityName?uncap_first}Page
	 */
	public void add(${entityName}Page ${entityName?uncap_first}Page) {
		${entityName}Entity t = new ${entityName}Entity();
		BeanUtils.copyProperties(${entityName?uncap_first}Page, t);
		${entityName?uncap_first}EntityDao.save(t);
	}
	/**
	 * 修改
	 * 
	 * @param ${entityName?uncap_first}Page
	 */
	public void update(${entityName}Page ${entityName?uncap_first}Page) throws Exception {
		${entityName}Entity t = ${entityName?uncap_first}EntityDao.get(${entityName}Entity.class, ${entityName?uncap_first}Page.get${jeecg_table_id?cap_first}());
	    if(t != null) {
			MyBeanUtils.copyBeanNotNull2Bean(${entityName?uncap_first}Page, t);
		}
	}
	/**
	 * 删除
	 * 
	 * @param ids
	 */
	public <T> void delete(T entity) {
	    String sql = "delete from ${tableName} WHERE ${jeecg_table_id} = '"+entity.getId()+"'";
	    dao.update(sql);
	}
	/**
	 * 获得
	 * 
	 * @param ${entityName}
	 * @return
	 */
	public ${entityName}Entity get(${entityName}Page ${entityName?uncap_first}Page) {
		return ${entityName?uncap_first}EntityDao.get(${entityName}Entity.class, ${entityName?uncap_first}Page.get${jeecg_table_id?cap_first}());
	}
	
	/**
	 * 获得
	 * 
	 * @param ${jeecg_table_id}
	 * @return
	 */
	public ${entityName}Entity get(${primary_key_type} ${jeecg_table_id}) {
		return ${entityName?uncap_first}EntityDao.get(${entityName}Entity.class, ${jeecg_table_id});
	}
	/**
	 * 获取所有数据
	 */
	public List<${entityName}Entity> listAll(${entityName}Page ${entityName?uncap_first}Page) {
		String hql = "from ${entityName}Entity where 1 = 1 ";
		List<Object> values = new ArrayList<Object>();
		hql = addWhere(${entityName?uncap_first}Page, hql, values);
		List<${entityName}Entity> list = ${entityName?uncap_first}EntityDao.find(hql,values);
		return list;
	}
	
	private Long total(${entityName}Page ${entityName?uncap_first}Page) {
		String hql = "select count(*) from ${entityName}Entity t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		hql = addWhere(${entityName?uncap_first}Page, hql, values);
		return ${entityName?uncap_first}EntityDao.count(hql, values);
	}
	
	private String addWhere(${entityName}Page ${entityName?uncap_first}Page, String hql, List<Object> values) {
	    //循环查询条件Page的所有[Integer][String]类型的字段，如果字段不为空则动态加上查询条件
		//-----------------------------------------------------
		StringBuffer hqlbf = new StringBuffer(hql);
		
		${entityName}Entity ${entityName?uncap_first}Entity = new ${entityName}Entity();
		BeanUtils.copyProperties(${entityName?uncap_first}Page, ${entityName?uncap_first}Entity);
		SearchSqlGenerateUtil.createSearchParamsHql(hqlbf, values, ${entityName?uncap_first}Entity);
		hql = hqlbf.toString();
		return hql;
	}
	
	public void add(${entityName}Page ${entityName?uncap_first}Page) {
		${entityName}Entity t = new ${entityName}Entity();
		BeanUtils.copyProperties(${entityName?uncap_first}Page, t);
		${entityName?uncap_first}EntityDao.save(t);
	}

	public void update(${entityName}Page ${entityName?uncap_first}Page) throws Exception {
		${entityName}Entity t = ${entityName?uncap_first}EntityDao.get(${entityName}Entity.class, ${entityName?uncap_first}Page.get${jeecg_table_id?cap_first}());
	    if(t != null) {
			MyBeanUtils.copyBeanNotNull2Bean(${entityName?uncap_first}Page, t);
		}
	}

	public void delete(String ids) {
		if (ids != null) {
			for (String id : ids.split(",")) {
				String hql = "from ${entityName}Entity where ${jeecg_table_id} = '"+id+"'";
				${entityName}Entity t = ${entityName?uncap_first}EntityDao.get(hql);
				if (t != null) {
					${entityName?uncap_first}EntityDao.delete(t);
				}
			}
		}
	}
	
	/**
	 * 设置DAO
	 * @param dao the DAO to set
	 */
    @Autowired(required= false) 
	public void setDao(CommonDao dao) {
		this.dao = dao;
	}
}
