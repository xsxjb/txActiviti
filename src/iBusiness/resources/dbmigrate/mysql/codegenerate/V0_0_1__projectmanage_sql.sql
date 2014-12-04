
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
