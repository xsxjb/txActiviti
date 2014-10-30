package com.ibusiness.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.component.form.dao.ConfFormDao;
import com.ibusiness.component.form.dao.ConfFormTableColumnDao;
import com.ibusiness.component.form.entity.ConfForm;
import com.ibusiness.component.form.entity.ConfFormTableColumn;
import com.ibusiness.component.table.dao.TableColumnsDao;
import com.ibusiness.component.table.entity.ConfTableColumns;
import com.ibusiness.core.spring.ApplicationContextHelper;

/**
 * CommonBusiness单例对象类
 * 
 * @author JiangBo
 *
 */
public class CommonBusiness {
    private CommonBusiness () {}
    private static CommonBusiness instance = new CommonBusiness();
    public static CommonBusiness getInstance() {
        return instance;
    }
    // 流水表表结构管理List
    private List<ConfTableColumns> tableColumnsList = new ArrayList<ConfTableColumns>();
    // 流水表表结构管理Map
    private Map<String, ConfTableColumns> tableColumnsMap = new HashMap<String, ConfTableColumns>();

    // 表单List
    private List<ConfForm> formList = new ArrayList<ConfForm>();
    
    // 表单对应表管理表List
    private List<ConfFormTableColumn> formTableColumnList = new ArrayList<ConfFormTableColumn>();
    private Map<String, ConfFormTableColumn> formTableColumnMap = new HashMap<String, ConfFormTableColumn>();
    
    /**
     * 取得流水表表结构管理List
     * @return the tableColumnsList
     */
    @SuppressWarnings("unchecked")
    public List<ConfTableColumns> getTableColumnsList(String tableName) {
        String hql = "from ConfTableColumns where tableName=?";
        tableColumnsList = getTableColumnsDao().find(hql, tableName);
        return tableColumnsList;
    }
    /**
     * 取得业务表字段结构管理Map
     * @return the tableColumnsMap
     */
    public Map<String, ConfTableColumns> getTableColumnsMap(String tableName) {
        List<ConfTableColumns> tableColumnsList = getTableColumnsList(tableName);
        for (ConfTableColumns bean : tableColumnsList) {
            tableColumnsMap.put(bean.getColumnValue(), bean);
        }
        return tableColumnsMap;
    }
    /**
     * 取得表单list
     * @return the formList
     */
    @SuppressWarnings("unchecked")
    public List<ConfForm> getFormList(String formName) {
        String hql = "from ConfForm where formName=?";
        this.formList = getConfFormDao().find(hql, formName);
        return this.formList;
    }
    /**
     * 取得表单对应表管理表List
     * @return the tableColumnsList
     */
    @SuppressWarnings("unchecked")
    public List<ConfFormTableColumn> getFormTableColumnList(String tableName, String formName) {
        if (CommonUtils.isNull(tableName) || CommonUtils.isNull(formName)) {
            String hql = "from ConfFormTableColumn ";
            this.formTableColumnList = getConfFormTableColumnDao().find(hql);
        } else {
            String hql = "from ConfFormTableColumn where tableName=? AND formName=?";
            this.formTableColumnList = getConfFormTableColumnDao().find(hql, tableName, formName);
        }
        return this.formTableColumnList;
    }
    /**
     * 取得表单对应表管理表List
     * @return the formTableColumnMap
     */
    public Map<String, ConfFormTableColumn> getFormTableColumnMap(String tableName, String formName) {
        this.formTableColumnMap = new HashMap<String, ConfFormTableColumn>();
        for(ConfFormTableColumn bean :getFormTableColumnList(tableName, formName)) {
            this.formTableColumnMap.put(bean.getTableColumn(), bean);
        }
        return this.formTableColumnMap;
    }
    // ======================================================================
    public TableColumnsDao getTableColumnsDao() {
        return ApplicationContextHelper.getBean(TableColumnsDao.class);
    }
    public ConfFormDao getConfFormDao() {
        return ApplicationContextHelper.getBean(ConfFormDao.class);
    }
    public ConfFormTableColumnDao getConfFormTableColumnDao() {
        return ApplicationContextHelper.getBean(ConfFormTableColumnDao.class);
    }
}
