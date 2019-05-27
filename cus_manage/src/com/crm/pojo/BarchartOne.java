package com.crm.pojo;

/**
 * 条形图图一
 * @author dell
 *
 */
public class BarchartOne {
	private String yuefen;	//月份
	private Integer count;	//数量
	public String getYuefen() {
		return yuefen;
	}
	public void setYuefen(String yuefen) {
		this.yuefen = yuefen;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BarchartOne [yuefen=" + yuefen + ", count=" + count + "]";
	}
	
	
	
}
