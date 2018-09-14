package com.aaa.controller.facility;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.facility.BreakDowns;
import com.aaa.service.facility.BreakDownsService;
import com.aaa.utils.GenerateNumber;
/**
 * 类名称：BreakDownsController
 * 类描述： 故障管理控制层
 * 创建人：wangsongkang
 * 创建时间：2018-8-15 
 * @version
 */
@Controller
@RequestMapping("breakDowns")//窄化访问路径
public class BreakDownsController {
	@Autowired//自动注入
	private BreakDownsService breakDownsService;//调用service层
	/**
	 * 查询列表信息
	 */
	@RequestMapping("toList")
	public String toList(){
		return "breakDowns/breakDownsList";
	}
	/**
	 * 异步请求的列表数据  json
	 * pageVo rows 一页显示5条记录  page当前第几页
	 * @return
	 * @RequestMapping 映射请求(处理URL请求,相当于Servlet中在web.xml中配置)
	 * @RequestMapping 中的 method属性 主要用来定义接收浏览器发来的何种请求
	 * @ResponseBody 该注解用于将Controller的方法返回的对象，通过适当的HttpMessageConverter转换为指定格式后，
	 * 		写入到Response对象的body数据区
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count = breakDownsService.findCountBybreakDowns(map);
		//数据库分页 调用查询方法
		List<Map<String,Object>> breakDownsList = breakDownsService.selectBreakDownsMap(pageVo,map);
		//配置对象
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(breakDownsList);//获取每一行信息
		return dg;
	}
	/**
	 * 跳转到新增页面
	 */
	@RequestMapping("toAdd")
	public String toAdd(BreakDowns breakDowns,Model model){
		//查询(下拉框)
		List <Map> list = breakDownsService.selectBreakDowns(breakDowns);
		model.addAttribute("list",list);
		//自动获取单号
		String breakDownsList=breakDownsService.breakDowns();
		String sno=breakDownsList;
		String prefix="R";
		String danhao=GenerateNumber.generaterNextNumber(sno, prefix);
		model.addAttribute("danhao", danhao);
		return "breakDowns/breakDownsAdd";
		
	}
	/**
	 * 新增保存
	 * @param breakdown
	 * @return
	 */
	@RequestMapping("save")
	@ResponseBody
	public Object save(BreakDowns breakDowns){
		int row = breakDownsService.save(breakDowns);
		return row;
	}
}
