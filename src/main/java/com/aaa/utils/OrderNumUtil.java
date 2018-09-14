package com.aaa.utils;   
	import java.text.SimpleDateFormat;  
import java.util.Date;    
    /** 
     * @ClassName: MakeOrderNum 
     * @CreateTime 2015年9月13日 下午4:51:02 
     * @author : mayi 
     * @Description: 订单号生成工具，生成非重复订单号，理论上限1毫秒1000个，可扩展 
     * 
     */  
    public class OrderNumUtil {  
        /** 
         * 订单号生成计数器 
         */  
        private static long orderNumCount = 0L;  
        /** 
         * 每毫秒生成订单号数量最大值 
         */  
        private static int maxPerMSECSize=10;  
        /** 
         * 生成非重复订单号，理论上限1毫秒1000个，可扩展 
         * @param tname 测试用 
         */  
        public static String makeOrderNum() {  
        	String finOrderNum = "";  
            try {  
                // 最终生成的订单号  
                    // 取系统当前时间作为订单号变量前半部分，精确到毫秒  
                    long nowLong = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));  
                    // 计数器到最大值归零，可扩展更大，目前1毫秒处理峰值1000个，1秒100万  
                    if (orderNumCount >= maxPerMSECSize) {  
                        orderNumCount = 0L;  
                    }  
                    //组装订单号  
                    String countStr=maxPerMSECSize +orderNumCount+"";  
                    finOrderNum=nowLong+countStr.substring(1);  
                    orderNumCount++;  
                    //System.out.println(finOrderNum);  
            } catch (Exception e) {  
                e.printStackTrace();  
            }
            return finOrderNum; 
        }
    }  