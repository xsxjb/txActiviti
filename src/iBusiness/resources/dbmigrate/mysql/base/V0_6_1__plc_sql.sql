/*==============================================================*/
/*  PLC绘图页面 设备对象配置管理表 */
/*==============================================================*/
DROP TABLE IF EXISTS IB_CONF_PLCDRAW;
CREATE TABLE IB_CONF_PLCDRAW (ID VARCHAR(64), ITEMID VARCHAR(64), ITEMNAME VARCHAR(64), ITEMTYPE VARCHAR(32), ITEMTITLE VARCHAR(32), IMGHURL VARCHAR(64), IMGVURL VARCHAR(64), REMARK VARCHAR(1024),  PRIMARY KEY (ID)) ENGINE=INNODB;
