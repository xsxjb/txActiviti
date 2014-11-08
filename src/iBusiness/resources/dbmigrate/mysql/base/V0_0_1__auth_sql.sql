/*-------------------------------------------------------------------------------*/
/*--  scope info 应用管理表   */
/*-------------------------------------------------------------------------------*/
DROP TABLE IF EXISTS IB_SCOPE_INFO;
CREATE TABLE IB_SCOPE_INFO(
        ID BIGINT auto_increment,
        NAME VARCHAR(50),
		CODE VARCHAR(50),
		REF VARCHAR(50),
		SHARED INTEGER,
		USER_REPO_REF VARCHAR(50),
		TYPE INTEGER,
        CONSTRAINT PK_SCOPE_INFO PRIMARY KEY(ID)
) engine=innodb;

/*-------------------------------------------------------------------------------*/
/*--  role def 角色模板管理表 */
/*-------------------------------------------------------------------------------*/
DROP TABLE IF EXISTS IB_AUTH_ROLE_DEF;
CREATE TABLE IF NOT EXISTS IB_AUTH_ROLE_DEF(
        ID BIGINT auto_increment,
        NAME VARCHAR(50),
        DESCN VARCHAR(200),
	SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_AUTH_ROLE_DEF PRIMARY KEY(ID)
) engine=innodb;

/*-------------------------------------------------------------------------------*/
/*--  permission type 授权类型表 */
/*-------------------------------------------------------------------------------*/
DROP TABLE IF EXISTS IB_AUTH_PERM_TYPE;
CREATE TABLE IF NOT EXISTS IB_AUTH_PERM_TYPE(
        ID BIGINT auto_increment,
        NAME VARCHAR(50),
	TYPE INTEGER,
	PRIORITY INTEGER,
        DESCN VARCHAR(200),
	SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_AUTH_PERM_TYPE PRIMARY KEY(ID)
) engine=innodb;

/*-------------------------------------------------------------------------------*/
/*--  permission 授权管理表  */
/*-------------------------------------------------------------------------------*/
DROP TABLE IF EXISTS IB_AUTH_PERM;
CREATE TABLE IF NOT EXISTS IB_AUTH_PERM(
        ID BIGINT auto_increment,
	CODE VARCHAR(200),
	NAME VARCHAR(200),
	PERM_TYPE_ID BIGINT NOT NULL,
	PRIORITY INTEGER,
	SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_AUTH_PERM PRIMARY KEY(ID)
	/* ,CONSTRAINT FK_AUTH_PERM_TYPE FOREIGN KEY(PERM_TYPE_ID) REFERENCES IB_AUTH_PERM_TYPE(ID) */
) engine=innodb;

/*-------------------------------------------------------------------------------*/
/*--  permission role def  授权和角色模板关联表   */
/*-------------------------------------------------------------------------------*/
DROP TABLE IF EXISTS IB_AUTH_PERM_ROLE_DEF;
CREATE TABLE IB_AUTH_PERM_ROLE_DEF(
        PERM_ID BIGINT NOT NULL,
        ROLE_DEF_ID BIGINT NOT NULL,
        CONSTRAINT PK_AUTH_PERM_ROLE_DEF PRIMARY KEY(PERM_ID,ROLE_DEF_ID)
      /* , CONSTRAINT FK_AUTH_PERM_ROLE_DEF_PERM FOREIGN KEY(PERM_ID) REFERENCES IB_AUTH_PERM(ID),
        CONSTRAINT FK_AUTH_PERM_ROLE_DEF_ROLE_DEF FOREIGN KEY(ROLE_DEF_ID) REFERENCES IB_AUTH_ROLE_DEF(ID)
        */
) engine=innodb;

/*-------------------------------------------------------------------------------*/
/*--  access 资源访问权限表  */
/*-------------------------------------------------------------------------------*/
DROP TABLE IF EXISTS IB_AUTH_ACCESS;
CREATE TABLE IB_AUTH_ACCESS(
	ID BIGINT auto_increment,
	TYPE VARCHAR(50),
	VALUE VARCHAR(200),
	PERM_ID BIGINT,
	PRIORITY INTEGER,
	DESCN VARCHAR(200),
	SCOPE_ID VARCHAR(50),
	MENU_ID VARCHAR(64),
	CONSTRAINT PK_AUTH_ACCESS PRIMARY KEY(ID)
/*	,CONSTRAINT FK_AUTH_ACCESS_PERM FOREIGN KEY(PERM_ID) REFERENCES IB_AUTH_PERM(ID) */
) engine=innodb;
