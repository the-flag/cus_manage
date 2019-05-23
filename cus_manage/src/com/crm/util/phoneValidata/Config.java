package com.crm.util.phoneValidata;

import org.springframework.stereotype.Component;

/**
 * 系统常量
 */
@Component
public class Config
{
	/**
	 * url前半部分
	 */
	public static final String BASE_URL = "https://api.miaodiyun.com";

	/**
	 * 开发者注册后系统自动生成的账号，可在官网登录后查看
	 */
	public static final String ACCOUNT_SID = "b90457e83e15401bbf600b20add8e825";

	/**
	 * 开发者注册后系统自动生成的TOKEN，可在官网登录后查看
	 */
	public static final String AUTH_TOKEN = "d73eeea0a5664c1fb29012a498c7d6cd";

	/**
	 * 响应数据类型, JSON或XML
	 */
	public static final String RESP_DATA_TYPE = "JSON";
}