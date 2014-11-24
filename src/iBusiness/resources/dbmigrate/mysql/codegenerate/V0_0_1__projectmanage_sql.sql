
/*==============================================================*/
/* 项目立项表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PROJECT_APPROVAL;
CREATE TABLE IB_PROJECT_APPROVAL (
  ID                             varchar(64) NOT NULL,
  USERNAME             varchar(128) DEFAULT NULL,
  TASKTITLE              varchar(256) DEFAULT NULL,
  NODENAME             varchar(128) DEFAULT NULL,
  EXECUTIONID          varchar(64) DEFAULT NULL,
  ASSIGNEEUSER       varchar(128) DEFAULT NULL,
  DONEFLAG              int(11) DEFAULT '0',
  CREATEDATEBPM  datetime DEFAULT NULL,
  EVENTDATE            varchar(24) DEFAULT NULL,
  PACTNO                   varchar(64) DEFAULT NULL,
  CUSTOMERNAME   varchar(64) DEFAULT NULL,
  PROJECTNO             varchar(64) DEFAULT NULL,
  PROJECTNAME        varchar(64) DEFAULT NULL,
  PROJECTTYPE          varchar(16) DEFAULT NULL,
  SALESUSER              varchar(64) DEFAULT NULL,
  PROJECTMANAGER varchar(32) DEFAULT NULL,
  PLANNER                varchar(32) DEFAULT NULL,
  BUYER                     varchar(32) DEFAULT NULL,
  PRODUCTMANAGE varchar(32) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 项目立项表 -- 产成品子表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_PROJECT_PRODUCT_S;
CREATE TABLE IB_PROJECT_PRODUCT_S (
  ID                             varchar(64) NOT NULL,
  PARENTID                varchar(64) DEFAULT NULL,
  PRODUCTNO            varchar(64) DEFAULT NULL,
  PRODUCTNAME       varchar(64) DEFAULT NULL,
  PRODUCTMODEL     varchar(63) DEFAULT NULL,
  PRODUCTNUMBER   int(10) DEFAULT NULL,
  PRODUCTUNIT          varchar(12) DEFAULT NULL,
  UNITPRICE                double(12,2) DEFAULT NULL,
  AMOUNT                   double(12,2) DEFAULT NULL,
  PRODUCTTYPE         varchar(32) DEFAULT NULL,
  PRODUCTFLOWID   varchar(32) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
