package com.ibusiness.codegenerate.common;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibusiness.codegenerate.code.Columnt;
import com.ibusiness.component.form.entity.ConfFormTableColumn;


/**
 * CodeFormulaFactory 公式工厂类
 * 
 * @author JiangBo
 */
public class CodeFormulaFactory {
    private CodeFormulaFactory () {}
    private static CodeFormulaFactory instance = new CodeFormulaFactory();
    public static CodeFormulaFactory getInstance() {
        return instance;
    }
    private static Logger logger = LoggerFactory.getLogger(CodeFormulaFactory.class);
    /**
     * 公式map
     */
    private static Map<String, String> formulaMap = new HashMap<String, String>();
    static {
        // 当前时间
        formulaMap.put("currentDate", "getCurrentDateTime");
//        // 当前年份
//        formulaMap.put("year", "getCurrentYear");
//        // 当前月份
//        formulaMap.put("month", "getCurrentMonth");
        // 当前用户
        formulaMap.put("userName", "getCurrentUserName");
//        // 当前用户ID
//        formulaMap.put("userId", "getCurrentUserId");
    }
    /**
     * 根据公式类型生成JSP值
     * 
     * @param tagType
     * @param formColumn
     */
    public String getFormula(Columnt columnt, ConfFormTableColumn formColumn) {
        // 根据事件类型解析事件
        try {
            if (formulaMap.containsKey(formColumn.getFcDefault())) {
                String strMethod = formulaMap.get(formColumn.getFcDefault());
                String str = (String) CodeFormulaFactory.class.getDeclaredMethod(strMethod, Columnt.class, ConfFormTableColumn.class).invoke(instance, columnt, formColumn);
                return str;
            } else {
                logger.error("================要求生成的公式控件不存在:" + formColumn.getFcType());
                return "";
            }
        } catch (IllegalArgumentException e) {
            logger.error("===============公式控件 IllegalArgumentException:" + e.toString());
        } catch (SecurityException e) {
            logger.error("===============公式控件 SecurityException:" + e.toString());
        } catch (IllegalAccessException e) {
            logger.error("===============公式控件 IllegalAccessException:" + e.toString());
        } catch (InvocationTargetException e) {
            logger.error("===============公式控件 InvocationTargetException:" + e.toString());
        } catch (NoSuchMethodException e) {
            logger.error("===============公式控件 NoSuchMethodException:" + e.toString());
        }
        return null;
    }
    
    /**
     * 获取当前系统时间
     * @return
     */
    public String getCurrentDateTime(Columnt columnt, ConfFormTableColumn formColumn) {
        // 生成JAVA内容
        String controllerInfo = "";
        controllerInfo = controllerInfo + "String "+columnt.getFieldName()+"Value= CommonUtils.getInstance().getCurrentDateTime();";
        controllerInfo = controllerInfo + "model.addAttribute(\""+columnt.getFieldName()+"Value\", "+columnt.getFieldName()+"Value);";
        List<String> maList = columnt.getModelAttributeList();
        maList.add(controllerInfo);
        columnt.setModelAttributeList(maList);
        
        // 生成JSP内容
        return "${"+columnt.getFieldName()+"Value}";
    }
    /**
     * 当前用户
     */
    public String getCurrentUserName(Columnt columnt, ConfFormTableColumn formColumn) {
        // 生成JAVA内容
        String controllerInfo = "";
        
        controllerInfo = controllerInfo + "String "+columnt.getFieldName()+"Value= CommonBusiness.getInstance().getUserBean(SpringSecurityUtils.getCurrentUserId()).getDisplayName();";
        controllerInfo = controllerInfo + "model.addAttribute(\""+columnt.getFieldName()+"Value\", "+columnt.getFieldName()+"Value);";
        List<String> maList = columnt.getModelAttributeList();
        maList.add(controllerInfo);
        columnt.setModelAttributeList(maList);
        // 生成JSP内容
        return "${"+columnt.getFieldName()+"Value}";
    }
    // ======================================================================
}
