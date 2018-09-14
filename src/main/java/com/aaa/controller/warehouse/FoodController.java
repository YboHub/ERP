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
import com.aaa.entity.warehouseentity.Food;
import com.aaa.service.warehouseservice.FoodService;
/**
 * 类名称：FoodController
 * 类描述： 仓库
 * 创建人：wangyatao
 * 创建时间：2018-8-16 下午8:05:42
 * @version
 */
@Controller
@RequestMapping("food")
public class FoodController {
	@Autowired
	private FoodService foodService;
	/**
	 * 跳转仓库页面
	 * @return
	 */
	@RequestMapping("toList")
	public String selectAllFood(){
		return "food/toList";
	}
	/**
	 * 查询仓库,模糊查询
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object selectAllFood(PageVo pageVo,String name,String value){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count=foodService.findCountByMap(map);
		List<Map<String,Object>> foodList=foodService.selectAllFood(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(foodList);
		return dg;
	}
	/**
	 * 判定编辑仓库验证仓库编号是否存在
	 * @param warehousenum
	 * @return
	 */
	@RequestMapping("yanzheng")
	@ResponseBody
	public Object chakan(Integer warehousenum){
		List<Map> list = foodService.selectFoodId(warehousenum);
		String msg="";
		if(list!=null&&list.size()>0){
			msg = "编号已存在！请重新输入";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", msg);
		return map;
	}
	/**
	 * 跳转新增仓库
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "food/foodAdd";
	}
	/**
	 * 保存新增仓库
	 * @param food
	 * @return
	 */
	@RequestMapping("toSave")
	@ResponseBody
	public int toSave(Food food){
		int row = foodService.addFood(food);
		return row;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("delete")
	@ResponseBody
	public int toDelete(Food food){
		int row = foodService.deleteFood(food);
		return row;
	}
	/**
	 * 更改
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(Food food,Model model){
		List<Map> editList = foodService.selectFood(food);
		model.addAttribute("editList",editList);
		return "food/foodEdit";
	}
	/**
	 * 保存更改
	 */
	@RequestMapping("saveUpdate")
	@ResponseBody
	public Object updateFood(Food food){
		int row = foodService.updateFood(food);
		return row;
	}
}
