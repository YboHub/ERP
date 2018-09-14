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
import com.aaa.entity.facility.ScrapApply;

import com.aaa.service.facility.ScrapApplyService;
import com.aaa.utils.GenerateNumber;
/**
 * 类名称：ScrapApplyController
 * 类描述：设备报废申请 控制层 
 * 创建人：wangsongkang
 * 创建时间：2018-8-16
 * @version
 */
@Controller
@RequestMapping("scrapApply")
public class ScrapApplyController {
	@Autowired
	private ScrapApplyService scrapApplyService;
	/**
	 * 查询列表信息
	 */
	@RequestMapping("toLists")
	public String toList(){
		return "scrapApply/scrapApplyList";
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
		int count = scrapApplyService.findCountByscrapApply(map);
		//数据库分页
		List<Map<String,Object>> scrapApplyList = scrapApplyService.selectScrapApplyMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(scrapApplyList);//获取每一行信息
		return dg;
	}
	/**
	 * 跳转到新增页面
	 */
	@RequestMapping("toAdd")
	public String toAdd(Model model){
		String scrapApplyLists = scrapApplyService.scrapApply();//获取单号
		String sno = scrapApplyLists;
		String prefix="J";
		String danhao=GenerateNumber.generaterNextNumber(sno, prefix);
		model.addAttribute("danhao", danhao);
		return "scrapApply/scrapApplyAdd";
	}
	/**
	 * 新增保存
	 */
	@RequestMapping("save")
	@ResponseBody
	public Object save(ScrapApply scrapApply){
		int row = scrapApplyService.save(scrapApply);
		return row;
	}
	/**
	 * 跳转修改页面
	 */
	@RequestMapping("toEdit")
	public String toEdit(ScrapApply scrapApply,Model model){
		List<ScrapApply> list = scrapApplyService.toEdit(scrapApply);
		model.addAttribute("list", list);
		return "scrapApply/scrapApplyEdit";
	} 
	/**
	 * 修改保存
	 */
	@RequestMapping("update")
	@ResponseBody
	public Object saveUpdate(ScrapApply scrapApply){
		int row = scrapApplyService.saveUpdate(scrapApply);
		return row;
	}
	/**
	 *审核
	 */
	@RequestMapping("toAudit")
	public String toAduit(ScrapApply scrapApply,Model model){
		List<ScrapApply> list = scrapApplyService.selectScrapApply(scrapApply);
		model.addAttribute("list", list);
		return "scrapApply/scrapApplyAudit"; 
	}
	/**
	 *审核 通过
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public int toUpdate(ScrapApply scrapApply){
		int row = scrapApplyService.updateScrapApply(scrapApply);
		return row;
	}
	/**
	 *审核 不通过
	 */
	@RequestMapping("tooUpdate")
	@ResponseBody
	public int tooUpdate(ScrapApply scrapApply){
		int row = scrapApplyService.noupdateScrapApply(scrapApply);
		return row;
	}
}
