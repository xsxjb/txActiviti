/*==============================================================*/
/* config table info 业务表结构管理表   */
/*==============================================================*/
CREATE TABLE TX_CONF_TABLE(
    UUID  VARCHAR(64),
	TABLENAME VARCHAR(128),
	TABLENAMECOMMENT VARCHAR(128),
        CONSTRAINT PK_TX_CONF_TABLE PRIMARY KEY(UUID)
) ENGINE=INNODB;

/*==============================================================*/
/* config table columns info 业务表字段结构管理表   */
/*==============================================================*/
CREATE TABLE TX_CONF_TABLE_COLUMNS (
	TABLENAME VARCHAR(128),
	TABLENAMECOMMENT VARCHAR(128),
	COLUMNNO INTEGER,
	COLUMNVALUE VARCHAR(128),
	COLUMNNAME VARCHAR(128),
	TYPEKEY VARCHAR(128),
	TYPEVALUE VARCHAR(128),
        CONSTRAINT PK_TX_CONF_TABLE_COL PRIMARY KEY(TABLENAME,COLUMNVALUE)
) ENGINE=INNODB;
