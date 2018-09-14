package com.aaa.controller.ischeck;

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
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.QualityRecord;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.service.ischeck.IscheckService;

@Controller
@RequestMapping("ischeck")
public class IscheckController {
	@Autowired
	private IscheckService ischeckService;
	/**
	 * 原料入库质检 查询  分页
	 * @return
	 */
	@RequestMapping("toList")
	public String toischeck(){
		return "shenhe/ischeck";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		//获取 name value 模糊查询 分页
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count= ischeckService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> list= ischeckService.selectIscheckMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(list);
		return dg;
	}
	/**
	 * 弹出框
	 * @param orderid
	 * @param types
	 * @param model
	 * @return
	 */
	@RequestMapping("butt")
	public String audit(Integer id,Model model){
		List<PurOrder> list=ischeckService.selectPur(id);
		//System.out.println(list);
		model.addAttribute("list", list);
		return "shenhe/button";
	}
	/**
	 * 合格按钮
	 * @param purorder
	 * @param qualityRecord
	 * @param session
	 * @return
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public Object toUpdate(PurOrder purorder,QualityRecord qualityRecord,HttpSession session){
		int row=ischeckService.toUpdate(purorder);
		String qualityname = (String) session.getAttribute("ename");
		qualityRecord.setQualityname(qualityname);
		ischeckService.insertQualityRecord(qualityRecord);
		return row;
	}
	/**
	 * 不合格按钮
	 * @param purorder
	 * @param qualityRecord
	 * @param session
	 * @return
	 */
	@RequestMapping("tooUpdate")
	@ResponseBody
	public Object tooUpdate(Procurement procurement,PurOrder purorder,QualityRecord qualityRecord,HttpSession session){
		int row=ischeckService.tooUpdate(purorder);
		String qualityname = (String) session.getAttribute("ename");
		qualityRecord.setQualityname(qualityname);
		ischeckService.updatePro(procurement);
		ischeckService.insertQualityRe(qualityRecord);
		return row;
	}
	
	/**
	 * 质检记录
	 * @return
	 */
	@RequestMapping("tooList")
	public String toqualityRecord(){
		return "shenhe/qualityrecord";
	}
	@RequestMapping("quality")
	@ResponseBody
	public Object quality(PageVo pageVo,String name,String value){
		//获取 name value 模糊查询 分页
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count= ischeckService.findCountByMapQuality(map);
		//数据库分页
		List<Map<String,Object>> list= ischeckService.selectQualityRecordMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(list);
		return dg;
	}
}
