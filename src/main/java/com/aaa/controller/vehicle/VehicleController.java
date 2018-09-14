package com.aaa.controller.vehicle;
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
import com.aaa.entity.vehicle.Vehicle;
import com.aaa.service.vehicle.VehicleService;
/**
 * 类名称：VehicleController
 * 类描述： 查询车辆信息
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:30:01
 * @version
 */
@Controller
@RequestMapping("vehicle")
public class VehicleController {
	@Autowired
	private VehicleService vehicleService;
	/**
	 * 查询车辆信息
	 */
	@RequestMapping("toList")
	public String toList(){
		return "vehicle/vehicleList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count = vehicleService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> vehicleList = vehicleService.selectVehicleMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);
		dg.setRows(vehicleList);
		return dg;
	}
	/**
	 * 跳转新增页面
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "vehicle/vehicleAdd";
	}
	/**
	 * 保存新增信息
	 * @param vehicle
	 * @return
	 */
	@RequestMapping("save")
	@ResponseBody
	public Object save(Vehicle vehicle){
		int row = vehicleService.save(vehicle);
		return row;
	}
	/**
	 * 删除
	 */
	@RequestMapping("del")
	@ResponseBody
	public Object deleteVehicle(Integer vid){
		int row = vehicleService.deleteVehicle(vid);
		return row;
	}
	/**
	 * 跳转修改页面
	 */
	@RequestMapping("upd")
	public String updateVehicle(Vehicle vehicle,Model model){
		List<Vehicle> vehicleList = vehicleService.updateVehicle(vehicle);
		model.addAttribute("vehicleList", vehicleList);
		return "vehicle/vehicleEdit";
	} 
	/**
	 * 保存修改信息
	 * @param vehicle
	 * @return
	 */
	@RequestMapping("edit")
	public String vehicleEdit(Vehicle vehicle){
		vehicleService.vehicleEdit(vehicle);
		return "forward:toList";
	}
}
