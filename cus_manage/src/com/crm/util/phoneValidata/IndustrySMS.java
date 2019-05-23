package com.crm.util.phoneValidata;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.google.gson.Gson;

 

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
	private static String smsContent = "【天长地酒酒业】您的验证码为999999，请于30分钟内正确输入，如非本人操作，请忽略此短信。";
	
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
	public static String execute(){
		String tmpSmsContent = null;
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        map = gson.fromJson(result, map.getClass());
        String respCode=(String) map.get("respCode");
        System.out.println("map的值为:"+respCode);
        return respCode;
	}
}
