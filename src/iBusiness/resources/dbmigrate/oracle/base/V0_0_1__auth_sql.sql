/*==============================================================*/
/* 删除表 */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE drop_table(table_name1 in varchar2) authid current_user
IS
v_c number(10);
BEGIN
    SELECT count(table_name) into v_c FROM user_tables WHERE table_name=upper(table_name1);
  IF(v_c>0) THEN
    execute immediate ' drop table ' || table_name1 || ' purge';
  END IF;
END drop_table;
/

/*-------------------------------------------------------------------------------*/
/*--  scope info 应用管理表   */
/*-------------------------------------------------------------------------------*/
declare
BEGIN
    drop_table('IB_SCOPE_INFO');
END;
/
CREATE TABLE IB_SCOPE_INFO(
        ID         VARCHAR2(64),
        NAME  VARCHAR2(64),
		CODE   VARCHAR2(64),
		REF      VARCHAR2(64),
		SHARED INTEGER,
		USER_REPO_REF VARCHAR2(64),
		TYPE INTEGER,
        CONSTRAINT PK_SCOPE_INFO PRIMARY KEY(ID)
);

/*-------------------------------------------------------------------------------*/
/*--  role def 角色模板管理表 */
/*-------------------------------------------------------------------------------*/
declare
BEGIN
    drop_table('IB_AUTH_ROLE_DEF');
END;
/
CREATE TABLE IF NOT EXISTS IB_AUTH_ROLE_DEF(
        ID              VARCHAR2(64),
        NAME       VARCHAR2(64),
        DESCN      VARCHAR2(256),
	    SCOPE_ID VARCHAR2(64),
        CONSTRAINT PK_AUTH_ROLE_DEF PRIMARY KEY(ID)
);

/*-------------------------------------------------------------------------------*/
/*--  permission type 授权类型表 */
/*-------------------------------------------------------------------------------*/
declare
BEGIN
    drop_table('IB_AUTH_PERM_TYPE');
END;
/
CREATE TABLE IF NOT EXISTS IB_AUTH_PERM_TYPE(
        ID        VARCHAR2(64),
        NAME VARCHAR2(64),
	    TYPE INTEGER,
	    PRIORITY INTEGER,
        DESCN VARCHAR2(256),
	    SCOPE_ID VARCHAR2(64),
        CONSTRAINT PK_AUTH_PERM_TYPE PRIMARY KEY(ID)
);

/*-------------------------------------------------------------------------------*/
/*--  permission 授权管理表  */
/*-------------------------------------------------------------------------------*/
declare
BEGIN
    drop_table('IB_AUTH_PERM');
END;
/
CREATE TABLE IF NOT EXISTS IB_AUTH_PERM(
        ID VARCHAR2(64),
		CODE VARCHAR2(200),
		NAME VARCHAR2(200),
		PERM_TYPE_ID VARCHAR2(64) NOT NULL,
		PRIORITY INTEGER,
		SCOPE_ID VARCHAR2(64),
        CONSTRAINT PK_AUTH_PERM PRIMARY KEY(ID)
	/* ,CONSTRAINT FK_AUTH_PERM_TYPE FOREIGN KEY(PERM_TYPE_ID) REFERENCES IB_AUTH_PERM_TYPE(ID) */
);

/*-------------------------------------------------------------------------------*/
/*--  permission role def  授权和角色模板关联表   */
/*-------------------------------------------------------------------------------*/
declare
BEGIN
    drop_table('IB_AUTH_PERM_ROLE_DEF');
END;
/
CREATE TABLE IB_AUTH_PERM_ROLE_DEF(
        PERM_ID VARCHAR2(64) NOT NULL,
        ROLE_DEF_ID VARCHAR2(64) NOT NULL,
        CONSTRAINT PK_AUTH_PERM_ROLE_DEF PRIMARY KEY(PERM_ID,ROLE_DEF_ID)
      /* , CONSTRAINT FK_AUTH_PERM_ROLE_DEF_PERM FOREIGN KEY(PERM_ID) REFERENCES IB_AUTH_PERM(ID),
        CONSTRAINT FK_AUTH_PERM_ROLE_DEF_ROLE_DEF FOREIGN KEY(ROLE_DEF_ID) REFERENCES IB_AUTH_ROLE_DEF(ID)
        */
);

/*-------------------------------------------------------------------------------*/
/*--  access 资源访问权限表  */
/*-------------------------------------------------------------------------------*/
DECLARE
BEGIN
    drop_table('IB_AUTH_ACCESS');
END;
/
CREATE TABLE IB_AUTH_ACCESS(
	ID               VARCHAR2(64),
	TYPE         VARCHAR2(64),
	VALUE       VARCHAR2(256),
	PERM_ID   VARCHAR2(64),
	PRIORITY  INTEGER,
	DESCN       VARCHAR2(256),
	SCOPE_ID  VARCHAR2(64),
	MENU_ID  VARCHAR2(64),
	CONSTRAINT PK_AUTH_ACCESS PRIMARY KEY(ID)
/*	,CONSTRAINT FK_AUTH_ACCESS_PERM FOREIGN KEY(PERM_ID) REFERENCES IB_AUTH_PERM(ID) */
);
