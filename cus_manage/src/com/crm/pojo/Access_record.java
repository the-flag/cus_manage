package com.crm.pojo;
//���ٱ�--kong
public class Access_record {
	
	private Integer record_id;//���ٱ��
	private String  record_time;//��̸����
	private String record_content;//��̸������
	private String record_address;//��̸��ַ
	
	private Integer user_id;//��ѯʦ���
	private Integer customer_id;//�ͻ����
	
	
	private User user;//����ǽ�ɫ
	
	private Customer customer;//����ǿͻ�
	
	
	private String record_endtime;//����ʱ��
	private String record_condition;//�ط����
	private String record_lasttime;//�´θ���ʱ��
	private String record_status;//�ط÷�ʽ
	private String record_remark;//��ע
	
	

	public Integer getRecord_id() {
		return record_id;
	}

	public void setRecord_id(Integer record_id) {
		this.record_id = record_id;
	}

	public String getRecord_time() {
		return record_time;
	}

	public void setRecord_time(String record_time) {
		this.record_time = record_time;
	}

	public String getRecord_content() {
		return record_content;
	}

	public void setRecord_content(String record_content) {
		this.record_content = record_content;
	}

	public String getRecord_address() {
		return record_address;
	}

	public void setRecord_address(String record_address) {
		this.record_address = record_address;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getRecord_endtime() {
		return record_endtime;
	}

	public void setRecord_endtime(String record_endtime) {
		this.record_endtime = record_endtime;
	}

	public String getRecord_condition() {
		return record_condition;
	}

	public void setRecord_condition(String record_condition) {
		this.record_condition = record_condition;
	}

	public String getRecord_lasttime() {
		return record_lasttime;
	}

	public void setRecord_lasttime(String record_lasttime) {
		this.record_lasttime = record_lasttime;
	}

	public String getRecord_status() {
		return record_status;
	}

	public void setRecord_status(String record_status) {
		this.record_status = record_status;
	}

	public String getRecord_remark() {
		return record_remark;
	}

	public void setRecord_remark(String record_remark) {
		this.record_remark = record_remark;
	}

	@Override
	public String toString() {
		return "Access_record [record_id=" + record_id + ", record_time=" + record_time + ", record_content="
				+ record_content + ", record_address=" + record_address + ", user_id=" + user_id + ", customer_id="
				+ customer_id + ", user=" + user + ", customer=" + customer + ", record_endtime=" + record_endtime
				+ ", record_condition=" + record_condition + ", record_lasttime=" + record_lasttime + ", record_status="
				+ record_status + ", record_remark=" + record_remark + "]";
	}
	
	
	

}
