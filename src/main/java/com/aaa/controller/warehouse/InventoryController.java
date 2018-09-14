package com.aaa.controller.warehouse;

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
import com.aaa.entity.warehouseentity.Inventory;
import com.aaa.service.warehouseservice.InventoryService;
/**
 * 类名称：InventoryController
 * 类描述： 库存表
 * 创建人：wangyatao
 * 创建时间：2018-8-16 下午8:13:14
 * @version
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("inventory")
public class InventoryController {
	@Autowired
	private InventoryService inventoryService;
	/**
	 * 跳转库存表页面
	 * @return
	 */
	@RequestMapping("toList")
	public String selectInv(){
		return "food/inventory/selectInvDeta";
	}
	/**
	 * 跳转成品入库记录页面
	 * @param warehousenum
	 * @param model
	 * @return
	 */
	@RequestMapping("selVpn")
	private String selInv(Integer warehousenum,Model model){
		model.addAttribute("warehousenum", warehousenum);
		return "food/inventory/selInv";
	}
	/**
	 * 库存表列表,模糊查询
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param warehousenum
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object selectAllInv(PageVo pageVo,String name,String value,Integer warehousenum){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("warehousenum", warehousenum);
		//获取总行数
		int count=inventoryService.findCountByMap(map);
		List<Map<String,Object>> foodList=inventoryService.selectAllInv(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(foodList);
		return dg;
	}
	/**
	 * 跳转原料入库记录
	 * @param warehousenum
	 * @param model
	 * @return
	 */
	@RequestMapping("selRmfd")
	private String selRmfd(Integer warehousenum,Model model){
		model.addAttribute("warehousenum", warehousenum);
		return "food/inventory/selRmfd";
	}
	/**
	 * 原料入库记录列表 模糊查询
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param warehousenum
	 * @return
	 */
	@RequestMapping("datagrid1")
	@ResponseBody
	public Object selectAllRmfd(PageVo pageVo,String name,String value,Integer warehousenum){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("warehousenum", warehousenum);
		//获取总行数
		int count=inventoryService.findCountByMap1(map);
		List<Map<String,Object>> foodList=inventoryService.selectAllRmfd(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(foodList);
		return dg;
	}
	/**
	 * 跳转成品入库记录页面
	 * @param warehousenum
	 * @param model
	 * @return
	 */
	@RequestMapping("selDow")
	public String selDow(Integer warehousenum,Model model){
		model.addAttribute("warehousenum", warehousenum);
		return "food/inventory/selDow";
	}
	/**
	 * 成品入库记录列表,模糊查询
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param warehousenum
	 * @return
	 */
	@RequestMapping("datagrid2")
	@ResponseBody
	public Object selectAllDow(PageVo pageVo,String name,String value,Integer warehousenum){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("warehousenum", warehousenum);
		//获取总行数
		int count=inventoryService.findCountByMap2(map);
		List<Map<String,Object>> foodList=inventoryService.selectAllDow(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(foodList);
		return dg;
	}
	/**
	 * 成品出库记录
	 * @return
	 */
	@RequestMapping("cpck")
	public String selCpck(){
		return "food/inventory/selCpck";
	}
	@RequestMapping("datagridThere")
	@ResponseBody
	public Object selectAllCpck(PageVo PageVo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		int count = inventoryService.findCountByMapthere(map);
		List<Map<String,Object>> arodList = inventoryService.selectArod(PageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);
		dg.setRows(arodList);
		return dg;
	}
	/**
	 * 跳转成品库存总量
	 */
	@RequestMapping("cpkcAll")
	public String selcpckAll(){
		return "food/inventory/selCpckAll";
	}
	/**
	 * 成品库存总量
	 * @param PageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagridFore")
	@ResponseBody
	public Object selectAllCpkc(PageVo PageVo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		int count = inventoryService.findCountByMapFore(map);
		List<Map<String,Object>> grossList = inventoryService.selectGross(PageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);
		dg.setRows(grossList);
		return dg;
	}
	/**
	 * 跳转原料库存总量
	 */
	@RequestMapping("ylzlAll")
	public String selylzlAll(){
		return "food/inventory/selYlzlAll";
	}
	/**
	 * 原料库存总量
	 * @param PageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagridFive")
	@ResponseBody
	public Object selectYlzlAll(PageVo PageVo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		int count = inventoryService.findCountByMapFive(map);
		List<Map<String,Object>> YlkcList = inventoryService.selectYlkc(PageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);
		dg.setRows(YlkcList);
		return dg;
	}
	/**
	 * 跳转废品库存总量
	 */
	@RequestMapping("fpzlAll")
	public String selFpzl(){
		return "food/inventory/selFpzl";
	}
	/**
	 * 废品库存总量
	 * @param PageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagridSex")
	@ResponseBody
	public Object selectselFpzlAll(PageVo PageVo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		int count = inventoryService.findCountByMapSex(map);
		List<Map<String,Object>> YlkcList = inventoryService.selFpzl(PageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);
		dg.setRows(YlkcList);
		return dg;
	}
}
