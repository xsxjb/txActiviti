/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('hrmanage0000','personmannager','行政管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('hrmanage0001','personmannager','表存储设计器','hrmanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('hrmanage0002','personmannager','表单设计器','hrmanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('hrmanage0003','personmannager','流程表设计器','hrmanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('hrmanage0004','personmannager','流程表单设计器','hrmanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('hrmanage0005','personmannager','流程设计器','hrmanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('hrmanageOne','行政管理','1','#','URL','5','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageTwo1','合同类型','2','#','URL','1','hrmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageTwo2','人事档案管理 ','2','#','URL','2','hrmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageTwo3','员工管理 ','2','#','URL','3','hrmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree11','合同类型','3','/contract_type/contract_type-list.do','URL','1','hrmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree21','人事档案管理','3','/person_info/person_info-list.do','URL','1','hrmanageTwo2');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree31','员工就职','3','/person_job_info/person_job_info-list.do','URL','1','hrmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree32','员工离职','3','/person_leave/person_leave-list.do','URL','2','hrmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree33','人员调动表','3','/person_move/person_move-list.do','URL','3','hrmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree34','复职登记表','3','/person_remove/person_remove-list.do','URL','4','hrmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree35','奖惩记录','3','/rewards_punishments/rewards_punishments-list.do','URL','5','hrmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree36','工资录入','3','/salary_enter/salary_enter-list.do','URL','6','hrmanageTwo3');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('hrmanageThree37','考核记录','3','/assess_record/assess_record-list.do','URL','7','hrmanageTwo3');


/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageTwo2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageTwo3','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree11','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree21','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree31','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree32','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree33','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree34','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree35','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree36','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('hrmanageThree37','2');

/* ================================================================================   */
/* ================================ 合同类型数据表   =================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('729430c8-5a6d-4d02-adff-18543f375b0a','personmannager','contractType','合同类型','/contract_type/contract_type-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','contractType','IB_CONTRACT_TYPE','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','contractType','IB_CONTRACT_TYPE.TYPENAME','合同类型名称','TYPENAME','IB_CONTRACT_TYPE',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','contractType','IB_CONTRACT_TYPE.TYPEDESCRIBE','合同类型描述','TYPEDESCRIBE','IB_CONTRACT_TYPE',2,'2','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('personmannager-ib_contract_type0001','personmannager','IB_CONTRACT_TYPE','合同类型','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONTRACT_TYPE','TYPENAME','合同类型名称','VARCHAR','32','否','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONTRACT_TYPE','TYPEDESCRIBE','合同类型描述','VARCHAR','32','否','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONTRACT_TYPE','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CONTRACT_TYPE','SCOPEID','范围','VARCHAR','64','否','',92);

/* ================================================================================   */
/* ========================= 人事档案管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('828693da-37cc-41de-ac67-647535aeb854','personmannager','personInfo','人事档案管理','/person_info/person_info-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','personInfo','IB_PERSON_INFO','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.JOBNUM','入职编号','JOBNUM','IB_PERSON_INFO',1,'1','','','2','2','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.NAME','姓名','NAME','IB_PERSON_INFO',2,'10','','','1','1','1','1','','{"jsplist":[{"inputKey":"name","inputValue":"name","inputTitle":"姓名"}],"className":"com.codegenerate.personmannager.service.Person_infoService"}
');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.GENDER','性别','GENDER','IB_PERSON_INFO',3,'6','','','1','1','2','1','','[{"key":"男","value":"男"},{"key":"女","value":"女"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.BIRTH','出生日期','BIRTH','IB_PERSON_INFO',4,'3','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.BIRTHPLACE','出生地','BIRTHPLACE','IB_PERSON_INFO',5,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.POLITICSSTATUS','政治面貌','POLITICSSTATUS','IB_PERSON_INFO',6,'6','','','1','1','2','1','','[{"key":"无","value":"无"},{"key":"群众","value":"群众"},{"key":"团员","value":"团员"},{"key":"党员","value":"党员"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.IDCARD','身份证号','IDCARD','IB_PERSON_INFO',7,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.MARITALSTATUS','婚姻状况','MARITALSTATUS','IB_PERSON_INFO',8,'6','','','1','1','2','1','','[{"key":"已婚","value":"已婚"},{"key":"未婚","value":"未婚"},{"key":"丧偶","value":"丧偶"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.CULTURESTANDARD','文化程度','CULTURESTANDARD','IB_PERSON_INFO',9,'6','','','1','1','2','1','','[{"key":"大专以下","value":"大专以下"},{"key":"大专","value":"大专"},{"key":"本科","value":"本科"},{"key":"硕士","value":"硕士"},{"key":"博士","value":"博士"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.GRADUATESCHOOL','毕业学校','GRADUATESCHOOL','IB_PERSON_INFO',10,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.MAJOR','所学专业','MAJOR','IB_PERSON_INFO',11,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.GRADUATEDATE','毕业时间','GRADUATEDATE','IB_PERSON_INFO',12,'3','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.PHONE','联系电话','PHONE','IB_PERSON_INFO',13,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.ADDRESS','家庭住址','ADDRESS','IB_PERSON_INFO',14,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.TEL','家庭电话','TEL','IB_PERSON_INFO',15,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.HKADR','户口所在地','HKADR','IB_PERSON_INFO',16,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.ZIPCODE','邮政编码','ZIPCODE','IB_PERSON_INFO',17,'5','10','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.ORIGANIZATIONCODE','组织代码','ORIGANIZATIONCODE','IB_PERSON_INFO',18,'1','','','2','2','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.POST','职务','POST','IB_PERSON_INFO',19,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.POSTTITLE','职称','POSTTITLE','IB_PERSON_INFO',20,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.ENTERDATE','入职时间','ENTERDATE','IB_PERSON_INFO',21,'4','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.FULLDATE','转正时间','FULLDATE','IB_PERSON_INFO',22,'4','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.LEAVEDATE','离职时间','LEAVEDATE','IB_PERSON_INFO',23,'4','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.CONTRACTTYPE','合同类型ID','CONTRACTTYPE','IB_PERSON_INFO',24,'1','','','2','2','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.TREATMENT','待遇','TREATMENT','IB_PERSON_INFO',25,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.ORIGINALWORKUNIT','原工作单位','ORIGINALWORKUNIT','IB_PERSON_INFO',26,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.BONDSMAN','担保人','BONDSMAN','IB_PERSON_INFO',27,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.RESUME','个人简历','RESUME','IB_PERSON_INFO',28,'1','','','2','2','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personInfo','IB_PERSON_INFO.REMARK','备注','REMARK','IB_PERSON_INFO',29,'2','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('6ac66bc3-dd45-4b11-a977-5811c09bee6f','personmannager','IB_PERSON_INFO','人事档案管理','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','JOBNUM','入职编号','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','NAME','姓名','VARCHAR','32','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','GENDER','性别','VARCHAR','8','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','BIRTH','出生日期','DATE','10','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','BIRTHPLACE','出生地','VARCHAR','32','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','POLITICSSTATUS','政治面貌','VARCHAR','32','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','IDCARD','身份证号','VARCHAR','18','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','MARITALSTATUS','婚姻状况','VARCHAR','32','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','CULTURESTANDARD','文化程度','VARCHAR','32','是','',9);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','GRADUATESCHOOL','毕业学校','VARCHAR','32','是','',10);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','MAJOR','所学专业','VARCHAR','32','是','',11);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','GRADUATEDATE','毕业时间','DATE','10','是','',12);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','PHONE','联系电话','VARCHAR','32','是','',13);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','ADDRESS','家庭住址','VARCHAR','32','是','',14);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','TEL','家庭电话','VARCHAR','32','是','',15);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','HKADR','户口所在地','VARCHAR','32','是','',16);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','ZIPCODE','邮政编码','NUMBER','10','是','',17);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','ORIGANIZATIONCODE','组织代码','VARCHAR','32','是','',18);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','POST','职务','VARCHAR','32','是','',19);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','POSTTITLE','职称','VARCHAR','32','是','',20);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','ENTERDATE','入职时间','DATE','10','是','',21);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','FULLDATE','转正时间','DATE','10','是','',22);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','LEAVEDATE','离职时间','DATE','10','是','',23);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','CONTRACTTYPE','合同类型ID','VARCHAR','32','是','',24);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','TREATMENT','待遇','NUMBER','20','是','',25);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','ORIGINALWORKUNIT','原工作单位','VARCHAR','32','是','',26);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','BONDSMAN','担保人','VARCHAR','32','是','',27);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','RESUME','个人简历','VARCHAR','32','是','',28);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','REMARK','备注','VARCHAR','32','是','',29);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_INFO','SCOPEID','范围','VARCHAR','64','否','',92);

/* ================================================================================   */
/* ========================= 人员就职管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('0daf3618-ac45-477c-92a9-60f368950252','personmannager','personWork','人员就职表','/person_job_info/person_job_info-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','personWork','IB_PERSON_JOB_INFO','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.NAME','人事档案ID(姓名)','NAME','IB_PERSON_JOB_INFO',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.DEPARTMENT','所属部门','DEPARTMENT','IB_PERSON_JOB_INFO',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.POST','职务','POST','IB_PERSON_JOB_INFO',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.POSTTITLE','职称','POSTTITLE','IB_PERSON_JOB_INFO',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.OBTAINDATE','取得职称时间','OBTAINDATE','IB_PERSON_JOB_INFO',5,'3','10','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.IDENTITY','身份','IDENTITY','IB_PERSON_JOB_INFO',6,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.ADMINLEVEL','行政级别','ADMINLEVEL','IB_PERSON_JOB_INFO',7,'6','','','1','1','2','1','','[{"key":"一级","value":"一级"},{"key":"二级","value":"二级"},{"key":"三级","value":"三级"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.SALARYSTANDARD','工资标准','SALARYSTANDARD','IB_PERSON_JOB_INFO',8,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.ENTERDATE','就职时间','ENTERDATE','IB_PERSON_JOB_INFO',9,'3','10','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personWork','IB_JOB_INFO.REMARK','备注','REMARK','IB_PERSON_JOB_INFO',10,'1','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('c26d3b66-3d31-43d3-9827-ec6d9afb503d','personmannager','IB_PERSON_JOB_INFO','人员就职','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','NAME','人事档案ID(姓名)','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','DEPARTMENT','所属部门','VARCHAR','32','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','POST','职务','VARCHAR','32','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','POSTTITLE','职称','VARCHAR','32','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','OBTAINDATE','取得职称时间','DATE','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','IDENTITY','身份','VARCHAR','32','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','ADMINLEVEL','行政级别','VARCHAR','32','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','SALARYSTANDARD','工资标准','NUMBER','20','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','ENTERDATE','就职时间','DATE','10','是','',9);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','REMARK','备注','VARCHAR','32','是','',10);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_JOB_INFO','SCOPEID','范围','VARCHAR','64','否','',92);
/* ================================================================================   */
/* ========================= 人员离职管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('a8dac583-2e0c-42fb-a3d1-83fa2e20992a','personmannager','personLeave','员工离职','/person_leave/person_leave-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','personLeave','IB_PERSON_LEAVE','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.NAME','人事档案ID(姓名)','NAME','IB_PERSON_LEAVE',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.LEAVESORT','离退类别','LEAVESORT','IB_PERSON_LEAVE',2,'6','','','1','1','2','1','','[{"key":"正常退休","value":"正常退休"},{"key":"因病退休","value":"因病退休"},{"key":"提前退休","value":"提前退休"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.LEAVESTATE','离职状态','LEAVESTATE','IB_PERSON_LEAVE',3,'6','','','1','1','2','1','','[{"key":"已离职","value":"已离职"},{"key":"未离职","value":"未离职"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.LEAVESECTION','离退部门','LEAVESECTION','IB_PERSON_LEAVE',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.LEAVEJOB','离退职位','LEAVEJOB','IB_PERSON_LEAVE',5,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.LEAVEDATE','离退时间','LEAVEDATE','IB_PERSON_LEAVE',6,'3','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.STOPDATE','停薪时间','STOPDATE','IB_PERSON_LEAVE',7,'3','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personLeave','IB_PERSON_LEAVE.REMARK','离职说明','REMARK','IB_PERSON_LEAVE',8,'2','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('928c280f-5af2-4ed6-b32c-6a0107581ead','personmannager','IB_PERSON_LEAVE','员工离职','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','NAME','人事档案ID(姓名)','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','LEAVESORT','离退类别','VARCHAR','32','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','LEAVESTATE','离职状态','VARCHAR','32','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','LEAVESECTION','离退部门','VARCHAR','32','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','LEAVEJOB','离退职位','VARCHAR','32','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','LEAVEDATE','离退时间','DATE','10','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','STOPDATE','停薪时间','DATE','10','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','REMARK','离职说明','VARCHAR','32','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_LEAVE','SCOPEID','范围','VARCHAR','64','否','',92);
/* ================================================================================   */
/* ========================= 人员调动管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('d50a2514-1adb-48cf-bfd1-663e0a28984d','personmannager','personMove','人员调动表','/person_move/person_move-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','personMove','IB_PERSON_MOVE','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.NAME','人事档案ID(姓名)','NAME','IB_PERSON_MOVE',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.CATEGORY','移动类别','CATEGORY','IB_PERSON_MOVE',2,'6','','','1','1','2','1','','[{"key":"部门内调","value":"部门内调"},{"key":"部门外调","value":"部门外调"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.BEFORESECTION','调前部门','BEFORESECTION','IB_PERSON_MOVE',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.NOWSECTION','调后部门','NOWSECTION','IB_PERSON_MOVE',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.BEFOREJOB','调前职务','BEFOREJOB','IB_PERSON_MOVE',5,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.NOWJOB','调后职务','NOWJOB','IB_PERSON_MOVE',6,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.OLDSTANDARD','原工资标准','OLDSTANDARD','IB_PERSON_MOVE',7,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.NEWSTANDARD','现工资标准','NEWSTANDARD','IB_PERSON_MOVE',8,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.MOVEDATE','调动日期','MOVEDATE','IB_PERSON_MOVE',9,'3','10','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personMove','IB_PERSON_MOVE.REMARK','备注','REMARK','IB_PERSON_MOVE',10,'1','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('368192da-2716-49e9-86c4-d0d1cafc5a63','personmannager','IB_PERSON_MOVE','人员调动','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','NAME','人事档案ID(姓名)','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','CATEGORY','移动类别','VARCHAR','32','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','BEFORESECTION','调前部门','VARCHAR','32','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','NOWSECTION','调后部门','VARCHAR','32','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','BEFOREJOB','调前职务','VARCHAR','32','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','NOWJOB','调后职务','VARCHAR','32','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','OLDSTANDARD','原工资标准','NUMBER','20','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','NEWSTANDARD','现工资标准','NUMBER','20','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','MOVEDATE','调动日期','DATE','10','是','',9);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','REMARK','备注','VARCHAR','32','是','',10);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_MOVE','SCOPEID','范围','VARCHAR','64','否','',92);
/* ================================================================================   */
/* ========================= 复职登记管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('bffdab10-baeb-4323-9bc2-9b1475a2c5e7','personmannager','personRemove','复职登记表','/person_remove/person_remove-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','personRemove','IB_PERSON_REMOVE','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personRemove','IB_PERSON_REMOVE.NAME','人事档案ID(姓名)','NAME','IB_PERSON_REMOVE',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personRemove','IB_PERSON_REMOVE.BEFORESECTION','原属部门','BEFORESECTION','IB_PERSON_REMOVE',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personRemove','IB_PERSON_REMOVE.BEFORJOB','原属职务','BEFORJOB','IB_PERSON_REMOVE',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personRemove','IB_PERSON_REMOVE.RESUMEDATE','复职日期','RESUMEDATE','IB_PERSON_REMOVE',4,'3','10','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personRemove','IB_PERSON_REMOVE.SALARYSTANDARD','工资标准','SALARYSTANDARD','IB_PERSON_REMOVE',5,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','personRemove','IB_PERSON_REMOVE.REMARK','备注','REMARK','IB_PERSON_REMOVE',6,'1','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ae6bd990-de66-4dd8-8010-cd9309400e29','personmannager','IB_PERSON_REMOVE','复职登记','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','NAME','人事档案ID(姓名)','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','BEFORESECTION','原属部门','VARCHAR','32','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','BEFORJOB','原属职务','VARCHAR','32','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','RESUMEDATE','复职日期','DATE','10','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','SALARYSTANDARD','工资标准','NUMBER','20','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','REMARK','备注','VARCHAR','128','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_PERSON_REMOVE','SCOPEID','范围','VARCHAR','64','否','',92);
/* ================================================================================   */
/* ========================= 奖惩记录管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('2748af9f-af02-4bf1-ade4-f3ba7b18f1c9','personmannager','rewardAndPunishments','奖惩记录','/rewards_punishments/rewards_punishments-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.NAME','人事档案ID(姓名)','NAME','IB_REWARDS_PUNISHMENTS',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.DATE','奖惩日期','DATE','IB_REWARDS_PUNISHMENTS',2,'3','10','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.TYPE','奖惩类别','TYPE','IB_REWARDS_PUNISHMENTS',3,'6','','','1','1','2','1','','[{"key":"奖励","value":"奖励"},{"key":"惩罚","value":"惩罚"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.NUM','次数','NUM','IB_REWARDS_PUNISHMENTS',4,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.SALARY','工资奖罚','SALARY','IB_REWARDS_PUNISHMENTS',5,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.ASSESS','考核奖罚','ASSESS','IB_REWARDS_PUNISHMENTS',6,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.MOTIONMAN','提案人','MOTIONMAN','IB_REWARDS_PUNISHMENTS',7,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','rewardAndPunishments','IB_REWARDS_PUNISHMENTS.REMARK','具体说明','REMARK','IB_REWARDS_PUNISHMENTS',8,'1','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('e3fcd6bc-9e34-42b5-8388-df160f4bb5c7','personmannager','IB_REWARDS_PUNISHMENTS','奖惩记录','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','NAME','人事档案ID(姓名)','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','DATE','奖惩日期','DATE','10','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','TYPE','奖惩类别','VARCHAR','32','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','NUM','次数','NUMBER','20','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','SALARY','工资奖罚','NUMBER','20','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','ASSESS','考核奖罚','NUMBER','20','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','MOTIONMAN','提案人','VARCHAR','32','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','REMARK','具体说明','VARCHAR','32','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_REWARDS_PUNISHMENTS','SCOPEID','范围','VARCHAR','64','否','',92);
/* ================================================================================   */
/* ========================= 工资录入管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('afe7aa8a-27ac-4c66-96e7-e9adb0ebbfb6','personmannager','salaryEnter','工资录入','/salary_enter/salary_enter-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','salaryEnter','IB_SALARY_ENTER','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.NAME','人事档案ID(姓名)','NAME','IB_SALARY_ENTER',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.TIME','年月','TIME','IB_SALARY_ENTER',2,'3','10','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.BASICSALARY','基本工资','BASICSALARY','IB_SALARY_ENTER',3,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.POSTSALARY','岗位工资','POSTSALARY','IB_SALARY_ENTER',4,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.YEARSSALARY','工龄工资','YEARSSALARY','IB_SALARY_ENTER',5,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.PERFORMANCESALARY','绩效工资','PERFORMANCESALARY','IB_SALARY_ENTER',6,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.AWARDSALARY','奖励工资','AWARDSALARY','IB_SALARY_ENTER',7,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.OUTWORKSALARY','出勤工资','OUTWORKSALARY','IB_SALARY_ENTER',8,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.COUNTSSALARY','全勤工资','COUNTSSALARY','IB_SALARY_ENTER',9,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.FINALAMOUNTS','应发小计','FINALAMOUNTS','IB_SALARY_ENTER',10,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.DEDUCTSALARY','扣罚工资','DEDUCTSALARY','IB_SALARY_ENTER',11,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.PREMIUM','保险费','PREMIUM','IB_SALARY_ENTER',12,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.INCOMETAX','所得税','INCOMETAX','IB_SALARY_ENTER',13,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.DEDUCTAMOUNTS','应扣小计','DEDUCTAMOUNTS','IB_SALARY_ENTER',14,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','salaryEnter','IB_SALARY_ENTER.ACTUALSALARY','实发工资','ACTUALSALARY','IB_SALARY_ENTER',15,'5','20','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('b9a2188f-4498-448f-bc61-13570d6117b1','personmannager','IB_SALARY_ENTER','工资录入','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','NAME','人事档案ID(姓名)','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','TIME','年月','DATE','10','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','BASICSALARY','基本工资','NUMBER','20','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','POSTSALARY','岗位工资','NUMBER','20','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','YEARSSALARY','工龄工资','NUMBER','20','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','PERFORMANCESALARY','绩效工资','NUMBER','20','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','AWARDSALARY','奖励工资','NUMBER','20','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','OUTWORKSALARY','出勤工资','NUMBER','20','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','COUNTSSALARY','全勤工资','NUMBER','20','是','',9);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','FINALAMOUNTS','应发小计','NUMBER','20','是','',10);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','DEDUCTSALARY','扣罚工资','NUMBER','20','是','',11);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','PREMIUM','保险费','NUMBER','20','是','',12);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','INCOMETAX','所得税','NUMBER','20','是','',13);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','DEDUCTAMOUNTS','应扣小计','NUMBER','20','是','',14);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','ACTUALSALARY','实发工资','NUMBER','20','是','',15);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_SALARY_ENTER','SCOPEID','范围','VARCHAR','64','否','',92);
/* ================================================================================   */
/* ========================= 考核记录管理 =================================  */
/* ================================================================================   */
/*======= 表单 ==========*/
insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('3adea23e-e75f-46c2-afeb-e5eacf6b776e','personmannager','assessRecord','考核记录','/assess_record/assess_record-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('personmannager','assessRecord','IB_ASSESS_RECORD','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.NAME','人事档案ID(姓名)','NAME','IB_ASSESS_RECORD',1,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.CHECKTIME','考核时间','CHECKTIME','IB_ASSESS_RECORD',2,'3','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.JOB','职务','JOB','IB_ASSESS_RECORD',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.CHECKPROJECT','考核项目','CHECKPROJECT','IB_ASSESS_RECORD',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.CHECKRANK','考核等级','CHECKRANK','IB_ASSESS_RECORD',5,'6','','','1','1','2','1','','[{"key":"一级","value":"一级"},{"key":"二级","value":"二级"},{"key":"三级","value":"三级"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.CHECKSCORE','考核分值','CHECKSCORE','IB_ASSESS_RECORD',6,'5','20','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.CHECKASSESS','考核评价','CHECKASSESS','IB_ASSESS_RECORD',7,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('personmannager','assessRecord','IB_ASSESS_RECORD.CHECKER','考核人员','CHECKER','IB_ASSESS_RECORD',8,'1','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('f2376f1a-ae89-48ff-9444-34dd022e22c1','personmannager','IB_ASSESS_RECORD','考核记录','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','NAME','人事档案ID(姓名)','VARCHAR','32','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','CHECKTIME','考核时间','DATE','10','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','JOB','职务','VARCHAR','32','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','CHECKPROJECT','考核项目','VARCHAR','32','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','CHECKRANK','考核等级','VARCHAR','32','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','CHECKSCORE','考核分值','NUMBER','20','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','CHECKASSESS','考核评价','VARCHAR','32','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','CHECKER','考核人员','VARCHAR','32','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ASSESS_RECORD','SCOPEID','范围','VARCHAR','64','否','',92);
