/* ===================== 菜单配置 ======================= */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('operationmanage-ib_conf_plcdraw-Three13','工艺图-绘图配置','3','/drawConf/drawConf-list.do','URL','3','operationmanageTwo1');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('operationmanage-ib_conf_plcdraw-Three13','2');

/* ===================== 插入默认数据 ======================= */
insert into ib_conf_plcdraw(ID,ITEMID,ITEMNAME,ITEMTYPE,ITEMTITLE,IMGHURL,IMGVURL,REMARK) values ('plcdraw_cyclepump00001','10001','循环泵','CyclePump','#循环泵','xhb1-h-0.png','xhb1-v-0.png','');
