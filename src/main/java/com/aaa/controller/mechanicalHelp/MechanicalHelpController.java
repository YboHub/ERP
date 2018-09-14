package com.aaa.controller.mechanicalHelp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.mechanicalHelp.MechanicalHelp;
import com.aaa.service.mechanicalHelp.MechanicalHelpService;
/**
 * 类名称：MechanicalHelpController
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:25:25
 * @version
 */
@Controller
@RequestMapping("mechanicalHelp")
public class MechanicalHelpController {
	@Autowired
	private MechanicalHelpService mechanicalHelpService;
	/**
	 * 查询所有信息
	 */
	@RequestMapping("toList")
	public String toList(){
		return "mechanicalHelp/mechanicalHelpList";
	}
	/**
	 * 异步请求的列表数据  json
	 * pageVo rows 一页显示5条记录  page当前第几页
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count = mechanicalHelpService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> mechanicalHelpList = mechanicalHelpService.selectMechanicalHelpMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(mechanicalHelpList);
		return dg;
	}
	/**
	 * 跳转新增页面
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "mechanicalHelp/mechanicalHelpAdd";
	}
	@RequestMapping("save")
	@ResponseBody
	public Object save(MechanicalHelp mechanicalHelp){
		int row = mechanicalHelpService.save(mechanicalHelp);
		return row;
	}
}
