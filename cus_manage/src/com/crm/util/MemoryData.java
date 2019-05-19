package com.crm.util;
/**
 * 内存数据类
 * @author dell
 *
 */

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MemoryData {
	private static Map<String, String> seeesionIdMap=new HashMap<String,String>();

	public static Map<String, String> getSeeesionIdMap() {
		return seeesionIdMap;
	}

	public static void setSeeesionIdMap(Map<String, String> seeesionIdMap) {
		MemoryData.seeesionIdMap = seeesionIdMap;
	}

	@Override
	public String toString() {
		return "MemoryData [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
