
/*-------------------------------------------------------------------------------*/
/*--  user repo 用户库列表  */
/*-------------------------------------------------------------------------------*/
declare
BEGIN
    drop_table('IB_USER_REPO');
END;
/
CREATE TABLE IB_USER_REPO(
        ID         VARCHAR2(64),
		CODE   VARCHAR2(64),
        NAME  VARCHAR2(64),
		REF      VARCHAR2(64),
		SCOPE_ID VARCHAR2(64),
        CONSTRAINT PK_U_USER_REPO PRIMARY KEY(ID)
);

/*==============================================================*/
/* user base 用户表   */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_USER_BASE');
END;
/
CREATE TABLE IB_USER_BASE(
        ID                         VARCHAR2(64),
        USERNAME         VARCHAR2(64),
		DISPLAY_NAME  VARCHAR2(64),
        PASSWORD         VARCHAR2(64),
        STATUS                INTEGER,
		REF                      VARCHAR2(64),
		USER_REPO_ID   VARCHAR2(64),
		SCOPE_ID            VARCHAR2(64),
		email                    VARCHAR2(128),
		mobile                 VARCHAR2(64),
		JOB_INFO_ID       BIGINT,
		ROLE_DEF_ID     VARCHAR2(64),
		CSS                       VARCHAR2(64),
        CONSTRAINT PK_USER_BASE PRIMARY KEY(ID)
       /* ,CONSTRAINT FK_USER_BASE_REPO FOREIGN KEY(USER_REPO_ID) REFERENCES IB_USER_REPO(ID) */
);
