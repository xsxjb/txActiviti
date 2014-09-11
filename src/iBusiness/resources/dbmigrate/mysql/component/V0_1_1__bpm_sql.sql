/*==============================================================*/
/* IB_CONF_BPM_FLOW BPM流程管理表   */
/*==============================================================*/
CREATE TABLE IB_CONF_BPM_FLOW (
	     ID  VARCHAR(64),
	     PACKAGENAME VARCHAR(128),
	     FLOWNAME VARCHAR(128),
        CONSTRAINT PK_IB_CONF_BPM_FLOW PRIMARY KEY(ID)
) ENGINE=INNODB;

