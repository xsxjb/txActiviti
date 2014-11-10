/*==============================================================*/
/* 业务模块组件管理表   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_CONF_COMPONENT');
END;
/
CREATE TABLE IB_CONF_COMPONENT (
         ID  VARCHAR2(64),
		 PACKAGENAME VARCHAR2(128),
		 MODULENAME VARCHAR2(128),
		 PARENTID VARCHAR2(64),
		 TYPEID VARCHAR2(8),
		 SUBNAME VARCHAR2(32),
        CONSTRAINT PK_IB_CONF_COMPONENT PRIMARY KEY(ID)
);

/*==============================================================*/
/* config table info 业务表结构管理表   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_CONF_TABLE');
END;
/
CREATE TABLE IB_CONF_TABLE(
		    ID  VARCHAR2(64),
		    PACKAGENAME VARCHAR2(128),
		    TABLENAME VARCHAR2(128),
		    TABLENAMECOMMENT VARCHAR2(128),
		    TABLETYPE  VARCHAR2(8),
		    PARENTTABLEID VARCHAR2(64),
		    ISBPMTABLE INTEGER,
        CONSTRAINT PK_IB_CONF_TABLE PRIMARY KEY(ID)
);

/*==============================================================*/
/* config table columns info 业务表字段结构管理表   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_CONF_TABLE_COLUMNS');
END;
/
CREATE TABLE IB_CONF_TABLE_COLUMNS (
  tableName VARCHAR2(128),
  columnValue VARCHAR2(128),
  columnName VARCHAR2(128),
  columnType VARCHAR2(32),
  columnSize VARCHAR2(8),
  isNull VARCHAR2(8),
  defaultValue VARCHAR2(32),
  columnNo INTEGER,
        CONSTRAINT PK_IB_CONF_TABLE_COLUMNS PRIMARY KEY(tableName,COLUMNVALUE)
);

/*==============================================================*/
/* IB_CONF_FORM–表单管理表   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_CONF_FORM');
END;
/
CREATE TABLE IB_CONF_FORM (
		   ID VARCHAR2(64),
		   PACKAGENAME VARCHAR2(128),
		   FORMNAME VARCHAR2(128),
		   FORMTITLE VARCHAR2(128),
		   FORMURL VARCHAR2(256),
		   ISEDIT INTEGER,
		   ISADD INTEGER,
		   ISDELETE INTEGER,
		   ISQUERY INTEGER,
		   ISBPMFORM INTEGER,
        CONSTRAINT PK_IB_CONF_FORM PRIMARY KEY(ID)
);

/*==============================================================*/
/* IB_CONF_FORM_TABLE-表单对应数据表管理表   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_CONF_FORM_TABLE');
END;
/
CREATE TABLE IB_CONF_FORM_TABLE (
  PACKAGENAME VARCHAR2(128),
  FORMNAME VARCHAR2(128),
  TABLENAME VARCHAR2(128),
  TABLETYPE  VARCHAR2(8),
        CONSTRAINT PK_IB_CONF_FORM_TABLE PRIMARY KEY(FORMNAME, TABLENAME)
);

/*==============================================================*/
/* IB_CONF_FORM_TABLE_COLUMS-表单对应字段管理表   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_CONF_FORM_TABLE_COLUMS');
END;
/
CREATE TABLE IB_CONF_FORM_TABLE_COLUMS (
		  PACKAGENAME     VARCHAR2(128),
		  FORMNAME           VARCHAR2(128),
		  FORMCOLUMN      VARCHAR2(128),
		  FORMCOLUMNTITLE VARCHAR2(128),
		  TABLECOLUMN     VARCHAR2(128),
		  TABLENAME          VARCHAR2(128),
		  COLUMNNO            INTEGER,
		  FCTYPE                   VARCHAR2(64),
		  FCWIDTH               VARCHAR2(8),
		  FCHEIGHT              VARCHAR2(8),
		  FCDISPLAY             VARCHAR2(8),
		  FCEDIT                   VARCHAR2(8),
		  FCQUERY                VARCHAR2(8),
		  FCDEFAULT            VARCHAR2(128),
		  CONFSELECTINFO VARCHAR2(512),
        CONSTRAINT PK_CONF_FORM_TABLE_COLUMS PRIMARY KEY(PACKAGENAME, FORMNAME, FORMCOLUMN)
);

