package com.crm.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class EasyUITreeJson {
	private Integer id;						//节点ID，对加载远程数据很重要。
	private String text;					//显示节点文本。
	private String url;
	private String state;					//节点状态，'open' 或 'closed'，默认：'open'。如果为'closed'的时候，将不自动展开该节点。
	private Boolean checked;				//表示该节点是否被选中。
	private Integer parentId;
	private String iconCls; //图标
	private Map attributes = new HashMap();
	private List<EasyUITreeJson> children;	//一个节点数组声明了若干节点。
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public Map getAttributes() {
		return attributes;
	}
	public void setAttributes(Map attributes) {
		this.attributes = attributes;
	}
	public List<EasyUITreeJson> getChildren() {
		return children;
	}
	public void setChildren(List<EasyUITreeJson> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "EasyUITreeJson [id=" + id + ", text=" + text + ", url=" + url + ", state=" + state + ", checked="
				+ checked + ", parentId=" + parentId + ", iconCls=" + iconCls + ", attributes=" + attributes
				+ ", children=" + children + "]";
	}
	
	
	
	
}
