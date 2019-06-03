package com.crm.pojo;

public class Offline_message {
	private Integer offline_message_id;
	private Integer message_send_user_id;//发送用户id
	private Integer message_receive_user_id;//接收用户id
	private Integer message_receive_state;//接收时状态 0 -- 在线 1--离线
	private Integer message_send_state;//发送时状态 0 -- 在线 1--离线
	private String  message_content;//消息内容
	private String message_receive_time;//接收时间
	private String message_send_time;//发送时间
	@Override
	public String toString() {
		return "Offline_message [offline_message_id=" + offline_message_id + ", message_send_user_id="
				+ message_send_user_id + ", message_receive_user_id=" + message_receive_user_id
				+ ", message_receive_state=" + message_receive_state + ", message_send_state=" + message_send_state
				+ ", message_content=" + message_content + ", message_receive_time=" + message_receive_time
				+ ", message_send_time=" + message_send_time + "]";
	}
	public Integer getOffline_message_id() {
		return offline_message_id;
	}
	public void setOffline_message_id(Integer offline_message_id) {
		this.offline_message_id = offline_message_id;
	}
	public Integer getMessage_send_user_id() {
		return message_send_user_id;
	}
	public void setMessage_send_user_id(Integer message_send_user_id) {
		this.message_send_user_id = message_send_user_id;
	}
	public Integer getMessage_receive_user_id() {
		return message_receive_user_id;
	}
	public void setMessage_receive_user_id(Integer message_receive_user_id) {
		this.message_receive_user_id = message_receive_user_id;
	}
	public Integer getMessage_receive_state() {
		return message_receive_state;
	}
	public void setMessage_receive_state(Integer message_receive_state) {
		this.message_receive_state = message_receive_state;
	}
	public Integer getMessage_send_state() {
		return message_send_state;
	}
	public void setMessage_send_state(Integer message_send_state) {
		this.message_send_state = message_send_state;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_receive_time() {
		return message_receive_time;
	}
	public void setMessage_receive_time(String message_receive_time) {
		this.message_receive_time = message_receive_time;
	}
	public String getMessage_send_time() {
		return message_send_time;
	}
	public void setMessage_send_time(String message_send_time) {
		this.message_send_time = message_send_time;
	}

}
