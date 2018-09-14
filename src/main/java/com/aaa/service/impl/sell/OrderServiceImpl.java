package com.aaa.service.impl.sell;

import java.util.Date;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.sell.ClientDao;
import com.aaa.dao.sell.OrderDao;
import com.aaa.dao.sell.SellProInfoDao;
import com.aaa.entity.Constant;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.Client;
import com.aaa.entity.sell.OrderData;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.entity.sell.ReturnOrder;
import com.aaa.service.sell.OrderService;
import com.aaa.utils.NowTimeUtil;
import com.aaa.utils.StringUtils;
import com.alibaba.fastjson.JSONObject;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ClientDao clientDao;
	@Autowired
	private SellProInfoDao sellProInfoDao;
	
	/**
	 * 根据产品名称查询产品信息
	 */
	@Override
	public List<OrderDetail> selectProInfoByPname(OrderDetail order) {
		return orderDao.selectProInfoByPname(order);
	}
	/**
	 * 根据产品编号查询产品信息
	 */
	@Override
	public List<OrderDetail> selectProInfoByPno(OrderDetail order) {
		return orderDao.selectProInfoByPno(order);
	}
	/**
	 * 根据产品型号查询产品信息
	 */
	@Override
	public List<OrderDetail> selectProInfoByPsize(OrderDetail order) {
		return orderDao.selectProInfoByPsize(order);
	}
	/**
	 * 查询客户名称
	 */
	@Override
	public List<Object> selectCname() {
		return clientDao.selectCname();
	}
	/**
	 * 查询产品编号
	 */
	@Override
	public List<Object> selectPno() {
		return sellProInfoDao.selectPno();
	}
	/**
	 * 查询产品名称
	 */
	@Override
	public List<Object> selectPname() {
		return  sellProInfoDao.selectPname();
	}
	/**
	 * 查询员工名称
	 */
	@Override
	public List<Object> selectEname(HttpSession session) {
		String ename = (String) session.getAttribute("ename");
		Map<String, String> deptMap = clientDao.selectDeptByEname(ename);
		String deptno = deptMap.get("deptno");
		return clientDao.selectEname(deptno);
	}
	/**
	 * 获取列表行数
	 */
	@Override
	public int gainTotalLineNum(Map<String, Object> map) {
		return orderDao.gainTotalLineNum(map);
	}
	/**
	 * 数据分页
	 */
	@Override
	public List<Map<String, Object>> selectOrderInfo(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return orderDao.selectOrderInfo(map);
	}
	/**
	 * 查询客户信息根据订单编号
	 */
	@Override
	public List<Map<String, Object>> selectClientInfoByOrderNo(OrderInfo orderInfo) {
		return orderDao.selectClientInfoByOrderNo(orderInfo);
	}
	/**
	 * 查询订单信息根据订单编号
	 */
	@Override
	public List<OrderDetail> selectOrderInfoByOrderNo(OrderDetail order) {
		return orderDao.selectOrderInfoByOrderNo(order);
	}
	/**
	 * 添加订单
	 */
	@Override
	public int insertOrder(OrderDetail orderDetail,OrderInfo orderInfo,Client client) {
		int od = 0;
		if (orderInfo.getPaytype()==Constant.ORDER_DOWN_PAYMENT&&orderInfo.getDpval()==null) {
			return od;
		}
		//查询客户编号
		try {
			orderInfo.setCno(orderDao.selectCnoByCname(orderInfo).getCno());
		} catch (NullPointerException e) {
			//客户不存在执行新增客户
			client.setEmpno(clientDao.selectEmpnoByEname(client).getEmpno());
			int ic = clientDao.addClient(client);
			if (ic>0) {
				client.setCno(client.getId()+Constant.CLIENT_NUM);
				int upd = clientDao.updateClientNum(client);
				if (upd>0) {
					orderInfo.setCno(orderDao.selectCnoByCname(orderInfo).getCno());
				}
			}
		}
		//查询员工编号
		orderInfo.setEmpno(orderDao.selectEnoByEname(orderInfo).getEmpno());
		//插入订单信息
		int oi = orderDao.addOrderInfo(orderInfo);
		//插入金额
//		Date time = NowTimeUtil.timeStrToDate(NowTimeUtil.newTime());
//		String num = orderInfo.getOrderno();
//		float money = 0f;
//		if (orderInfo.getDpval()!=null) {
//			money = orderInfo.getDpval();
//		} else {
//			money = Float.valueOf(orderInfo.getMtotal());
//		}
//		int type = orderInfo.getPaytype();
//		Map<String,Object> financeMap = new HashMap<String,Object>();
//		financeMap.put("time", time);
//		financeMap.put("num", num);
//		financeMap.put("money",money);
//		financeMap.put("type", type);
//		orderDao.insertDownPayment(financeMap);
		String[] pNo = orderDetail.getPno().split(",");
		String[] pName = orderDetail.getPname().split(",");
		String[] pSize = orderDetail.getPsize().split(",");
		String[] pUnit = orderDetail.getPunit().split(",");
		String[] pPrice = orderDetail.getPprice().split(",");
		String[] pNum = orderDetail.getPnum().split(",");
		String[] mSubtotal = orderDetail.getMsubtotal().split(",");
		//插入订单详情
		if (oi>0) {
			for (int i = 0; i < pName.length; i++) {
				orderDetail.setPno(pNo[i]);
				orderDetail.setPname(pName[i]);
				orderDetail.setPsize(pSize[i]);
				orderDetail.setPunit(pUnit[i]);
				orderDetail.setPprice(pPrice[i]);
				orderDetail.setPnum(pNum[i]);
				//查询库存数量
				int data = selectPnumByPno(orderDetail);
				if (data<Integer.valueOf(orderDetail.getPnum())) {
					orderDetail.setState(Constant.ORDER_PRODUCE_LACK);
				} else {
					orderDetail.setState(Constant.ORDER_PRODUCE_ENOUGH);
				}
				orderDetail.setMsubtotal(mSubtotal[i]);
				List<OrderDetail> proList = orderDao.selectProInfoByPname(orderDetail);
				if (proList.size()>0&&proList!=null&&mSubtotal[i]!=null&&mSubtotal[i]!="") {
					od = orderDao.addOrderDetail(orderDetail);
				}
			}
		}
		return od;
	}
	/**
	 * 修改订单
	 */
	@Override
	public int updateOrderInfoByOrderId(OrderDetail orderDetail,OrderInfo orderInfo) {
		//更改备注信息
		orderDao.updateOrderInfoByOrderId(orderInfo);
		//修改
		String[] id = orderDetail.getId().split(",");
		String[] pNo = orderDetail.getPno().split(",");
		String[] pName = orderDetail.getPname().split(",");
		String[] pSize = orderDetail.getPsize().split(",");
		String[] pUnit = orderDetail.getPunit().split(",");
		String[] pPrice = orderDetail.getPprice().split(",");
		String[] pNum = orderDetail.getPnum().split(",");
		String[] mSubtotal = orderDetail.getMsubtotal().split(",");
		int row = 0;
		for (int i = 0; i < pName.length; i++) {
			try {
				orderDetail.setId(id[i]);
				orderDetail.setPno(pNo[i]);
				orderDetail.setPname(pName[i]);
				orderDetail.setPsize(pSize[i]);
				orderDetail.setPunit(pUnit[i]);
				orderDetail.setPprice(pPrice[i]);
				orderDetail.setPnum(pNum[i]);
				//查询库存数量
				int data = selectPnumByPno(orderDetail);
				if (data<Integer.valueOf(orderDetail.getPnum())) {
					orderDetail.setState(Constant.ORDER_PRODUCE_LACK);
				} else {
					orderDetail.setState(Constant.ORDER_PRODUCE_ENOUGH);
				}
				orderDetail.setMsubtotal(mSubtotal[i]);
				String subtotal = orderDetail.getMsubtotal();
				List<OrderDetail> proList = orderDao.selectProInfoByPname(orderDetail);
				if (proList.size()>0&&proList!=null&&subtotal!=null&&!subtotal.equals("")) {
					row = orderDao.updateOrderDetailByOrderId(orderDetail);
				}
			//订单信息更改新增货物处理
			} catch (ArrayIndexOutOfBoundsException e) {
				orderDetail.setPno(pNo[i]);
				orderDetail.setPname(pName[i]);
				orderDetail.setPsize(pSize[i]);
				orderDetail.setPunit(pUnit[i]);
				orderDetail.setPprice(pPrice[i]);
				orderDetail.setPnum(pNum[i]);
				//查询库存数量
				int data = selectPnumByPno(orderDetail);
				if (data<Integer.valueOf(orderDetail.getPnum())) {
					orderDetail.setState(Constant.ORDER_PRODUCE_LACK);
				} else {
					orderDetail.setState(Constant.ORDER_PRODUCE_ENOUGH);
				}
				orderDetail.setMsubtotal(mSubtotal[i]);
				String subtotal = orderDetail.getMsubtotal();
				List<OrderDetail> proList = orderDao.selectProInfoByPname(orderDetail);
				if (proList.size()>0&&proList!=null&&subtotal!=null&&!subtotal.equals("")) {
					row = orderDao.addOrderDetail(orderDetail);
				}
			}
		}
		return row;
	}
	/**
	 * 修改订单删除产品
	 */
	@Override
	public int deleteOrderDetailByOrderId(OrderDetail orderDetail) {
		return orderDao.deleteOrderDetailByOrderId(orderDetail);
	}
	/**
	 * 修改订单删除订单（最后一行删除）
	 */
	@Override
	public int deleteOrderDetailByOrderNo(OrderDetail orderDetail) {
		return orderDao.deleteOrderDetailByOrderNo(orderDetail);
	}
	/**
	 * 根据产品编号查询产品数量
	 */
	@Override
	public int selectPnumByPno(OrderDetail orderDetail) {
		Double pnum = 0.0;
		if (!orderDetail.getPno().equals("")&&!orderDetail.getPno().equals("")) {
			Map<String,Object> map = orderDao.selectPnumByPno(orderDetail);
			pnum =  (Double) map.get("pnum");
		}
		int data = pnum.intValue();
		return data;
	}
	/**
	 * 保存退货订单信息
	 */
	@Override
	public int saveReturnOrder(ReturnOrder returnOrder) {
		String orderno = returnOrder.getRorderno();
		String reason = returnOrder.getReturnreason();
		int type = returnOrder.getRtype();
		int state = Constant.ORDER_RETURN_STATE;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderno", orderno);
		map.put("state", state);
		map.put("reason", reason);
		map.put("type",type);
		orderDao.updateOrderStateByOrderNo(map);
		int row = 0;
		//部分退回
		if (returnOrder.getRtype()==Constant.ORDER_PART_RETURN) {
			row = orderDao.saveReturnOrder(returnOrder);
		//全部退回
		} else if (returnOrder.getRtype()==Constant.ORDER_ALL_RETURN) {
			row = orderDao.saveReturnOrder(returnOrder);
			row = orderDao.updateReturnReason(map);
		}
		return row;
	}
	/**
	 * 根据订单产品信息id查找订单中该产品详情
	 */
	@Override
	public OrderDetail selectReturnProInfoById(OrderDetail orderDetail) {
		return orderDao.selectReturnProInfoById(orderDetail);
	}
	/**
	 * 插入尾款金额
	 */
	@Override
	public int insertFinalPayment(OrderInfo orderInfo) {
		int row = 0;
		int type = orderInfo.getPaytype();
		String num = orderInfo.getOrderno();
		int fpType = Constant.ORDER_FINAL_PAYMENT;
		//查询订单是否结算尾款
 		Map<String,Object> psMap = orderDao.selectPaymentStateByOrderNo(num,fpType);
		if (psMap==null) {
			//根据订单编号查询预付定金和订单总额以及订单状态
			orderInfo = orderDao.selectOrderMoneyByOrderNo(orderInfo);
			int orderState = orderInfo.getStatess();
			//计算尾款
			Float finalMoney = Float.valueOf(orderInfo.getMtotal())-orderInfo.getDpval();
			//插入尾款金额
			Date time = NowTimeUtil.timeStrToDate(NowTimeUtil.newTime());
			Map<String,Object> financeMap = new HashMap<String,Object>();
			financeMap.put("time", time);
			financeMap.put("num", num);
			financeMap.put("money",finalMoney);
			financeMap.put("type", type);
			row = orderDao.insertDownPayment(financeMap);
			//更改订单信息中货款状态为已结算
			orderDao.updateOrderPayTypeByOrderNo(num,fpType);
			//更改订单状态为已完成
			if (row>0&&orderState==Constant.ORDER_OUTPUT_STATE) {
				Map<String,Object> map = new HashMap<String,Object>();
				int state = Constant.ORDER_ACCOMPLISH_STATE;
				map.put("state", state);
				map.put("orderno", num);
				orderDao.updateOrderStateByOrderNo(map);
			}
		}
		return row;
	}
	/**
	 * 获取异常订单数据行数
	 */
	@Override
	public int gainReorderTotalLineNum(Map<String, Object> map) {
		return orderDao.gainReorderTotalLineNum();
	}
	/**
	 * 异常订单列表分页
	 */
	@Override
	public List<Map<String, Object>> selectReorderInfo(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return orderDao.selectReorderInfo(map);
	}
	/**
	 * 查询退回订单详情
	 */
	@Override
	public List<Map<String, Object>> selectReorderDetail(String rorderno) {
		return orderDao.selectReorderDetail(rorderno);
	}
	/**
	 * 查询已退回数量
	 */
	@Override
	public int selectReturnedQuantity(int opid) {
		Map<String,Integer> quantityMap = orderDao.selectReturnedQuantity(opid);
		if (quantityMap==null) {
			return 0;
		} 
		int quantity = quantityMap.get("rpnum");
		return quantity;
	}
	/**
	 * 查询统计数据
	 */
	@Override
	public List<OrderData> selectOrderData(OrderData orderData) {
		int dateState = 0;	//默认x轴为年
		Date startDate = NowTimeUtil.timeStrToDate(orderData.getStartTime());
		Date endDate = NowTimeUtil.timeStrToDate(orderData.getEndTime());
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(startDate);
		int startYear = startCal.get(Calendar.YEAR);
		int startMonth = startCal.get(Calendar.MONTH)+1;
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(endDate);
		int endYear = endCal.get(Calendar.YEAR);
		int endMonth = endCal.get(Calendar.MONTH)+1;
		if (startYear==endYear&&startMonth!=endMonth) {
			dateState = 1;	//x轴为月
		} else if (startYear==endYear&&startMonth==endMonth) {
			dateState = 2;	//x轴为天
		}
		Map<String,Object> dateMap = new HashMap<String,Object>(); 
		dateMap.put("pno", orderData.getPno());
		dateMap.put("dateState", dateState);
		dateMap.put("startYear", startYear);
		dateMap.put("startMonth",startMonth);
		dateMap.put("startDate", startDate);
		dateMap.put("endDate", endDate);
		List<OrderData> list = orderDao.selectOrderData(dateMap);
		Set<Integer> pnoSet = new LinkedHashSet<Integer>();
		Set<String> dateSet = new LinkedHashSet<String>();
		for (int i = 0; i < list.size(); i++) {
			pnoSet.add(list.get(i).getPno());
			String orderDay = list.get(i).getOrderDay();
			String orderMonth = list.get(i).getOrderMonth();
			String orderYear = list.get(i).getOrderYear();
			if (StringUtils.isNotEmpty(orderDay)) {
				dateSet.add(orderDay);
			} else if(StringUtils.isNotEmpty(orderMonth)){
				dateSet.add(orderMonth);
			} else {
				dateSet.add(orderYear);
			}
		}
		List<Object> allList = new LinkedList<Object>();
		Set<Object> pnoAndPnumSet = new LinkedHashSet<Object>(); 
		for (OrderData orderData2 : list) {
			for (String string : dateSet) {
				String date = null;
				if (StringUtils.isNotEmpty(orderData2.getOrderDay())) {
					date = orderData2.getOrderDay();
				} else if (StringUtils.isNotEmpty(orderData2.getOrderMonth())) {
					date = orderData2.getOrderMonth();
				} else if (StringUtils.isNotEmpty(orderData2.getOrderYear())) {
					date = orderData2.getOrderYear();
				}
				for (Integer integer : pnoSet) {
					if (orderData2.getPno()==integer&&orderData2.getOrderDay().equals(string)) {
						if (pnoAndPnumSet.isEmpty()) {
							pnoAndPnumSet.add(orderData2.getPno());
							dateJudge(pnoAndPnumSet,dateSet,orderData2);
							allList.add(pnoAndPnumSet);
						} else if (pnoAndPnumSet.contains(integer)) {
							pnoAndPnumSet.add(orderData2.getPno());
							dateJudge(pnoAndPnumSet,dateSet,orderData2);
						} else {
							Set<Object> pnoAndPnumSet1 = new LinkedHashSet<Object>(); 
							pnoAndPnumSet1.add(orderData2.getPno());
								if (!string.equals(date)) {
									pnoAndPnumSet1.add(0);
								} else {
									pnoAndPnumSet1.add(orderData2.getOrderTotal());
								}
							
							allList.add(pnoAndPnumSet1);
						}
					}
				}
			}
		}
		return list;
	}
	public void dateJudge(Set<Object> pnoAndPnumSet,Set<String> dateSet,OrderData orderData){
		for (String string : dateSet) {
			String date = null;
			if (StringUtils.isNotEmpty(orderData.getOrderDay())) {
				date = orderData.getOrderDay();
			} else if (StringUtils.isNotEmpty(orderData.getOrderMonth())) {
				date = orderData.getOrderMonth();
			} else if (StringUtils.isNotEmpty(orderData.getOrderYear())) {
				date = orderData.getOrderYear();
			}
			if (!string.equals(date)) {
				pnoAndPnumSet.add(0);
			} else if (string.equals(date)) {
				pnoAndPnumSet.add(orderData.getOrderTotal());
			}
		}
	}


}
