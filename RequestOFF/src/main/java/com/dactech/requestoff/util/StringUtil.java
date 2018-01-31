package com.dactech.requestoff.util;

public class StringUtil {
	public static boolean isNotEmpty(String str) {
		return str != null && !str.equals(""); 
	}
	
	public static boolean isEmpty(String str) {
		return str == null || str.equals(""); 
	}
}
