package com.crm.pojo;

import java.util.List;

import org.springframework.stereotype.Repository;
@Repository
public class FenYe {
	private Integer page;
	private Integer row;
	private Integer total;
	private List<?> rows;
	private Object object;
	
	//查询条件
	private String cname;//名字
	private String uteacher;//咨询师
	private Integer visit;//是否访问
	private Integer ingate;//是否上门
	private String minTime;
	private String maxTime;//时间区间
	private String record_condition;//回访情况
	private String record_status;//回访方式
	
	public String getRecord_condition() {
		return record_condition;
	}
	public void setRecord_condition(String record_condition) {
		this.record_condition = record_condition;
	}
	public String getRecord_status() {
		return record_status;
	}
	public void setRecord_status(String record_status) {
		this.record_status = record_status;
	}
	private Integer user_id;
	private Integer userw_id;
	public Integer getUserw_id() {
		return userw_id;
	}
	public void setUserw_id(Integer userw_id) {
		this.userw_id = userw_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	private String beginTime;
	private String endTime;
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "FenYe [page=" + page + ", row=" + row + ", total=" + total + ", rows=" + rows + ", object=" + object
				+ ", cname=" + cname + ", uteacher=" + uteacher + ", visit=" + visit + ", ingate=" + ingate
				+ ", minTime=" + minTime + ", maxTime=" + maxTime + ", record_condition=" + record_condition
				+ ", record_status=" + record_status + ", user_id=" + user_id + ", beginTime=" + beginTime
				+ ", endTime=" + endTime + "]";
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getUteacher() {
		return uteacher;
	}
	public void setUteacher(String uteacher) {
		this.uteacher = uteacher;
	}
	public Integer getVisit() {
		return visit;
	}
	public void setVisit(Integer visit) {
		this.visit = visit;
	}
	public Integer getIngate() {
		return ingate;
	}
	public void setIngate(Integer ingate) {
		this.ingate = ingate;
	}
	public String getMinTime() {
		return minTime;
	}
	public void setMinTime(String minTime) {
		this.minTime = minTime;
	}
	public String getMaxTime() {
		return maxTime;
	}
	public void setMaxTime(String maxTime) {
		this.maxTime = maxTime;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRow() {
		return row;
	}
	public void setRow(Integer row) {
		this.row = row;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	
}
