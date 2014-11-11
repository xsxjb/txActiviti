package com.ibusiness.common.util;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 共用方法类
 * 
 * @author JiangBo
 *
 */
public class CommonUtils {

    /**
     * 单例模式
     */
    private static CommonUtils instance = new CommonUtils();
    private CommonUtils() {}
    public static CommonUtils getInstance() {
        return instance;
    }
    
    /**
     * 字符串,日期类型转换用变量
     */
    private SimpleDateFormat ymdhms = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD_HH_MM_SS);
    /**
     * Log4j
     */
    private static Logger logger = LoggerFactory.getLogger(CommonUtils.class);
	
    /**
     * 判断日期之间的天数
     * 
     * @return
     */
    @SuppressWarnings("deprecation")
    public boolean isDaysBetween(String startTime, String endTime, int number) {
        try {
            Date startDate = ymdhms.parse(startTime.replace("T", " "));
            startDate.setDate(startDate.getDate() + number);
            if (startDate.after(ymdhms.parse(endTime.replace("T", " ")))) {
                return true;
            }
        } catch (ParseException e) {
            logger.error("==========================导出Excel方法 ParseException:" + e.toString());
        }
        return false;
    }
    
    /**
     * 判断字符串是否为bull
     * @param str
     * @return true 为空 false 不为空
     */
    public static boolean isNull(String str) {
        return (null == str || "".equals(str) || "null".equals(str)) ? true : false;
    }
    
    /**
     * Double格式化,返回一位小数
     * @param temp
     * @return
     */
    public static String formatDoubleBy1Decimal(double temp) {
        return new DecimalFormat("0.0").format(temp);
    }
    /**
     * Double格式化,返回一位小数
     * @param temp
     * @return
     */
    public static String formatDoubleBy2Decimal(double temp) {
        return new DecimalFormat("0.00").format(temp);
    }
    /**
     * 链接JSON字符串，是否加逗号分隔
     * @return
     */
    public static String appendJsonString(String strOne, String strTwo, boolean flag) {
        if (flag) {
            strOne = strOne + ",";
        }
        strOne = strOne + strTwo;
        return strOne;
    }
    /**
     * list转换JSON字符串
     * @param beanList
     * @param datePattern
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static JSONArray getJsonFromList(List beanList, String datePattern) {
        if (datePattern == null || "".equals(datePattern)) {
            datePattern = Constants.DATE_FORMAT_YYYY_MM_DD_HH_MM_SS;
        }
        JsonConfig jsonConfig = configJson(null, datePattern);
        JSONArray array = JSONArray.fromObject(beanList, jsonConfig);
        return array;
    }
    /**
     * Bean转换JSON字符串
     * @param beanList
     * @param datePattern
     * @return
     */
    public static JSONObject getJsonFromBean(Object bean, String datePattern) {
        if (datePattern == null || "".equals(datePattern)) {
            datePattern = Constants.DATE_FORMAT_YYYY_MM_DD_HH_MM_SS;
        }
        JsonConfig jsonConfig = configJson(null, datePattern);
        JSONObject jsonObject = JSONObject.fromObject(bean, jsonConfig);
        return jsonObject;
    }
    /**
     * JSON字符串转换List对象
     * @param beanList
     * @param datePattern
     * @return
     */
    @SuppressWarnings({"deprecation", "rawtypes"})
    public static Object getListFromJson(String jsonStr, Class clazz) {
        return JSONArray.toList(JSONArray.fromObject(jsonStr), clazz);
    }
    /**
     * 创建JSON配置对象
     * @param excludes
     * @param datePattern
     * @return
     */
    private static JsonConfig configJson(String[] excludes, String datePattern) {
        JsonConfig jsonConfig = new JsonConfig();
        if (excludes != null) {
            jsonConfig.setExcludes(excludes);
        }
        jsonConfig.setIgnoreDefaultExcludes(false);
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor(datePattern));
        return jsonConfig;
    }
    /**
     * @return the ymdhms
     */
    public SimpleDateFormat getYmdhms() {
        return ymdhms;
    }
    /**
     * @param ymdhms the ymdhms to set
     */
    public void setYmdhms(SimpleDateFormat ymdhms) {
        this.ymdhms = ymdhms;
    }
}
