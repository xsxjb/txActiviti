/*==============================================================*/
/* config table info 业务表结构管理表   */
/*==============================================================*/
CREATE TABLE TX_CONF_TABLE(
    UUID  VARCHAR(64),
	TABLENAME VARCHAR(128),
	TABLENAMECOMMENT VARCHAR(128),
        CONSTRAINT PK_TX_CONF_TABLE PRIMARY KEY(UUID)
) ENGINE=INNODB;
