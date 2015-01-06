/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('operationmanage0000','operationmanage','运行管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('operationmanage0001','operationmanage','表存储设计器','operationmanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('operationmanage0002','operationmanage','表单设计器','operationmanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('operationmanage0003','operationmanage','流程表设计器','operationmanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('operationmanage0004','operationmanage','流程表单设计器','operationmanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('operationmanage0005','operationmanage','流程设计器','operationmanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageOne','运行管理','1','#','URL','5','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageTwo1','配置','2','#','URL','2','operationmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageTwo2','控制','2','#','URL','1','operationmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageTwo3','日志','2','#','URL','2','operationmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageThree11','工艺图-绘图控件配置','3','/drawConf/drawConf-list.do','URL','1','operationmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageThree12','工艺图-弹出页面配置','3','/conf_popup_page/conf_popup_page-list.do','URL','2','operationmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageThree13','工艺图-弹出页面组件配置','3','/pop_conf_ctrlobj/pop_conf_ctrlobj-list.do','URL','3','operationmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageThree21','工艺图-展示','3','/ibusiness/plc-control/plc-show.jsp','URL','1','operationmanageTwo2');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageThree22','工艺图-绘图','3','/ibusiness/plc-control/plc-draw.jsp','URL','2','operationmanageTwo2');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanageThree31','空调控制记录','3','/airconditionlog/airconditionlog-list.do','URL','1','operationmanageTwo3');
/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageTwo2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageTwo3','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageThree11','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageThree12','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageThree13','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageThree21','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageThree22','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanageThree31','2');

/* ================================================================================   */
/* ================================= 空调控制记录表  =================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('e3aa552e-c075-4aef-8b62-60c754fcd63d','operationmanage','airConditionLog','空调控制记录','/airconditionlog/airconditionlog-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('operationmanage','airConditionLog','IB_AIRCONDITIONLOG','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','airConditionLog','IB_AIRCONDITIONLOG.EVENTTIME','操作时间','EVENTTIME','IB_AIRCONDITIONLOG',1,'3','','','1','2','2','1','@currentDate','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','airConditionLog','IB_AIRCONDITIONLOG.CONTROLUSER','操作人员','CONTROLUSER','IB_AIRCONDITIONLOG',2,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','airConditionLog','IB_AIRCONDITIONLOG.CONTROLINFO','控制内容','CONTROLINFO','IB_AIRCONDITIONLOG',3,'2','','','1','1','2','2','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_airconditionlog001','operationmanage','IB_AIRCONDITIONLOG','空调控制记录','1','',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_AIRCONDITIONLOG','EVENTTIME','操作时间','DATE','0','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_AIRCONDITIONLOG','CONTROLUSER','操作人员','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_AIRCONDITIONLOG','CONTROLINFO','控制内容','VARCHAR','512','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_AIRCONDITIONLOG','ID','UUID主键','VARCHAR','64','否','',91);

/* ================================================================================   */
/* =============================== PLC弹出页面配置页面  ==============================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('operationmanage-plcConfPopupPage0001','operationmanage','plcConfPopupPage','PLC弹出页面','/conf_popup_page/conf_popup_page-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.PAGENAME','弹出页面名子','PAGENAME','IB_CONF_POPUP_PAGE',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.PAGETITLE','页面标题','PAGETITLE','IB_CONF_POPUP_PAGE',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.POPUPTYPE','页面弹出方式','POPUPTYPE','IB_CONF_POPUP_PAGE',3,'1','','','1','1','2','1','','[{"key":"1","value":"新标签弹出"},{"key":"2","value":"新窗口弹出"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.PAGEURL','弹出页面url路径','PAGEURL','IB_CONF_POPUP_PAGE',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.PAGETYPE','弹出页面类型','PAGETYPE','IB_CONF_POPUP_PAGE',5,'6','','','1','1','2','1','','[{"key":"1","value":"主页面"},{"key":"2","value":"子页面"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.MAINPAGEID','所属主页面ID','MAINPAGEID','IB_CONF_POPUP_PAGE',6,'7','','','1','1','2','2','','{"sql":"select id vKey, PAGENAME vValue from IB_CONF_POPUP_PAGE where PAGETYPE=1 "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.PAGEHIGHT','页面高度','PAGEHIGHT','IB_CONF_POPUP_PAGE',7,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','plcConfPopupPage','IB_CONF_POPUP_PAGE.PAGEWIDTH','页面宽度','PAGEWIDTH','IB_CONF_POPUP_PAGE',8,'1','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('operationmanage-ib_conf_popup_page001','operationmanage','IB_CONF_POPUP_PAGE','PLC弹出页面','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','PAGENAME','页面名子','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','PAGETITLE','页面标题','VARCHAR','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','POPUPTYPE','弹出方式','VARCHAR','16','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','PAGEURL','页面url路径','VARCHAR','256','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','PAGETYPE','页面类型','VARCHAR','16','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','MAINPAGEID','所属主页面ID','VARCHAR','64','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','PAGEHIGHT','页面高度','VARCHAR','8','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','PAGEWIDTH','页面宽度','VARCHAR','8','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONF_POPUP_PAGE','ID','UUID主键','VARCHAR','64','否','',91);

/* ================================================================================   */
/* ============================ 弹出页面组件配置页面  ================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('a888b8e7-619f-4233-9c74-346497160083','operationmanage','popConfCtrlObj','弹出页面组件配置页面','/pop_conf_ctrlobj/pop_conf_ctrlobj-list.do',1,1,1,1,2,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ.OBJNAME','控件名','OBJNAME','IB_POP_CONF_CTRLOBJ',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ.OBJTITLE','控件标题','OBJTITLE','IB_POP_CONF_CTRLOBJ',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ.OBJTYPE','控件类型','OBJTYPE','IB_POP_CONF_CTRLOBJ',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ.OBJIMG','控件图片1','OBJIMG','IB_POP_CONF_CTRLOBJ',5,'1','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ.OBJIMG2','控件图片2','OBJIMG2','IB_POP_CONF_CTRLOBJ',6,'1','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ.OBJIMG3','控件图片3','OBJIMG3','IB_POP_CONF_CTRLOBJ',7,'1','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('operationmanage','popConfCtrlObj','IB_POP_CONF_CTRLOBJ.OBJIMG4','控件图片4','OBJIMG4','IB_POP_CONF_CTRLOBJ',8,'1','','','1','1','2','2','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('c39146d0-5dab-4c9b-9cd6-868cde285a6e','operationmanage','IB_POP_CONF_CTRLOBJ','PLC弹出页面控件对象配置表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','OBJNAME','控件名','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','OBJTITLE','控件标题','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','OBJTYPE','控件类型','VARCHAR','16','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','OBJIMG','控件图片1','VARCHAR','128','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','OBJIMG2','控件图片2','VARCHAR','128','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','OBJIMG3','控件图片3','VARCHAR','128','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','OBJIMG4','控件图片4','VARCHAR','128','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_POP_CONF_CTRLOBJ','ID','UUID主键','VARCHAR','64','否','',91);

/* ===================== 工艺图-绘图控件配置页面   插入默认数据 ======================= */
insert into ib_conf_plcdraw(ID,ITEMID,ITEMNAME,ITEMTYPE,ITEMTITLE,IMGHURL,IMGVURL,REMARK) values ('plcdraw_cyclepump00001','10001','循环泵','CyclePump','#循环泵','xhb1-h-0.png','xhb1-v-0.png','');
/* ===================== 工艺图-弹出页面配置   插入默认数据 ======================= */
insert into ib_conf_popup_page(PAGENAME,PAGETITLE,POPUPTYPE,PAGEURL,PAGETYPE,MAINPAGEID,PAGEHIGHT,PAGEWIDTH,ID) values ('循环泵弹出页面曲线子页面','循环泵弹曲线','1','cpumpXXX.action!query.do','1','bebd831f-5cfc-4018-8c46-2151de9d59db','400','300','88749b35-a714-411b-806e-3aad51b77aeb');
insert into ib_conf_popup_page(PAGENAME,PAGETITLE,POPUPTYPE,PAGEURL,PAGETYPE,MAINPAGEID,PAGEHIGHT,PAGEWIDTH,ID) values ('循环泵弹出页面','#循环泵弹出页面','1','station\\generics\\controlCyclePump.jsp','1','','600','400','bebd831f-5cfc-4018-8c46-2151de9d59db');
/* ===================== 工艺图-弹出页面组件配置   插入默认数据 ======================= */
insert into ib_pop_conf_ctrlobj(OBJNAME,OBJTITLE,OBJTYPE,OBJIMG,OBJIMG2,OBJIMG3,OBJIMG4,ID) values ('button','按钮','下发按钮','','','','','0f21e40a-0f69-42a7-b9c5-114d3d02b917');
insert into ib_pop_conf_ctrlobj(OBJNAME,OBJTITLE,OBJTYPE,OBJIMG,OBJIMG2,OBJIMG3,OBJIMG4,ID) values ('sendText','下发输入框','下发输入框','','','','','28a16e7d-6987-47b9-b0d1-a110929f4bcb');
insert into ib_pop_conf_ctrlobj(OBJNAME,OBJTITLE,OBJTYPE,OBJIMG,OBJIMG2,OBJIMG3,OBJIMG4,ID) values ('圆灯','报警灯','图片','/deng.jpg','/deng2.jpg','/deng3.jpg','/deng4.jpg','c061303a-1415-494f-8ec8-0ca97dc93484');

