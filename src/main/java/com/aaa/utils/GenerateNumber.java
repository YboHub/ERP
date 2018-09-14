package com.aaa.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GenerateNumber {
	public static String generaterNextNumber(String sno,String prefix){
		String id=null;
		Date date=new Date();
		SimpleDateFormat fromatter=new SimpleDateFormat("yyyyMMdd");
		if(!StringUtils.isNotEmpty(sno)){
			sno = prefix+"20180000000";
		}
		DecimalFormat df=new DecimalFormat("000");
		id=prefix+fromatter.format(date)+df.format(1+Integer.parseInt(sno.substring(9, sno.length())));
		System.out.println(fromatter.format(date));
		System.out.println(id);
		return id;
	}
	
}
