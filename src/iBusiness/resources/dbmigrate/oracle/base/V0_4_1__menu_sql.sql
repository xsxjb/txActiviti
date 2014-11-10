
/*==============================================================*/
/*  菜单管理表 */
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_MENU');
END;
/
CREATE TABLE IB_MENU(
        ID VARCHAR2(64),
        MENUNAME VARCHAR2(256),
		MENULEVEL VARCHAR2(16),
		MENUURL VARCHAR2(256),
		MENUIFRAME VARCHAR2(16),
		MENUORDER VARCHAR2(16),
		PARENTID VARCHAR2(64),
		DESKTOPICON  VARCHAR2(8),
		ICONURL  VARCHAR2(128),
        CONSTRAINT PK_IB_MENU PRIMARY KEY(ID)
);

/*==============================================================*/
/*  菜单和角色模板关联表*/
/*==============================================================*/
DECLARE
BEGIN
    drop_table('IB_MENU_ROLE_DEF');
END;
/
CREATE TABLE IB_MENU_ROLE_DEF(
        MENU_ID          VARCHAR2(64) NOT NULL,
        ROLE_DEF_ID   VARCHAR2(64) NULL,
        CONSTRAINT PK_AUTH_PERM_ROLE_DEF PRIMARY KEY(MENU_ID,ROLE_DEF_ID)
);
