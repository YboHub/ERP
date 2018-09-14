package com.aaa.service.carRecord;
import java.util.List;
import java.util.Map;
import com.aaa.entity.PageVo;
import com.aaa.entity.carRecord.CarRecord;
/**
 * 类名称：CarRecordService
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:21:02
 * @version
 */
public interface CarRecordService {

	int findCountBycarRecord(Map<String, Object> map);

	List<Map<String, Object>> selectCarRecordMap(PageVo pageVo,Map<String, Object> map);

	int save(CarRecord carRecord);

}
