package com.aaa.controller.carRecord;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.carRecord.CarRecord;
import com.aaa.service.carRecord.CarRecordService;
/**
 * 类名称：CarRecordController
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:18:49
 * @version
 */
@Controller
@RequestMapping("carRecord")
public class CarRecordController {
	@Autowired
	private CarRecordService carRecordService;
	/**
	 * 查询所有信息
	 */
	@RequestMapping("toList")
	public String toList(){
		return "carRecord/carRecordList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count = carRecordService.findCountBycarRecord(map);
		//数据库分页
		List<Map<String,Object>> carRecordList = carRecordService.selectCarRecordMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);
		dg.setRows(carRecordList);
		return dg;
	}
	/**
	 * 跳转新增页面
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "carRecord/carRecordAdd";
	}
	@RequestMapping("save")
	@ResponseBody
	public Object save(CarRecord carRecord){
		int row = carRecordService.save(carRecord);
		return row;
	}
}
