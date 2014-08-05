package com.tx.table.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mossle.core.hibernate.PropertyFilter;
import com.mossle.core.page.Page;
import com.mossle.core.spring.MessageHelper;
import com.mossle.ext.export.TableModel;
import com.mossle.user.persistence.domain.UserBase;
import com.tx.table.domain.ConfTable;
import com.tx.table.domain.ConfTableColumns;
import com.tx.table.service.TableService;

/**
 * 数据库表结构管理
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("table")
public class TableManageController {

    // 共用Service,可以查询热力站,热源,BPM等基础信息
    private TableService tableService;
    // 表名
    private String tableName;
    // 更新字段
    private String updateData;
    
    private MessageHelper messageHelper;

    /**
     * 业务表管理表信息查询
     * 
     * @return
     */
    @RequestMapping("conf-table-show")
    public String confTableShow(Model model) {
        // 取得表结构信息。
        List<ConfTable> list = tableService.queryConfTableList(tableName);
        // 表结构信息
        model.addAttribute("tableInfoList", list);
        
        return "../jsp/table/conf-table-show"; 
    }
    /**
     * 表字段结构管理表信息查询
     * 
     * @return
     */
    @RequestMapping("conf-table-detail-show")
    public String queryConfTableDetail(Model model) {
    	// 取得表结构信息。
        List<ConfTableColumns> list = tableService.queryConfTableColumns(tableName);
        // 表结构信息
        model.addAttribute("tableInfoList", list);
        // 取得表结构信息。
        return "../jsp/table/conf-table-detail-show";
    }
    
    /**
     * 新建一张新表
     * 
     * @return
     */
    @RequestMapping("conf-table-insert")
    public String confTableInsert(Model model) {
        return "../jsp/table/conf-table-insert"; 
    }
    
    /**
     * 保存新建表信息
     * 
     * @return
     */
    @RequestMapping("conf-table-save")
    public String confTableSave(@ModelAttribute ConfTable confTable, RedirectAttributes redirectAttributes) {
    	List<ConfTable> list = new ArrayList<ConfTable>();
    	confTable.setUuId(UUID.randomUUID().toString());
    	list.add(confTable);
    	tableService.insertConfTable(list);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/table/conf-table-show.do";
    }
    /**
     * 删除业务表管理表信息
     * 
     * @return
     */
    @RequestMapping("conf-table-remove")
    public String confTableRemove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
    	tableService.deleteConfTable(selectedItem);
    	messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        return "redirect:/table/conf-table-show.do";
    }
    
//    /**
//     * 查询统计表SQL文管理数据
//     * 
//     * @return
//     */
//    public void queryReportSqlManage() {
//        // 取得统计表SQL文信息。
//        List<ConfReportSQLManage> list = tableManageService.queryReportSqlManage(tableName);
//        if (null == list || list.size() < 1) {
//            return;
//        }
//        JSONObject jsonObject = CommonUtils.getJsonFromBean(list.get(0), null);
//        tableManageInfo = jsonObject.toString();
//        super.responsePrint(tableManageInfo);
//    }
//    /**
//     * 更新流水表表结构信息
//     * 
//     * @return
//     */
//    @RequestMapping("updateTableInfo")
//    public void updateFlowTableManage() {
//        // 取得前台页面传递的数据
//        List<ConfTableInfo> list = JSONArray.toList(JSONArray.fromObject(updateData), ConfTableInfo.class);
//        // 编辑流水表表结构List
//        updateFlowTableManageList(list);
//        // 清空内存数据
//        CommonBusiness.getInstance().setFlowTableManageMap(new HashMap<String, List<ConfTableInfo>>());
//        CommonBusiness.getInstance().setFlowTableManageList(new ArrayList<ConfTableInfo>());
//    }
    
//    /**
//     * 更新统计表表结构信息
//     * 
//     * @return
//     */
//    @SuppressWarnings({ "unchecked", "deprecation" })
//    public void updateReportTableManage() {
//        // 取得前台页面传递的数据
//        List<ConfReportTableManage> list = JSONArray.toList(JSONArray.fromObject(updateData), ConfReportTableManage.class);
//        // 编辑流水表表结构List
//        updateReportTableManageList(list);
//    }
//    
//    /**
//     * 生成SQL文
//     * 
//     * @return
//     */
//    public void createReportSQL () {
//        // 取得前台页面传递的数据
//        ConfReportSQLManage confReportSQLManage = (ConfReportSQLManage) JSONObject.toBean(JSONObject.fromObject(updateData), ConfReportSQLManage.class);
//        String tableNameStr = confReportSQLManage.getTableName();
//        
//        List<ConfReportSQLManage> list = tableManageService.queryReportSqlManage(tableNameStr);
//        if (null == list || list.size() < 1 || CommonUtils.isNull(tableNameStr)) {
//            return;
//        }
//        ConfReportSQLManage sqlBean = list.get(0);
//        // 生成SQL文
//        List<ConfReportTableManage> reportTableList = tableManageService.queryConfReportTableManageList(tableNameStr);
//        String insertSql = "insert into " + tableNameStr + " (";
//        String selectSql = "SELECT ";
//        String selectFromSql = " FROM ";
//        for (int i = 0; i < reportTableList.size(); i++) {
//            ConfReportTableManage bean = reportTableList.get(i);
//            // 编辑插入子句
//            insertSql = insertSql + bean.getColumnValue();
//            // 编辑查询子句
//            String columnSQL = createColumn(bean);
//            if (CommonUtils.isNull(columnSQL)) {
//                // 如果生成SQL文出错直接返回
//                logger.error("============================根据统计表表结构生成结转SQL文 表字段失败。");
//                return;
//            }
//            selectSql = selectSql + columnSQL;
//            if (i < reportTableList.size() - 1) {
//                selectSql = selectSql + ",";
//                insertSql = insertSql + ",";
//            } else {
//                selectSql = selectSql + " ";
//                insertSql = insertSql + ") ";
//            }
//            
//        }
//        selectFromSql = confReportSQLManage.getSelectFromSql();
//        sqlBean.setInsertSql(insertSql);
//        sqlBean.setSelectSql(selectSql);
//        sqlBean.setSelectFromSql(selectFromSql);
//        // 更新统计表SQL文管理
//        tableManageService.updateReportSQLManage(sqlBean);
//    }
//    /**
//     * 编辑统计表结转SQL文，查询子句--编辑查询字段SQL
//     * @param columnValue
//     * @return
//     */
//    private String createColumn(ConfReportTableManage bean) {
//        String columnSQL = "";
//        if ("Date".equals(bean.getTypeKey())) {
//            columnSQL = columnSQL + "to_date(to_char(" + bean.getColumnSQL() + ",'yyyy-MM-dd hh24'), 'yyyy-MM-dd hh24')";
//        } else if ("String".equals(bean.getTypeKey())) {
//            columnSQL = columnSQL + bean.getColumnSQL();
//        } else if ("Double".equals(bean.getTypeKey())) {
//            columnSQL = columnSQL + "nvl(" + bean.getColumnSQL() + ",0)";
//        } else if ("Integer".equals(bean.getTypeKey())) {
//            columnSQL = columnSQL + "nvl(" + bean.getColumnSQL() + ",0)";
//        }
//        return columnSQL;
//    }
//    /**
//     * 更新统计表表结构信息
//     * 
//     * @return
//     */
//    @SuppressWarnings({ "unchecked", "deprecation" })
//    public void updateReportSQL() {
//        // 取得前台页面传递的数据
//        ConfReportSQLManage bean = (ConfReportSQLManage) JSONObject.toBean(JSONObject.fromObject(updateData), ConfReportSQLManage.class);
//        // 更新统计表SQL文管理
//        tableManageService.updateReportSQLManage(bean);
//    }
//    
//    /**
//     * 更新/插入 流水表表结构管理表
//     * 
//     * @param list
//     */
//    private void updateFlowTableManageList(List<ConfTableInfo> list) {
//        List<ConfTableInfo> insertList = new ArrayList<ConfTableInfo>();
//        List<ConfTableInfo> updateList = new ArrayList<ConfTableInfo>();
//        for (ConfTableInfo bean : list) {
//            if (1 == bean.getInsertFlag()) {
//                insertList.add(bean);
//            } else {
//                updateList.add(bean);
//            }
//        }
//        // 批量插入 流水表表结构管理表
//        if (insertList.size() > 0) {
//            logger.info("=================================更新流水表的表结 ====");
//            String defaultStr = "";
//            for (ConfTableInfo bean : insertList) {
//                if (bean.getTypeValue().indexOf("number") >= 0) {
//                    defaultStr = " default 0";
//                }
//                String sql = "ALTER TABLE " + bean.getTableName() + " ADD " + bean.getColumnValue() + " " + bean.getTypeValue() + defaultStr;
//                if (0 == tableManageService.execute(sql)) {
//                    super.responsePrint("failure");
//                    return;
//                }
//                String tempTableName = bean.getTableName();
//                tempTableName = tempTableName.replace("FLOW", "TEMP");
//                String sqlTemp = "ALTER TABLE " + tempTableName + " ADD " + bean.getColumnValue() + " " + bean.getTypeValue() + defaultStr;
//                if (0 == tableManageService.execute(sqlTemp)) {
//                    super.responsePrint("failure");
//                    return;
//                }
//            }
//            tableManageService.insertFlowTableManage(insertList);
//        }
//        // 批量更新 流水表表结构管理表
//        if (updateList.size() > 0) {
//            for (ConfTableInfo bean : updateList) {
//                String sql = "";
//                String sqlTemp = "";
//                // 修改数据列名
//                if (!bean.getColumnValue().equals(bean.getColumnValueOld())) {
//                    sql = "ALTER TABLE " + bean.getTableName() + " RENAME COLUMN " + bean.getColumnValueOld() + " TO " + bean.getColumnValue();
//                    if (0 == tableManageService.execute(sql)) {
//                        super.responsePrint("failure");
//                        return;
//                    }
//                    String tempTableName = bean.getTableName();
//                    tempTableName = tempTableName.replace("FLOW", "TEMP");
//                    sqlTemp = "ALTER TABLE " + tempTableName + " RENAME COLUMN " + bean.getColumnValueOld() + " TO " + bean.getColumnValue();
//                    if (0 == tableManageService.execute(sqlTemp)) {
//                        super.responsePrint("failure");
//                        return;
//                    }
//                }
//                // 修改数据列类型
//                if (!bean.getTypeValue().equals(bean.getTypeValueOld())) {
//                    sql = "ALTER TABLE " + bean.getTableName() + " MODIFY " + bean.getColumnValue() + " " + bean.getTypeValue();
//                    if (0 == tableManageService.execute(sql)) {
//                        super.responsePrint("failure");
//                        return;
//                    }
//                    String tempTableName = bean.getTableName();
//                    tempTableName = tempTableName.replace("FLOW", "TEMP");
//                    sqlTemp = "ALTER TABLE " + tempTableName + " MODIFY " + bean.getColumnValue() + " " + bean.getTypeValue();
//                    if (0 == tableManageService.execute(sqlTemp)) {
//                        super.responsePrint("failure");
//                        return;
//                    }
//                }
//            }
//            tableManageService.updateFlowTableManage(updateList);
//        }
//        super.responsePrint("success");
//    }
//    /**
//     * 更新/插入 统计表表结构管理表
//     * 
//     * @param list
//     */
//    private void updateReportTableManageList(List<ConfReportTableManage> list) {
//        List<ConfReportTableManage> insertList = new ArrayList<ConfReportTableManage>();
//        List<ConfReportTableManage> updateList = new ArrayList<ConfReportTableManage>();
//        for (ConfReportTableManage bean : list) {
//            if (1 == bean.getInsertFlag()) {
//                insertList.add(bean);
//            } else {
//                updateList.add(bean);
//            }
//        }
//        // 批量插入 流水表表结构管理表
//        if (insertList.size() > 0) {
//            logger.info("=================================更新流水表的表结 ====");
//            String defaultStr = "";
//            for (ConfReportTableManage bean : insertList) {
//                if (bean.getTypeValue().indexOf("number") >= 0) {
//                    defaultStr = " default 0";
//                }
//                String sql = "ALTER TABLE " + bean.getTableName() + " ADD " + bean.getColumnValue() + " " + bean.getTypeValue() + defaultStr;
//                if (0 == tableManageService.execute(sql)) {
//                    super.responsePrint("failure");
//                    return;
//                }
//            }
//            tableManageService.insertReportTableManage(insertList);
//        }
//        // 批量更新 流水表表结构管理表
//        if (updateList.size() > 0) {
//            for (ConfReportTableManage bean : updateList) {
//                String sql = "";
//                // 修改数据列名
//                if (!bean.getColumnValue().equals(bean.getColumnValueOld())) {
//                    sql = "ALTER TABLE " + bean.getTableName() + " RENAME COLUMN " + bean.getColumnValueOld() + " TO " + bean.getColumnValue();
//                    if (0 == tableManageService.execute(sql)) {
//                        super.responsePrint("failure");
//                        return;
//                    }
//                }
//                // 修改数据列类型
//                if (!bean.getTypeValue().equals(bean.getTypeValueOld())) {
//                    sql = "ALTER TABLE " + bean.getTableName() + " MODIFY " + bean.getColumnValue() + " " + bean.getTypeValue();
//                    if (0 == tableManageService.execute(sql)) {
//                        super.responsePrint("failure");
//                        return;
//                    }
//                }
//            }
//            tableManageService.updateReportTableManage(updateList);
//        }
//        super.responsePrint("success");
//    }
//    /**
//     * 删除流水表表结构信息
//     * 
//     * @return
//     */
//    @SuppressWarnings({ "deprecation", "unchecked" })
//    public void deleteFlowTableManage() {
//        // 取得前台页面传递的数据
//        List<ConfTableInfo> list = JSONArray.toList(JSONArray.fromObject(updateData), ConfTableInfo.class);
//        // 删除流水表中字段
//        for (ConfTableInfo bean : list) {
//            String sql = "ALTER TABLE " + bean.getTableName() + " DROP COLUMN " + bean.getColumnValue() ;
//            if (0 == tableManageService.execute(sql)) {
//                super.responsePrint("failure");
//                return;
//            }
//            String tempTableName = bean.getTableName();
//            tempTableName = tempTableName.replace("FLOW", "TEMP");
//            String sqlTemp = "ALTER TABLE " + tempTableName + " DROP COLUMN " + bean.getColumnValue() ;
//            if (0 == tableManageService.execute(sqlTemp)) {
//                super.responsePrint("failure");
//                return;
//            }
//        }
//        // 删除流水表表结构管理数据
//        tableManageService.deleteFlowTableManage(list);
//        // 清空内存数据
//        CommonBusiness.getInstance().setFlowTableManageMap(new HashMap<String, List<ConfTableInfo>>());
//        CommonBusiness.getInstance().setFlowTableManageList(new ArrayList<ConfTableInfo>());
//        super.responsePrint("success"); 
//    }
//    /**
//     * 删除流水表表结构信息
//     * 
//     * @return
//     */
//    @SuppressWarnings({ "deprecation", "unchecked" })
//    public void deleteReportTableManage() {
//        // 取得前台页面传递的数据
//        List<ConfReportTableManage> list = JSONArray.toList(JSONArray.fromObject(updateData), ConfReportTableManage.class);
//        // 删除流水表中字段
//        for (ConfReportTableManage bean : list) {
//            String sql = "ALTER TABLE " + bean.getTableName() + " DROP COLUMN " + bean.getColumnValue() ;
//            if (0 == tableManageService.execute(sql)) {
//                super.responsePrint("failure");
//                return;
//            }
//        }
//        // 删除流水表表结构管理数据
//        tableManageService.deleteReportTableManage(list);
//        super.responsePrint("success"); 
//    }
//    /**
//     * 取得流水表表名下拉列表
//     * 
//     * @return
//     */
//    public void queryFlowTableNameCombo() {
//        // 取得表结构信息。
//        List<ConfTableInfo> list = tableManageService.queryConfFlowTableNameList();
//        
//        // 组合JSON格式字符串,并返回前台
//        StringBuffer param = new StringBuffer();
//        param.append("[");
//        for (int i = 0; i < list.size(); i++) {
//            if (i!=0) { param.append(",");}
//            param.append("{");
//            param.append("\"tableName\":").append("\"" + list.get(i).getTableName() + "\"");
//            param.append(", \"tableNameComment\"" + ":").append("\"" + list.get(i).getTableNameComment() + "\"");
//            param.append("}");
//        }
//        param.append("]");
//        tableNameComboInfo = param.toString();
//        super.responsePrint(tableNameComboInfo);
//    }
//    
//    /**
//     * 取得流水表表名下拉列表
//     * 
//     * @return
//     */
//    public void queryReportTableNameCombo() {
//        // 取得表结构信息。
//        List<ConfReportTableManage> list = tableManageService.queryConfReportTableNameList();
//        
//        // 组合JSON格式字符串,并返回前台
//        StringBuffer param = new StringBuffer();
//        param.append("[");
//        for (int i = 0; i < list.size(); i++) {
//            if (i!=0) { param.append(",");}
//            param.append("{");
//            param.append("\"tableName\":").append("\"" + list.get(i).getTableName() + "\"");
//            param.append(", \"tableNameComment\"" + ":").append("\"" + list.get(i).getTableNameComment() + "\"");
//            param.append("}");
//        }
//        param.append("]");
//        tableNameComboInfo = param.toString();
//        super.responsePrint(tableNameComboInfo);
//    }

    /**
     * 取得tableName
     * 
     * @return the tableName
     */
    public String getTableName() {
        return tableName;
    }
    /**
     * 设置tableName
     * 
     * @param tableName the tableName to set
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    /**
     * 取得updateData
     * @return the updateData
     */
    public String getUpdateData() {
        return updateData;
    }
    /**
     * 设置updateData
     * @param updateData the updateData to set
     */
    public void setUpdateData(String updateData) {
        this.updateData = updateData;
    }

    @Resource
	public void setTableService(TableService tableService) {
		this.tableService = tableService;
	}
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
