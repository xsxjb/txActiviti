/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('4028819e49df4dc30149df637e5c0000','projectmanage','项目管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('4028819e49df4dc30149df637f220001','projectmanage','表存储设计器','4028819e49df4dc30149df637e5c0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('4028819e49df4dc30149df637f8d0002','projectmanage','表单设计器','4028819e49df4dc30149df637e5c0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('4028819e49df4dc30149df637fd50003','projectmanage','流程表设计器','4028819e49df4dc30149df637e5c0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('4028819e49df4dc30149df63802d0004','projectmanage','流程表单设计器','4028819e49df4dc30149df637e5c0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('4028819e49df4dc30149df6380be0005','projectmanage','流程设计器','4028819e49df4dc30149df637e5c0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('mOneXmgl','项目管理','1','#','URL','5','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('mTwoXmgl1','项目管理','2','#','URL','1','mOneXmgl');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('mThreeXmgl1','物料分类管理','3','/materials_type/materials_type-list.do','URL','1','mTwoXmgl1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('mThreeWlgl1','物料管理','3','/materials/materials-list.do','URL','2','mTwoXmgl1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('mThreeCcpfl1','产成品分类管理','3','/producttype/producttype-list.do','URL','3','mTwoXmgl1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('mThreeCcpgl1','产成品管理','3','/product/product-list.do','URL','4','mTwoXmgl1');

/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('mOneXmgl','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('mTwoXmgl1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('mThreeXmgl1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('mThreeWlgl1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('mThreeCcpfl1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('mThreeCcpgl1','2');

/* ================================================================================   */
/* ===================================    项目立项表  =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('IB_PROJECT_APPROVAL001','projectmanage','IB_PROJECT_APPROVAL','项目立项表','1',NULL,1);
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('IB_PROJECT_PRODUCT_S001','projectmanage','IB_PROJECT_PRODUCT_S','立项产成品子表','2',NULL,1);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','EXECUTIONID','流程执行实例ID','VARCHAR','64','是',NULL,92);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','CREATEDATEBPM','流程创建时间','DATETIME','','是',NULL,93);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','NODENAME','流程节点名','VARCHAR','128','是',NULL,94);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','USERNAME','负责人名','VARCHAR','128','是',NULL,95);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','DONEFLAG','流程结束标记','INTEGER','4','是',NULL,96);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','TASKTITLE','流程实例标题','VARCHAR','256','是',NULL,97);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','EVENTDATE','日期','VARCHAR','24','是','',1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','PACTNO','合同编号','VARCHAR','64','是','',2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','CUSTOMERNAME','客户名称','VARCHAR','64','是','',3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','PROJECTNO','项目编号','VARCHAR','64','是','',4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','PROJECTNAME','项目名称','VARCHAR','64','是','',5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','PROJECTTYPE','项目类型','VARCHAR','16','是','',6);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','SALESUSER','销售人员','VARCHAR','64','是','',7);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','PROJECTMANAGER','项目经理','VARCHAR','32','是','',8);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','PLANNER','计划员','VARCHAR','32','是','',9);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','BUYER','采购员','VARCHAR','32','是','',10);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_APPROVAL','PRODUCTMANAGE','生成负责人','VARCHAR','32','是','',11);
/* =================== 子表  =================================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PARENTID','主表UUID','VARCHAR','64','否',NULL,92);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTNO','产成品编号','VARCHAR','64','是','',1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTNAME','产成品名','VARCHAR','64','是','',2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTMODEL','规格型号','VARCHAR','63','是','',3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTNUMBER','数量','INT','10','是','',4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTUNIT','单位','VARCHAR','12','是','',5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','UNITPRICE','单价','DOUBLE','12,2','是','',6);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','AMOUNT','金额','DOUBLE','12,2','是','',7);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTTYPE','产品类型','VARCHAR','32','是','',8);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTFLOWID','产品件号','VARCHAR','32','是','',9);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('projectmanage-projectApproval001','projectmanage','projectApproval','项目立项表单',NULL,1,1,1,2,1);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL','main');
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S','sub');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.BUYER','采购员','BUYER','IB_PROJECT_APPROVAL',10,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.CUSTOMERNAME','客户名称','CUSTOMERNAME','IB_PROJECT_APPROVAL',3,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.EVENTDATE','日期','EVENTDATE','IB_PROJECT_APPROVAL',1,'3',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.PACTNO','合同编号','PACTNO','IB_PROJECT_APPROVAL',2,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.PLANNER','计划员','PLANNER','IB_PROJECT_APPROVAL',9,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.PRODUCTMANAGE','生成负责人','PRODUCTMANAGE','IB_PROJECT_APPROVAL',11,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.PROJECTMANAGER','项目经理','PROJECTMANAGER','IB_PROJECT_APPROVAL',8,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.PROJECTNAME','项目名称','PROJECTNAME','IB_PROJECT_APPROVAL',5,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.PROJECTNO','项目编号','PROJECTNO','IB_PROJECT_APPROVAL',4,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.PROJECTTYPE','项目类型','PROJECTTYPE','IB_PROJECT_APPROVAL',6,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_APPROVAL.SALESUSER','销售人员','SALESUSER','IB_PROJECT_APPROVAL',7,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.AMOUNT','金额','AMOUNT','IB_PROJECT_PRODUCT_S',7,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTFLOWID','产品件号','PRODUCTFLOWID','IB_PROJECT_PRODUCT_S',9,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTMODEL','规格型号','PRODUCTMODEL','IB_PROJECT_PRODUCT_S',3,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTNAME','产成品名','PRODUCTNAME','IB_PROJECT_PRODUCT_S',2,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTNO','产成品编号','PRODUCTNO','IB_PROJECT_PRODUCT_S',1,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTNUMBER','数量','PRODUCTNUMBER','IB_PROJECT_PRODUCT_S',4,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTTYPE','产品类型','PRODUCTTYPE','IB_PROJECT_PRODUCT_S',8,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTUNIT','单位','PRODUCTUNIT','IB_PROJECT_PRODUCT_S',5,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.UNITPRICE','单价','UNITPRICE','IB_PROJECT_PRODUCT_S',6,'1',NULL,NULL,'1','1','1','2',NULL,NULL);

/* ================================================================================   */
/* ===================================    物料分类信息表  =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('IB_MATERIALS_TYPE001','projectmanage','IB_MATERIALS_TYPE','物料分类信息表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','TYPENO','分类编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','TYPENAME','分类名称','DATETIME','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','RPARENTID','父节点ID','VARCHAR','64','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','ISLEAF','是否叶子节点','DATETIME','8','是',NULL,4);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('projectmanage-materialsType001','projectmanage','materialsType','物料分类管理',NULL,1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','materialsType','IB_MATERIALS_TYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materialsType','IB_MATERIALS_TYPE.ISLEAF','是否叶子节点','ISLEAF','IB_MATERIALS_TYPE',4,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materialsType','IB_MATERIALS_TYPE.RPARENTID','父节点','RPARENTID','IB_MATERIALS_TYPE',3,'7','','','1','1','1','2','','{\"sql\":\"select id vKey, typeName vValue from IB_MATERIALS_TYPE \"}');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materialsType','IB_MATERIALS_TYPE.TYPENAME','物料分类名称','TYPENAME','IB_MATERIALS_TYPE',2,'1','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materialsType','IB_MATERIALS_TYPE.TYPENO','物料分类编号','TYPENO','IB_MATERIALS_TYPE',1,'1','','','1','1','1','2','','');


/* ================================================================================   */
/* ====================================   物料表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_materials001','projectmanage','IB_MATERIALS','物料表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNO','物料编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNAME','物料名称','DATETIME','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALPRICE','价格','DOUBLE','12,2','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALTYPENO','分类编号','DATETIME','64','是',NULL,4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALUNIT','单位','VARCHAR','8','是',NULL,5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MODEL','规格型号','VARCHAR','64','是',NULL,6);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('projectmanage-materials001','projectmanage','materials','物料管理','/materials/materials-list.do',1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','materials','IB_MATERIALS','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materials','IB_MATERIALS.MATERIALNO','物料编号','MATERIALNO','IB_MATERIALS',1,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materials','IB_MATERIALS.MATERIALNAME','物料名称','MATERIALNAME','IB_MATERIALS',2,'7','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materials','IB_MATERIALS.MATERIALPRICE','价格','MATERIALPRICE','IB_MATERIALS',3,'5','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materials','IB_MATERIALS.MATERIALTYPENO','物料分类','MATERIALTYPENO','IB_MATERIALS',4,'7','','','1','1','1','2','','{"sql":"select id vKey, typeName vValue from IB_MATERIALS_TYPE "} ');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materials','IB_MATERIALS.MATERIALUNIT','单位','MATERIALUNIT','IB_MATERIALS',5,'1','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','materials','IB_MATERIALS.MODEL','规格型号','MODEL','IB_MATERIALS',6,'1','','','1','1','1','2','','');

/* ================================================================================   */
/* ===================================   产成品分类表  ===================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_producttype001','projectmanage','IB_PRODUCTTYPE','产成品分类表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','TYPENO','分类编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','TYPENAME','分类名称','VARCHAR','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','RPARENTID','父节点ID','VARCHAR','64','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','ISLEAF','是否叶子节点','VARCHAR','8','是',NULL,4);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('projectmanage-productType001','projectmanage','productType','产成品分类管理','/producttype/producttype-list.do',1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','productType','IB_PRODUCTTYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','productType','IB_PRODUCTTYPE.ISLEAF','产成品分类表.是否叶子节点','ISLEAF','IB_PRODUCTTYPE',4,'8','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','productType','IB_PRODUCTTYPE.RPARENTID','父节点ID','RPARENTID','IB_PRODUCTTYPE',3,'7','','','1','1','2','','{\"sql\":\"select id vKey, typeName vValue from IB_PRODUCTTYPE \"} ',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','productType','IB_PRODUCTTYPE.TYPENAME','产成品分类名称','TYPENAME','IB_PRODUCTTYPE',2,'1','','','1','1','1','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','productType','IB_PRODUCTTYPE.TYPENO','分类编号','TYPENO','IB_PRODUCTTYPE',1,'1','','','1','1','2','','',NULL);

/* ================================================================================   */
/* ====================================   产成品表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_product001','projectmanage','IB_PRODUCT','产成品管理表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTTYPE','产品类型','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTFLOWID','产品件号','VARCHAR','64','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTNO','产成品编号','VARCHAR','64','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTNAME','产成品名','VARCHAR','128','是',NULL,4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTMODEL','规格型号','VARCHAR','64','是',NULL,5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTUNIT','单位','VARCHAR','8','是',NULL,6);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','UNITPRICE','单价','DOUBLE','12,2','是',NULL,7);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('projectmanage-product001','projectmanage','product','产成品管理','/product/product-list.do',1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','product','IB_PRODUCT','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.AMOUNT','金额','AMOUNT','IB_PRODUCT',8,'5','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.PRODUCTFLOWID','产品件号','PRODUCTFLOWID','IB_PRODUCT',2,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.PRODUCTMODEL','规格型号','PRODUCTMODEL','IB_PRODUCT',5,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.PRODUCTNAME','产成品名','PRODUCTNAME','IB_PRODUCT',4,'1','','','1','1','1','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.PRODUCTNO','产成品编号','PRODUCTNO','IB_PRODUCT',3,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.PRODUCTTYPE','产品类型','PRODUCTTYPE','IB_PRODUCT',1,'7','','','1','1','2','','{\"sql\":\"select id vKey, typeName vValue from IB_PRODUCTTYPE \"} ',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.PRODUCTUNIT','单位','PRODUCTUNIT','IB_PRODUCT',6,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','product','IB_PRODUCT.UNITPRICE','单价','UNITPRICE','IB_PRODUCT',7,'5','','','1','1','2','','',NULL);

