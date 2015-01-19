
/*==============================================================*/
/* doc info 文档表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DOC_INFO;
CREATE TABLE IB_DOC_INFO(
        ID                 VARCHAR(64),
		NAME               VARCHAR(256),
		PATH               VARCHAR(256),
		DOCTYPE            INTEGER,
		CREATE_TIME        DATETIME,
		USER_ID            VARCHAR(64),
		DESCN              VARCHAR(255),
		SCOPEID            VARCHAR(64),
        CONSTRAINT PK_IB_DOC_INFO PRIMARY KEY(ID)
) engine=innodb;

