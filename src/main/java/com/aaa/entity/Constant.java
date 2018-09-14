package com.aaa.entity;

public class Constant {
	/**
	 * 客户编号起始值
	 */
    public static final Integer CLIENT_NUM = 1000; 
    /**
     * 订单已出库
     */
    public static final Integer ORDER_OUTPUT_STATE = 9;
    /**
     * 客户下单库存充足产品状态
     */
    public static final Integer ORDER_PRODUCE_ENOUGH = 11;
    /**
     * 客户下单库存不足产品状态
     */
    public static final Integer ORDER_PRODUCE_LACK = 12;
    /**
     * 已销售订单部分退回
     */
    public static final Integer ORDER_PART_RETURN = 16;
    /**
     * 已销售订单全部退回
     */
    public static final Integer ORDER_ALL_RETURN = 17;
    /**
     * 销售订单退回处理状态
     */
    public static final Integer ORDER_RETURN_STATE = 19;
    /**
     * 销售订单完成状态
     */
    public static final Integer ORDER_ACCOMPLISH_STATE = 21;
    /**
     * 预付定金
     */
    public static final Integer ORDER_DOWN_PAYMENT = 22;
    /**
     * 尾款支付
     */
    public static final Integer ORDER_FINAL_PAYMENT = 24;
    
}
