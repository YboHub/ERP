package com.aaa.controller.manger;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Plan;
import com.aaa.service.manger.PlanService;
import com.aaa.utils.NowTimeUtil;

@Controller
@RequestMapping("plan")
public class PlanController {
@Autowired
private PlanService planService;

/**
 * 
 * @param model
 * @return
 */
@RequestMapping("toList")
public String toList( Model model){
	return "plan/planList";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = planService.findCountByplan(map);
	//数据库分页
	List<Map<String,Object>> empList = planService.selectplan(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}

/**
 * 添加
 */
@RequestMapping("toAdd")
public String toAdd(){
	return "plan/planAdd";
}
/**
 * 保存
 */
@RequestMapping("toSave")
@ResponseBody
public int toSave(Plan plan){
	int row = planService.addplan(plan);
	return row;
}

/**
 * 批量删除
 */
@RequestMapping("delete")
@ResponseBody
public int add(@RequestParam(value ="idStr[]") long[] idStr){
	int row=0;
	for (long id : idStr) {
		 row=planService.delete(id);
	}
	return row;
}

/**
 * 更改
 */
@RequestMapping("toEdit")
public String toEdit(Plan plan,Model model){
	List<Plan> editList = planService.selectbyplan(plan);
	model.addAttribute("editList", editList);
	return "plan/planEdit"; 
}


/**
 * 提交更改
 */
@RequestMapping("toUpdate")
@ResponseBody
public int toUpdate(Plan plan){
	int row = planService.updateplan(plan);
	return row;
}

/**
 * 开始生产
 */
@RequestMapping("up")
@ResponseBody
public int up(Plan plan){
	String begintime=NowTimeUtil.newTime();
	plan.setBegintime(begintime);
	int	 row=planService.update(plan);
	return row;
}
/**
 * 结束生产
 */
@RequestMapping("toselect")
@ResponseBody
public Object toselect(Plan plan){
	Map<String, Object> map = new HashMap<String, Object>();
	List<Plan> list=planService.selectma(plan);
	String dnumber=plan.getDnumber();
	int row=0;
	for (int i = 0; i < list.size();i++){
		String psize=list.get(i).getPsize();
		Double zong=list.get(i).getPnum();
		map.put("psize", psize);
		map.put("dnumber", dnumber);
		Double oldzong=planService.selectpl(map);
		if(oldzong==null){
			row=0;
			break;
		}
		if(zong<=oldzong){
			 row=1;
		}else{
			row=0;
			break;
		}
	}
if(row!=0){
	String endtime=NowTimeUtil.newTime();
	plan.setEndtime(endtime);
	planService.tooupdate(plan);
	List<Plan> pList=planService.selectshi(plan);
	plan.setBegintime(pList.get(0).getBegintime());
	plan.setEndtime(pList.get(0).getEndtime());
	List<Plan> planList=planService.selecttime(plan);
	plan.setPnum(planList.get(0).getPnum());
	planService.date(plan);
	
}
return row;
}	
	
/**
 * 详情
 */
@RequestMapping("todel")
public String todel(String dnumber,Model model){
	model.addAttribute("dnumber",dnumber);
	return "plan/Add";
}
/**
 * 详情
 */
@RequestMapping("dataOne")
@ResponseBody
public Object dateone(String dnumber){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("dnumber", dnumber);
	List<Map<String,Object>> orderList = planService.selectorder(map);
	DataGrid dg = new DataGrid();
	dg.setRows(orderList);
	return dg;
}
}
