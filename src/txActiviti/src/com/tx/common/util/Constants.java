package com.tx.common.util;

/**
 * 常量公用类, XMCP所有常量。 使用时请标注什么页面的常量。尽量不要使用其它页面的常量。
 * 
 * @author JiangBo
 * 
 */
public interface Constants {
    /**
     * action公用
     */
    // 返回失败
    String FAILURE = "failure";
    // 返回成功
    String SUCCESS = "success";
    // 时间格式常量
    String DATE_FORMAT_YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";
    String DATE_FORMAT_YYYY_MM_DD = "yyyy-MM-dd";
    String DATE_FORMAT_HH_MM_SS = "HH:mm:ss";

    /**
     * Oracle SQL
     */
    String SQL_YYYY_MM_DD_HH24_MM_SS = "yyyy-MM-dd hh24:mi:ss";

    /**
     * 时间类型
     */
    // 日
    String DATE_TIME_TYPE_DAY = "3";
    // 小时
    String DATE_TIME_TYPE_HOUR = "1";
    // 分钟
    String DATE_TIME_TYPE_MINUTE = "2";

    /**
     * PLC 巡站
     */
    String PATROL_STATION_USER1 = "FCHECK1";
    String PATROL_STATION_USER2 = "FCHECK2";
    String PATROL_STATION_USER3 = "FCHECK3";
    String PATROL_STATION_USER4 = "FCHECK4";

    /**
     * 历史曲线
     */
    // 一次网压力
    String HISTORY_CHART_PRESS = "press";
    // 一次网温度
    String HISTORY_CHART_TEMP = "temp";
    // 室外温度
    String HISTORY_CHART_OUTDOOR_TEMP = "outdoorTemp";
    // 二次网压力
    String HISTORY_CHART_SEC_PRESS = "secPress";
    // 二次网温度
    String HISTORY_CHART_SEC_TEMP = "secTemp";

    /**
     * 热源曲线
     */
    // 压力
    String HEAT_SOURCE_CHART_PRESS = "press";
    // 温度
    String HEAT_SOURCE_CHART_TEMP = "temp";
    // 瞬时流量
    String HEAT_SOURCE_CHART_FLOW = "flow";
    // 累计流量
    String HEAT_SOURCE_CHART_CUMUFLOW = "cumuFlow";
    // 瞬时热量
    String HEAT_SOURCE_CHART_HEAT = "heat";

    /**
     * 二网配置（温度指标指导）
     */
    // 机组类型 地热
    String HEAT_UNIT_MODE_GEOTH = "地热";
    // 机组类型 地热
    String HEAT_UNIT_MODE_HEAT_SINK = "散热器";
    // 供水
    String HEAT_UNIT_TEMP_SUPPLY = "1";
    // 回水
    String HEAT_UNIT_TEMP_BACKWATER = "2";
    // 供水温度
    String HEAT_UNIT_TEMP_SUPPLY_NAME = "供水温度";
    // 回水温度
    String HEAT_UNIT_TEMP_BACKWATER_NAME = "回水温度";

    /**
     * 报警设置
     */
    // 实际面积
    String WARNING_ACTUALAREA = "actualArea";
    // 一网供水压力高限
    String WARNING_SUPPLYPRESSHIGH = "supplyPressHigh";
    // 一网回水压力低限
    String WARNING_BACKWATERPRESSLOW = "backWaterPressLow";
    // 一网供水温度高限
    String WARNING_SUPPLYTEMPHIGH = "supplyTempHigh";
    // 一网回水温度低限
    String WARNING_BACKWATERTEMPLOW = "backWaterTempLow";
    // 一网机组回温
    String WARNING_UNITBACKWATERTEMP = "unitBackWaterTemp";
    // 二网供水压力高限
    String WARNING_SECSUPPLYPRESSHIGH = "secSupplyPressHigh";
    // 二网供水压力低限
    String WARNING_SECSUPPLYPRESSLOW = "secSupplyPressLow";
    // 二网回水压力高限
    String WARNING_SECBACKWATERPRESSHIGH = "secBackWaterPressHigh";
    // 二网回水压力低限
    String WARNING_SECBACKWATERPRESSLOW = "secBackWaterPressLow";
    // 二网供水温度高限
    String WARNING_SECSUPPLYTEMPHIGH = "secSupplyTempHigh";
    // 二网供水温度低限
    String WARNING_SECSUPPLYTEMPLOW = "secSupplyTempLow";
    // 二网回水温度高限
    String WARNING_SECBACKWATERTEMPHIGH = "secBackWaterTempHigh";
    // 二网回水温度低限
    String WARNING_SECBACKWATERTEMPLOW = "secBackWaterTempLow";
    // 二网循环泵频率高限
    String WARNING_CIRCPUMPFREQUENCYHIGH = "circPumpFrequencyHigh";

    /**
     * SQL用数字(SQl专用)
     */
    // 数字1
    int SQL_1 = 1;
    // 数字2
    int SQL_2 = 2;
    // 数字3
    int SQL_3 = 3;
    // 数字4
    int SQL_4 = 4;
    // 数字5
    int SQL_5 = 5;
    // 数字6
    int SQL_6 = 6;
    // 数字7
    int SQL_7 = 7;
    // 数字8
    int SQL_8 = 8;
    // 数字9
    int SQL_9 = 9;
    // 数字10
    int SQL_10 = 10;
    // 数字11
    int SQL_11 = 11;
    // 数字12
    int SQL_12 = 12;
    // 数字13
    int SQL_13 = 13;
    // 数字14
    int SQL_14 = 14;
    // 数字15
    int SQL_15 = 15;
    // 数字16
    int SQL_16 = 16;
    // 数字17
    int SQL_17 = 17;
    // 数字18
    int SQL_18 = 18;
    // 数字19
    int SQL_19 = 19;
    // 数字20
    int SQL_20 = 20;
    // 数字22
    int SQL_21 = 21;
    // 数字22
    int SQL_22 = 22;
    // 数字23
    int SQL_23 = 23;
    // 数字24
    int SQL_24 = 24;
    // 数字25
    int SQL_25 = 25;
    // 数字26
    int SQL_26 = 26;
    // 数字27
    int SQL_27 = 27;
    // 数字28
    int SQL_28 = 28;
    // 数字29
    int SQL_29 = 29;
    // 数字30
    int SQL_30 = 30;
    // 数字33
    int SQL_31 = 31;
    // 数字33
    int SQL_32 = 32;
    // 数字33
    int SQL_33 = 33;
    // 数字34
    int SQL_34 = 34;
    // 数字35
    int SQL_35 = 35;
    // 数字36
    int SQL_36 = 36;
    // 数字37
    int SQL_37 = 37;
    // 数字38
    int SQL_38 = 38;
    // 数字39
    int SQL_39 = 39;
    // 数字40
    int SQL_40 = 40;
    // 数字41
    int SQL_41 = 41;
    // 数字42
    int SQL_42 = 42;
    // 数字43
    int SQL_43 = 43;
    // 数字44
    int SQL_44 = 44;
    // 数字45
    int SQL_45 = 45;
    
    /**
     * 报表用
     */
    // 开始时间
    String BEGINTIME = "beginTime";
    // 结束时间
    String ENDTIME = "endTime";

}
