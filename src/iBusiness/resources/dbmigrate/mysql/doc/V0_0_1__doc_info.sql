

/*==============================================================*/
/* doc info   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DOC_INFO;
CREATE TABLE IB_DOC_INFO(
        ID BIGINT auto_increment,
	NAME VARCHAR(200),
	PATH VARCHAR(200),
	TYPE INTEGER,
	CREATE_TIME TIMESTAMP,
	USER_ID BIGINT,
	DESCN VARCHAR(255),
        CONSTRAINT PK_DOC_INFO PRIMARY KEY(ID)
) engine=innodb;

