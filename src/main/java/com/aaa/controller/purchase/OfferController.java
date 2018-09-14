/**
 * 
 */
package com.aaa.controller.purchase;


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
import com.aaa.entity.purchase.Offer;
import com.aaa.service.purchase.OffService;


/**
 * @类名称: OfferController
 * @描述类: 报价报表增删该查
 * @author: LiuJinYu
 * @time: 2018-7-28下午3:01:10
 * 
 */
@Controller
@RequestMapping("/off")
public class OfferController {
	@Autowired
 private OffService offService;	
	/**
	 * 跳转查询
	 */
	@RequestMapping("toList")
	public String toList(){
		return "off/offList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String company,String goodsname){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("company", company);
		map.put("goodsname", goodsname);
		/*
		 * 获取company的总行数
		 */
		int lineNum = offService.findCountByMap(map);
		List<Map<String,Object>> purList = offService.selectOff(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(purList);
		return dg;
	}
	/**
	 * 新增跳转
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "off/offAdd";
	}
	/**
	 * 新增保存
	 */
	@RequestMapping("toSave")
	@ResponseBody
	public int toSave(Offer off){
		int row = offService.addOff(off);
		return row;
	}
	/**
	 * 更改查询
	 */
	@RequestMapping("toEdit")
	public String toEdit(Offer off,Model model){
		List<Offer> offList = offService.selectOffbiao(off);
		model.addAttribute("offList", offList);
		return "off/offEdit";
	}
	/**
	 * 更改保存
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public int toUpdate(Offer off){
		int row = offService.updateOff(off);
		return row;
	}
	/**
	 * 删除
	 */
	@RequestMapping("delete")
	@ResponseBody
	public int toDelete(Offer off){
		int row = offService.deleteOff(off);
		return row;
	}
}
