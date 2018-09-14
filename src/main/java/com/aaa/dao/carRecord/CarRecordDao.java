package com.aaa.dao.carRecord;
import java.util.List;
import java.util.Map;
import com.aaa.entity.carRecord.CarRecord;
/**
 * 类名称：CarRecordDao
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:19:40
 * @version
 */
public interface CarRecordDao {

	int findCountBycarRecord(Map<String, Object> map);

	int save(CarRecord carRecord);

	List<Map<String, Object>> selectCarRecordMap(Map<String, Object> map);

}
