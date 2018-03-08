package com.dactech.requestoff.util;

import java.text.Normalizer;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class StringUtil {
	public static boolean isNotEmpty(String str) {
		return str != null && !str.equals("");
	}

	public static boolean isEmpty(String str) {
		return str == null || str.equals("");
	}

	// function compare 2 Vietmamese name
	// ignore accent and white space
	public static boolean compareName(String name1, String name2) {
		name1 = removeAccent(name1);
		name2 = removeAccent(name2);
		return name1.equals(name2);
	}

	// function remove accent, white space, _ for name comparing function
	public static String removeAccent(String s) {
		String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		String returnStr = pattern.matcher(temp).replaceAll("");
		returnStr = returnStr.toLowerCase().replace("\t", "").replace("\n", "").replace(" ", "").replace("_", "").replace(".", "");
		System.out.println(returnStr);
		return returnStr;
	}
	
	// function standardize the name (remove redundant white space)
	public static String standardizeName(String name) {
		StringTokenizer tokenizer = new StringTokenizer(name, " \t-_");
		StringBuilder standardizedName = new StringBuilder();
		if (tokenizer.countTokens() > 0) {
			standardizedName.append(tokenizer.nextToken());
			while (tokenizer.hasMoreTokens()) {
				standardizedName.append(' ');
				standardizedName.append(tokenizer.nextToken());
			}
		}
		return standardizedName.toString();
	}
}
