package com.crm.pojo;

public class Customer {
	private String customer_no;//客户编号
	private String customer_name;//客户名字
	private String customer_academic;//学历
	private String customer_region;//所属地区
	private String customer_post;//邮政编码
	private String customer_address;//地址
	private String customer_phone;//电话
	private String customer_source;//来源渠道
	private String customer_create_time;//创建时间
	private String customer_qq;//
	private String customer_course;//课程方向
	private String customer_onevisit_time;//首次回访时间
	private String customer_ingate_time;//上门时间
	private Integer customer_id;//主键
	private Integer customer_age;//年龄
	private Integer customer_sex;//性别
	private Integer customer_level;//等级
	private Integer customer_status;//状态
	private Integer customer_visit;//是否访问
	private Integer customer_ingate;//是否上门
	private Integer user_id;//用户编号
	private Integer userw_id;//网络咨询师编号
	public Integer getUserw_id() {
		return userw_id;
	}
	public void setUserw_id(Integer userw_id) {
		this.userw_id = userw_id;
	}
	private User user;
	
	private Integer customer_dmoney;//定金金额
	private String customer_dtime;//定金时间
	private String customer_jiaofei;//是否缴费
	private String customer_jiaotime;//缴费时间
	private Integer customer_jiaomoney;//缴费金额
	private Integer customer_istui;//是否退费
	private String customer_tuicause;//退费原因
	private Integer customer_isjinban;//是否进班
	private String customer_jinbantime;//进班时间
	private String customer_jinbanremark;//进班备注
	private String customer_zixunremark;//咨询师备注
	public Integer getCustomer_dmoney() {
		return customer_dmoney;
	}
	public void setCustomer_dmoney(Integer customer_dmoney) {
		this.customer_dmoney = customer_dmoney;
	}
	public String getCustomer_dtime() {
		return customer_dtime;
	}
	public void setCustomer_dtime(String customer_dtime) {
		this.customer_dtime = customer_dtime;
	}
	public String getCustomer_jiaofei() {
		return customer_jiaofei;
	}
	public void setCustomer_jiaofei(String customer_jiaofei) {
		this.customer_jiaofei = customer_jiaofei;
	}
	public String getCustomer_jiaotime() {
		return customer_jiaotime;
	}
	public void setCustomer_jiaotime(String customer_jiaotime) {
		this.customer_jiaotime = customer_jiaotime;
	}
	public Integer getCustomer_jiaomoney() {
		return customer_jiaomoney;
	}
	public void setCustomer_jiaomoney(Integer customer_jiaomoney) {
		this.customer_jiaomoney = customer_jiaomoney;
	}
	public Integer getCustomer_istui() {
		return customer_istui;
	}
	public void setCustomer_istui(Integer customer_istui) {
		this.customer_istui = customer_istui;
	}
	public String getCustomer_tuicause() {
		return customer_tuicause;
	}
	public void setCustomer_tuicause(String customer_tuicause) {
		this.customer_tuicause = customer_tuicause;
	}
	public Integer getCustomer_isjinban() {
		return customer_isjinban;
	}
	public void setCustomer_isjinban(Integer customer_isjinban) {
		this.customer_isjinban = customer_isjinban;
	}
	public String getCustomer_jinbantime() {
		return customer_jinbantime;
	}
	public void setCustomer_jinbantime(String customer_jinbantime) {
		this.customer_jinbantime = customer_jinbantime;
	}
	public String getCustomer_jinbanremark() {
		return customer_jinbanremark;
	}
	public void setCustomer_jinbanremark(String customer_jinbanremark) {
		this.customer_jinbanremark = customer_jinbanremark;
	}
	public String getCustomer_zixunremark() {
		return customer_zixunremark;
	}
	public void setCustomer_zixunremark(String customer_zixunremark) {
		this.customer_zixunremark = customer_zixunremark;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_academic() {
		return customer_academic;
	}
	public void setCustomer_academic(String customer_academic) {
		this.customer_academic = customer_academic;
	}
	public String getCustomer_region() {
		return customer_region;
	}
	public void setCustomer_region(String customer_region) {
		this.customer_region = customer_region;
	}
	public String getCustomer_post() {
		return customer_post;
	}
	public void setCustomer_post(String customer_post) {
		this.customer_post = customer_post;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_source() {
		return customer_source;
	}
	public void setCustomer_source(String customer_source) {
		this.customer_source = customer_source;
	}
	public String getCustomer_create_time() {
		return customer_create_time;
	}
	public void setCustomer_create_time(String customer_create_time) {
		this.customer_create_time = customer_create_time;
	}
	public String getCustomer_qq() {
		return customer_qq;
	}
	public void setCustomer_qq(String customer_qq) {
		this.customer_qq = customer_qq;
	}
	public String getCustomer_course() {
		return customer_course;
	}
	public void setCustomer_course(String customer_course) {
		this.customer_course = customer_course;
	}
	public String getCustomer_onevisit_time() {
		return customer_onevisit_time;
	}
	public void setCustomer_onevisit_time(String customer_onevisit_time) {
		this.customer_onevisit_time = customer_onevisit_time;
	}
	public String getCustomer_ingate_time() {
		return customer_ingate_time;
	}
	public void setCustomer_ingate_time(String customer_ingate_time) {
		this.customer_ingate_time = customer_ingate_time;
	}
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	public Integer getCustomer_age() {
		return customer_age;
	}
	public void setCustomer_age(Integer customer_age) {
		this.customer_age = customer_age;
	}
	public Integer getCustomer_sex() {
		return customer_sex;
	}
	public void setCustomer_sex(Integer customer_sex) {
		this.customer_sex = customer_sex;
	}
	public Integer getCustomer_level() {
		return customer_level;
	}
	public void setCustomer_level(Integer customer_level) {
		this.customer_level = customer_level;
	}
	public Integer getCustomer_status() {
		return customer_status;
	}
	public void setCustomer_status(Integer customer_status) {
		this.customer_status = customer_status;
	}
	public Integer getCustomer_visit() {
		return customer_visit;
	}
	public void setCustomer_visit(Integer customer_visit) {
		this.customer_visit = customer_visit;
	}
	public Integer getCustomer_ingate() {
		return customer_ingate;
	}
	public void setCustomer_ingate(Integer customer_ingate) {
		this.customer_ingate = customer_ingate;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Customer [customer_no=" + customer_no + ", customer_name=" + customer_name + ", customer_academic="
				+ customer_academic + ", customer_region=" + customer_region + ", customer_post=" + customer_post
				+ ", customer_address=" + customer_address + ", customer_phone=" + customer_phone + ", customer_source="
				+ customer_source + ", customer_create_time=" + customer_create_time + ", customer_qq=" + customer_qq
				+ ", customer_course=" + customer_course + ", customer_onevisit_time=" + customer_onevisit_time
				+ ", customer_ingate_time=" + customer_ingate_time + ", customer_id=" + customer_id + ", customer_age="
				+ customer_age + ", customer_sex=" + customer_sex + ", customer_level=" + customer_level
				+ ", customer_status=" + customer_status + ", customer_visit=" + customer_visit + ", customer_ingate="
				+ customer_ingate + ", user_id=" + user_id + ", userw_id=" + userw_id + ", user=" + user
				+ ", customer_dmoney=" + customer_dmoney + ", customer_dtime=" + customer_dtime + ", customer_jiaofei="
				+ customer_jiaofei + ", customer_jiaotime=" + customer_jiaotime + ", customer_jiaomoney="
				+ customer_jiaomoney + ", customer_istui=" + customer_istui + ", customer_tuicause=" + customer_tuicause
				+ ", customer_isjinban=" + customer_isjinban + ", customer_jinbantime=" + customer_jinbantime
				+ ", customer_jinbanremark=" + customer_jinbanremark + ", customer_zixunremark=" + customer_zixunremark
				+ "]";
	}
	

}
