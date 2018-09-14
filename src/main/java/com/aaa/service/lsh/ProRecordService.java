package com.aaa.service.lsh;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.aaa.entity.PageVo;

public interface ProRecordService {

	List<Map<String, Object>> selectAllProRecord(PageVo pageVo, Map<String, Object> map);

	int getAllCount(Map<String, Object> map);

	boolean toSaveProRecord(HttpSession session, String[] pronos, Double[] weights,
			int[] nums, String dnumber);

	List<Map<String, Object>> selectAllCapacity(Integer id);

	List<Map<String, Object>> getDoodsType();

}
