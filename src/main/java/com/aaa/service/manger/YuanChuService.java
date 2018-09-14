package com.aaa.service.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.manger.YuanChu;

public interface YuanChuService {

	int findCountyuanchu(Map<String, Object> map);

	List<Map<String, Object>> selectyuanchu(PageVo pagevo,
			Map<String, Object> map);

	List<YuanChu> selectmaterialss(YuanChu yuanchu);

}
