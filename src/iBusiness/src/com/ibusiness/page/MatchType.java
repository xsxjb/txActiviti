package com.ibusiness.page;

/**
 * MatchType.查询条件枚举类
 * 
 * @author Lingo
 */
public enum MatchType {
    /** equals. */
    EQ,
    /** like. */
    LIKE,
    /** less than. */
    LT,
    /** greater than. */
    GT,
    /** less equals. */
    LE,
    /** greater equals. */
    GE,
    /** in. */
    IN,
    /** unknown. */
    UNKNOWN;
}
