

INSERT INTO USER_REPO(ID,CODE,NAME,REF,SCOPE_ID) VALUES(1,'default','默认','1','1');


INSERT INTO USER_SCHEMA(ID,CODE,NAME,TYPE,USER_REPO_ID) VALUES(1,'email','电子邮箱','string',1);
INSERT INTO USER_SCHEMA(ID,CODE,NAME,TYPE,USER_REPO_ID) VALUES(2,'phone','电话','string',1);


INSERT INTO USER_BASE(ID,USERNAME,PASSWORD,DISPLAY_NAME,STATUS,REF,USER_REPO_ID,SCOPE_ID,JOB_INFO_ID,CSS,ROLE_DEF_ID) VALUES(1,'root','a1ccdbc7f295e0aeda5dc4e0f2677ea3','管理员',1,1,1,'1',1,'Cerulean',2);
INSERT INTO USER_BASE(ID,USERNAME,PASSWORD,DISPLAY_NAME,STATUS,REF,USER_REPO_ID,SCOPE_ID,JOB_INFO_ID,CSS,ROLE_DEF_ID) VALUES(2,'admin','a1ccdbc7f295e0aeda5dc4e0f2677ea3','系统管理员',1,2,1,'1',1,'Cerulean',2);
INSERT INTO USER_BASE(ID,USERNAME,PASSWORD,DISPLAY_NAME,STATUS,REF,USER_REPO_ID,SCOPE_ID,JOB_INFO_ID,CSS,ROLE_DEF_ID) VALUES(3,'cuitianyu','a1ccdbc7f295e0aeda5dc4e0f2677ea3','催天宇',1,3,1,'1',1,'Cerulean',2);
INSERT INTO USER_BASE(ID,USERNAME,PASSWORD,DISPLAY_NAME,STATUS,REF,USER_REPO_ID,SCOPE_ID,JOB_INFO_ID,CSS,ROLE_DEF_ID) VALUES(4,'jiangbo','a1ccdbc7f295e0aeda5dc4e0f2677ea3','姜博',1,4,1,'1',2,'Cerulean',2);
INSERT INTO USER_BASE(ID,USERNAME,PASSWORD,DISPLAY_NAME,STATUS,REF,USER_REPO_ID,SCOPE_ID,JOB_INFO_ID,CSS,ROLE_DEF_ID) VALUES(5,'yanlei','a1ccdbc7f295e0aeda5dc4e0f2677ea3','严磊',1,5,1,'1',2,'Cerulean',2);
INSERT INTO USER_BASE(ID,USERNAME,PASSWORD,DISPLAY_NAME,STATUS,REF,USER_REPO_ID,SCOPE_ID,JOB_INFO_ID,CSS,ROLE_DEF_ID) VALUES(6,'zhanyingda','a1ccdbc7f295e0aeda5dc4e0f2677ea3','詹应答',1,6,1,'1',2,'Cerulean',2);
INSERT INTO USER_BASE(ID,USERNAME,PASSWORD,DISPLAY_NAME,STATUS,REF,USER_REPO_ID,SCOPE_ID,JOB_INFO_ID,CSS,ROLE_DEF_ID) VALUES(7,'linzhao','a1ccdbc7f295e0aeda5dc4e0f2677ea3','林钊',1,7,1,'1',2,'Cerulean',2);

INSERT INTO USER_ATTR(ID,STRING_VALUE,USER_BASE_ID,USER_SCHEMA_ID) VALUES(1,'root.ibusiness@gmail.com',1,1);
INSERT INTO USER_ATTR(ID,STRING_VALUE,USER_BASE_ID,USER_SCHEMA_ID) VALUES(2,'12345678901',1,2);

UPDATE USER_BASE set email='root.ibusiness@gmail.com' where id=1;
UPDATE USER_BASE set email='admin.ibusiness@gmail.com' where id=2;
UPDATE USER_BASE set email='demo.ibusiness@gmail.com' where id=3;
UPDATE USER_BASE set email='demo.ibusiness@gmail.com' where id=4;
UPDATE USER_BASE set email='demo.ibusiness@gmail.com' where id=5;
UPDATE USER_BASE set email='demo.ibusiness@gmail.com' where id=6;
UPDATE USER_BASE set email='demo.ibusiness@gmail.com' where id=7;

UPDATE USER_BASE set mobile='18012345678';

delete from USER_ATTR;

delete from USER_SCHEMA;
