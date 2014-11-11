package com.ibusiness.common.config;

/**
 * 读取Properties文件信息配置类
 * 
 * @author JiangBo
 *
 */
public class ConfigProperties {
	
	private static PropertiesReader pr = null;

	// 日期时间类型_创建数据库表字段时用。用于区分mysql：DATETIME 和oracle：DATE  
	public static String DATATYPE_DATE;
	
	static {
		pr = new PropertiesReader("/application.properties");
		DATATYPE_DATE = pr.getValue("default.datatype.DATE");
	}
}
