package com.aaa.controller.facility;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.service.facility.ScrapRecordsService;
/**
 * 类名称：ScrapRecordsController
 * 类描述： 设备报废记录控制层
 * 创建人：wangsongkang
 * 创建时间：2018-8-10 
 * @version
 */
@Controller
@RequestMapping("scrapapplys")//窄化访问路径
public class ScrapRecordsController {
	@Autowired//自动注入
	private ScrapRecordsService scrapRecordsService;//调用service层
	/**
	 * 查询列表信息
	 */
	@RequestMapping("toLists")
	public String toLists(){
		return "scrapRecords/scrapRecordsLists";
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
		int count = scrapRecordsService.findCountByscrapRecords(map);
		//数据库分页
		List<Map<String,Object>> scrapRecordsLists = scrapRecordsService.selectScrapRecordsMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(scrapRecordsLists);//获取每一行信息
		return dg;
	}
}
