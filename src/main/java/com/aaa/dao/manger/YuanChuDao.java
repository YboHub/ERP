package com.aaa.dao.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.manger.YuanChu;

public interface YuanChuDao {

	int findCountyuanchu(Map<String, Object> map);

	List<Map<String, Object>> selectyuanchu(Map<String, Object> map);

	List<YuanChu> selectmaterialss(YuanChu yuanchu);

}
