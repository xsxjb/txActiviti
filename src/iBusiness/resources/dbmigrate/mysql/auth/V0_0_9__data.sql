/*-------------------------------------------------------------------------------*/
/*--  role def 角色模板管理表 */
/*-------------------------------------------------------------------------------*/
INSERT INTO AUTH_ROLE_DEF(ID,NAME,SCOPE_ID) VALUES(1,'超级管理员','1');
INSERT INTO AUTH_ROLE_DEF(ID,NAME,SCOPE_ID) VALUES(2,'系统管理员','1');
INSERT INTO AUTH_ROLE_DEF(ID,NAME,SCOPE_ID) VALUES(3,'普通用户','1');

/*-------------------------------------------------------------------------------*/
/*--  permission type 授权类型表 */
/*-------------------------------------------------------------------------------*/
INSERT INTO AUTH_PERM_TYPE(ID,NAME,TYPE,PRIORITY,DESCN,SCOPE_ID) VALUES(1,'默认',1,0,NULL,'1');
INSERT INTO AUTH_PERM_TYPE(ID,NAME,TYPE,PRIORITY,DESCN,SCOPE_ID) VALUES(2,'系统',0,1,NULL,'1');
INSERT INTO AUTH_PERM_TYPE(ID,NAME,TYPE,PRIORITY,DESCN,SCOPE_ID) VALUES(7,'菜单',0,10,NULL,'1');
INSERT INTO AUTH_PERM_TYPE(ID,NAME,TYPE,PRIORITY,DESCN,SCOPE_ID) VALUES(3,'用户',0,2,NULL,'1');
INSERT INTO AUTH_PERM_TYPE(ID,NAME,TYPE,PRIORITY,DESCN,SCOPE_ID) VALUES(5,'权限',0,4,NULL,'1');

/*-------------------------------------------------------------------------------*/
/*--  permission 授权管理表  */
/*-------------------------------------------------------------------------------*/
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(1,'*','所有权限',1,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(2,'IS_GUEST','游客',1,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(3,'IS_USER','用户',1,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(4,'IS_LOGINED','登录',1,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(5,'IS_SWITCHED','切换身份',1,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(6,'IS_REMEMBERED','自动登录',1,'1');

INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(21,'util','工具',2,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(22,'userrepo','用户体系',2,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(23,'scope','应用管理',2,'1');

INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(31,'userattr','属性管理',3,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(32,'userinfo','维护用户信息',3,'1');

INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(51,'authconf','权限管理',5,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(52,'role','角色管理',5,'1');
INSERT INTO AUTH_PERM(ID,CODE,NAME,PERM_TYPE_ID,SCOPE_ID) VALUES(53,'userstatus','用户权限',5,'1');

/*-------------------------------------------------------------------------------*/
/*--  permission role def  授权和角色模板关联表   */
/*-------------------------------------------------------------------------------*/
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(1,1);
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(22,2);
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(23,2);
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(31,2);
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(32,2);
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(51,2);
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(52,2);
INSERT INTO AUTH_PERM_ROLE_DEF(PERM_ID,ROLE_DEF_ID) VALUES(53,2);

/*-------------------------------------------------------------------------------*/
/*--  access 资源访问权限表  */
/*-------------------------------------------------------------------------------*/
-- IS_AUTHENTICATED_FULLY
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(1,'URL','/**',3,9999,'1');
-- IS_SWITCHED_USER
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(2,'URL','/common/util/**',5,1,'1');
-- util
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(3,'URL','/common/util/**',21,1,'1');
-- IS_AUTHENTICATED_ANONYMOUSLY
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(4,'URL','/common/**',2,2,'1');
-- IS_SWITCHED_USER
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(5,'URL','/j_spring_security_exit_user',5,3,'1');
-- IS_SWITCHED_USER
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(6,'URL','/j_spring_security_switch_user',5,4,'1');
-- util
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(7,'URL','/j_spring_security_switch_user',21,4,'1');
-- IS_AUTHENTICATED_ANONYMOUSLY
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(8,'URL','/rs/**',2,5,'1');

-- userrepo
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(11,'URL','/user/user-repo*',22,11,'1');
-- scope
INSERT INTO AUTH_ACCESS(ID,TYPE,VALUE,PERM_ID,PRIORITY,SCOPE_ID) VALUES(12,'URL','/scope/**',23,12,'1');

UPDATE AUTH_PERM SET PRIORITY=ID;
