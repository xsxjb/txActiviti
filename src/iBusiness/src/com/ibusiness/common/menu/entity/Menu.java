package com.ibusiness.common.menu.entity;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *菜单权限表
 * @author 
 */
@Entity
@Table(name = "IB_MENU")
public class Menu implements java.io.Serializable {
	/**
     * serialVersionUID
     */
    private static final long serialVersionUID = 1L;
    private Menu ibMenu;//父菜单
    private String id;//菜单编号
	private String menuName;//菜单名称
	private String menuLevel;//菜单等级
	private String menuUrl;//菜单地址
	private String menuIframe;//菜单地址打开方式
	private String menuOrder;//菜单排序
	// 一个父菜单项目对应多个叶子菜单项目
	private List<Menu> chiledItems = new ArrayList<Menu>();
	// 
    @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentid")
	public Menu getIbMenu() {
		return this.ibMenu;
	}

	public void setIbMenu(Menu ibMenu) {
		this.ibMenu = ibMenu;
	}
	@Id
	@Column(name = "id", nullable = false)
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
	@Column(name = "menuname", nullable = false, length = 50)
	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "menulevel")
	public String getMenuLevel() {
		return this.menuLevel;
	}

	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}
	@Column(name = "menuurl", length = 100)
	public String getMenuUrl() {
		return this.menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	@Column(name = "menuorder")
	public String getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}
	@Column(name = "menuiframe")
	public String getMenuIframe() {
		return menuIframe;
	}
	public void setMenuIframe(String menuIframe) {
		this.menuIframe = menuIframe;
	}
	@OneToMany(mappedBy="ibMenu")
    public List<Menu> getChiledItems() {
        return this.chiledItems;
    }
    public void setChiledItems(List<Menu> chiledItems) {
        this.chiledItems = chiledItems;
    }
}