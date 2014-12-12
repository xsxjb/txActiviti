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
/*==============================================================*/
/*  原料库存管理表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_WAREHOUSE_MATERIALS;
CREATE TABLE IB_WAREHOUSE_MATERIALS (
  ID                                 varchar(64) NOT NULL,
  MATERIALTYPENO     varchar(64) DEFAULT NULL,
  MATERIALNO             varchar(64) DEFAULT NULL,
  MATERIALNAME       varchar(64) DEFAULT NULL,
  MATERIALMODEL    varchar(64) DEFAULT NULL,
  MATERIALPRICE       double(12,2) DEFAULT NULL,
  MATERIALUNIT        varchar(8) DEFAULT NULL,
  MATERIALNUM        int(10) DEFAULT NULL,
  WAREHOUSENO       varchar(64) DEFAULT NULL,
  WAREHOUSENAME varchar(128) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  (领料)原料出库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_OUT;
CREATE TABLE IB_MATERIAL_OUT (
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
  PRODUCTNO varchar(64) DEFAULT NULL,
  PRODUCTNAME varchar(256) DEFAULT NULL,
  MATERIALNUM int(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  原料出库信息子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_OUT_S;
CREATE TABLE IB_MATERIAL_OUT_S (
  ID varchar(64) NOT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  MATERIALNO varchar(64) DEFAULT NULL,
  MATERIALNAME varchar(128) DEFAULT NULL,
  MATERIALMODEL varchar(64) DEFAULT NULL,
  MATERIALUNIT varchar(16) DEFAULT NULL,
  MATERIALNUM int(10) DEFAULT NULL,
  MANUFACTURENAME varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  产品入库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PRODUCT_IN;
CREATE TABLE IB_PRODUCT_IN (
  ASSIGNEEUSER varchar(64) DEFAULT NULL,
  CREATEDATEBPM datetime DEFAULT NULL,
  DONEFLAG int(4) DEFAULT NULL,
  EVENTDATE datetime DEFAULT NULL,
  EXECUTIONID varchar(64) DEFAULT NULL,
  ID varchar(64) NOT NULL DEFAULT '',
  NODENAME varchar(128) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  SUPPLIERSNAME varchar(50) DEFAULT NULL,
  TASKTITLE varchar(256) DEFAULT NULL,
  USERNAME varchar(128) DEFAULT NULL,
  WAREHOUSENAME varchar(64) DEFAULT NULL,
  WAREHOUSENO varchar(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  产品入库子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PRODUCT_IN_S;
CREATE TABLE IB_PRODUCT_IN_S (
  ID varchar(64) NOT NULL DEFAULT '',
  PARENTID varchar(64) DEFAULT NULL,
  PRODUCTFLOWID varchar(64) DEFAULT NULL,
  PRODUCTMODEL varchar(64) DEFAULT NULL,
  PRODUCTNAME varchar(128) DEFAULT NULL,
  PRODUCTNO varchar(64) DEFAULT NULL,
  PRODUCTNUM int(10) DEFAULT NULL,
  PRODUCTTYPE varchar(64) DEFAULT NULL,
  PRODUCTUNIT varchar(8) DEFAULT NULL,
  UNITPRICE double(12,2) DEFAULT NULL,
  WAREHOUSENAME varchar(64) DEFAULT NULL,
  WAREHOUSENO varchar(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  项目出库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PROJECT_OUT;
CREATE TABLE IB_PROJECT_OUT (
  AMOUNTCAPITAL varchar(64) DEFAULT NULL,
  AMOUNTLOWERCASE double(12,2) DEFAULT NULL,
  APPLICANTUSER varchar(32) DEFAULT NULL,
  ASSIGNEEUSER varchar(64) DEFAULT NULL,
  CARDOOR varchar(2) DEFAULT NULL,
  COMMENTS varchar(128) DEFAULT NULL,
  CONSIGNEE varchar(32) DEFAULT NULL,
  CONSIGNEEPHONE varchar(128) DEFAULT NULL,
  CREATEDATEBPM datetime DEFAULT NULL,
  CUSTOMERNAME varchar(64) DEFAULT NULL,
  DELIVERYADDRESS varchar(128) DEFAULT NULL,
  DETAILEDINFO varchar(512) DEFAULT NULL,
  DONEFLAG int(4) DEFAULT NULL,
  EVENTDATE datetime DEFAULT NULL,
  EXECUTIONID varchar(64) DEFAULT NULL,
  FINANCIALAPPR varchar(128) DEFAULT NULL,
  ID varchar(64) NOT NULL DEFAULT '',
  ISEXECUTPACT varchar(2) DEFAULT NULL,
  NODENAME varchar(128) DEFAULT NULL,
  OTHERINFO varchar(256) DEFAULT NULL,
  OUTDOOR varchar(2) DEFAULT NULL,
  PACKAGETYPE varchar(16) DEFAULT NULL,
  PACTNO varchar(32) DEFAULT NULL,
  PAYMENTINFO varchar(128) DEFAULT NULL,
  PAYMENTNO varchar(32) DEFAULT NULL,
  PLANNER varchar(32) DEFAULT NULL,
  PMANAGERAPPR varchar(128) DEFAULT NULL,
  PROJECTMANAGER varchar(32) DEFAULT NULL,
  PROJECTNAME varchar(128) DEFAULT NULL,
  PROJECTNO varchar(128) DEFAULT NULL,
  SALESDEPT varchar(32) DEFAULT NULL,
  SALESDEPTMANAAPPR varchar(128) DEFAULT NULL,
  SALESDIRECTORAPPR varchar(128) DEFAULT NULL,
  SALESUSER varchar(32) DEFAULT NULL,
  TASKTITLE varchar(256) DEFAULT NULL,
  TRANSPORTMODE varchar(32) DEFAULT NULL,
  TYPE varchar(32) DEFAULT NULL,
  USERNAME varchar(128) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  产品出库信息子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PRODUCT_OUT_S;
CREATE TABLE IB_PRODUCT_OUT_S (
  BATCHNO varchar(32) DEFAULT NULL,
  DELIVERYDATE datetime DEFAULT NULL,
  GOODSADDRESS varchar(64) DEFAULT NULL,
  ID varchar(64) NOT NULL DEFAULT '',
  MATERIALNUM int(10) DEFAULT NULL,
  MODELTYPE varchar(128) DEFAULT NULL,
  OUTTYPE varchar(32) DEFAULT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  PRICE datetime DEFAULT NULL,
  PRODUCTFLOWID varchar(64) DEFAULT NULL,
  PRODUCTNAME varchar(64) DEFAULT NULL,
  PRODUCTNO varchar(32) DEFAULT NULL,
  SIZES varchar(64) DEFAULT NULL,
  STATIONNAME varchar(128) DEFAULT NULL,
  UNIT varchar(64) DEFAULT NULL,
  UNITPRICE datetime DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  产品库存管理表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_WAREHOUSE_PRODUCT;
CREATE TABLE IB_WAREHOUSE_PRODUCT (
  ID varchar(64) NOT NULL DEFAULT '',
  PRODUCTFLOWID varchar(64) DEFAULT NULL,
  PRODUCTMODEL varchar(64) DEFAULT NULL,
  PRODUCTNAME varchar(128) DEFAULT NULL,
  PRODUCTNO varchar(64) DEFAULT NULL,
  PRODUCTNUM int(10) DEFAULT NULL,
  PRODUCTPRICE double(12,2) DEFAULT NULL,
  PRODUCTTYPE varchar(64) DEFAULT NULL,
  PRODUCTUNIT varchar(8) DEFAULT NULL,
  WAREHOUSENAME varchar(128) DEFAULT NULL,
  WAREHOUSENO varchar(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
