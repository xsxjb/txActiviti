/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0000','productmanage','产品管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0001','productmanage','表存储设计器','productmanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0002','productmanage','表单设计器','productmanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0003','productmanage','流程表设计器','productmanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0004','productmanage','流程表单设计器','productmanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0005','productmanage','流程设计器','productmanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageOne','产品管理','1','#','URL','5','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageTwo1','原料信息','2','#','URL','1','productmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageTwo2','原料管理','2','#','URL','1','productmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageTwo3','产品信息','2','#','URL','1','productmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageTwo4','产品管理','2','#','URL','1','productmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree11','原料分类','3','/materials_type/materials_type-list.do','URL','1','productmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree12','原料管理','3','/materials/materials-list.do','URL','2','productmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree21','原料入库流程','3','/material_in/material_in-list.do?flowType=0&flowId=materialin001','URL','1','productmanageTwo2');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree31','仓库信息','3','/warehouse/warehouse-list.do','URL','1','productmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree32','产品分类管理','3','/producttype/producttype-list.do','URL','2','productmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree33','产品管理','3','/product/product-list.do','URL','3','productmanageTwo3');
/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo3','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo4','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree11','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree12','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree21','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree31','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree32','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree33','2');

/* ================================================================================   */
/* ===================================    仓库信息表          =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_warehouse001','productmanage','IB_WAREHOUSE','仓库信息','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','WAREHOUSENO','仓库编号','VARCHAR','64','是','',1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','WAREHOUSENAME','仓库名称','VARCHAR','128','是','',2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','WAREHOUSELOCATION','仓库位置','VARCHAR','128','是','',3);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-warehouse001','productmanage','warehouse','仓库管理','/warehouse/warehouse-list.do',1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','warehouse','IB_WAREHOUSE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouse','IB_WAREHOUSE.WAREHOUSENO','仓库编号','WAREHOUSENO','IB_WAREHOUSE',1,'1','','','1','1','2','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouse','IB_WAREHOUSE.WAREHOUSENAME','仓库名称','WAREHOUSENAME','IB_WAREHOUSE',2,'1','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouse','IB_WAREHOUSE.WAREHOUSELOCATION','仓库位置','WAREHOUSELOCATION','IB_WAREHOUSE',3,'2','','','1','1','2','1','','');

/* ================================================================================   */
/* ===================================    原料分类信息表  =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('IB_MATERIALS_TYPE001','productmanage','IB_MATERIALS_TYPE','原料分类表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','TYPENO','分类编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','TYPENAME','分类名称','DATETIME','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','RPARENTID','父节点ID','VARCHAR','64','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','ISLEAF','是否叶子节点','DATETIME','8','是',NULL,4);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-materialsType001','productmanage','materialsType','原料分类管理',NULL,1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialsType','IB_MATERIALS_TYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.ISLEAF','是否叶子节点','ISLEAF','IB_MATERIALS_TYPE',4,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.RPARENTID','父节点','RPARENTID','IB_MATERIALS_TYPE',3,'7','','','1','1','1','2','','{\"sql\":\"select id vKey, typeName vValue from IB_MATERIALS_TYPE \"}');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.TYPENAME','原料分类名称','TYPENAME','IB_MATERIALS_TYPE',2,'1','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.TYPENO','原料分类编号','TYPENO','IB_MATERIALS_TYPE',1,'1','','','1','1','1','2','','');

/* ================================================================================   */
/* ====================================   原料表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_materials001','productmanage','IB_MATERIALS','原料表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNO','原料编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNAME','原料名称','DATETIME','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALPRICE','价格','NUMBER','12,2','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALTYPENO','分类编号','DATETIME','64','是',NULL,4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALUNIT','单位','VARCHAR','8','是',NULL,5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MODEL','规格型号','VARCHAR','64','是',NULL,6);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-materials001','productmanage','materials','原料管理','/materials/materials-list.do',1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materials','IB_MATERIALS','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALNO','原料编号','MATERIALNO','IB_MATERIALS',1,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALNAME','原料名称','MATERIALNAME','IB_MATERIALS',2,'7','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALPRICE','价格','MATERIALPRICE','IB_MATERIALS',3,'5','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALTYPENO','原料分类','MATERIALTYPENO','IB_MATERIALS',4,'7','','','1','1','1','2','','{"sql":"select id vKey, typeName vValue from IB_MATERIALS_TYPE "} ');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALUNIT','单位','MATERIALUNIT','IB_MATERIALS',5,'1','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MODEL','规格型号','MODEL','IB_MATERIALS',6,'1','','','1','1','1','2','','');

/* ================================================================================   */
/* ===================================   产品分类表  ===================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_producttype001','productmanage','IB_PRODUCTTYPE','产品分类表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','TYPENO','分类编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','TYPENAME','分类名称','VARCHAR','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','RPARENTID','父节点ID','VARCHAR','64','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCTTYPE','ISLEAF','是否叶子节点','VARCHAR','8','是',NULL,4);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-productType001','productmanage','productType','产品分类管理','/producttype/producttype-list.do',1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','productType','IB_PRODUCTTYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.ISLEAF','产品分类表.是否叶子节点','ISLEAF','IB_PRODUCTTYPE',4,'8','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.RPARENTID','父节点ID','RPARENTID','IB_PRODUCTTYPE',3,'7','','','1','1','2','','','{\"sql\":\"select id vKey, typeName vValue from IB_PRODUCTTYPE \"} ');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.TYPENAME','产品分类名称','TYPENAME','IB_PRODUCTTYPE',2,'1','','','1','1','1','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.TYPENO','分类编号','TYPENO','IB_PRODUCTTYPE',1,'1','','','1','1','2','','',NULL);

/* ================================================================================   */
/* ====================================   产品表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_product001','productmanage','IB_PRODUCT','产品管理表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTTYPE','产品类型','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTFLOWID','产品件号','VARCHAR','64','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTNO','产品编号','VARCHAR','64','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTNAME','产品名','VARCHAR','128','是',NULL,4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTMODEL','规格型号','VARCHAR','64','是',NULL,5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','PRODUCTUNIT','单位','VARCHAR','8','是',NULL,6);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','UNITPRICE','单价','NUMBER','12,2','是',NULL,7);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-product001','productmanage','product','产品管理','/product/product-list.do',1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','product','IB_PRODUCT','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.AMOUNT','金额','AMOUNT','IB_PRODUCT',8,'5','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTFLOWID','产品件号','PRODUCTFLOWID','IB_PRODUCT',2,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTMODEL','规格型号','PRODUCTMODEL','IB_PRODUCT',5,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTNAME','产品名','PRODUCTNAME','IB_PRODUCT',4,'1','','','1','1','1','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTNO','产品编号','PRODUCTNO','IB_PRODUCT',3,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTTYPE','产品类型','PRODUCTTYPE','IB_PRODUCT',1,'7','','','1','1','2','','','{\"sql\":\"select id vKey, typeName vValue from IB_PRODUCTTYPE \"} ');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTUNIT','单位','PRODUCTUNIT','IB_PRODUCT',6,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.UNITPRICE','单价','UNITPRICE','IB_PRODUCT',7,'5','','','1','1','2','','',NULL);
/* ================================================================================   */
/* ====================================   原料入库表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_material_in001','productmanage','IB_MATERIAL_IN','原料入库表','1',NULL,1);
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_material_in_s001','productmanage','IB_MATERIAL_IN_S','原料入库信息子表','2',NULL,1);
/* ================= 业务表字段结构管理表 ==================   */
/*============== 原料入库表 ===============*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','EXECUTIONID','流程执行实例ID','VARCHAR','64','是',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','CREATEDATEBPM','流程创建时间','DATETIME','','是',NULL,93);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','NODENAME','流程节点名','VARCHAR','128','是',NULL,94);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','ASSIGNEEUSER','负责人','VARCHAR','64','是',NULL,95);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','DONEFLAG','流程结束标记','INTEGER','4','是',NULL,96);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','TASKTITLE','流程实例标题','VARCHAR','256','是',NULL,97);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','EVENTDATE','入库日期','DATE','0','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','SUPPLIERSNAME','供应商名称','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','WAREHOUSENO','仓库编号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','WAREHOUSENAME','仓库名称','VARCHAR','128','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','TOTALNUM','总数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','AMOUNT','合计金额','NUMBER','12,2','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','AMOUNTBIG','合计金额大写','VARCHAR','64','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','REMARK','备注','VARCHAR','512','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','USERNAME','负责人名','VARCHAR','128','是',NULL,9);
/*============== 原料入库信息子表 ===============*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','PARENTID','主表UUID','VARCHAR','64','否',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALNO','原料编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALNAME','原料名称','VARCHAR','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALMODEL','原料规格型号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALUNIT','单位','VARCHAR','16','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALNUM','数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','AMOUNT','金额','NUMBER','12,2','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MANUFACTURENAME','制造商','VARCHAR','64','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','REMARK','备注','VARCHAR','512','是','',8);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-materialin001','productmanage','materialin','原料入库流程','/material_in/material_in-list.do',1,1,1,2,2,2,1);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialin','IB_MATERIAL_IN','main');
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialin','IB_MATERIAL_IN_S','sub');
/* ================= 表单对应字段管理表 ==================   */
/*============== 原料入库表 ===============*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.AMOUNT','合计金额','AMOUNT','IB_MATERIAL_IN',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.AMOUNTBIG','合计金额大写','AMOUNTBIG','IB_MATERIAL_IN',7,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.EVENTDATE','入库日期','EVENTDATE','IB_MATERIAL_IN',1,'3','','','1','2','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.REMARK','备注','REMARK','IB_MATERIAL_IN',8,'2','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.SUPPLIERSNAME','供应商名称','SUPPLIERSNAME','IB_MATERIAL_IN',2,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.TOTALNUM','总数量','TOTALNUM','IB_MATERIAL_IN',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.WAREHOUSENAME','仓库名称','WAREHOUSENAME','IB_MATERIAL_IN',4,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.WAREHOUSENO','仓库编号','WAREHOUSENO','IB_MATERIAL_IN',3,'7','','','1','1','2','1','','{\"sql\":\"select id vKey, WAREHOUSENAME vValue from IB_WAREHOUSE \"} ');
/*============== 原料入库信息子表 ===============*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.AMOUNT','金额','AMOUNT','IB_MATERIAL_IN_S',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MANUFACTURENAME','制造商','MANUFACTURENAME','IB_MATERIAL_IN_S',7,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALMODEL','原料规格型号','MATERIALMODEL','IB_MATERIAL_IN_S',3,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALNAME','原料名称','MATERIALNAME','IB_MATERIAL_IN_S',2,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALNO','原料编号','MATERIALNO','IB_MATERIAL_IN_S',1,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALNUM','数量','MATERIALNUM','IB_MATERIAL_IN_S',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALUNIT','单位','MATERIALUNIT','IB_MATERIAL_IN_S',4,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.REMARK','备注','REMARK','IB_MATERIAL_IN_S',8,'2','','','1','1','2','1','','');
/* ============================= 流程管理表 =============================   */
INSERT INTO IB_BPM_PROCESS(ID,PACKAGENAME,FLOWNAME,FLOWTITLE,VERSIONID,FORMID,FLOWURL) VALUES('materialin001','productmanage','materialin','原料入库流程','bcb868a5-db45-454f-8a72-68093367010c','productmanage-materialin001','/material_in/material_in-list.do?flowType=0&flowId=materialin001');
/* ============================= 流程图管理表 =============================   */
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('06ab634d-b9f8-4316-8531-1813530ecbe5','materialin001','3a916bdd-f8e0-4021-b586-e7415be2d966',NULL,'{\"id\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"realPoints\":\"120,90,200,90\",\"startElmId\":\"9c3f1ba1-c5bd-42d8-be62-c041793d6bb1\",\"endElmId\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('06f3697c-4a1d-41e5-b076-556047af244a','materialin001','4e21a11c-db68-45cf-aa2f-2428487fb8a2',NULL,'{\"id\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\",\"name\":\"发起\",\"type\":\"TaskNode\",\"title\":\"发起\",\"x\":\"200\",\"y\":\"65\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\",\"afterLineIds\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('18b0b532-b79e-4c2e-a65d-f57091d64232','materialin001','68acb9ed-b620-47ad-9ea4-7179105a4aa6',NULL,'{\"id\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"250,115,250,200,400,200\",\"startElmId\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\",\"endElmId\":\"f4224f84-0df8-425f-af69-34620fb53377\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('1f5d84ef-6d6a-4144-afd0-5b21569a8588','materialin001','fa4237d4-93eb-4534-b94d-21d60eec970f',NULL,'{\"id\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"realPoints\":\"700,310,750,310,750,310\",\"startElmId\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\",\"endElmId\":\"756b2f73-2539-4a0c-8ff9-eb21f626a2b1\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('21594b6e-5db2-49a6-a107-67de01a1c902','materialin001','76388b75-b3ff-4be1-9b02-ba0d04fa5482',NULL,'{\"id\":\"76388b75-b3ff-4be1-9b02-ba0d04fa5482\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('22e00fcb-adfc-4b3f-8cab-d18bb6ee7a30','materialin001','935e844a-4377-498a-98bf-f3d6f2d22c52',NULL,'{\"id\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"realPoints\":\"450,225,450,310,600,310\",\"startElmId\":\"f4224f84-0df8-425f-af69-34620fb53377\",\"endElmId\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('25ead779-2010-42dc-a5d0-59c2f8bed31b','materialin001','f4224f84-0df8-425f-af69-34620fb53377',NULL,'{\"id\":\"f4224f84-0df8-425f-af69-34620fb53377\",\"name\":\"审批\",\"type\":\"TaskNode\",\"title\":\"审批\",\"x\":\"400\",\"y\":\"175\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\",\"afterLineIds\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('2d042d87-380f-441f-a18e-af75bf615d30','materialin001','9c3f1ba1-c5bd-42d8-be62-c041793d6bb1',NULL,'{\"id\":\"9c3f1ba1-c5bd-42d8-be62-c041793d6bb1\",\"name\":\"开始节点\",\"type\":\"StartNode\",\"title\":\"开始节点\",\"x\":\"70\",\"y\":\"65\",\"width\":\"50\",\"height\":\"50\",\"afterLineIds\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('595c0b02-88ca-4b79-97ca-558e9539f37f','materialin001','4973687e-9ad3-4415-a6ba-ae21589fb599',NULL,'{\"id\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\",\"name\":\"入库质检\",\"type\":\"TaskNode\",\"title\":\"入库质检\",\"x\":\"600\",\"y\":\"285\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\",\"afterLineIds\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('91d88246-4949-422d-bebe-a6af02236a26','materialin001','2e47a7e0-51d4-412c-a189-2e739ea7229c',NULL,'{\"id\":\"2e47a7e0-51d4-412c-a189-2e739ea7229c\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('936ed6d4-e0a9-4a13-b036-57e009ee15fe','materialin001','756b2f73-2539-4a0c-8ff9-eb21f626a2b1',NULL,'{\"id\":\"756b2f73-2539-4a0c-8ff9-eb21f626a2b1\",\"name\":\"结束节点\",\"type\":\"EndNode\",\"title\":\"结束\",\"x\":\"750\",\"y\":\"285\",\"width\":\"50\",\"height\":\"50\",\"headLineIds\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('a1ea70ee-2f97-4923-a141-d8851f27d7f9','materialin001','bd5e352b-212c-4489-a700-b363d7acda0b',NULL,'{\"id\":\"bd5e352b-212c-4489-a700-b363d7acda0b\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"width\":\"35\",\"height\":\"110\"}');

