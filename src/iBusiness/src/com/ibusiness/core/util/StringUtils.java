package com.ibusiness.core.util;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
/**
 * 字符串相关通用方法
 * 
 * @author JiangBo
 *
 */
public class StringUtils {
    protected StringUtils() {
    }
    public static boolean isEmpty(String text) {
        return StringUtils.isEmpty(text);
    }

    public static boolean isBlank(String text) {
        return StringUtils.isBlank(text);
    }

    public static boolean isNotBlank(String text) {
        return StringUtils.isNotBlank(text);
    }

    public static String capitalize(String text) {
        return StringUtils.capitalize(text);
    }

    public static String substring(String text, int offset, int limit) {
        return StringUtils.substring(text, offset,
                limit);
    }

    public static String substringBefore(String text, String token) {
        return StringUtils
                .substringBefore(text, token);
    }

    public static String substringAfter(String text, String token) {
        return StringUtils.substringAfter(text, token);
    }

    public static String[] splitByWholeSeparator(String text, String separator) {
        return StringUtils.splitByWholeSeparator(text,
                separator);
    }

    public static String join(List list, String separator) {
        return StringUtils.join(list, separator);
    }

    public static String escapeHtml(String text) {
        return StringEscapeUtils.escapeHtml4(text);
    }

    public static String unescapeHtml(String text) {
        return StringEscapeUtils.unescapeHtml4(text);
    }

    public static String escapeXml(String text) {
        return StringEscapeUtils.escapeXml11(text);
    }

    public static String unescapeXml(String text) {
        return StringEscapeUtils.unescapeXml(text);
    }
}
