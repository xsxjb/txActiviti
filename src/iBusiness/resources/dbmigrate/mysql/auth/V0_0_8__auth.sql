
-------------------------------------------------------------------------------
--  user status
-------------------------------------------------------------------------------
CREATE TABLE AUTH_USER_STATUS(
	ID BIGINT auto_increment,
	USERNAME VARCHAR(50),
	PASSWORD VARCHAR(50),
	STATUS INTEGER,
	REF VARCHAR(64),
	USER_REPO_ID BIGINT,
	USER_REPO_REF VARCHAR(50),
	SCOPE_ID VARCHAR(50),
	CONSTRAINT PK_AUTH_USER_STATUS PRIMARY KEY(ID)
) engine=innodb;
-------------------------------------------------------------------------------
--  role def
-------------------------------------------------------------------------------
CREATE TABLE AUTH_ROLE_DEF(
        ID BIGINT auto_increment,
        NAME VARCHAR(50),
        DESCN VARCHAR(200),
	SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_AUTH_ROLE_DEF PRIMARY KEY(ID)
) engine=innodb;

-------------------------------------------------------------------------------
--  role
-------------------------------------------------------------------------------
CREATE TABLE AUTH_ROLE(
        ID BIGINT auto_increment,
        NAME VARCHAR(50),
        DESCN VARCHAR(200),
	ROLE_DEF_ID BIGINT,
	SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_AUTH_ROLE PRIMARY KEY(ID),
        CONSTRAINT FK_AUTH_ROLE_DEF FOREIGN KEY(ROLE_DEF_ID) REFERENCES AUTH_ROLE_DEF(ID)
) engine=innodb;

-------------------------------------------------------------------------------
--  permission type
-------------------------------------------------------------------------------
CREATE TABLE AUTH_PERM_TYPE(
        ID BIGINT auto_increment,
        NAME VARCHAR(50),
	TYPE INTEGER,
	PRIORITY INTEGER,
        DESCN VARCHAR(200),
	SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_AUTH_PERM_TYPE PRIMARY KEY(ID)
) engine=innodb;

-------------------------------------------------------------------------------
--  permission
-------------------------------------------------------------------------------
CREATE TABLE AUTH_PERM(
        ID BIGINT auto_increment,
	CODE VARCHAR(200),
	NAME VARCHAR(200),
	PERM_TYPE_ID BIGINT NOT NULL,
	PRIORITY INTEGER,
	SCOPE_ID VARCHAR(50),
        CONSTRAINT PK_AUTH_PERM PRIMARY KEY(ID),
	CONSTRAINT FK_AUTH_PERM_TYPE FOREIGN KEY(PERM_TYPE_ID) REFERENCES AUTH_PERM_TYPE(ID)
) engine=innodb;

-------------------------------------------------------------------------------
--  permission role def
-------------------------------------------------------------------------------
CREATE TABLE AUTH_PERM_ROLE_DEF(
        PERM_ID BIGINT NOT NULL,
        ROLE_DEF_ID BIGINT NOT NULL,
        CONSTRAINT PK_AUTH_PERM_ROLE_DEF PRIMARY KEY(PERM_ID,ROLE_DEF_ID),
        CONSTRAINT FK_AUTH_PERM_ROLE_DEF_PERM FOREIGN KEY(PERM_ID) REFERENCES AUTH_PERM(ID),
        CONSTRAINT FK_AUTH_PERM_ROLE_DEF_ROLE_DEF FOREIGN KEY(ROLE_DEF_ID) REFERENCES AUTH_ROLE_DEF(ID)
) engine=innodb;

-------------------------------------------------------------------------------
--  access
-------------------------------------------------------------------------------
CREATE TABLE AUTH_ACCESS(
	ID BIGINT auto_increment,
	TYPE VARCHAR(50),
	VALUE VARCHAR(200),
	PERM_ID BIGINT,
	PRIORITY INTEGER,
	DESCN VARCHAR(200),
	SCOPE_ID VARCHAR(50),
	CONSTRAINT PK_AUTH_ACCESS PRIMARY KEY(ID),
	CONSTRAINT FK_AUTH_ACCESS_PERM FOREIGN KEY(PERM_ID) REFERENCES AUTH_PERM(ID)
) engine=innodb;

-------------------------------------------------------------------------------
--  user role
-------------------------------------------------------------------------------
CREATE TABLE AUTH_USER_ROLE(
        USER_STATUS_ID BIGINT NOT NULL,
        ROLE_ID BIGINT NOT NULL,
        CONSTRAINT PK_AUTH_USER_ROLE PRIMARY KEY(USER_STATUS_ID,ROLE_ID),
        CONSTRAINT FK_AUTH_USER_ROLE_USER FOREIGN KEY(USER_STATUS_ID) REFERENCES AUTH_USER_STATUS(ID),
        CONSTRAINT FK_AUTH_USER_ROLE_ROLE FOREIGN KEY(ROLE_ID) REFERENCES AUTH_ROLE(ID)
) engine=innodb;
