package com.tx.codeGenerate.code.generate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tx.codeGenerate.code.Columnt;
import com.tx.codeGenerate.code.NonceUtils;
import com.tx.codeGenerate.code.DbEntity.DbFiledToJspUtil;
import com.tx.codeGenerate.code.generate.window.CreateFileProperty;
import com.tx.codeGenerate.util.CodeDateUtils;
import com.tx.codeGenerate.util.CodeResourceUtil;
import com.tx.codeGenerate.util.def.FtlDef;

public class CodeGenerate
  implements ICallBack
{
  private static final Log jdField_a_of_type_OrgApacheCommonsLoggingLog = LogFactory.getLog(CodeGenerate.class);
  private static String jdField_entityPackage_String = "test";
  private static String jdField_entityName_String = "Company";
  private static String tableNameStr = "person";
  private static String ftl_descriptionStr = "分公司";
  private static String primary_key_policyStr = "uuid";
  private static String sequence_codeStr = "";
  private List jdField_a_of_type_JavaUtilList = new ArrayList();
  public static int FIELD_ROW_NUM = 1;
  private static CreateFileProperty jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty = new CreateFileProperty();
  private List jdField_b_of_type_JavaUtilList = new ArrayList();
  private DbFiledToJspUtil jdField_a_of_type_ComCodeDbEntityDbFiledToJspUtil = new DbFiledToJspUtil();

  static
  {
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.setActionFlag(true);
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.setServiceIFlag(true);
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.setJspFlag(true);
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.setServiceImplFlag(true);
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.setJspMode("01");
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.setPageFlag(true);
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.setEntityFlag(true);
  }

  public CodeGenerate()
  {
  }

  public CodeGenerate(String packageStr, String entityNameStr, String tableNameStr, String descriptionStr, CreateFileProperty paramCreateFileProperty, int rowNumInt, String pkStr, String sequenceStr)
  {
    jdField_entityName_String = entityNameStr;
    jdField_entityPackage_String = packageStr;
    this.tableNameStr = tableNameStr;
    ftl_descriptionStr = descriptionStr;
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty = paramCreateFileProperty;
    FIELD_ROW_NUM = rowNumInt;
    primary_key_policyStr = pkStr;
    sequence_codeStr = sequenceStr;
  }

  public CodeGenerate(String packageStr, String entityNameStr, String tableNameStr, String descriptionStr, CreateFileProperty paramCreateFileProperty, String pkStr, String sequenceStr)
  {
    jdField_entityName_String = entityNameStr;
    jdField_entityPackage_String = packageStr;
    this.tableNameStr = tableNameStr;
    ftl_descriptionStr = descriptionStr;
    jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty = paramCreateFileProperty;
    primary_key_policyStr = pkStr;
    sequence_codeStr = sequenceStr;
  }

  public Map execute()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("bussiPackage", CodeResourceUtil.bussiPackage);
    localHashMap.put("entityPackage", jdField_entityPackage_String);
    localHashMap.put("entityName", jdField_entityName_String);
    localHashMap.put("tableName", tableNameStr);
    localHashMap.put("ftl_description", ftl_descriptionStr);
    localHashMap.put(FtlDef.JEECG_TABLE_ID, CodeResourceUtil.JEECG_GENERATE_TABLE_ID);
    localHashMap.put(FtlDef.JEECG_PRIMARY_KEY_POLICY, primary_key_policyStr);
    localHashMap.put(FtlDef.JEECG_SEQUENCE_CODE, sequence_codeStr);
    localHashMap.put("ftl_create_time", CodeDateUtils.dateToString(new Date()));
    localHashMap.put(FtlDef.FIELD_REQUIRED_NAME, Integer.valueOf((StringUtils.isNotEmpty(CodeResourceUtil.JEECG_UI_FIELD_REQUIRED_NUM)) ? Integer.parseInt(CodeResourceUtil.JEECG_UI_FIELD_REQUIRED_NUM) : -1));
    localHashMap.put(FtlDef.SEARCH_FIELD_NUM, Integer.valueOf((StringUtils.isNotEmpty(CodeResourceUtil.JEECG_UI_FIELD_SEARCH_NUM)) ? Integer.parseInt(CodeResourceUtil.JEECG_UI_FIELD_SEARCH_NUM) : -1));
    localHashMap.put(FtlDef.FIELD_ROW_NAME, Integer.valueOf(FIELD_ROW_NUM));
    try
    {
      jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isEntityFlag();
      jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isPageFlag();
    }
    catch (Exception localException1)
    {
      localException1.printStackTrace();
    }
    try
    {
      this.jdField_b_of_type_JavaUtilList = this.jdField_a_of_type_ComCodeDbEntityDbFiledToJspUtil.readTableColumn(tableNameStr);
      localHashMap.put("columns", this.jdField_b_of_type_JavaUtilList);
      this.jdField_a_of_type_JavaUtilList = this.jdField_a_of_type_ComCodeDbEntityDbFiledToJspUtil.readOriginalTableColumn(tableNameStr);
      localHashMap.put("originalColumns", this.jdField_a_of_type_JavaUtilList);
      Iterator localIterator = this.jdField_a_of_type_JavaUtilList.iterator();
      while (localIterator.hasNext())
      {
        Columnt localColumnt = (Columnt)localIterator.next();
        if (!localColumnt.getFieldName().toLowerCase().equals(CodeResourceUtil.JEECG_GENERATE_TABLE_ID.toLowerCase()))
          continue;
        localHashMap.put("primary_key_type", localColumnt.getFieldType());
      }
    }
    catch (Exception localException2)
    {
      localException2.printStackTrace();
      System.exit(-1);
    }
    long l = NonceUtils.randomLong() + NonceUtils.currentMills();
    localHashMap.put("serialVersionUID", String.valueOf(l));
    return localHashMap;
  }

  public void generateToFile()
  {
    jdField_a_of_type_OrgApacheCommonsLoggingLog.info("----jeecg---Code----Generation----[单表模型:" + tableNameStr + "]------- 生成中。。。");
    CodeFactory localCodeFactory = new CodeFactory();
    localCodeFactory.setCallBack(new CodeGenerate());
    if (jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isJspFlag())
    {
      if ("01".equals(jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.getJspMode()))
        localCodeFactory.invoke("jspLineFeedTemplate.ftl", "jsp");
      if ("02".equals(jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.getJspMode()))
        localCodeFactory.invoke("jspRowEditTemplate.ftl", "jsp");
    }
    if (jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isServiceImplFlag())
      localCodeFactory.invoke("serviceImplTemplate.ftl", "serviceImpl");
    if (jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isServiceIFlag())
      localCodeFactory.invoke("serviceITemplate.ftl", "service");
    if (jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isActionFlag())
      localCodeFactory.invoke("actionTemplate.ftl", "action");
    if (jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isEntityFlag())
      localCodeFactory.invoke("entityTemplate.ftl", "entity");
    if (jdField_a_of_type_ComCodeGenerateWindowCreateFileProperty.isPageFlag())
      localCodeFactory.invoke("pageEntityTemplate.ftl", "page");
    jdField_a_of_type_OrgApacheCommonsLoggingLog.info("----jeecg----Code----Generation-----[单表模型：" + tableNameStr + "]------ 生成完成。。。");
  }

  public static void main(String[] paramArrayOfString)
  {
    System.out.println("----Code------------- Generation -----[单表模型]------- 生成中。。。");
    new CodeGenerate().generateToFile();
    System.out.println("----Code------------- Generation -----[单表模型]------- 生成完成。。。");
  }
}

/* Location:           C:\Users\Administrator\Desktop\commons-cg-2.1.jar
 * Qualified Name:     com.code.generate.CodeGenerate
 * JD-Core Version:    0.5.4
 */