package com.aaa.controller.lsh;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.service.lsh.ProRecordService;

@Controller
@RequestMapping("proRecord")
public class ProRecordController {
	@Autowired
	private ProRecordService proRecordService;
	@RequestMapping("toList")
	public String toProRecordList(String dnumber,Model model){
		model.addAttribute("dnumber", dnumber);
		return "proRecord/proRecordList";
	}
	@RequestMapping("proList")
	@ResponseBody
	public Object selectAllProRecord(PageVo pageVo,String name,String value,String dnumber){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("value", value);
		map.put("name", name);
		map.put("dnumber", dnumber);
		//获取总行数
		int count=proRecordService.getAllCount(map);
		List<Map<String, Object>> proRecordList=proRecordService.selectAllProRecord(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(proRecordList);
		return dg;
	}
	@RequestMapping("proAdd")
	public String toProRecordAdd(String dnumber,Model model){
		model.addAttribute("dnumber", dnumber);
		return "proRecord/proRecordAdd";
	}
	@RequestMapping("proSave")
	@ResponseBody
	public Integer toSaveProRecord(HttpServletRequest request,HttpSession session,String dnumber){
		String[] types=request.getParameterValues("type[]");
		String[] weight=request.getParameterValues("weight[]");
		String[] num=request.getParameterValues("num[]");
		Double[] weights=new Double[weight.length];
		int[] nums=new int[num.length];
		for (int i = 0; i < weight.length; i++) {
			weights[i]=Double.parseDouble(weight[i]);
		}
		for (int i = 0; i < num.length; i++) {
			nums[i]=Integer.parseInt(num[i]);
		}
		boolean bo=proRecordService.toSaveProRecord(session,types,weights,nums,dnumber);
		Integer nom=0;
		if (bo) {
			nom=1;
		}
		return nom;
	}
	@RequestMapping("clist")
	@ResponseBody
	public Object selectAllCapacity(Integer id){
		List<Map<String, Object>> capacityList=proRecordService.selectAllCapacity(id);
		return capacityList;
	}
	@RequestMapping("getType")
	@ResponseBody
	public Object getDoodsType(){
		List<Map<String, Object>> proinfo=proRecordService.getDoodsType();
		System.out.println(proinfo);
		return proinfo;
	}
}
