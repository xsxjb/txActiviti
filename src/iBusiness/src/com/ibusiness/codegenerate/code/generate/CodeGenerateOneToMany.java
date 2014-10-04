package com.ibusiness.codegenerate.code.generate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ibusiness.codegenerate.code.CodeParamBean;
import com.ibusiness.codegenerate.code.Columnt;
import com.ibusiness.codegenerate.code.NonceUtils;
import com.ibusiness.codegenerate.code.DbEntity.DbFiledToJspUtil;
import com.ibusiness.codegenerate.code.window.CreateFileProperty;
import com.ibusiness.codegenerate.util.CodeDateUtils;
import com.ibusiness.codegenerate.util.CodeResourceUtil;
import com.ibusiness.codegenerate.util.def.FtlDef;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.component.form.entity.ConfForm;
import com.ibusiness.component.form.entity.ConfFormTableColumn;
import com.ibusiness.component.table.entity.ConfTableColumns;

/**
 * 一对多生成器
 * 
 * @author JiangBo
 * 
 */
public class CodeGenerateOneToMany implements ICallBack {
    private static final Log log = LogFactory.getLog(CodeGenerateOneToMany.class);
    private static String entityPackage = "test";
    private static String entityName = "Person";
    private static String tableName = "person";
    private static String formName = "";
    private static String entityTitle = "用户";
    private static String primaryKeyPolicy = "uuid";
    private static String sequenceCode = "";
    private static String ftlMode;
    public static String FTL_MODE_A = "A";
    public static String FTL_MODE_B = "B";
    private static List<CodeParamBean> subTabParamList = new ArrayList<CodeParamBean>();
    private static CreateFileProperty createFileProperty = new CreateFileProperty();
    public static int FIELD_ROW_NUM = 4;
    // 主表字段List
    private List<Columnt> mainColums = new ArrayList<Columnt>();
    private List<Columnt> originalColumns = new ArrayList<Columnt>();
    // 子表对应字段
//    private List<Columnt> subColums = new ArrayList<Columnt>();
    private DbFiledToJspUtil dbFiledToJspUtil = new DbFiledToJspUtil();
    
    static {
        createFileProperty.setActionFlag(false);
        createFileProperty.setServiceIFlag(false);
        createFileProperty.setJspFlag(false);
        createFileProperty.setServiceImplFlag(false);
        createFileProperty.setPageFlag(false);
        createFileProperty.setEntityFlag(false);
    }

    /**
     * 构造函数
     */
    public CodeGenerateOneToMany() {
    }
    public CodeGenerateOneToMany(CodeParamBean codeParamBean, CreateFileProperty createFileProperty) {
        entityName = codeParamBean.getEntityName();
        entityPackage = codeParamBean.getPackageName();
        formName = codeParamBean.getFormName();
        tableName = codeParamBean.getTableName();
        entityTitle = codeParamBean.getEntityTitle();
        ftlMode = codeParamBean.getFormStyle();
        primaryKeyPolicy = (StringUtils.isNotBlank(codeParamBean.getKeyType())) ? codeParamBean.getKeyType() : "uuid";
        sequenceCode = "";
        this.createFileProperty = createFileProperty;
        subTabParamList = codeParamBean.getSubParamBeans();
    }

    /**
     * 执行方法,此方法中返回模板用的Map数据
     */
    public Map<String, Object> execute() {
        // 向模板中设置Map数据
        // 设置各种数据信息向生成器模板用的Map中
        HashMap<String, Object> localHashMap = new HashMap<String, Object>();
        localHashMap.put("bussiPackage", CodeResourceUtil.bussiPackage);
        // 包名
        localHashMap.put("entityPackage", entityPackage);
        // 实体名
        localHashMap.put("entityName", entityName);
        // 表名
        localHashMap.put("tableName", tableName);
        // 表描述
        localHashMap.put("ftl_description", entityTitle);
        localHashMap.put(FtlDef.JEECG_TABLE_ID, CodeResourceUtil.JEECG_GENERATE_TABLE_ID);
        // 主键
        localHashMap.put(FtlDef.JEECG_PRIMARY_KEY_POLICY, primaryKeyPolicy);
        // SEQUENCE
        localHashMap.put(FtlDef.JEECG_SEQUENCE_CODE, sequenceCode);
        // 创建时间
        localHashMap.put("ftl_create_time", CodeDateUtils.dateToString(new Date()));
        localHashMap.put(FtlDef.FIELD_REQUIRED_NAME, Integer.valueOf((StringUtils.isNotEmpty(CodeResourceUtil.JEECG_UI_FIELD_REQUIRED_NUM)) ? Integer
                .parseInt(CodeResourceUtil.JEECG_UI_FIELD_REQUIRED_NUM) : -1));
        localHashMap.put(FtlDef.SEARCH_FIELD_NUM, Integer.valueOf((StringUtils.isNotEmpty(CodeResourceUtil.JEECG_UI_FIELD_SEARCH_NUM)) ? Integer
                .parseInt(CodeResourceUtil.JEECG_UI_FIELD_SEARCH_NUM) : -1));
        // 行字段数目
        localHashMap.put(FtlDef.FIELD_ROW_NAME, Integer.valueOf(FIELD_ROW_NUM));
        try {
            createFileProperty.isEntityFlag();
            createFileProperty.isPageFlag();
        } catch (Exception e) {
            log.error("===================" + e.toString());
        }
        try {
            // 取得主表字段数据
            this.mainColums = this.dbFiledToJspUtil.readTableColumn(tableName);
            // 读取指定表名的表字段List
            // 取得表字段信息
            Map<String, ConfTableColumns> tableColumnsMap = CommonBusiness.getInstance().getTableColumnsMap(tableName);
            if (tableColumnsMap.size() > 0) {
                for (Columnt columnt : this.mainColums) {
                    String key = columnt.getFieldDbName();
                    if (tableColumnsMap.containsKey(key)) {
                        columnt.setFiledComment(tableColumnsMap.get(key).getColumnName());
                    }
                }
            }
            // 设置表字段信息
            localHashMap.put("columns", this.mainColums);
            
            // 取得表单信息
            List<ConfForm> formList = CommonBusiness.getInstance().getFormList(formName);
            // 表单信息
            localHashMap.put("confForm", formList.get(0));
            
            // 取得表单对应表管理表信息
            List<ConfFormTableColumn> formTableColumnList = CommonBusiness.getInstance().getFormTableColumnList(tableName, formName);
            for (ConfFormTableColumn formTableColumn : formTableColumnList) {
                // 转换小写
                formTableColumn.setTableColumnLower(formTableColumn.getTableColumn().toLowerCase());
            }
            // 表单字段信息
            localHashMap.put("formTableColumnList", formTableColumnList);
            
            // 读取指定表名的表字段(原值)List
            this.originalColumns = this.dbFiledToJspUtil.readOriginalTableColumn(tableName);
            localHashMap.put("originalColumns", this.originalColumns);
            // 设置值
            for (Columnt columnt : originalColumns) {
                if (!columnt.getFieldName().toLowerCase().equals(CodeResourceUtil.JEECG_GENERATE_TABLE_ID.toLowerCase())) {
                    continue;
                }
                localHashMap.put("primary_key_type", columnt.getFieldType());
            }
            //========= 子表内容生成 =========================================//
            for (CodeParamBean codeParamBean : subTabParamList) {
                // 取得子表对应表字段信息
                List<ConfTableColumns> subTableColumnsList = CommonBusiness.getInstance().getTableColumnsList(codeParamBean.getTableName());
                List<Columnt> subColumlist = new ArrayList<Columnt>();
                if (tableColumnsMap.size() > 0) {
                    for (ConfTableColumns confTableColumns : subTableColumnsList) {
                        Columnt columnt = new Columnt();
                        // 字段名
                        columnt.setFieldDbName(confTableColumns.getColumnValue());
                        //
                        columnt.setFieldType(confTableColumns.getColumnType());
                        columnt.setCharmaxLength(confTableColumns.getColumnSize());
                        // 字段名
                        columnt.setFieldName(confTableColumns.getColumnValue().toLowerCase());
                        // 字段标题
                        columnt.setFiledComment(confTableColumns.getColumnName());
                        subColumlist.add(columnt);
                    }
                }
                codeParamBean.setColumns(subColumlist);
            }
            // 将子表内容存入
            localHashMap.put("subTab", subTabParamList);
        } catch (Exception e) {
            log.error("===================" + e.toString());
        }
        long serialVersionUID = NonceUtils.randomLong() + NonceUtils.currentMills();
        localHashMap.put("serialVersionUID", String.valueOf(serialVersionUID));
        return localHashMap;
    }

    /**
     * 生成文件
     */
    public void generateToFile() {
        CodeFactoryOneToMany codeFactoryOneToMany = new CodeFactoryOneToMany();
        codeFactoryOneToMany.setCallBack(new CodeGenerateOneToMany());
        if (createFileProperty.isJspFlag()) {
            codeFactoryOneToMany.invoke("bpm/jspInputOneToMTemplate.ftl", "jsp");
            codeFactoryOneToMany.invoke("bpm/jspListOneToMTemplate.ftl", "jspList");
            codeFactoryOneToMany.invoke("bpm/jspSubInputOneToMTemplate.ftl", "jspSub");
        }
        // ServiceImpl文件
        if (createFileProperty.isServiceImplFlag()) {
            codeFactoryOneToMany.invoke("bpm/serviceOneToMTemplate.ftl", "serviceImpl");
        }
        // ServiceI文件
        if (createFileProperty.isServiceIFlag()) {
            codeFactoryOneToMany.invoke("bpm/serviceOneToMTemplate.ftl", "service");
        }
        // controller文件
        if (createFileProperty.isActionFlag()) {
            codeFactoryOneToMany.invoke("bpm/controllerOneToMTemplate.ftl", "controller");
        }
        // entity文件
        if (createFileProperty.isEntityFlag()) {
            codeFactoryOneToMany.invoke("bpm/entityOneToMTemplate.ftl", "entity");
        }
    }

    /**
     * 一对多(父子表)数据模型,代码生成
     * @param subList
     * @param codeParamBean
     */
    public void oneToManyCreate(List<CodeParamBean> subParamList, CodeParamBean codeParamBean) {
        // 主表
        generateToFile();
        // 子表
        for (CodeParamBean subBean : subParamList) {
            
        }
    }
    
    public static void main(String[] paramArrayOfString) {
    }
}
