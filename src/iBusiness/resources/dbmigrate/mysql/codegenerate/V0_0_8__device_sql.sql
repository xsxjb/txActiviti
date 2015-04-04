/* ======================== 工程部模块 ====================  */

/*==============================================================*/
/* 仓库信息表   */
/*==============================================================
DROP TABLE IF EXISTS IB_WAREHOUSE;
CREATE TABLE IB_WAREHOUSE (WAREHOUSENO VARCHAR(64), WAREHOUSENAME VARCHAR(128), WAREHOUSELOCATION VARCHAR(128), ID VARCHAR(64), SCOPEID VARCHAR(64),  PRIMARY KEY (ID)) ENGINE=INNODB;
*/
/*==============================================================*/
/* 设备分类信息表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DEVICE_TYPE;
CREATE TABLE IB_DEVICE_TYPE (TYPENO VARCHAR(64), TYPENAME VARCHAR(256), PARENTID VARCHAR(64), ISLEAF VARCHAR(16), ID VARCHAR(64), SCOPEID VARCHAR(64),  PRIMARY KEY (ID)) ENGINE=INNODB;

/*==============================================================*/
/* 设备表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DEVICE;
CREATE TABLE IB_DEVICE (DEVICENO VARCHAR(64), DEVICENAME VARCHAR(64), DEVICEPRICE DOUBLE(12,2), DEVICETYPENO VARCHAR(64), DEVICEUNIT VARCHAR(8), MODEL VARCHAR(64), ID VARCHAR(64), SCOPEID VARCHAR(64),  PRIMARY KEY (ID)) ENGINE=INNODB;

/*==============================================================*/
/*  设备入库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DEVICE_IN;
CREATE TABLE IB_DEVICE_IN (
  ID varchar(64) NOT NULL,
  EXECUTIONID varchar(64) DEFAULT NULL,
  ASSIGNEEUSER varchar(128) DEFAULT NULL,
  DONEFLAG int(11) DEFAULT '0',
  USERNAME varchar(128) DEFAULT NULL,
  TASKTITLE varchar(256) DEFAULT NULL,
  NODENAME varchar(128) DEFAULT NULL,
  CREATEDATEBPM datetime DEFAULT NULL,
  EVENTDATE datetime DEFAULT NULL,
  SUPPLIERSNAME varchar(64) DEFAULT NULL,
  WAREHOUSENO varchar(64) DEFAULT NULL,
  WAREHOUSENAME varchar(64) DEFAULT NULL,
  TOTALNUM int(10) DEFAULT NULL,
  AMOUNT double(12,2) DEFAULT NULL,
  AMOUNTBIG varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  设备入库信息子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DEVICE_IN_S;
CREATE TABLE IB_DEVICE_IN_S (
  ID varchar(64) NOT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  DEVICENO varchar(64) DEFAULT NULL,
  DEVICENAME varchar(128) DEFAULT NULL,
  DEVICEMODEL varchar(64) DEFAULT NULL,
  DEVICEUNIT varchar(16) DEFAULT NULL,
  DEVICENUM int(10) DEFAULT NULL,
  AMOUNT double(12,2) DEFAULT NULL,
  MANUFACTURENAME varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  设备库存管理表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_WAREHOUSE_DEVICE;
CREATE TABLE IB_WAREHOUSE_DEVICE (DEVICETYPENO VARCHAR(64), DEVICENO VARCHAR(64), DEVICENAME VARCHAR(128), DEVICEMODEL VARCHAR(64), DEVICEPRICE DOUBLE(12,2), DEVICEUNIT VARCHAR(8), DEVICENUM INT(10), WAREHOUSENO VARCHAR(64), WAREHOUSENAME VARCHAR(128), ID VARCHAR(64), SCOPEID VARCHAR(64),  PRIMARY KEY (ID)) ENGINE=INNODB;

/*==============================================================*/
/*  (领料)设备出库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DEVICE_OUT;
CREATE TABLE IB_DEVICE_OUT (
  EXECUTIONID varchar(64) DEFAULT NULL,
  ASSIGNEEUSER varchar(128) DEFAULT NULL,
  DONEFLAG int(11) DEFAULT '0',
  ID varchar(64) NOT NULL,
  USERNAME varchar(128) DEFAULT NULL,
  TASKTITLE varchar(256) DEFAULT NULL,
  NODENAME varchar(128) DEFAULT NULL,
  CREATEDATEBPM datetime DEFAULT NULL,
  EVENTDATE datetime DEFAULT NULL,
  BATCHNO varchar(8) DEFAULT NULL,
  WAREHOUSENO varchar(64) DEFAULT NULL,
  CUSTOMERNAME varchar(64) DEFAULT NULL,
  CUSTOMERADDRESS varchar(256) DEFAULT NULL,
  DEVICENUM int(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  设备出库信息子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_DEVICE_OUT_S;
CREATE TABLE IB_DEVICE_OUT_S (
  ID varchar(64) NOT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  DEVICENO varchar(64) DEFAULT NULL,
  DEVICENAME varchar(128) DEFAULT NULL,
  DEVICEMODEL varchar(64) DEFAULT NULL,
  DEVICEUNIT varchar(16) DEFAULT NULL,
  DEVICENUM int(10) DEFAULT NULL,
  MANUFACTURENAME varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
