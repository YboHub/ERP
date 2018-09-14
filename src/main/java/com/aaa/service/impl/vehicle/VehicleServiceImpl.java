package com.aaa.service.impl.vehicle;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.dao.vehicle.VehicleDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.vehicle.Vehicle;
import com.aaa.service.vehicle.VehicleService;
/**
 * 类名称：VehicleServiceImpl
 * 类描述： 实现类业务层
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 
 * @version
 */
@Service
public class VehicleServiceImpl implements VehicleService{
	@Autowired
	private VehicleDao vehicleDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return vehicleDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectVehicleMap(PageVo vo,Map<String, Object> map) {
		int begin = vo.getRows()*(vo.getPage()-1);
		int end = vo.getRows()*vo.getPage()+1;
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> vehicleList = vehicleDao.selectVehicleMap(map);
		return vehicleList;
	}

	@Override
	public int save(Vehicle vehicle) {
		return vehicleDao.save(vehicle);
	}

	@Override
	public int deleteVehicle(Integer vid) {
		int row = vehicleDao.deleteVehicle(vid);
		return row;
	}

	@Override
	public List<Vehicle> updateVehicle(Vehicle vehicle) {
		return vehicleDao.updateVehicle(vehicle);
	}

	@Override
	public void vehicleEdit(Vehicle vehicle) {
		vehicleDao.vehicleEdit(vehicle);
	}
}
