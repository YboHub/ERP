package com.aaa.controller.purchase;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.purchase.MaterialReturn;
import com.aaa.entity.purchase.Offer;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.service.purchase.PurService;
import com.aaa.utils.DanhaoUtil;
import com.aaa.utils.GenerateNumber;

/***
 * @类名称: PurchaseConreoller
 * @描述类: 采购计划
 * @author: LiuJinYu
 * @time: 2018-7-27上午9:05:43
 */
@Controller
@SuppressWarnings("all")
public class PurchaseConreoller {
	@Autowired
	private PurService purService;
	/**
	 * 跳转查询
	 */
	@RequestMapping("toListOne")
	public String toList(){
		return "purchase/purList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		/* 
		 * 获取caozuoname，orderid的总行数
		 */
		int lineNum = purService.findCountByMap(map);
		List<Map<String,Object>> purList = purService.selectPur(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(purList);
		return dg;
	}
	/**
	 * 跳转到新增页面
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(Model model){
		String purionList=purService.purductionList();
		String sno=purionList;
		String gen=DanhaoUtil.generaterNextNumber(sno);
		model.addAttribute("gen", gen);
		return "purchase/purAdd";
	}
	/**
	 * 修改订单状态
	 */
	@RequestMapping("edi")
	@ResponseBody
	public int edi(@RequestParam(value ="idStr[]") int[] idStr,Procurement pro){
		
		int row=0;
		for (int id : idStr) {	
			pro.setId(id);
			row=purService.edit(pro);
		}
		return row;
	}
	/**
	 * 下拉框获取所有物品名称
	 */
	@RequestMapping("getBMName")
	@ResponseBody
	public List<Map<String,Object>> getBMName() throws Exception{
		List<Map<String,Object>> list = purService.getBMName();
		return list;	
	}
	/**
	 * 第二个下拉框
	 */
	@RequestMapping("getSpecificate")
	@ResponseBody
	public List<Map<String,Object>> getSpecificate(HttpServletRequest request,String goodsname) throws Exception{
//		goodsname = request.getParameter("goodsname");
//		goodsname = new String(goodsname .getBytes("iso8859-1"),"utf-8");
		List<Map<String,Object>> list = purService.getSpecificate(goodsname);
		return list;
	}
	/**
	 * 第三个下拉框
	 */
	@RequestMapping("agetSpecificate")
	@ResponseBody
	public List<Map<String,Object>> agetSpecificate(HttpServletRequest request,String goodsname,String goodstype) throws Exception{
		
//		//乱码转换
//		goodsname = request.getParameter("goodsname");
//		goodsname = new String(goodsname .getBytes("iso8859-1"),"utf-8");
		//乱码转换
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goodsname", goodsname);
		map.put("goodstype", goodstype);
		List<Map<String,Object>> list = purService.agetSpecificate(map);
		return list;
	}
	/**
	 *第四个下拉框
	 */
	@RequestMapping("aagetSpecificate")
	@ResponseBody
	public List<Map<String,Object>> aagetSpecificate(HttpServletRequest request,String goodsname,String goodstype,String company)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
//		goodsname = request.getParameter("goodsname");
//		goodsname = new String(goodsname .getBytes("iso8859-1"),"utf-8");
		map.put("company", company);
		map.put("goodstype", goodstype);
		map.put("goodsname", goodsname);
		List<Map<String,Object>> list = purService.aagetSpecificate(map);
		return list;
	}
	/**
	 * 	插入申请表
	 */
	@RequestMapping("insertCargo")
	@ResponseBody
	public Object insertCargo(PurOrder purOrder,Procurement pro,HttpSession session){
		String pOrederid=purOrder.getOrderid();
		String pOrid=pro.getOrderid();
		String pReason=pro.getReason();
		String qualityname = (String) session.getAttribute("ename");
		pro.setReason(pReason);
		pro.setOrderid(pOrid);
		pro.setCaozuoname(qualityname);
		int rowOne=purService.addP(pro);
		String[] pGoodsname = purOrder.getGoodsname().split(",");
		String[] pTypes = purOrder.getTypes().split(",");
		String[] pCompany = purOrder.getCompany().split(",");
		String[] pPrice = purOrder.getPrice().split(",");
		String[] pWeights = purOrder.getWeights().split(",");
		String[] pMoney = purOrder.getMoney().split(",");
		int row = 0;
		for (int i = 0; i < pGoodsname.length; i++) {
			purOrder.setOrderid(pOrederid);
			purOrder.setGoodsname(pGoodsname[i]);
			purOrder.setTypes(pTypes[i]);
			purOrder.setCompany(pCompany[i]);
			purOrder.setPrice(pPrice[i]);
			purOrder.setWeights(pWeights[i]);
			purOrder.setMoney(pMoney[i]);
			row = purService.addPurOff(purOrder);
		}
		return "forward:toList";
	}
	/**
	 * 详情表添加
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("insertPur")
	@ResponseBody
	public Object insertPur(PurOrder purOrder) throws UnsupportedEncodingException{
		//URLDecoder.decode(faultAddr , "utf-8");后台解码
		//encodeURI(encodeURI(document.getElementById("faultAddr").value)); 前台编码两次
		String pOrederid=purOrder.getOrderid();
		Integer pStates=purOrder.getStates();
		String[] pGoodsname = purOrder.getGoodsname().split(",");
		String[] pTypes = purOrder.getTypes().split(",");
		String[] pCompany = purOrder.getCompany().split(",");
		String[] pPrice = purOrder.getPrice().split(",");
		String[] pWeights = purOrder.getWeights().split(",");
		String[] pMoney = purOrder.getMoney().split(",");
		String[] pReason=purOrder.getReason().split(",");
		int row = 0;
		for (int i = 0; i < pGoodsname.length; i++) {
			purOrder.setOrderid(pOrederid);
			purOrder.setStates(pStates);
			purOrder.setGoodsname(pGoodsname[i]);
			purOrder.setTypes(pTypes[i]);
			purOrder.setCompany(pCompany[i]);
			purOrder.setPrice(pPrice[i]);
			purOrder.setWeights(pWeights[i]);
			purOrder.setMoney(pMoney[i]);
			purOrder.setReason(pReason[i]);
			row = purService.addPurOff(purOrder);
		}
 		return "redirect:toList";
	}
	/**
	 * 采购单详情页查询+编辑
	 */
	@RequestMapping("Upedit")
	public String Upedit(Model model,String orderid){
		List<Map<String,Object>> purList = purService.selectOrder(orderid);
		model.addAttribute("purList", purList);
		model.addAttribute("orderid",orderid);
		return "purchase/purDetail";
	}
	/**
	 * 退货查询
	 */
	@RequestMapping("UpeditReturn")
	public String UpeditReturn(Model model,String orderid){
		List<Map<String,Object>> purList = purService.selectOrderReturn(orderid);
		model.addAttribute("purList", purList);
		model.addAttribute("orderid",orderid);
		return "purchase/purDetailReturn";
	}
	/**
	 * 退货
	 */

	/**
	 * 采购详情页查询
	 */
	@RequestMapping("UpeditOneo")
	@ResponseBody
	public Object UpeditOne(Model model,String orderid){
		List<Map<String,Object>> purList = purService.selectOrder(orderid);
		model.addAttribute("purList", purList);
		model.addAttribute("orderid",orderid);
		DataGrid dg = new DataGrid();
		
		dg.setRows(purList);
		return dg;
	}
	@RequestMapping("UpeditOne")
	public String selectdelatil(Model model,String orderid){
		model.addAttribute("orderid",orderid);
		return "purchase/purDetailOne";
		
	}
	@RequestMapping("purdetailone")
	@ResponseBody
	public Object purdetailone(String orderid){
		List<Map<String,Object>> purList = purService.selectOrder(orderid);
		DataGrid purdetail = new DataGrid();
		purdetail.setRows(purList);
		return purdetail;
	}
	/**
	 * 删除采购记录
	 */
	@RequestMapping("delete")
	@ResponseBody
	public int delete(String id){
		int row = purService.delete(id);
		return row;	
	}
	/**
	 * 详情批量删除
	 */
	@RequestMapping("deleteOne")
	@ResponseBody
	public int add(@RequestParam(value ="idStr[]") long[] idStr){
		int row=0;
		for (long id : idStr) {
			 row=purService.deleteOne(id);
		}
		return row;
	}
	/**
	 * 删除记录中的一条信息
	 */
	@RequestMapping("deletetwo")
	@ResponseBody
	public int deleteTwo(String id){
		int row=purService.deleteTwo(id);
		return row;
	}
	/**
	 * 退货
	 */
	@RequestMapping("deletetwoReturn")
	@ResponseBody
	public int deletetwoReturn(String id,MaterialReturn mater,PurOrder pur,HttpSession session){
		List<PurOrder> purList = purService.selectOrderReturnOne(pur);//查询
		String name=(String)session.getAttribute("ename");
		purList.get(0).setName(name);
		purService.insert(purList.get(0));//插入
		int row=purService.deleteTwo(id);//删除
		return row;
		
	}
	/**
	 * 生产订单详情
	 */
	@RequestMapping("selectPurdaction")
	public String selectPurdaction(Model model){
		List<Map<String,Object>> purList = purService.selectPlanNum();
		model.addAttribute("purList", purList);
		return "purchase/selectOne";
	}
	@RequestMapping("datagridProdaction")
	@ResponseBody
	public Object datagridProdaction(){
		List<Map<String,Object>> purList = purService.selectProduction();
		DataGrid dg = new DataGrid();
		dg.setRows(purList);
		return dg;
	}
	/**
	 * 采购详情框内查询
	 */
	@RequestMapping("updatedetalisONe")

	public String updatedetalisONe(Model model,String id,PurOrder pur){
		List<PurOrder> offList=purService.updatedetalisONe(pur);
		model.addAttribute("offList", offList);
		return "purchase/updatedetalisONe";	
	}
	/**
	 * 更改保存
	 */
	@RequestMapping("toUpdateDetalis")
	@ResponseBody
	public int toUpdateDetalis(PurOrder pur){
		int row = purService.updateDetalis(pur);
		return row;
	}
	/**
	 * 把采购单改成等待质检
	 */
	@RequestMapping("detailToBuy")
	@ResponseBody
	public int detailToBuy(Procurement pro,PurOrder pur){
		int row=purService.detailToBuy(pro);
		purService.detailToBuyOne(pur);
		return row;
		
	}
	/**
	 * 把采购单改成等待质检
	 */
	@RequestMapping("detailOk")
	@ResponseBody
	public int detailOk(Procurement pro){
		int row=purService.detailToBuy(pro);
		return row;
	}
}
