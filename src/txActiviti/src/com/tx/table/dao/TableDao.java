package com.tx.table.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tx.table.domain.ConfTable;
import com.tx.table.domain.ConfTableColumns;

/**
 * 流水表表结构管理DAO
 */
@Component
@Transactional(rollbackFor = Exception.class)
public class TableDao {
	/**
	 * JdbcTemplate
	 */
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
    /**
     * 业务表管理表信息查询
     * 
     * @param sql
     * @return
     */
    public List<ConfTable> queryConfTableList(String sql) {
       try{
           return getJdbcTemplate().query(sql, ParameterizedBeanPropertyRowMapper.newInstance(ConfTable.class));
           }catch (Exception e){
           return null;
       }
    }
    /**
     * 表字段结构管理表信息查询
     * 
     * @param sql
     * @return
     */
	public List<ConfTableColumns> queryConfTableColumns(String sql) {
		try {
			return getJdbcTemplate().query(sql,ParameterizedBeanPropertyRowMapper.newInstance(ConfTableColumns.class));
		} catch (Exception e) {
			return null;
		}
	}
    /**
     * 插入数据-业务表管理表
     * 
     * @param list
     * @param sql
     */
	public int insertConfTable(final List<ConfTable> list, String sql) {
		try{
	          jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
	             @Override
	             public int getBatchSize() {
	              return list.size();    //这个方法设定更新记录数，通常List里面存放的都是我们要更新的，所以返回list.size()；
	             }
	              @Override
	              public void setValues(PreparedStatement ps, int i)
	                      throws SQLException {
	            	  ConfTable bean = list.get(i);
	            	  ps.setString(1, bean.getUuId());
	                  ps.setString(2, bean.getTableName());
	                  ps.setString(3, bean.getTableNameComment());
	              }
	          });
	          return 1;
	      }catch (Exception e){
	          return 0;
	      }
	}
	/**
     * 删除业务表管理表数据
     * 
     * @param selectedItem
     * @param sql
     */
	public int batchDeleteConfTable(final List<String> list, String sql) {
		try{
          jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
             @Override
             public int getBatchSize() {
              return list.size();    //这个方法设定更新记录数，通常List里面存放的都是我们要更新的，所以返回list.size()；
             }
              @Override
              public void setValues(PreparedStatement ps, int i)
                      throws SQLException {
            	  String uuid = list.get(i);
                  ps.setString(1, uuid);
              }
          });
          return 1;
      }catch (Exception e){
          return 0;
      }
	}
		
//    /**
//     * 批量更新流水表表结构管理表
//     * @param list
//     * @param sql
//     */
//    public int batchUpdateFlowTableManage(final List<ConfFlowTableManage> list, String sql) {
//        try{
//            jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
//               @Override
//               public int getBatchSize() {
//                return list.size();    //这个方法设定更新记录数，通常List里面存放的都是我们要更新的，所以返回list.size()；
//               }
//                @Override
//                public void setValues(PreparedStatement ps, int i)
//                        throws SQLException {
//                    ConfFlowTableManage bean = list.get(i);
//                    ps.setInt(SQL_1, bean.getColumnNo());
//                    ps.setString(SQL_2, bean.getColumnValue());
//                    ps.setString(SQL_3, bean.getColumnName());
//                    ps.setString(SQL_4, bean.getTypeKey());
//                    ps.setString(SQL_5, bean.getTypeValue());
//                    ps.setString(SQL_6, bean.getTableName());
//                    ps.setString(SQL_7, bean.getColumnValueOld());
//                }
//            });
//            return 1;
//        }catch (Exception e){
//            logger.error("==========批量插入流水表表结构管理表 Exception:" + e.toString());
//            return 0;
//        }
//    }
    /**
     * 更新
     * 
     * @param sql
     * @return
     */
    public int update(String sql) {
        try {
            jdbcTemplate.update(sql);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }
    /**
     * 执行
     * @param sql
     * @return
     */
    public int execute(String sql) {
        try {
            jdbcTemplate.execute(sql);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }
	/**
     * 取得JdbcTemplate
     * 
     * @return
     */
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
    /**
     * @param jdbcTemplate
     *            JdbcTemplate.
     */
    @Resource
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
