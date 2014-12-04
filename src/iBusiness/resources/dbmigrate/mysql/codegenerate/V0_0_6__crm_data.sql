/* =============================  IB_CONF_COMPONENT 业务模块组件管理表 ---  商务管理  =============================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('crmmanage10001','crmmanage','商务管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('crmmanage10002','crmmanage','表存储设计器','crmmanage10001','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('crmmanage10003','crmmanage','表单设计器','crmmanage10001','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('crmmanage10004','crmmanage','流程表设计器','crmmanage10001','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('crmmanage10005','crmmanage','流程表单设计器','crmmanage10001','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('crmmanage10006','crmmanage','流程设计器','crmmanage10001','Bpm');

/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('crmmanageOne','商务管理','1','#','URL','6','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('crmmanageTwo1','客户管理','2','#','URL','1','crmmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('crmmanageTwo2','供应商管理','2','#','URL','1','crmmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('crmmanageThree1','客户信息管理','3','/customer_info/customer_info-list.do','URL','1','crmmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('crmmanageThree2','供应商管理','3','/supplier/supplier-list.do','URL','2','crmmanageTwo2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('crmmanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('crmmanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('crmmanageTwo2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('crmmanageThree1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('crmmanageThree2','2');

/* ============================= 业务表管理表 =============================   */
INSERT INTO IB_CONF_TABLE(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,ISBPMTABLE) VALUES('ib_customer_info10001','crmmanage','IB_CUSTOMER_INFO','客户信息表','1',2);
INSERT INTO IB_CONF_TABLE(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,ISBPMTABLE) VALUES('ib_supplier10001','crmmanage','IB_SUPPLIER','原材料供应商维护','1',2);

/* ============================= 表列字段管理表  ============================= */
/* ====== 客户信息表 =====  */
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','ACCOUNTNO','帐号','VARCHAR','32','是','',22);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','BANK','开户行','VARCHAR','64','是','',21);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CITY','市','VARCHAR','16','是','',14);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','COOPERATIONINFO','是否以合作信息表','VARCHAR','2','是','',19);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERADDRESS','客户地址','VARCHAR','512','是','',5);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERDEMAND','客户诉求','VARCHAR','256','是','',18);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERNAME','客户名称','VARCHAR','64','是','',10);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERNATURE','企业性质','VARCHAR','16','是','',15);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERNO','客户编号','VARCHAR','64','是','',1);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERSTATE','客户状态','VARCHAR','16','是','',2);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERTYPE',' 客户类别','VARCHAR',' 32','是','',4);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','CUSTOMERUSER','首选联系人','VARCHAR','32','是','',31);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','ID','UUID主键','VARCHAR','64','否',NULL,91);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INFOSOURCE','信息来源','VARCHAR','16','是','',11);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INVOICADDRESSEE','收件人','VARCHAR','64','是','',29);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INVOICEMAILUNITNAME','发票邮寄单位名称','VARCHAR','64','是','',26);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INVOICENAME','客户发票单位名称','VARCHAR','64','是','',20);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INVOICEUSER','开票联系人','VARCHAR','32','是','',24);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INVOICEUSERTEL','联系电话','VARCHAR','16','是','',25);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INVOICPHONETEL','电话','VARCHAR','16','是','',30);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','INVOICZIP','邮编','VARCHAR','10','是','',28);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','MAILADDRESS','邮寄地址','VARCHAR','128','是','',27);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','PHONE','手机','VARCHAR','32','是','',6);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','PLANINFO','三年内规划描述','VARCHAR','512','是','',17);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','PROVINCE','省','VARCHAR','16','是','',13);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','RELATIONSHIPSTATUS','关系状态','VARCHAR','16','是','',12);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','SALESMANAGER','负责经理','VARCHAR','32','是','',8);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','SUPERVISEUNIT','上级主管单位','VARCHAR','64','是','',16);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','SYSTEMSALES','系统销售','VARCHAR','32','是','',9);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','TAXID','税号','VARCHAR','32','是','',23);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','TELEPHONE','联系电话','VARCHAR','32','是','',7);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','USEREMAIL','邮件','VARCHAR','32','是','',35);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','USEROFFICEADDRESS','办公地址','VARCHAR','64','是','',36);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','USERPHONE','手机','VARCHAR','16','是','',34);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','USERPOSITION','职位','VARCHAR','32','是','',32);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','USERTELEPHONE','固话/传真','VARCHAR','32','是','',33);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_CUSTOMER_INFO','USERZIP','邮编','VARCHAR','10','是','',37);

/* ====== 原材料供应商维护表 =====  */
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','ACCOUNTNO','帐号','VARCHAR','32','是','',28);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','BENEFICIARY','开户行','VARCHAR','128','是','',26);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','BUSINESSCONTACTS','业务联系人','VARCHAR','16','是','',17);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','CATEGORY','类别','VARCHAR','8','是','',3);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','UNITCHARACTER','企业性质','VARCHAR','16','是','',6);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','COMPANYFAX','公司传真','VARCHAR','16','是','',11);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','COMPANYPHONE','公司电话','VARCHAR','16','是','',10);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','CONTACTFAX','联系人传真','VARCHAR','16','是','',20);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','CONTACTMOBILEPHONE','联系人手机','VARCHAR','16','是','',19);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','CONTACTTELEPHONE','联系人电话','VARCHAR','16','是','',18);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','ENROLLTIME','注册时间','VARCHAR','16','是','',8);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','ESTINATIONCITY','目的地城市','VARCHAR','128','是','',35);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','FINANCIALCALL','财务电话','VARCHAR','16','是','',22);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','FINANCIALCONTACTS','财务联系人','VARCHAR','16','是','',21);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','FINANCIALFAX','财务传真','VARCHAR','16','是','',24);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','FINANCIALPHONE','财务手机','VARCHAR','16','是','',23);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','ID','UUID主键','VARCHAR','64','否',NULL,91);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','INFORMATION','填表人','VARCHAR','32','是','',1);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','PRODUCT','供应产品','VARCHAR','32','是','',12);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','REGISTERED','注册资本','VARCHAR','16','是','',7);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','REMITTANCENAME','汇款单位名称','VARCHAR','128','是','',25);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','SUPPLIERNUMBER','供应商编号','VARCHAR','32','是','',2);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','TAXNO','税号','VARCHAR','32','是','',27);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','TELEPHONE','固定电话','VARCHAR','16','是','',33);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','UNITNAME','企业名称','VARCHAR','128','是','',4);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','UPDATAS','上传资料','VARCHAR','256','是','',36);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','URL','网址','VARCHAR','32','是','',9);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','USERADDRESS','企业地址','VARCHAR','128','是','',5);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','USERFAX','负责人传真','VARCHAR','16','是','',16);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','USERMOBILEPHONE','负责人手机','VARCHAR','16','是','',15);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','USERPERSON','企业负责人','VARCHAR','16','是','',13);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','USERPHONE','负责人电话','VARCHAR','16','是','',14);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','YOURADDRESS','收件地址','VARCHAR','128','是','',30);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','YOURCOMPANY','收件公司','VARCHAR','128','是','',29);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','YOURNAME','收件人姓名','VARCHAR','32','是','',31);
INSERT INTO ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) VALUES ('IB_SUPPLIER','YOURPHONE','联系电话','VARCHAR','16','是','',32);

/* ============================= 表单管理表 =============================  */
INSERT INTO ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM,FORMURL) VALUES('customerInfo001','crmmanage','customerInfo','客户信息管理',1,1,1,1,2,'/customer_info/customer_info-list.do');
INSERT INTO ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,ISEDIT,ISADD,ISDELETE,ISQUERY,ISBPMFORM,FORMURL) VALUES('supplierInfo001','crmmanage','supplierInfo','供应商管理',1,1,1,1,2,'/supplier/supplier-list.do');

/* ============================= 表单对应数据表管理表 =============================  */
INSERT INTO ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) VALUES('crmmanage','customerInfo','IB_CUSTOMER_INFO','main');
INSERT INTO ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) VALUES('crmmanage','supplierInfo','IB_SUPPLIER','main');

/* ============================= 表单对应字段管理表 =============================  */
