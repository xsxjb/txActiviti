
/*==============================================================*/
/* 项目立项表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PROJECT_APPROVAL;
CREATE TABLE IB_PROJECT_APPROVAL (
  ID                             varchar(64) NOT NULL,
  USERNAME             varchar(128) ,
  TASKTITLE              varchar(256) ,
  NODENAME             varchar(128) ,
  EXECUTIONID          varchar(64) ,
  ASSIGNEEUSER       varchar(128) ,
  DONEFLAG              int(11) DEFAULT '0',
  CREATEDATEBPM  datetime ,
  EVENTDATE            varchar(24) ,
  PACTNO                   varchar(64) ,
  CUSTOMERNAME   varchar(64) ,
  PROJECTNO             varchar(64) ,
  PROJECTNAME        varchar(64) ,
  PROJECTTYPE          varchar(16) ,
  SALESUSER              varchar(64) ,
  PROJECTMANAGER varchar(32) ,
  PLANNER                varchar(32) ,
  BUYER                     varchar(32) ,
  PRODUCTMANAGE varchar(32) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 项目立项表 -- 产成品子表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PROJECT_PRODUCT_S;
CREATE TABLE IB_PROJECT_PRODUCT_S (
  ID                             varchar(64) NOT NULL,
  PARENTID                varchar(64) ,
  PRODUCTNO            varchar(64) ,
  PRODUCTNAME       varchar(64) ,
  PRODUCTMODEL     varchar(63) ,
  PRODUCTNUMBER   int(10) ,
  PRODUCTUNIT          varchar(12) ,
  UNITPRICE                double(12,2) ,
  AMOUNT                   double(12,2) ,
  PRODUCTTYPE         varchar(32) ,
  PRODUCTFLOWID   varchar(32) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 原料分解表(BOM)   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_BOM;
CREATE TABLE IB_BOM (
  ID varchar(64) NOT NULL DEFAULT '',
  PROJECTNO varchar(64) DEFAULT NULL,
  PROJECTNAME varchar(128) DEFAULT NULL,
  AUDITUSER varchar(64) DEFAULT NULL,
  CUSTOMERNAME varchar(64) DEFAULT NULL,
  DESIGNUSER varchar(64) DEFAULT NULL,
  DRAWBOOK varchar(128) DEFAULT NULL,
  PRODUCTFLOWID varchar(64) DEFAULT NULL,
  PRODUCTMODEL varchar(64) DEFAULT NULL,
  PRODUCTNAME varchar(128) DEFAULT NULL,
  PRODUCTNO varchar(64) DEFAULT NULL,
  PRODUCTNUMBER int(10) DEFAULT NULL,
  PRODUCTTYPE varchar(64) DEFAULT NULL,
  PRODUCTUNIT varchar(8) DEFAULT NULL,
  UNITPRICE double(12,2) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 原料分解子表 */
/*==============================================================*/
DROP TABLE IF EXISTS IB_BOM_MATERIALS;
CREATE TABLE IB_BOM_MATERIALS (
  COMMENTS varchar(512) DEFAULT NULL,
  ID varchar(64) NOT NULL DEFAULT '',
  MATERIALNAME varchar(128) DEFAULT NULL,
  MATERIALNO varchar(64) DEFAULT NULL,
  MATERIALNUM varchar(10) DEFAULT NULL,
  MATERIALPRICE double(12,2) DEFAULT NULL,
  MATERIALTYPENO varchar(64) DEFAULT NULL,
  MATERIALUNIT varchar(8) DEFAULT NULL,
  MODEL varchar(64) DEFAULT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  STOCKTYPE varchar(16) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;

