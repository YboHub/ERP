package com.aaa.controller.warehouse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.entity.warehouseentity.StockManager;
import com.aaa.service.warehouseservice.ProOutAuditService;
import com.aaa.utils.GenerateNumber;
import com.aaa.utils.NowTimeUtil;
/**
 * 类名称：ProOutAuditController
 * 类描述： 
 * 创建人：wangyatao
 * 创建时间：2018-8-13 下午8:47:33
 * @version
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("proOutAudit")
public class ProOutAuditController {
	@Autowired
	private ProOutAuditService proOutAuditService;
	/**
	 * 跳转出库审核页面
	 * @return
	 */
	@RequestMapping("proOutAuditList")
	public String proOutList(){
		return "food/proOutAudit/proOutAuditList";
	}
	/**
	 * 成品出库审核列表
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param orderno
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object selOutAuditDetails(PageVo pageVo,String name,String value,String orderno){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("orderno", orderno);
		//获取总行数
		int count=proOutAuditService.findCountByMap(map);
		List<Map<String,Object>> pOutAuditList=proOutAuditService.selOutAuditDetails(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(pOutAuditList);
		return dg;
	}
	/**
	 * 成品出库审核页面
	 * @param orderDetail
	 * @param model
	 * @return
	 */
	@RequestMapping("proOutAuditV")
	public String ProductAudit(OrderDetail orderDetail,Model model){
		List<Map> editList = proOutAuditService.proOutAudit(orderDetail);
		String Nowtime=NowTimeUtil.newTime();
		model.addAttribute("Nowtime", Nowtime);
		model.addAttribute("editList", editList);
		return "food/proOutAudit/proOutAudit";
	}
	/**
	 * 成品出库审核(通过)
	 * @param stockManager
	 * @return
	 */
	@RequestMapping("passProOut")
	@ResponseBody
	public Object savePeoInc(OrderInfo orderInfo,HttpSession session){
		String qualityname = (String) session.getAttribute("ename");
		orderInfo.setAuditman(qualityname);
		int row  =  proOutAuditService.savepassProOut(orderInfo);
		return row;
	}
	/**
	 * 成品出库审核驳回
	 * @param orderInfo
	 * @param session
	 * @return
	 */
	@RequestMapping("cprkbh")
	@ResponseBody
	public Object cprkbh(OrderInfo orderInfo,HttpSession session){
		String qualityname = (String) session.getAttribute("ename");
		orderInfo.setAuditman(qualityname);
		int row  =  proOutAuditService.cprkbh(orderInfo);
		return row;
	}
	/**
	 * 成品出库审核记录
	 */
	@RequestMapping("proOutAuditRecord")
	public String proOutAuditRecord(){
		return "food/proOutAudit/record";
	}
	/**
	 * 成品出库审核记录页面
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("datagridOne")
	@ResponseBody
	public Object selOutAuditRecord(PageVo pageVo,String name,String value,String beginTime,String endTime){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		//获取总行数
		int count=proOutAuditService.findCountByMapOne(map);
		List<Map<String,Object>> pOutAuditRecordList=proOutAuditService.selOutAuditRecord(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(pOutAuditRecordList);
		return dg;
	}
	/**
	 * 成品出库审核记录详情
	 */
	@RequestMapping("selProOutDeta")
	public String selProOutDeta(Model model,String orderno){
		model.addAttribute("orderno",orderno);
		return "food/proOutAudit/details";
	}
	@RequestMapping("datagridTwo")
	@ResponseBody
	public Object SelProDatails(Model model,String orderno){
		List proAuditDetailss = proOutAuditService.selProDatails(orderno);
		model.addAttribute("proAuditDetailss",proAuditDetailss);
		DataGrid dg= new DataGrid();
		dg.setRows(proAuditDetailss);
		return dg;
	}
}
