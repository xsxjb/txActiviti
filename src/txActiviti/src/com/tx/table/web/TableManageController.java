package com.tx.table.web;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mossle.core.spring.MessageHelper;
import com.tx.common.util.CommonUtils;
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
    private MessageHelper messageHelper;

    /**
     * 业务表管理表信息查询
     * 
     * @return
     */
    @RequestMapping("conf-table-show")
    public String confTableShow(Model model) {
        // 取得表结构信息。
        List<ConfTable> list = tableService.queryConfTableList(null);
        // 表结构信息
        model.addAttribute("tableInfoList", list);
        
        return "../jsp/table/conf-table-show"; 
    }
    /**
     * 表列字段结构管理表信息查询
     * 
     * @return
     */
    @RequestMapping("conf-table-detail-show")
    public String queryConfTableDetail(@RequestParam("tableName") String tableName, Model model) {
    	// 取得表结构信息
        List<ConfTableColumns> list = tableService.queryConfTableColumns(tableName);
        // 表结构信息
        model.addAttribute("tableInfoList", list);
        model.addAttribute("tableName", tableName);
        // 取得表结构信息
        return "../jsp/table/conf-table-detail-show";
    }
    
    /**
     * 新建一张业务表页面跳转
     * 
     * @return
     */
    @RequestMapping("conf-table-insert")
    public String confTableInsert(Model model) {
        return "../jsp/table/conf-table-insert"; 
    }
    
    /**
     * 保存业务表信息
     * 
     * @return
     */
    @RequestMapping("conf-table-save")
    public String confTableSave(@ModelAttribute ConfTable confTable, RedirectAttributes redirectAttributes) {
    	List<ConfTable> list = new ArrayList<ConfTable>();
    	confTable.setUuId(UUID.randomUUID().toString());
    	confTable.setTableName(confTable.getTableName().toUpperCase());//转成大写
    	list.add(confTable);
    	tableService.insertConfTable(list);
    	// 在数据库中创建一张业务表
		createTable(confTable);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/table/conf-table-show.do";
    }
    /**
     * 保存表列字段结构信息
     * 
     * @return
     */
    @RequestMapping("conf-table-columns-save")
    public String confTableColumnsSave(@ModelAttribute ConfTableColumns confTableColumns, @RequestParam("tableName") String tableName, RedirectAttributes redirectAttributes) {
    	List<ConfTableColumns> list = new ArrayList<ConfTableColumns>();
    	confTableColumns.setTableName(tableName.toUpperCase());//转成大写
    	list.add(confTableColumns);
    	tableService.insertConfTableColumns(list);
    	// 在数据库中修改(更新/追加)指定的业务表的数据列
    	alterTable(confTableColumns);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        
        return "redirect:/table/conf-table-detail-show.do?tableName=" + tableName;
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

    /**
     * 在数据库中创建一张业务表
     * @param list
     */
    private void createTable(ConfTable bean) {
    	String sql = "CREATE TABLE " + bean.getTableName() + " (TASKID VARCHAR(64))";
        if (0 == tableService.execute(sql)) {
            return;
        }
    }
    /**
     * 在数据库中修改(更新/追加)指定的业务表的数据列
     * @param list
     */
    private void alterTable(ConfTableColumns bean) {
    	String defaultStr = "";
    	if (bean.getColumnType().indexOf("number") >= 0) {
		    defaultStr = " default 0";
	    }
    	// 插入数据列
		if (CommonUtils.isNull(bean.getColumnValueOld())) {
			String sql = "ALTER TABLE " + bean.getTableName() + " ADD " + bean.getColumnValue() + " " + bean.getColumnType();
			if (!CommonUtils.isNull(bean.getColumnSize())) {
				sql = sql + "(" + bean.getColumnSize() + ")";
			}
			sql = sql + defaultStr;
			if (0 == tableService.execute(sql)) {
				return;
			}
		} else {
			// 修改数据列名
		    if (!bean.getColumnValue().equals(bean.getColumnValueOld())) {
		    	String sql = "ALTER TABLE " + bean.getTableName() + " RENAME COLUMN " + bean.getColumnValueOld() + " TO " + bean.getColumnValue();
		        if (0 == tableService.execute(sql)) {
		            return;
		        }
		    }
	    	
		    // 修改数据列类型
			if (!bean.getColumnType().equals(bean.getColumnTypeOld())) {
				String sql = "ALTER TABLE " + bean.getTableName() + " MODIFY " + bean.getColumnValue() + " " + bean.getColumnType();
				if (0 == tableService.execute(sql)) {
		            return;
		        }
			}
		}
    }
    /**
     * 注入 table service
     * @param tableService
     */
    @Resource
	public void setTableService(TableService tableService) {
		this.tableService = tableService;
	}
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
