package com.aaa.utils;

public class StringUtils {
	//检索是否为未定义的字符串或者是空字符串
	public static boolean isNotEmpty(String str){
		if(str==null||str.equals("")){
			return false;
		}else{
			return true;
		}
	}
}
