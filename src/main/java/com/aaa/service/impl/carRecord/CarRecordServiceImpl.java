package com.aaa.service.impl.carRecord;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.dao.carRecord.CarRecordDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.carRecord.CarRecord;
import com.aaa.service.carRecord.CarRecordService;
/**
 * 类名称：CarRecordServiceImpl
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:21:43
 * @version
 */
@Service
public class CarRecordServiceImpl implements CarRecordService{
	@Autowired
	private CarRecordDao carRecordDao;

	@Override
	public int findCountBycarRecord(Map<String, Object> map) {
		return carRecordDao.findCountBycarRecord(map);
	}
	@Override
	public List<Map<String, Object>> selectCarRecordMap(PageVo vo,Map<String, Object> map) {
		int begin = vo.getRows()*(vo.getPage()-1);
		int end = vo.getRows()*vo.getPage()+1;
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> carRecordList = carRecordDao.selectCarRecordMap(map);
		return carRecordList;
	}
	@Override
	public int save(CarRecord carRecord) {
		return carRecordDao.save(carRecord);
	}
}
