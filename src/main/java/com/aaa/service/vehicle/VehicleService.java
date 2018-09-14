package com.aaa.service.vehicle;
import java.util.List;
import java.util.Map;
import com.aaa.entity.PageVo;
import com.aaa.entity.vehicle.Vehicle;
/**
 * 类名称：VehicleService
 * 类描述： 实现类业务层
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:30:55
 * @version
 */
public interface VehicleService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectVehicleMap(PageVo pageVo,Map<String, Object> map);

	int save(Vehicle vehicle);

	int deleteVehicle(Integer vid);

	List<Vehicle> updateVehicle(Vehicle vehicle);

	void vehicleEdit(Vehicle vehicle);
}
