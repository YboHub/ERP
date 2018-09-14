package com.aaa.dao.vehicle;
import java.util.List;
import java.util.Map;
import com.aaa.entity.vehicle.Vehicle;
/**
 * 类名称：VehicleDao
 * 类描述： 实现类
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:30:20
 * @version
 */
public interface VehicleDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectVehicleMap(Map<String, Object> map);

	int save(Vehicle vehicle);

	int deleteVehicle(Integer vid);

	List<Vehicle> updateVehicle(Vehicle vehicle);

	void vehicleEdit(Vehicle vehicle);

}
