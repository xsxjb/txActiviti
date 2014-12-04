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
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree12','原料管理','3','/materials/materials-list.do','URL','1','productmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree31','仓库信息','3','#','URL','1','productmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree32','产品分类','3','/producttype/producttype-list.do','URL','1','productmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree33','产品管理','3','/product/product-list.do','URL','1','productmanageTwo3');
/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo3','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo4','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree11','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree12','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree31','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree32','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree33','2');

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
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('productmanage-materialsType001','productmanage','materialsType','原料分类管理',NULL,1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialsType','IB_MATERIALS_TYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.ISLEAF','是否叶子节点','ISLEAF','IB_MATERIALS_TYPE',4,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.RPARENTID','父节点','RPARENTID','IB_MATERIALS_TYPE',3,'7','','','1','1','1','2','','{\"sql\":\"select id vKey, typeName vValue from IB_MATERIALS_TYPE \"}');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.TYPENAME','原料分类名称','TYPENAME','IB_MATERIALS_TYPE',2,'1','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.TYPENO','原料分类编号','TYPENO','IB_MATERIALS_TYPE',1,'1','','','1','1','1','2','','');


/* ================================================================================   */
/* ====================================   原料表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_materials001','productmanage','IB_MATERIALS','原料表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNO','原料编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNAME','原料名称','DATETIME','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALPRICE','价格','DOUBLE','12,2','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALTYPENO','分类编号','DATETIME','64','是',NULL,4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALUNIT','单位','VARCHAR','8','是',NULL,5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MODEL','规格型号','VARCHAR','64','是',NULL,6);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('productmanage-materials001','productmanage','materials','原料管理','/materials/materials-list.do',1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materials','IB_MATERIALS','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALNO','原料编号','MATERIALNO','IB_MATERIALS',1,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALNAME','原料名称','MATERIALNAME','IB_MATERIALS',2,'7','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALPRICE','价格','MATERIALPRICE','IB_MATERIALS',3,'5','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALTYPENO','原料分类','MATERIALTYPENO','IB_MATERIALS',4,'7','','','1','1','1','2','','{"sql":"select id vKey, typeName vValue from IB_MATERIALS_TYPE "} ');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALUNIT','单位','MATERIALUNIT','IB_MATERIALS',5,'1','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MODEL','规格型号','MODEL','IB_MATERIALS',6,'1','','','1','1','1','2','','');

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
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('productmanage-productType001','productmanage','productType','产品分类管理','/producttype/producttype-list.do',1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','productType','IB_PRODUCTTYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.ISLEAF','产品分类表.是否叶子节点','ISLEAF','IB_PRODUCTTYPE',4,'8','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.RPARENTID','父节点ID','RPARENTID','IB_PRODUCTTYPE',3,'7','','','1','1','2','','','{\"sql\":\"select id vKey, typeName vValue from IB_PRODUCTTYPE \"} ');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.TYPENAME','产品分类名称','TYPENAME','IB_PRODUCTTYPE',2,'1','','','1','1','1','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','productType','IB_PRODUCTTYPE.TYPENO','分类编号','TYPENO','IB_PRODUCTTYPE',1,'1','','','1','1','2','','',NULL);

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
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_PRODUCT','UNITPRICE','单价','DOUBLE','12,2','是',NULL,7);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM) values ('productmanage-product001','productmanage','product','产品管理','/product/product-list.do',1,1,1,1,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','product','IB_PRODUCT','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.AMOUNT','金额','AMOUNT','IB_PRODUCT',8,'5','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTFLOWID','产品件号','PRODUCTFLOWID','IB_PRODUCT',2,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTMODEL','规格型号','PRODUCTMODEL','IB_PRODUCT',5,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTNAME','产品名','PRODUCTNAME','IB_PRODUCT',4,'1','','','1','1','1','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTNO','产品编号','PRODUCTNO','IB_PRODUCT',3,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTTYPE','产品类型','PRODUCTTYPE','IB_PRODUCT',1,'7','','','1','1','2','','','{\"sql\":\"select id vKey, typeName vValue from IB_PRODUCTTYPE \"} ');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.PRODUCTUNIT','单位','PRODUCTUNIT','IB_PRODUCT',6,'1','','','1','1','2','','',NULL);
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCMUST,FCQUERY,FCDEFAULT,CONFSELECTINFO) values ('productmanage','product','IB_PRODUCT.UNITPRICE','单价','UNITPRICE','IB_PRODUCT',7,'5','','','1','1','2','','',NULL);

