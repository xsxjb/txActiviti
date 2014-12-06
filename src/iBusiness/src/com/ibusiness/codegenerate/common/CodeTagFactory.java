package com.ibusiness.codegenerate.common;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibusiness.codegenerate.code.Columnt;
import com.ibusiness.common.util.Constants;
import com.ibusiness.component.form.entity.ConfFormTableColumn;


/**
 * CodeTagFactory生成页面标签工厂类
 * 
 * @author JiangBo
 *
 */
public class CodeTagFactory {
    private CodeTagFactory () {}
    private static CodeTagFactory instance = new CodeTagFactory();
    public static CodeTagFactory getInstance() {
        return instance;
    }
    private static Logger logger = LoggerFactory.getLogger(CodeTagFactory.class);
    /**
     * 组件map
     */
    private static Map<String, String> tagComponentMap = new HashMap<String, String>();
    static {
        // 单行输入框
        tagComponentMap.put(Constants.CODE_SINGLE_INPUT, "singleInputParser");
        // 多行输入框
        tagComponentMap.put(Constants.CODE_MULTI_INPUT, "multiInputParser");
        // 数值
        tagComponentMap.put(Constants.CODE_NUMBER_INPUT, "numberInputParser");
        // 日期
        tagComponentMap.put(Constants.CODE_DATE, "dateParser");
        // 时间
        tagComponentMap.put(Constants.CODE_DATE_TIME, "dateTimeParser");
        // 下拉列表
        tagComponentMap.put(Constants.CODE_SELECT, "selectParser");
        // 数据字典
        tagComponentMap.put(Constants.CODE_DATA_SELECT, "dataSelectParser");
        // 单选按钮
        tagComponentMap.put(Constants.CODE_RADIOBOX, "radioBoxParser");
        // 复选按钮
        tagComponentMap.put(Constants.CODE_CHECKBOX, "checkBoxParser");
    }
    
    /**
     * 根据标签类型生成标签
     * 
     * @param tagType
     * @param formColumn
     */
    public Columnt CreateTagComponent(Columnt columnt, ConfFormTableColumn formColumn) {
        // 根据事件类型解析事件
        try {
            if (tagComponentMap.containsKey(formColumn.getFcType())) {
                String strMethod = tagComponentMap.get(formColumn.getFcType());
                columnt = (Columnt) CodeTagFactory.class.getDeclaredMethod(strMethod, Columnt.class, ConfFormTableColumn.class).invoke(instance, columnt, formColumn);
                return columnt;
            } else {
                logger.error("================要求生成的页面控件不存在:" + formColumn.getFcType());
            }
        } catch (IllegalArgumentException e) {
            logger.error("===============生成页面控件 IllegalArgumentException:" + e.toString());
        } catch (SecurityException e) {
            logger.error("===============生成页面控件 SecurityException:" + e.toString());
        } catch (IllegalAccessException e) {
            logger.error("===============生成页面控件 IllegalAccessException:" + e.toString());
        } catch (InvocationTargetException e) {
            logger.error("===============生成页面控件 InvocationTargetException:" + e.toString());
        } catch (NoSuchMethodException e) {
            logger.error("===============生成页面控件 NoSuchMethodException:" + e.toString());
        }
        return null;
    }
    
    /**
     * 单行输入框
     */
    public Columnt singleInputParser(Columnt columnt, ConfFormTableColumn formColumn) {
        String str = "";
        str = str + "<div class=\"col-lg-3\">";
        str = str + "   <input id=\"code-"+columnt.getFieldName()+"\" type=\"text\" name=\""+columnt.getFieldName()+"\" value=\"${model."+columnt.getFieldName()+"}\" class=\"text required\" >";
        str = str + "</div>";
        columnt.setJspTagInfo(str);
        return columnt;
    }
    /**
     * 多行输入框
     */
    public Columnt multiInputParser(Columnt columnt, ConfFormTableColumn formColumn) {
        String str = "";
        str = str + "<div class=\"col-lg-6\">";
        str = str + "    <textarea class=\"form-control\" id=\"code-"+columnt.getFieldName()+"\" name=\""+columnt.getFieldName()+"\" rows=\"1\" >${model."+columnt.getFieldName()+"}</textarea>";
        str = str + "</div>";
        columnt.setJspTagInfo(str);
        return columnt;
    }
    /**
     * 数值
     */
    public Columnt numberInputParser(Columnt columnt, ConfFormTableColumn formColumn) {
        String str = "";
        str = str + "<div class=\"col-lg-3\">";
        str = str + "  <input id=\"code-"+columnt.getFieldName()+"\" type=\"text\" name=\""+columnt.getFieldName()+"\" value=\"${model."+columnt.getFieldName()+"}\" class=\"text number\" >";
        str = str + "</div>";
        columnt.setJspTagInfo(str);
        return columnt;
    }
    /**
     * 日期
     */
    public Columnt dateParser(Columnt columnt, ConfFormTableColumn formColumn) {
        String str ="";
        str = str + "<div class=\"col-lg-3\">";
        str = str + "  <div class=\"input-append datepicker date\">";
        str = str + "  <span class=\"add-on\">";
        str = str + "    <input id=\"code-"+columnt.getFieldName()+"\" type=\"text\" name=\""+columnt.getFieldName()+"\" value=\"${model."+columnt.getFieldName()+"}\" class=\"text required\" readonly >";
        str = str + "  </span>";
        str = str + "  </div>";
        str = str + "</div>";
        columnt.setJspTagInfo(str);
        return columnt;
    }
    /**
     * 时间
     */
    public Columnt dateTimeParser(Columnt columnt, ConfFormTableColumn formColumn) {
        // TODO 未实现
        String str ="";
        str = str + "<div class=\"col-lg-3\">";
        str = str + "  <div class=\"input-append datepicker date\">";
        str = str + "  <span class=\"add-on\">";
        str = str + "    <input id=\"code-"+columnt.getFieldName()+"\" type=\"text\" name=\""+columnt.getFieldName()+"\" value=\"${model."+columnt.getFieldName()+"}\" class=\"text required\" maxlength=\"10\" readonly >";
        str = str + "  </span>";
        str = str + "  </div>";
        str = str + "</div>";
        columnt.setJspTagInfo(str);
        return columnt;
    }
    /**
     * 下拉列表
     */
    public Columnt selectParser(Columnt columnt, ConfFormTableColumn formColumn) {
        // 生成controller类中的Attribute
        String controllerInfo = "";
        // 取得表单对应表管理表Map
        controllerInfo = controllerInfo + "Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> "+columnt.getFieldName()+"FTCMap= CommonBusiness.getInstance().getFormTableColumnMap(\""+formColumn.getTableName()+"\", \""+formColumn.getFormName()+"\");";
        // 下拉列表
        controllerInfo = controllerInfo + "List<com.ibusiness.common.model.ConfSelectItem> "+columnt.getFieldName()+"Items = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson("+columnt.getFieldName()+"FTCMap.get(\""+columnt.getFieldDbName()+"\").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);";
        controllerInfo = controllerInfo + "model.addAttribute(\""+columnt.getFieldName()+"Items\", "+columnt.getFieldName()+"Items);";
        List<String> maList = new ArrayList<String>();
        maList.add(controllerInfo);
        columnt.setModelAttributeList(maList);
        
        // ============================================================================
        // 生成JSP显示组件
        String jspTagInfo = "";
        jspTagInfo = jspTagInfo + "<div class=\"col-lg-3\">";
        jspTagInfo = jspTagInfo + "    <select id=\"code-"+columnt.getFieldName()+"\" name=\""+columnt.getFieldName()+"\" class=\"form-control\" >";
        jspTagInfo = jspTagInfo + "          <option value=\"\" >请选择</option>";
        jspTagInfo = jspTagInfo + "        <c:forEach items=\"${"+columnt.getFieldName()+"Items}\" var=\"item\">";
        jspTagInfo = jspTagInfo + "          <option value=\"${item.key}\" ${item.key==model."+columnt.getFieldName()+"? 'selected':''} >${item.value}</option>";
        jspTagInfo = jspTagInfo + "        </c:forEach>";
        jspTagInfo = jspTagInfo + "    </select>";
        jspTagInfo = jspTagInfo + "</div>";
        columnt.setJspTagInfo(jspTagInfo);
        return columnt;
    }
    /**
     * 下拉数据字典
     */
    public Columnt dataSelectParser(Columnt columnt, ConfFormTableColumn formColumn) {
        // 生成controller类中的Attribute
        String controllerInfo = "";
        // 取得表单对应表管理表Map
        controllerInfo = controllerInfo + "Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> "+columnt.getFieldName()+"FTCMap= CommonBusiness.getInstance().getFormTableColumnMap(\""+formColumn.getTableName()+"\", \""+formColumn.getFormName()+"\");";
        // 下拉列表
        controllerInfo = controllerInfo + "net.sf.json.JSONObject "+columnt.getFieldName()+"JsonObj = net.sf.json.JSONObject.fromObject("+columnt.getFieldName()+"FTCMap.get(\""+columnt.getFieldDbName()+"\").getConfSelectInfo());";
        controllerInfo = controllerInfo + "String "+columnt.getFieldName()+"Sql = "+columnt.getFieldName()+"JsonObj.getString(\"sql\");";
        controllerInfo = controllerInfo + "List<Map<String,Object>> "+columnt.getFieldName()+"List = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList("+columnt.getFieldName()+"Sql);";
        controllerInfo = controllerInfo + "List<ConfSelectItem> "+columnt.getFieldName()+"Items = new java.util.ArrayList<ConfSelectItem>();";
        controllerInfo = controllerInfo + "for (Map<String,Object> mapBean : "+columnt.getFieldName()+"List) {";
        controllerInfo = controllerInfo + "    ConfSelectItem confSelectItem = new ConfSelectItem();";
        controllerInfo = controllerInfo + "    confSelectItem.setKey(mapBean.get(\"vKey\").toString());";
        controllerInfo = controllerInfo + "    confSelectItem.setValue(mapBean.get(\"vValue\").toString());";
        controllerInfo = controllerInfo + "    "+columnt.getFieldName()+"Items.add(confSelectItem);";
        controllerInfo = controllerInfo + "}";
        //
        controllerInfo = controllerInfo + "model.addAttribute(\""+columnt.getFieldName()+"Items\", "+columnt.getFieldName()+"Items);";
        List<String> maList = new ArrayList<String>();
        maList.add(controllerInfo);
        columnt.setModelAttributeList(maList);
        
        // ============================================================================
        // 生成JSP显示组件
        String jspTagInfo = "";
        jspTagInfo = jspTagInfo + "<div class=\"col-lg-3\">";
        jspTagInfo = jspTagInfo + "    <select id=\"code-"+columnt.getFieldName()+"\" name=\""+columnt.getFieldName()+"\" class=\"form-control\" >";
        jspTagInfo = jspTagInfo + "          <option value=\"\" >请选择</option>";
        jspTagInfo = jspTagInfo + "        <c:forEach items=\"${"+columnt.getFieldName()+"Items}\" var=\"item\">";
        jspTagInfo = jspTagInfo + "          <option value=\"${item.key}\" ${item.key==model."+columnt.getFieldName()+"? 'selected':''} >${item.value}</option>";
        jspTagInfo = jspTagInfo + "        </c:forEach>";
        jspTagInfo = jspTagInfo + "    </select>";
        jspTagInfo = jspTagInfo + "</div>";
        columnt.setJspTagInfo(jspTagInfo);
        
        return columnt;
    }
    /**
     * 单选按钮
     */
    public Columnt radioBoxParser(Columnt columnt, ConfFormTableColumn formColumn) {
        String str = "";
        str = str + "<div class=\"col-lg-3\">";
        str = str + "  <label class=\"radio\"><input type=\"radio\" name=\""+columnt.getFieldName()+"\" value=\"1\" ${1==model."+columnt.getFieldName()+"? 'checked':''} >是</label>";
        str = str + "  <label class=\"radio\"><input type=\"radio\" name=\""+columnt.getFieldName()+"\" value=\"2\" ${2==model."+columnt.getFieldName()+"? 'checked':''} >否</label>";
        str = str + " </div>";
        columnt.setJspTagInfo(str);
        return columnt;
    }
    /**
     * 复选按钮
     */
    public Columnt checkBoxParser(Columnt columnt, ConfFormTableColumn formColumn) {
        // TODO 未实现
        String str = "";
        str = str + "<div class=\"col-lg-3\">";
        str = str + "   <input id=\"code-"+columnt.getFieldName()+"\" type=\"text\" name=\""+columnt.getFieldName()+"\" value=\"${model."+columnt.getFieldName()+"}\" class=\"text required\" >";
        str = str + "</div>";
        columnt.setJspTagInfo(str);
        return columnt;
    }
    // ======================================================================
}
