package com.aaa.controller.manger;

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
import com.aaa.entity.manger.Material;
import com.aaa.service.manger.MaterialchuService;

@Controller
@RequestMapping("materialchu")
public class MaterialChuController {
	@Autowired
	private MaterialchuService materialchuService;
	
	@RequestMapping("toList")
	public String toList( Model model){
		return "materialChu/materialList";
	}
	/**
	 * 查询
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = materialchuService.findCountBymaterial(map);
		//数据库分页
		List<Map<String,Object>> empList = materialchuService.selectmaterial(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(empList);
		return dg;
	}
	/**
	 * 出库
	 */
	@RequestMapping("del")
	@ResponseBody
	public Object edit(Material material,HttpSession session){
		List<Material> materialList=materialchuService.selectbymaterial(material);
		String ename=(String) session.getAttribute("ename");
		materialList.get(0).setMname(ename);
		List<Material> list=materialchuService.selectma(material);
		int row=0;
		for (int i = 0; i < list.size();i++) {
			String name=list.get(i).getMname();
			Double zong=list.get(i).getZong();
			Double oldzong=materialchuService.select(name);
			if(zong<=oldzong){
				 row+=1;
			}else{
				row=0;
				break;
			}
		}
		if(row!=0){
			for (int j = 0; j < list.size();j++) {
				String name=list.get(j).getMname();
				Double zong=list.get(j).getZong();
				Double oldzong=materialchuService.select(name);
				material.setMname(name);
				material.setZong(zong);
				material.setOldzong(oldzong);
				materialchuService.update(material);
			}
			materialchuService.up(material);
			materialchuService.insert(materialList.get(0));
			materialchuService.upda(materialList.get(0));
			return 1;
		}else{
			return 0;
		}
	
	}
}
