package com.crm.util.phoneValidata;



import java.net.URLEncoder;

import org.springframework.stereotype.Component;

 

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
@Component
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	
	private static String to = "13838639591";
	private static String smsContent = "您的验证码为{1}，请于{2}分钟内正确输入，如非本人操作，请忽略此短信。";
	
	public static String getTo() {
		return to;
	}

	public static void setTo(String to) {
		IndustrySMS.to = to;
	}

	public static String getSmsContent() {
		return smsContent;
	}

	public static void setSmsContent(String smsContent) {
		IndustrySMS.smsContent = smsContent;
	}

	/**
	 * 验证码通知短信
	 */
	public static void execute(){
		String tmpSmsContent = null;
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + Config.ACCOUNT_SID + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + System.getProperty("line.separator")+ result);
	}
}