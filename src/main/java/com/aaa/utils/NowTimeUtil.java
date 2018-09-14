package com.aaa.utils;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NowTimeUtil {

	public static String newTime(){
		Date day=new Date();    
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String date=df.format(day);  
		return date;
	}
	public static String newDateTime(){
		Date day=new Date();    
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		String date=df.format(day);  
		return date;
	}
	public static String timeFormat(String str){
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日yyyy年"); 
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); 
		Date date = null; 
		String str1=null;
		   try { 
		    date = sdf.parse(str); 
		    str1 = sdf1.format(date); 
		   } catch (ParseException e) { 
		    e.printStackTrace(); 
		   } 
		   return str1; 
	}
	public static Date timeStrToDate(String str){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
}
