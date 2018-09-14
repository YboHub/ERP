/**
 * 
 */
package com.aaa.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @类名称: DanhaoUtil
 * @描述类: 采购单号
 * @author: LiuJinYu
 * @time: 2018-8-7上午11:10:15
 * 
 */
public class DanhaoUtil {
	public static String generaterNextNumber(String sno){
		String id=null;
		Date date=new Date();
		SimpleDateFormat fromatter=new SimpleDateFormat("yyyyMMdd");
		if(!StringUtils.isNotEmpty(sno)){
			sno = "20180000000";
		}
		DecimalFormat df=new DecimalFormat("000");
		id=fromatter.format(date)+df.format(1+Integer.parseInt(sno.substring(9, sno.length())));
		System.out.println(fromatter.format(date));
		System.out.println(id);
		return id;
	}
}
