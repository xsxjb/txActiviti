
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(1,'vacation','全局','process',1,2,0,2,0,2,2);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(2,'vacation_1','填写请假单','startEvent',1,2,0,2,2,2,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(3,'taskuser-1','填写请假单','userTask',1,0,0,0,0,0,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(4,'taskuser-2','部门领导审批','userTask',1,0,0,0,0,0,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(5,'taskuser-3','人事审批','userTask',1,0,0,0,0,0,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(6,'taskuser-5','调整申请','userTask',1,0,0,0,0,0,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(7,'endnone-2','endnone-2','endEvent',1,2,0,2,2,2,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(8,'taskuser-6','销假','userTask',1,0,0,0,0,0,0);

INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(11,'permission','审批权限','process',3,2,0,2,0,2,2);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(12,'startEvent-1','','startEvent',3,0,0,0,0,0,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(13,'userTask-1','经理审批','userTask',3,0,0,0,0,0,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(14,'userTask-2','模块负责人审批','userTask',3,0,0,0,0,0,0);
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(15,'endEvent-1','','endEvent',3,2,0,2,2,2,0);

INSERT INTO BPM_CONF_NOTICE(id,type,receiver,due_date,node_id,template_id) values(1,0,'任务接收人',null,4,1);
INSERT INTO BPM_CONF_NOTICE(id,type,receiver,due_date,node_id,template_id) values(2,0,'流程发起人',null,5,2);
INSERT INTO BPM_CONF_NOTICE(id,type,receiver,due_date,node_id,template_id) values(3,1,'1',null,8,3);
INSERT INTO BPM_CONF_NOTICE(id,type,receiver,due_date,node_id,template_id) values(4,2,'任务接收人','P1H',8,4);

COMMIT;

UPDATE BPM_CONF_NODE SET priority=1 where ID=1;
UPDATE BPM_CONF_NODE SET priority=2 where ID=2;
UPDATE BPM_CONF_NODE SET priority=3 where ID=3;
UPDATE BPM_CONF_NODE SET priority=4 where ID=4;
UPDATE BPM_CONF_NODE SET priority=5 where ID=5;
UPDATE BPM_CONF_NODE SET priority=6 where ID=6;
UPDATE BPM_CONF_NODE SET priority=7 where ID=7;
UPDATE BPM_CONF_NODE SET priority=8 where ID=8;

UPDATE BPM_CONF_NODE SET priority=1 where ID=11;
UPDATE BPM_CONF_NODE SET priority=2,conf_user=2,conf_rule=2,conf_form=2,conf_operation=2 where ID=12;
UPDATE BPM_CONF_NODE SET priority=3 where ID=13;
UPDATE BPM_CONF_NODE SET priority=4 where ID=14;
UPDATE BPM_CONF_NODE SET priority=5 where ID=15;


UPDATE BPM_CONF_NODE SET code='usertask1',name='发起申请' where id=13;
UPDATE BPM_CONF_NODE SET code='usertask2',name='部门经理审批' where id=14;
UPDATE BPM_CONF_NODE SET code='endevent1' where id=15;
INSERT INTO BPM_CONF_NODE(ID,code,name,type,conf_base_id,conf_user,conf_listener,conf_rule,conf_form,conf_operation,conf_notice) VALUES(16,'usertask3','总经理审批','userTask',3,0,0,0,0,0,0);

INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(1,'保存草稿',3);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(2,'完成任务',3);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(3,'保存草稿',4);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(4,'完成任务',4);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(5,'保存草稿',5);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(6,'完成任务',5);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(7,'保存草稿',6);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(8,'完成任务',6);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(9,'保存草稿',8);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(10,'完成任务',8);

INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(11,'保存草稿',14);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(12,'完成任务',14);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(13,'驳回',14);

INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(14,'保存草稿',16);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(15,'完成任务',16);
INSERT INTO BPM_CONF_OPERATION(id,value,node_id) values(16,'驳回',16);

INSERT INTO BPM_CONF_RULE(id,value,node_id) values(1,'职位',14);



