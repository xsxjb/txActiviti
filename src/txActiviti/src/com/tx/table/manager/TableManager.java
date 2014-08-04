package com.tx.table.manager;

import java.util.List;

import com.tx.common.util.CommonUtils;
import com.tx.table.dao.TableDao;
import com.tx.table.domain.ConfTableInfo;

/**
 * 流水表表结构管理 service
 * 
 * @author JiangBo
 *
 */
public class TableManager {
	
	/**
	 * 实例化公用DAO
	 */
	private TableDao dao;
	
	/**
     * 流水表表结构管理List
     * 
     * @param string
     * @return
     */
    public List<ConfTableInfo> queryConfFlowTableManageList(String tableName) {
        String sql = " select t.*,t.columnValue columnValueOld, t.typeValue typeValueOld from tx_conf_flow_table_Manage t ";
        if (!CommonUtils.isNull(tableName)) {
            sql = sql + " where t.tableName='" + tableName + "' ";
        }
        sql = sql + " order by t.columnNo ";
        return dao.queryConfFlowTableManageList(sql);
    }
//    /**
//     * 统计表表结构管理List
//     * 
//     * @param string
//     * @return
//     */
//    public List<ConfTableInfo> queryConfReportTableManageList(String tableName) {
//        String sql = " select t.*,t.columnValue columnValueOld, t.typeValue typeValueOld from tx_conf_report_table_Manage t ";
//        if (!CommonUtils.isNull(tableName)) {
//            sql = sql + " where t.tableName='" + tableName + "' ";
//        }
//        sql = sql + " order by t.columnNo ";
//        return dao.queryConfReportTableManageList(sql);
//    }
    /**
     * 流水表表名List
     * 
     * @param string
     * @return
     */
    public List<ConfTableInfo> queryConfFlowTableNameList() {
        String sql = "  select tableName, min(tableNameComment) tableNameComment from tx_conf_flow_table_Manage ";
        sql = sql + " group by tableName ";
        return dao.queryConfFlowTableManageList(sql);
    }
//    /**
//     * 统计表表名List
//     * 
//     * @param string
//     * @return
//     */
//    public List<ConfTableInfo> queryConfReportTableNameList() {
//        String sql = "  select tableName, min(tableNameComment) tableNameComment from tx_conf_report_table_Manage ";
//        sql = sql + " group by tableName ";
//        return dao.queryConfReportTableManageList(sql);
//    }
//    /**
//     * 取得统计表SQL文信息
//     * 
//     * @param tableName
//     * @return
//     */
//    public List<ConfReportSQLManage> queryReportSqlManage(String tableName) {
//        String sql = "  select * from tx_conf_report_sql_manage ";
//        if (!CommonUtils.isNull(tableName)) {
//            sql = sql + " WHERE tableName ='" + tableName + "'";
//        }
//        return dao.queryReportSqlManage(sql);
//    }
//    /**
//     * 插入 流水表表结构管理表
//     * @param list
//     */
//    public void insertFlowTableManage(List<ConfTableInfo> list) {
//        String sql = "insert into tx_conf_flow_table_Manage(" +
//        " tablename, tablenamecomment, columnno, columnvalue, columnname, " +
//        " typekey, typevalue ) " +
//        " values(" + 
//        " ?, ?, ?, ?, ?, ?, ?)";
//        dao.batchInsertFlowTableManage(list, sql);
//    }
//    /**
//     * 插入 流水表表结构管理表
//     * @param list
//     */
//    public void insertReportTableManage(List<ConfReportTableManage> list) {
//        String sql = "insert into tx_conf_report_table_Manage(" +
//        " tablename, tablenamecomment, columnno, columnvalue, columnname, " +
//        " typekey, typevalue ) " +
//        " values(" + 
//        " ?, ?, ?, ?, ?, ?, ?)";
//        dao.batchInsertReportTableManage(list, sql);
//    }
//    /**
//     * 更新 流水表表结构管理表
//     * @param list
//     */
//    public void updateFlowTableManage(List<ConfTableInfo> list) {
//        String sql = "update tx_conf_flow_table_Manage set " +
//        " columnno = ?, columnvalue = ?, columnname = ?, " +
//        " typekey = ?, typevalue = ? WHERE tablename = ? AND columnvalue = ?";
//        dao.batchUpdateFlowTableManage(list, sql);
//    }
//    /**
//     * 更新 统计表表结构管理表
//     * @param list
//     */
//    public void updateReportTableManage(List<ConfReportTableManage> list) {
//        String sql = "update tx_conf_report_table_Manage set " +
//        " columnno = ?, columnvalue = ?, columnname = ?, columnSQL = ?, " +
//        " typekey = ?, typevalue = ? WHERE tablename = ? AND columnvalue = ?";
//        dao.batchUpdateReportTableManage(list, sql);
//    }
//    /**
//     * 更新统计表SQL文管理
//     * 
//     * @param bean
//     */
//    public void updateReportSQLManage(ConfReportSQLManage bean) {
//        String sql = "update tx_conf_report_sql_manage set " +
//        " insertSql = '" + bean.getInsertSql().replaceAll("'", "''") +
//        "', selectSql = '" + bean.getSelectSql().replaceAll("'", "''") + 
//        "', selectFromSql = '" + bean.getSelectFromSql().replaceAll("'", "''") + 
//        "' WHERE tablename = '" + bean.getTableName() + "'";
//        dao.update(sql);
//    }
//    /**
//     * 删除流水表表结构信息
//     * @param list
//     */
//    public void deleteFlowTableManage(List<ConfTableInfo> list) {
//        String sql = "delete from tx_conf_flow_table_Manage " +
//        " where tablename = ? AND columnvalue = ? ";
//        dao.batchDeleteFlowTableManage(list, sql);
//    }
//    /**
//     * 删除统计表表结构信息
//     * @param list
//     */
//    public void deleteReportTableManage(List<ConfReportTableManage> list) {
//        String sql = "delete from tx_conf_report_table_Manage " +
//        " where tablename = ? AND columnvalue = ? ";
//        dao.batchDeleteReportTableManage(list, sql);
//    }
    /**
     * 更新数据
     * @param sql
     */
    public void update(String sql) {
        dao.update(sql);
    }
    /**
     * 执行
     * @param sql
     */
    public int execute(String sql) {
        return dao.execute(sql);
    }
	/**
	 * 取得DAO
	 * @return the DAO
	 */
	public TableDao getDao() {
		return dao;
	}
	/**
	 * 设置DAO
	 * @param dao the DAO to set
	 */
	public void setDao(TableDao dao) {
		this.dao = dao;
	}
}
