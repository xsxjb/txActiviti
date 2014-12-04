/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('projectmanage0000','projectmanage','项目管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('projectmanage0001','projectmanage','表存储设计器','projectmanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('projectmanage0002','projectmanage','表单设计器','projectmanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('projectmanage0003','projectmanage','流程表设计器','projectmanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('projectmanage0004','projectmanage','流程表单设计器','projectmanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('projectmanage0005','projectmanage','流程设计器','projectmanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('projectmanageOne','项目管理','1','#','URL','5','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('projectmanageTwo1','合同管理','2','#','URL','1','projectmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('projectmanageTwo2','项目管理','2','#','URL','1','projectmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('projectmanageThree21','项目立项','3','/project_approval/project_approval-list.do?flowType=0&flowId=projectApproval001','URL','1','projectmanageTwo2');

/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('projectmanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('projectmanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('projectmanageTwo2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('projectmanageThree21','2');

/* ================================================================================   */
/* ===================================    项目立项表  =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_project_approval001','projectmanage','IB_PROJECT_APPROVAL','项目立项表','1',NULL,1);
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_project_product_s001','projectmanage','IB_PROJECT_PRODUCT_S','立项产品子表','2',NULL,1);

/* ================= 业务表字段结构管理表 ==================   */
/* ========= 项目立项产品表 ============   */
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
/* ========== 项目立项产品子表  ============= */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PARENTID','主表UUID','VARCHAR','64','否',NULL,92);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTNO','产品编号','VARCHAR','64','是','',1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PROJECT_PRODUCT_S','PRODUCTNAME','产品名','VARCHAR','64','是','',2);
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
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTNAME','产品名','PRODUCTNAME','IB_PROJECT_PRODUCT_S',2,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTNO','产品编号','PRODUCTNO','IB_PROJECT_PRODUCT_S',1,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTNUMBER','数量','PRODUCTNUMBER','IB_PROJECT_PRODUCT_S',4,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTTYPE','产品类型','PRODUCTTYPE','IB_PROJECT_PRODUCT_S',8,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.PRODUCTUNIT','单位','PRODUCTUNIT','IB_PROJECT_PRODUCT_S',5,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('projectmanage','projectApproval','IB_PROJECT_PRODUCT_S.UNITPRICE','单价','UNITPRICE','IB_PROJECT_PRODUCT_S',6,'1',NULL,NULL,'1','1','1','2',NULL,NULL);
/* ============================= 流程管理表 =============================   */
INSERT INTO IB_BPM_PROCESS(ID,PACKAGENAME,FLOWNAME,FLOWTITLE,VERSIONID,FORMID,FLOWURL) VALUES('projectApproval001','projectmanage','projectApproval','项目立项流程','4b7a45ea-8cdb-4f4d-bf69-0a08ffff9876','projectmanage-projectApproval001','/project_approval/project_approval-list.do?flowType=0&flowId=projectApproval001');
/* ============================= 流程图管理表 =============================   */
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('0f587082-276f-4794-a211-0106853e648a','projectApproval001','7d44444c-8a24-4cf5-85cc-0c5d32eadb99',NULL,'{\"id\":\"7d44444c-8a24-4cf5-85cc-0c5d32eadb99\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"realPoints\":\"120,90,200,90\",\"startElmId\":\"d075a0da-dd86-425b-a1c4-f1818d0ba0da\",\"endElmId\":\"c93afc27-5598-4ded-bc44-3b98b0e32eae\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('2e49f0a8-4fd8-4a58-9fe6-8536119b49e2','projectApproval001','bf1551d1-2d36-4f76-a355-6f455fc6c6aa',NULL,'{\"id\":\"bf1551d1-2d36-4f76-a355-6f455fc6c6aa\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('75ef67d7-379c-46e8-9788-bdfbbe58caca','projectApproval001','c727505f-d95a-473b-b782-378b7fa127ca',NULL,'{\"id\":\"c727505f-d95a-473b-b782-378b7fa127ca\",\"name\":\"结束节点\",\"type\":\"EndNode\",\"title\":\"结束\",\"x\":\"550\",\"y\":\"175\",\"width\":\"50\",\"height\":\"50\",\"headLineIds\":\"b7985ebd-50be-43ad-b09a-2e97b83a0a16\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('8c07981a-aa4f-4525-994f-abd89d3a857d','projectApproval001','b7985ebd-50be-43ad-b09a-2e97b83a0a16',NULL,'{\"id\":\"b7985ebd-50be-43ad-b09a-2e97b83a0a16\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"500,200,550,200,550,200\",\"startElmId\":\"3dfae1d5-ac2e-48a4-ae3a-e8b8ebabf1d8\",\"endElmId\":\"c727505f-d95a-473b-b782-378b7fa127ca\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('9058ef2b-aeb6-4731-b5d2-067d0befa48c','projectApproval001','3dfae1d5-ac2e-48a4-ae3a-e8b8ebabf1d8',NULL,'{\"id\":\"3dfae1d5-ac2e-48a4-ae3a-e8b8ebabf1d8\",\"name\":\"审批\",\"type\":\"TaskNode\",\"title\":\"审批\",\"x\":\"400\",\"y\":\"175\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"89a48242-1f97-44f5-b698-cf0c18b37bb7\",\"afterLineIds\":\"b7985ebd-50be-43ad-b09a-2e97b83a0a16\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('92e13644-83d9-466b-ae5d-617a4688c61d','projectApproval001','782f4949-df19-4dca-be5a-030d5777109e',NULL,'{\"id\":\"782f4949-df19-4dca-be5a-030d5777109e\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('aa7e252a-f73b-4b0e-8955-63e8db4a2e7e','projectApproval001','c93afc27-5598-4ded-bc44-3b98b0e32eae',NULL,'{\"id\":\"c93afc27-5598-4ded-bc44-3b98b0e32eae\",\"name\":\"发起\",\"type\":\"TaskNode\",\"title\":\"发起\",\"x\":\"200\",\"y\":\"65\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"7d44444c-8a24-4cf5-85cc-0c5d32eadb99\",\"afterLineIds\":\"89a48242-1f97-44f5-b698-cf0c18b37bb7\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('c418eda1-7dde-4b79-823c-1bfc6888888a','projectApproval001','d075a0da-dd86-425b-a1c4-f1818d0ba0da',NULL,'{\"id\":\"d075a0da-dd86-425b-a1c4-f1818d0ba0da\",\"name\":\"开始节点\",\"type\":\"StartNode\",\"title\":\"开始节点\",\"x\":\"70\",\"y\":\"65\",\"width\":\"50\",\"height\":\"50\",\"afterLineIds\":\"7d44444c-8a24-4cf5-85cc-0c5d32eadb99\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('df517fb2-b897-4810-b46d-0f58a39d605b','projectApproval001','89a48242-1f97-44f5-b698-cf0c18b37bb7',NULL,'{\"id\":\"89a48242-1f97-44f5-b698-cf0c18b37bb7\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"250,115,250,200,400,200\",\"startElmId\":\"c93afc27-5598-4ded-bc44-3b98b0e32eae\",\"endElmId\":\"3dfae1d5-ac2e-48a4-ae3a-e8b8ebabf1d8\"}');

/* ================================================================================   */
/* ===================================   原料BOM分解表  =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_bom001','projectmanage','IB_BOM','原料BOM分解表','1',NULL,1);
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_bom_materials001','projectmanage','IB_BOM_MATERIALS','原料BOM分解子表','2',NULL,1);
/* ============ 原料BOM分解表  ============== */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','EXECUTIONID','流程执行实例ID','VARCHAR','64','是',NULL,92);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','CREATEDATEBPM','流程创建时间','DATETIME','','是',NULL,93);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','NODENAME','流程节点名','VARCHAR','128','是',NULL,94);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','USERNAME','负责人名','VARCHAR','128','是',NULL,95);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','DONEFLAG','流程结束标记','INTEGER','4','是',NULL,96);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','TASKTITLE','流程实例标题','VARCHAR','256','是',NULL,97);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PROJECTNO','项目编号','VARCHAR','64','是','',1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','CUSTOMERNAME','名称客户','VARCHAR','64','是','',2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PRODUCTTYPE','产品类型','VARCHAR','64','是','',3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PRODUCTFLOWID','产品件号','VARCHAR','64','是','',4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PRODUCTNO','产品编号','VARCHAR','64','是','',5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PRODUCTNAME','产品名','VARCHAR','128','是','',6);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PRODUCTMODEL','规格型号','VARCHAR','64','是','',7);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PRODUCTUNIT','单位','VARCHAR','8','是','',8);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','UNITPRICE','单价','DOUBLE','12,2','是','',9);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','PRODUCTNUMBER','数量','NUMBER','10','是','',10);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','DRAWBOOK','参照工艺','VARCHAR','128','是','',11);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','DESIGNUSER','人','VARCHAR','64','是','',12);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM','AUDITUSER','审核人员','VARCHAR','64','是','',13);
/* ============ 原料BOM分解子表  ============== */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','PARENTID','主表编号','VARCHAR','64','是','',92);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','MATERIALTYPENO','分类编号','VARCHAR','64','是','',2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','MATERIALNO','原料编号','VARCHAR','64','是','',3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','MATERIALNAME','原料名称','VARCHAR','128','是','',4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','MODEL','规格型号','VARCHAR','64','是','',5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','MATERIALPRICE','价格','NUMBER','12,2','是','',6);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','MATERIALUNIT','单位','VARCHAR','8','是','',7);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','MATERIALNUM','数量','VARCHAR','10','是','',8);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','STOCKTYPE','备货类型','VARCHAR','16','是','',9);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_BOM_MATERIALS','COMMENTS','备注','VARCHAR','512','是','',10);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('bomManage001','projectmanage','bomManage','原料分解流程','',1,1,1,2,1);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','bomManage','IB_BOM','main');
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('projectmanage','bomManage','IB_BOM_MATERIALS','sub');



