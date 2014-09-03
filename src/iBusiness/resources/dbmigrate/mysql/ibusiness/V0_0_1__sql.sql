/*==============================================================*/
/* 业务模块组件管理表   */
/*==============================================================*/
CREATE TABLE IB_CONF_SERVICE_MODULE (
    ID  VARCHAR(64),
	PACKAGENAME VARCHAR(128),
	MODULENAME VARCHAR(128),
	PARENTID VARCHAR(64),
	TYPEID VARCHAR(8),
	SUBNAME VARCHAR(32),
        CONSTRAINT PK_TX_CONF_TABLE PRIMARY KEY(ID)
) ENGINE=INNODB;

/*==============================================================*/
/* config table info 业务表结构管理表   */
/*==============================================================*/
CREATE TABLE IB_CONF_TABLE(
    UUID  VARCHAR(64),
    PACKAGENAME VARCHAR(128),
	TABLENAME VARCHAR(128),
	TABLENAMECOMMENT VARCHAR(128),
        CONSTRAINT PK_IB_CONF_TABLE PRIMARY KEY(UUID)
) ENGINE=INNODB;

/*==============================================================*/
/* config table columns info 业务表字段结构管理表   */
/*==============================================================*/
CREATE TABLE IB_CONF_TABLE_COLUMNS (
		tableName VARCHAR(128),
		columnValue VARCHAR(128),
		columnName VARCHAR(128),
		columnType VARCHAR(32),
		columnSize VARCHAR(8),
		isNull VARCHAR(8),
		defaultValue VARCHAR(32),
		columnNo INTEGER,
        CONSTRAINT PK_TX_CONF_TABLE_COL PRIMARY KEY(tableName,COLUMNVALUE)
) ENGINE=INNODB;

/*==============================================================*/
/* IB_CONF_FORM–表单管理表   */
/*==============================================================*/
CREATE TABLE IB_CONF_FORM (
		UUID VARCHAR(64),
		PACKAGENAME VARCHAR(128),
		FORMNAME VARCHAR(128),
		FORMTITLE VARCHAR(128),
        CONSTRAINT PK_TX_CONF_TABLE_COL PRIMARY KEY(UUID)
) ENGINE=INNODB;

/*==============================================================*/
/* IB_CONF_FORM_TABLE-表单对应数据表管理表   */
/*==============================================================*/
CREATE TABLE IB_CONF_FORM_TABLE (
		PACKAGENAME VARCHAR(128),
		FORMNAME VARCHAR(128),
		TABLENAME VARCHAR(128),
		TABLETYPE VARCHAR(32),
		PARENTTABLENAME VARCHAR(128),
        CONSTRAINT PK_TX_CONF_TABLE_COL PRIMARY KEY(FORMNAME, TABLENAME)
) ENGINE=INNODB;

/*==============================================================*/
/* 公司 company   */
/*==============================================================*/
CREATE TABLE IB_COMPANY(
        ID BIGINT auto_increment,
        NAME VARCHAR(200),
	    DESCN VARCHAR(200),
        STATUS INTEGER,
	    REF VARCHAR(200),
	    SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_ORG_COMPANY PRIMARY KEY(ID)
) engine=innodb;

/*==============================================================*/
/* 部门 department  */
/*==============================================================*/
CREATE TABLE IB_DEPARTMENT(
        ID BIGINT auto_increment,
        COMPANYID BIGINT,
        NAME VARCHAR(200),
	    DESCN VARCHAR(200),
        STATUS INTEGER,
	    REF VARCHAR(200),
	    SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_ORG_DEPARTMENT PRIMARY KEY(ID)
) engine=innodb;

/*==============================================================*/
/* 小组 group  */
/*==============================================================*/
CREATE TABLE IB_GROUP(
        ID BIGINT auto_increment,
        COMPANYID BIGINT,
        DEPTID BIGINT,
        NAME VARCHAR(200),
	    DESCN VARCHAR(200),
        STATUS INTEGER,
	    REF VARCHAR(200),
	    SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_ORG_GROUP PRIMARY KEY(ID)
) engine=innodb;

/*==============================================================*/
/* job type 职务类型表  */
/*==============================================================*/
CREATE TABLE IB_JOB_TYPE(
        ID BIGINT auto_increment,
	    NAME VARCHAR(50),
	    PARENT_ID BIGINT,
	    SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_IB_JOB_TYPE PRIMARY KEY(ID),
        CONSTRAINT FK_IB_JOB_TYPE_PARENT FOREIGN KEY(PARENT_ID) REFERENCES IB_JOB_TYPE(ID)
) engine=innodb;

/*==============================================================*/
/* job title 职位名称管理表 */
/*==============================================================*/
CREATE TABLE IB_JOB_TITLE(
        ID BIGINT auto_increment,
	    NAME VARCHAR(50),
	    SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_IB_JOB_TITLE PRIMARY KEY(ID)
) engine=innodb;

/*==============================================================*/
/* job info 职务管理表 */
/*==============================================================*/
CREATE TABLE IB_JOB_INFO(
        ID BIGINT auto_increment,
	    NAME VARCHAR(50),
	    TYPE_ID BIGINT,
	    TITLE_ID BIGINT,
	    SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_IB_JOB_INFO PRIMARY KEY(ID),
        CONSTRAINT FK_IB_JOB_INFO_TYPE FOREIGN KEY(TYPE_ID) REFERENCES IB_JOB_TYPE(ID),
        CONSTRAINT FK_IB_JOB_INFO_TITLE FOREIGN KEY(TITLE_ID) REFERENCES IB_JOB_TITLE(ID)
) engine=innodb;

/*==============================================================*/
/*  菜单管理表 */
/*==============================================================*/
CREATE TABLE IB_MENU(
        ID VARCHAR(64),
        MENUNAME VARCHAR(256),
		MENULEVEL VARCHAR(16),
		MENUURL VARCHAR(256),
		MENUIFRAME VARCHAR(16),
		MENUORDER VARCHAR(16),
		PARENTID VARCHAR(64),
        CONSTRAINT PK_IB_MENU PRIMARY KEY(ID)
) engine=innodb;

/*==============================================================*/
/*  菜单和角色模板关联表*/
/*==============================================================*/
CREATE TABLE IB_MENU_ROLE_DEF(
        MENU_ID VARCHAR(64) NOT NULL,
        ROLE_DEF_ID BIGINT NOT NULL,
        CONSTRAINT PK_AUTH_PERM_ROLE_DEF PRIMARY KEY(MENU_ID,ROLE_DEF_ID)
) engine=innodb;
