package com.crm.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TreeNode {
private String id;
	
	private String text;
	
	private String url;
	
	private String state;//value closed,open
	
	private boolean checked; //
	
	private String parentId;
	
	private String iconCls; //图标
	
	private Map attributes = new HashMap();
	
	private List  children;
	

	public String getId() { 
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public  String getParentId() {
		return parentId;
	}

	public void setParentId( String parentId) {
		this.parentId = parentId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List getChildren() {
		return children;
	}

	public void setChildren(List children) {
		this.children = children;
	}

	public Map getAttributes() {
		return attributes;
	}

	public void setAttributes(Map attributes) {
		this.attributes = attributes;
	}

	/**
	 * @return the iconCls
	 */
	public String getIconCls() {
		return iconCls;
	}

	/**
	 * @param iconCls the iconCls to set
	 */
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	@Override
	public String toString() {
		return "TreeNode [id=" + id + ", text=" + text + ", url=" + url + ", state=" + state + ", checked=" + checked
				+ ", parentId=" + parentId + ", iconCls=" + iconCls + ", attributes=" + attributes + ", children="
				+ children + "]";
	}
	
	
}
