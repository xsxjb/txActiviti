/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('ib_indeximgbyworks0001','首页图片配置页面','3','/indeximgbyworks/indeximgbyworks-list.do','URL','2','mTwoindex26');
/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('ib_indeximgbyworks0001','2');

/*==============================================================*/
/* cms 公告栏目表   */
/*==============================================================*/
TRUNCATE TABLE IB_CMS_CATALOG;
INSERT INTO IB_CMS_CATALOG(ID,name,code,logo,catalogtype,template_index,template_list,template_detail,SCOPEID) VALUES(1,'新闻','news',null,0,'/default/index.html','/default/list.html','/default/detail.html','1');

/*==============================================================*/
/* 图片管理作品展示表   */
/*==============================================================*/
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('bac9be90-11da-4d05-a1b6-91e273f3c368','test','indeximgbyworks','作品展示页面','/indeximgbyworks/indeximgbyworks-list.do',1,1,1,1,2,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('test','indeximgbyworks','IB_INDEXIMGBYWORKS','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('test','indeximgbyworks','IB_INDEXIMGBYWORKS.IMGURL','图片地址','IMGURL','IB_INDEXIMGBYWORKS',1,'11','','','1','1','2','1','','{"pathName":"imgworks"}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('test','indeximgbyworks','IB_INDEXIMGBYWORKS.IMGINFO','图片信息描述','IMGINFO','IB_INDEXIMGBYWORKS',2,'2','','','1','1','1','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('test','indeximgbyworks','IB_INDEXIMGBYWORKS.SHOWFLAG','是否显示标记','SHOWFLAG','IB_INDEXIMGBYWORKS',3,'6','','','1','1','2','1','','[{"key":"1","value":"是"},{"key":"2","value":"否"}]');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ff776e3d-bee3-4cf2-bab3-890d7d581390','test','IB_INDEXIMGBYWORKS','作品展示表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_INDEXIMGBYWORKS','IMGURL','图片地址','VARCHAR','256','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_INDEXIMGBYWORKS','IMGINFO','图片信息描述','VARCHAR','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_INDEXIMGBYWORKS','SHOWFLAG','是否显示标记','VARCHAR','8','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_INDEXIMGBYWORKS','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_INDEXIMGBYWORKS','SCOPEID','范围','VARCHAR','64','否','',92);



