
/*==============================================================*/
/* 公司 company   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_COMPANY');
END;
/
CREATE TABLE IB_COMPANY(
        ID                 VARCHAR2(64),
        NAME          VARCHAR2(256),
	    DESCN        VARCHAR2(256),
        STATUS       INTEGER,
	    REF             VARCHAR2(256),
	    SCOPE_ID   VARCHAR2(64),
        CONSTRAINT PK_ORG_COMPANY PRIMARY KEY(ID)
);

/*==============================================================*/
/* 部门 department  */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_DEPARTMENT');
END;
/
CREATE TABLE IB_DEPARTMENT(
        ID                   VARCHAR2(64),
        COMPANYID VARCHAR2(64),
        NAME            VARCHAR2(200),
	    DESCN           VARCHAR2(200),
        STATUS          INTEGER,
	    REF               VARCHAR2(200),
	    SCOPE_ID     VARCHAR2(50),
        CONSTRAINT PK_ORG_DEPARTMENT PRIMARY KEY(ID)
);

/*==============================================================*/
/* 小组 group  */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_GROUP');
END;
/
CREATE TABLE IB_GROUP(
        ID                      VARCHAR2(64),
        COMPANYID    VARCHAR2(64),
        DEPTID            VARCHAR2(64),
        NAME              VARCHAR2(256),
	    DESCN             VARCHAR2(256),
        STATUS            INTEGER,
	    REF                  VARCHAR2(256),
	    SCOPE_ID       VARCHAR2(64),
        CONSTRAINT PK_ORG_GROUP PRIMARY KEY(ID)
);

/*==============================================================*/
/* job type 职务类型表  */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_JOB_TYPE');
END;
/
CREATE TABLE IB_JOB_TYPE(
        ID                 VARCHAR2(64),
	    NAME          VARCHAR2(64),
	    PARENT_ID VARCHAR2(64),
	    SCOPE_ID    VARCHAR2(64),
        CONSTRAINT PK_IB_JOB_TYPE PRIMARY KEY(ID)
        /*,CONSTRAINT FK_IB_JOB_TYPE_PARENT FOREIGN KEY(PARENT_ID) REFERENCES IB_JOB_TYPE(ID) */
);

/*==============================================================*/
/* job title 职位名称管理表 */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_JOB_TITLE');
END;
/
CREATE TABLE IB_JOB_TITLE(
        ID                VARCHAR2(64),
	    NAME         VARCHAR2(64),
	    SCOPE_ID   VARCHAR2(64),
        CONSTRAINT PK_IB_JOB_TITLE PRIMARY KEY(ID)
);

/*==============================================================*/
/* job info 职务管理表 */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_JOB_INFO');
END;
/
CREATE TABLE IB_JOB_INFO(
        ID               VARCHAR2(64),
	    NAME        VARCHAR2(64),
	    TYPE_ID    VARCHAR2(64),
	    TITLE_ID   VARCHAR2(64), 
	    SCOPE_ID  VARCHAR2(64),
        CONSTRAINT PK_IB_JOB_INFO PRIMARY KEY(ID)
        /*,CONSTRAINT FK_IB_JOB_INFO_TYPE FOREIGN KEY(TYPE_ID) REFERENCES IB_JOB_TYPE(ID),
        CONSTRAINT FK_IB_JOB_INFO_TITLE FOREIGN KEY(TITLE_ID) REFERENCES IB_JOB_TITLE(ID) */
);

