/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('devicemanage0000','devicemanage','设备管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('devicemanage0001','devicemanage','表存储设计器','devicemanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('devicemanage0002','devicemanage','表单设计器','devicemanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('devicemanage0003','devicemanage','流程表设计器','devicemanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('devicemanage0004','devicemanage','流程表单设计器','devicemanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('devicemanage0005','devicemanage','流程设计器','devicemanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageOne','设备管理','1','#','URL','6','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageTwo3','设备管理','2','#','URL','3','devicemanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageThree31','仓库管理','3','/warehouse/warehouse-list.do','URL','1','devicemanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageThree32','设备分类(树)','3','/deviceTypeTree/tree-list.do','URL','2','devicemanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageThree33','设备管理','3','/device/device-list.do','URL','3','devicemanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageThree34','设备入库流程','3','/device_in/device_in-list.do?flowType=0&flowId=devicein001','URL','4','devicemanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageThree35','设备出库','3','/device_out/device_out-list.do?flowType=0&flowId=deviceOut001','URL','5','devicemanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('devicemanageThree36','设备库存管理','3','/warehouse_device/warehouse_device-list.do','URL','6','devicemanageTwo3');

/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageTwo3','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageThree31','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageThree32','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageThree33','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageThree34','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageThree35','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('devicemanageThree36','2');


/* ================================================================================   */
/* ===================================    设备分类信息表  =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('devicemanage-ib_device_type001','devicemanage','IB_DEVICE_TYPE','设备分类表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_TYPE','TYPENO','分类编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_TYPE','TYPENAME','分类名称','DATETIME','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_TYPE','PARENTID','父节点ID','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_TYPE','ISLEAF','是否叶子节点','DATETIME','8','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_TYPE','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_TYPE','SCOPEID','范围ID','VARCHAR','64','是','',93);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('devicemanage-deviceType001','devicemanage','deviceType','设备分类管理',NULL,1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('devicemanage','deviceType','IB_DEVICE_TYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','deviceType','IB_DEVICE_TYPE.ISLEAF','是否叶子节点','ISLEAF','IB_DEVICE_TYPE',4,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','deviceType','IB_DEVICE_TYPE.PARENTID','父节点','PARENTID','IB_DEVICE_TYPE',3,'7','','','1','1','1','2','','{\"sql\":\"select id vKey, typeName vValue from IB_DEVICE_TYPE where isleaf =\'true\' \"}');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','deviceType','IB_DEVICE_TYPE.TYPENAME','设备分类名称','TYPENAME','IB_DEVICE_TYPE',2,'1','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','deviceType','IB_DEVICE_TYPE.TYPENO','设备分类编号','TYPENO','IB_DEVICE_TYPE',1,'1','','','1','1','1','2','','');
/* ================= 数据插入 ================== */
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10001101',NULL,'有机合成','10001','false');
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000010101',NULL,'抗生素','1000010','false');
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000011',NULL,'植物化学类','10000','true');
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10000',NULL,'瓷砖','0','true');
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000010',NULL,'生物化学类','10000','true');
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10001102',NULL,'无机合成','10001','false');
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000011101',NULL,'植物类','1000011','false');
insert into ib_device_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10001',NULL,'地板','0','true');


/* ================================================================================   */
/* ====================================   设备表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('devicemanage-ib_device001','devicemanage','IB_DEVICE','设备表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','DEVICENO','设备编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','DEVICENAME','设备名称','DATETIME','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','DEVICEPRICE','价格','NUMBER','12,2','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','DEVICETYPENO','分类编号','DATETIME','64','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','DEVICEUNIT','单位','VARCHAR','8','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','MODEL','规格型号','VARCHAR','64','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE','SCOPEID','范围ID','VARCHAR','64','是','',92);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('devicemanage-device001','devicemanage','device','设备管理','/device/device-list.do',1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('devicemanage','device','IB_DEVICE','main');
/* ================= 表单对应字段管理表 ==================   */
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','device','IB_DEVICE.DEVICENAME','设备名称','DEVICENAME','IB_DEVICE',3,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','device','IB_DEVICE.DEVICENO','设备编号','DEVICENO','IB_DEVICE',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','device','IB_DEVICE.DEVICEPRICE','价格','DEVICEPRICE','IB_DEVICE',3,'5','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','device','IB_DEVICE.DEVICETYPENO','设备分类','DEVICETYPENO','IB_DEVICE',1,'7','','','1','1','1','1','','{\"sql\":\"select id vKey, typeName vValue from IB_DEVICE_TYPE where isleaf =\'false\'  \"} ');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','device','IB_DEVICE.DEVICEUNIT','单位','DEVICEUNIT','IB_DEVICE',5,'1','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','device','IB_DEVICE.MODEL','规格型号','MODEL','IB_DEVICE',6,'1','','','1','1','2','2','','');
/* ================= 插入数据 ==================   */
insert into ib_device(ID,SCOPEID,deviceTypeNo,deviceNo,deviceName,model,devicePrice,deviceUnit) values ('9000010001','1','1000010101','10001','脂肪酸','Xp-21',100.00,'公斤');
insert into ib_device(ID,SCOPEID,deviceTypeNo,deviceNo,deviceName,model,devicePrice,deviceUnit) values ('9000010002','1','1000011101','10002','三羧酸','Sjs-121',25.00,'吨');

/* ================================================================================   */
/* ==================================    设备库存管理表      =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('devicemanage-ib_warehouse_device001','devicemanage','IB_WAREHOUSE_DEVICE','设备库存管理表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','DEVICETYPENO','设备分类编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','DEVICENO','设备编号','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','DEVICENAME','设备名称','VARCHAR','128','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','DEVICEMODEL','规格型号','VARCHAR','64','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','DEVICEPRICE','价格','NUMBER','12,2','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','DEVICEUNIT','单位','VARCHAR','8','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','DEVICENUM','数量','NUMBER','10','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','WAREHOUSENO','仓库编号','VARCHAR','64','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','WAREHOUSENAME','仓库名称','VARCHAR','128','是','',9);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_DEVICE','SCOPEID','范围ID','VARCHAR','64','是','',92);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('devicemanage-warehouseMaterials001','devicemanage','warehouseMaterials','设备库存管理','/warehouse_device/warehouse_device-list.do',1,1,1,1,1,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE','main');
/* ================= 表单对应字段管理表 ==================   */
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.DEVICETYPENO','设备分类编号','DEVICETYPENO','IB_WAREHOUSE_DEVICE',1,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.DEVICENO','设备编号','DEVICENO','IB_WAREHOUSE_DEVICE',2,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.DEVICENAME','设备名称','DEVICENAME','IB_WAREHOUSE_DEVICE',3,'1',NULL,NULL,'1','1','1',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.DEVICEMODEL','规格型号','DEVICEMODEL','IB_WAREHOUSE_DEVICE',4,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.DEVICEPRICE','价格','DEVICEPRICE','IB_WAREHOUSE_DEVICE',5,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.DEVICEUNIT','单位','DEVICEUNIT','IB_WAREHOUSE_DEVICE',6,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.DEVICENUM','数量','DEVICENUM','IB_WAREHOUSE_DEVICE',7,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.WAREHOUSENO','仓库编号','WAREHOUSENO','IB_WAREHOUSE_DEVICE',8,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('devicemanage','warehouseMaterials','IB_WAREHOUSE_DEVICE.WAREHOUSENAME','仓库名称','WAREHOUSENAME','IB_WAREHOUSE_DEVICE',9,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);

/* ================================================================================   */
/* ====================================   设备入库表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('devicemanage-ib_device_in001','devicemanage','IB_DEVICE_IN','设备入库表','1',NULL,1);
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('devicemanage-ib_device_in_s001','devicemanage','IB_DEVICE_IN_S','设备入库信息子表','2',NULL,1);
/* ================= 业务表字段结构管理表 ==================   */
/*============== 设备入库表 ===============*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','EXECUTIONID','流程执行实例ID','VARCHAR','64','是',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','CREATEDATEBPM','流程创建时间','DATETIME','','是',NULL,93);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','NODENAME','流程节点名','VARCHAR','128','是',NULL,94);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','ASSIGNEEUSER','负责人','VARCHAR','64','是',NULL,95);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','DONEFLAG','流程结束标记','INTEGER','4','是',NULL,96);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','TASKTITLE','流程实例标题','VARCHAR','256','是',NULL,97);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','EVENTDATE','入库日期','DATE','0','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','SUPPLIERSNAME','供应商名称','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','WAREHOUSENO','仓库编号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','WAREHOUSENAME','仓库名称','VARCHAR','128','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','TOTALNUM','总数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','AMOUNT','合计金额','NUMBER','12,2','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','AMOUNTBIG','合计金额大写','VARCHAR','64','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','REMARK','备注','VARCHAR','512','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN','@USERNAME','负责人名','VARCHAR','128','是',NULL,9);
/*============== 设备入库信息子表 ===============*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','PARENTID','主表UUID','VARCHAR','64','否',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','DEVICENO','设备编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','DEVICENAME','设备名称','VARCHAR','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','DEVICEMODEL','设备规格型号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','DEVICEUNIT','单位','VARCHAR','16','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','DEVICENUM','数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','AMOUNT','金额','NUMBER','12,2','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','MANUFACTURENAME','制造商','VARCHAR','64','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_DEVICE_IN_S','REMARK','备注','VARCHAR','512','是','',8);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('devicemanage-devicein001','devicemanage','devicein','设备入库流程','/device_in/device_in-list.do',1,1,1,2,2,2,1);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('devicemanage','devicein','IB_DEVICE_IN','main');
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('devicemanage','devicein','IB_DEVICE_IN_S','sub');
/* ================= 表单对应字段管理表 ==================   */
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.EVENTDATE','入库日期','EVENTDATE','IB_DEVICE_IN',1,'3','','','1','2','2','1','@currentDate','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.SUPPLIERSNAME','供应商名称','SUPPLIERSNAME','IB_DEVICE_IN',2,'7','','','1','1','2','2','','{"sql":"select id vKey, UNITNAME vValue from IB_SUPPLIER "} ');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.WAREHOUSENO','仓库编号','WAREHOUSENO','IB_DEVICE_IN',3,'7','','','1','1','2','1','','{"sql":"select id vKey, WAREHOUSENAME vValue from IB_WAREHOUSE "} ');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.WAREHOUSENAME','仓库名称','WAREHOUSENAME','IB_DEVICE_IN',4,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.TOTALNUM','总数量','TOTALNUM','IB_DEVICE_IN',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.AMOUNT','合计金额','AMOUNT','IB_DEVICE_IN',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.AMOUNTBIG','合计金额大写','AMOUNTBIG','IB_DEVICE_IN',7,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN.REMARK','备注','REMARK','IB_DEVICE_IN',8,'2','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.DEVICENO','设备编号','DEVICENO','IB_DEVICE_IN_S',1,'10','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.DEVICENAME','设备名称','DEVICENAME','IB_DEVICE_IN_S',2,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.DEVICEMODEL','设备规格型号','DEVICEMODEL','IB_DEVICE_IN_S',3,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.DEVICEUNIT','单位','DEVICEUNIT','IB_DEVICE_IN_S',4,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.DEVICENUM','数量','DEVICENUM','IB_DEVICE_IN_S',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.AMOUNT','金额','AMOUNT','IB_DEVICE_IN_S',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.MANUFACTURENAME','制造商','MANUFACTURENAME','IB_DEVICE_IN_S',7,'1','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','devicein','IB_DEVICE_IN_S.REMARK','备注','REMARK','IB_DEVICE_IN_S',8,'2','','','1','1','2','1','','');
/* ============================= 流程管理表 =============================   */
INSERT INTO IB_BPM_PROCESS(ID,PACKAGENAME,FLOWNAME,FLOWTITLE,VERSIONID,FORMID,FLOWURL) VALUES('devicein001','devicemanage','devicein','设备入库流程','bcb868a5-db45-454f-8a72-68093367010c','devicemanage-devicein001','/device_in/device_in-list.do?flowType=0&flowId=devicein001');
/* ============================= 流程图管理表 =============================   */
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000001','devicein001','3a916bdd-f8e0-4021-b586-e7415be2d966',NULL,'{\"id\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"realPoints\":\"120,90,200,90\",\"startElmId\":\"9c3f1ba1-c5bd-42d8-be62-c041793d6bb1\",\"endElmId\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000002','devicein001','4e21a11c-db68-45cf-aa2f-2428487fb8a2',NULL,'{\"id\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\",\"name\":\"发起\",\"type\":\"TaskNode\",\"title\":\"发起\",\"x\":\"200\",\"y\":\"65\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\",\"afterLineIds\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000003','devicein001','68acb9ed-b620-47ad-9ea4-7179105a4aa6',NULL,'{\"id\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"250,115,250,200,400,200\",\"startElmId\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\",\"endElmId\":\"f4224f84-0df8-425f-af69-34620fb53377\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000004','devicein001','fa4237d4-93eb-4534-b94d-21d60eec970f',NULL,'{\"id\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"realPoints\":\"700,310,750,310,750,310\",\"startElmId\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\",\"endElmId\":\"756b2f73-2539-4a0c-8ff9-eb21f626a2b1\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000005','devicein001','76388b75-b3ff-4be1-9b02-ba0d04fa5482',NULL,'{\"id\":\"76388b75-b3ff-4be1-9b02-ba0d04fa5482\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000006','devicein001','935e844a-4377-498a-98bf-f3d6f2d22c52',NULL,'{\"id\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"realPoints\":\"450,225,450,310,600,310\",\"startElmId\":\"f4224f84-0df8-425f-af69-34620fb53377\",\"endElmId\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000007','devicein001','f4224f84-0df8-425f-af69-34620fb53377',NULL,'{\"id\":\"f4224f84-0df8-425f-af69-34620fb53377\",\"name\":\"审批\",\"type\":\"TaskNode\",\"title\":\"审批\",\"x\":\"400\",\"y\":\"175\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\",\"afterLineIds\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000008','devicein001','9c3f1ba1-c5bd-42d8-be62-c041793d6bb1',NULL,'{\"id\":\"9c3f1ba1-c5bd-42d8-be62-c041793d6bb1\",\"name\":\"开始节点\",\"type\":\"StartNode\",\"title\":\"开始节点\",\"x\":\"70\",\"y\":\"65\",\"width\":\"50\",\"height\":\"50\",\"afterLineIds\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-0000009','devicein001','4973687e-9ad3-4415-a6ba-ae21589fb599',NULL,'{\"id\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\",\"name\":\"入库质检\",\"type\":\"TaskNode\",\"title\":\"入库质检\",\"x\":\"600\",\"y\":\"285\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\",\"afterLineIds\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-00000010','devicein001','2e47a7e0-51d4-412c-a189-2e739ea7229c',NULL,'{\"id\":\"2e47a7e0-51d4-412c-a189-2e739ea7229c\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-00000011','devicein001','756b2f73-2539-4a0c-8ff9-eb21f626a2b1',NULL,'{\"id\":\"756b2f73-2539-4a0c-8ff9-eb21f626a2b1\",\"name\":\"结束节点\",\"type\":\"EndNode\",\"title\":\"结束\",\"x\":\"750\",\"y\":\"285\",\"width\":\"50\",\"height\":\"50\",\"headLineIds\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('flowchart-devicein001-00000012','devicein001','bd5e352b-212c-4489-a700-b363d7acda0b',NULL,'{\"id\":\"bd5e352b-212c-4489-a700-b363d7acda0b\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"width\":\"35\",\"height\":\"110\"}');

/* ================================================================================   */
/* ==============================   设备出库表   ====================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('devicemanage-deviceOut001','devicemanage','deviceOut','设备出库信息','/device_out/device_out-list.do',1,1,1,2,2,2,1);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('devicemanage','deviceOut','IB_DEVICE_OUT','main');
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S','sub');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT.EVENTDATE','出库日期','EVENTDATE','IB_DEVICE_OUT',1,'4','','','1','2','2','1','@currentDate','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT.BATCHNO','批次号','BATCHNO','IB_DEVICE_OUT',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT.WAREHOUSENO','仓库名','WAREHOUSENO','IB_DEVICE_OUT',3,'7','','','1','1','2','1','','{"sql":"select id vKey, WAREHOUSENAME vValue from IB_WAREHOUSE "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT.CUSTOMERADDRESS','客户地址','CUSTOMERADDRESS','IB_DEVICE_OUT',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT.CUSTOMERNAME','客户名','CUSTOMERNAME','IB_DEVICE_OUT',5,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT.DEVICENUM','数量','DEVICENUM','IB_DEVICE_OUT',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S.DEVICENO','设备编号','DEVICENO','IB_DEVICE_OUT_S',1,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S.DEVICENAME','设备名称','DEVICENAME','IB_DEVICE_OUT_S',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S.DEVICEMODEL','设备规格型号','DEVICEMODEL','IB_DEVICE_OUT_S',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S.DEVICEUNIT','单位','DEVICEUNIT','IB_DEVICE_OUT_S',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S.DEVICENUM','数量','DEVICENUM','IB_DEVICE_OUT_S',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S.MANUFACTURENAME','制造商','MANUFACTURENAME','IB_DEVICE_OUT_S',6,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('devicemanage','deviceOut','IB_DEVICE_OUT_S.REMARK','备注','REMARK','IB_DEVICE_OUT_S',7,'2','','','1','1','2','2','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('devicemanage-ib_device_out001','devicemanage','IB_DEVICE_OUT','设备出库表','1','null',1);
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('devicemanage-ib_device_out_s001','devicemanage','IB_DEVICE_OUT_S','设备出库信息子表','2','null',1);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','EVENTDATE','出库日期','DATE','0','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','BATCHNO','批次号','VARCHAR','8','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','WAREHOUSENO','仓库编号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','CUSTOMERNAME','客户名称','VARCHAR','64','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','CUSTOMERADDRESS','客户地址','VARCHAR','256','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','DEVICENUM','数量','NUMBER','10','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','EXECUTIONID','流程执行实例ID','VARCHAR','64','是','',92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','CREATEDATEBPM','流程创建时间','DATETIME','','是','',93);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','NODENAME','流程节点名','VARCHAR','128','是','',94);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','@USERNAME','负责人名','VARCHAR','128','是','',95);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','ASSIGNEEUSER','负责人','VARCHAR','64','是','',95);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','DONEFLAG','流程结束标记','INTEGER','4','是','',96);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT','TASKTITLE','流程实例标题','VARCHAR','256','是','',97);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','DEVICENO','设备编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','DEVICENAME','设备名称','VARCHAR','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','DEVICEMODEL','设备规格型号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','DEVICEUNIT','单位','VARCHAR','16','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','DEVICENUM','数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','MANUFACTURENAME','制造商','VARCHAR','64','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','REMARK','备注','VARCHAR','512','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_DEVICE_OUT_S','PARENTID','主表UUID','VARCHAR','64','否','',92);

/* ============================= 流程管理表 =============================   */
INSERT INTO IB_BPM_PROCESS(ID,PACKAGENAME,FLOWNAME,FLOWTITLE,VERSIONID,FORMID,FLOWURL) VALUES('deviceOut001','devicemanage','deviceOut','设备出库','45caccae-ede2-4fba-86b0-1217201c32b2','devicemanage-deviceOut001','/device_out/device_out-list.do?flowType=0&flowId=deviceOut001');
/* ============================= 流程图管理表 =============================   */
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00001','deviceOut001','5b3fd827-5900-4d2f-9cfa-6390a36a1378',NULL,'{\"id\":\"5b3fd827-5900-4d2f-9cfa-6390a36a1378\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00002','deviceOut001','09e20832-cd75-4bcd-9e58-1155449e52f5',NULL,'{\"id\":\"09e20832-cd75-4bcd-9e58-1155449e52f5\",\"name\":\"开始节点\",\"type\":\"StartNode\",\"title\":\"开始节点\",\"x\":\"70\",\"y\":\"65\",\"width\":\"50\",\"height\":\"50\",\"afterLineIds\":\"9ea0ef66-273d-4e26-8a90-cb79d7e58f4f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00003','deviceOut001','35956630-42f6-4614-915f-33e13dcf0408',NULL,'{\"id\":\"35956630-42f6-4614-915f-33e13dcf0408\",\"name\":\"审批\",\"type\":\"TaskNode\",\"title\":\"审批\",\"x\":\"400\",\"y\":\"175\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"b411d834-75d1-4afd-8657-07eed45b0838\",\"afterLineIds\":\"c4def968-4683-41d4-9d9c-45a2b09d57c7\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00004','deviceOut001','f3eb7cc8-d108-4ca7-a0f8-a6de2078a01a',NULL,'{\"id\":\"f3eb7cc8-d108-4ca7-a0f8-a6de2078a01a\",\"name\":\"结束节点\",\"type\":\"EndNode\",\"title\":\"结束\",\"x\":\"550\",\"y\":\"175\",\"width\":\"50\",\"height\":\"50\",\"headLineIds\":\"c4def968-4683-41d4-9d9c-45a2b09d57c7\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00005','deviceOut001','96d0afdb-8ab1-42bf-b422-9147a60e1479',NULL,'{\"id\":\"96d0afdb-8ab1-42bf-b422-9147a60e1479\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00006','deviceOut001','c722e60a-83e9-4d61-a44e-cebb9662c60c',NULL,'{\"id\":\"c722e60a-83e9-4d61-a44e-cebb9662c60c\",\"name\":\"发起\",\"type\":\"TaskNode\",\"title\":\"发起\",\"x\":\"200\",\"y\":\"65\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"9ea0ef66-273d-4e26-8a90-cb79d7e58f4f\",\"afterLineIds\":\"b411d834-75d1-4afd-8657-07eed45b0838\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00007','deviceOut001','b411d834-75d1-4afd-8657-07eed45b0838',NULL,'{\"id\":\"b411d834-75d1-4afd-8657-07eed45b0838\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"250,115,250,200,400,200\",\"startElmId\":\"c722e60a-83e9-4d61-a44e-cebb9662c60c\",\"endElmId\":\"35956630-42f6-4614-915f-33e13dcf0408\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00008','deviceOut001','9ea0ef66-273d-4e26-8a90-cb79d7e58f4f',NULL,'{\"id\":\"9ea0ef66-273d-4e26-8a90-cb79d7e58f4f\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"realPoints\":\"120,90,200,90\",\"startElmId\":\"09e20832-cd75-4bcd-9e58-1155449e52f5\",\"endElmId\":\"c722e60a-83e9-4d61-a44e-cebb9662c60c\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('ibconfflowchart-deviceOut001-00009','deviceOut001','c4def968-4683-41d4-9d9c-45a2b09d57c7',NULL,'{\"id\":\"c4def968-4683-41d4-9d9c-45a2b09d57c7\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"500,200,550,200,550,200\",\"startElmId\":\"35956630-42f6-4614-915f-33e13dcf0408\",\"endElmId\":\"f3eb7cc8-d108-4ca7-a0f8-a6de2078a01a\"}');
