/*==============================================================*/
/* 仓库信息表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_WAREHOUSE;
CREATE TABLE IB_WAREHOUSE (
  ID                                   varchar(64) NOT NULL,
  WAREHOUSENO           varchar(64) DEFAULT NULL,
  WAREHOUSENAME      varchar(128) DEFAULT NULL,
  WAREHOUSELOCATION varchar(128) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 物料分类信息表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIALS_TYPE;
CREATE TABLE IB_MATERIALS_TYPE (
  ID                      varchar(64) NOT NULL,
  TYPENO            varchar(64) ,
  TYPENAME      varchar(128) ,
  RPARENTID     varchar(64) ,
  ISLEAF             varchar(8) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 物料表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIALS;
CREATE TABLE IB_MATERIALS (
  ID                            varchar(64) NOT NULL,
  materialTypeNo    varchar(64) ,
  materialNo             varchar(64) ,
  materialName        varchar(128) ,
  model                     varchar(64) ,
  materialPrice        double(12,2) ,
  materialUnit          varchar(8) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 产成品分类表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PRODUCTTYPE;
CREATE TABLE IB_PRODUCTTYPE (
  ID                      varchar(64) NOT NULL,
  TYPENO            varchar(64) ,
  TYPENAME      varchar(128) ,
  RPARENTID     varchar(64) ,
  ISLEAF             varchar(8) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  产成品表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PRODUCT;
CREATE TABLE IB_PRODUCT (
  ID                                  varchar(64) NOT NULL,
  PRODUCTTYPE            varchar(64) ,
  PRODUCTFLOWID      varchar(64) ,
  PRODUCTNO                varchar(64) ,
  PRODUCTNAME           varchar(128) ,
  PRODUCTMODEL         varchar(64) ,
  PRODUCTUNIT             varchar(8) ,
  UNITPRICE                   double(12,2) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  原料入库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_IN;
CREATE TABLE IB_MATERIAL_IN (
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
/*  原料入库信息子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_IN_S;
CREATE TABLE IB_MATERIAL_IN_S (
  ID varchar(64) NOT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  MATERIALNO varchar(64) DEFAULT NULL,
  MATERIALNAME varchar(128) DEFAULT NULL,
  MATERIALMODEL varchar(64) DEFAULT NULL,
  MATERIALUNIT varchar(16) DEFAULT NULL,
  MATERIALNUM int(10) DEFAULT NULL,
  AMOUNT double(12,2) DEFAULT NULL,
  MANUFACTURENAME varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;

