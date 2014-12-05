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
/* 产成品表   */
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
