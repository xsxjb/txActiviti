package com.tx.table.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tx.common.util.CommonUtils;
import com.tx.table.dao.TableDao;
import com.tx.table.domain.ConfTable;
import com.tx.table.domain.ConfTableColumns;

/**
 * 流水表表结构管理 service
 * 
 * @author JiangBo
 *
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class TableService {
	
	/**
	 * 实例化公用DAO
	 */
	@Autowired  
	@Qualifier("tableDao")  
	private TableDao dao;
	
	/**
     * 业务表管理表信息查询
     * 
     * @param string
     * @return
     */
    public List<ConfTable> queryConfTableList(String tableName) {
        String sql = " select * from TX_CONF_TABLE ";
        if (!CommonUtils.isNull(tableName)) {
        	sql = sql + " WHERE tableName='" + tableName +"' ";
        }
        return dao.queryConfTableList(sql);
    }
    /**
     * 表字段结构管理表信息查询
     * 
     * @param tableName
     * @return
     */
	public List<ConfTableColumns> queryConfTableColumns(String tableName) {
		String sql = " select * from TX_CONF_TABLE_COLUMNS ";
        if (!CommonUtils.isNull(tableName)) {
        	sql = sql + " WHERE tableName='" + tableName +"' ";
        }
        return dao.queryConfTableColumns(sql);
	}
    /**
     * 插入数据-业务表管理表
     * @param tableName
     */
	public void insertConfTable(List<ConfTable> list) {
		String sql = "insert into TX_CONF_TABLE("
				+ " uuid, tablename, tablenamecomment) " + " values(?, ?, ?)";
		dao.insertConfTable(list, sql);
	}
	/**
     * 删除业务表管理表数据
     * 
     * @param list
     */
	public void deleteConfTable(List<String> list) {
		String sql = "delete from TX_CONF_TABLE WHERE uuid = ? ";
		dao.batchDeleteConfTable(list, sql);
	}
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
	 * 设置DAO
	 * @param dao the DAO to set
	 */
    @Autowired(required= false) 
	public void setDao(TableDao dao) {
		this.dao = dao;
	}
}
