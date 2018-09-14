package com.aaa.dao.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.manger.Material;

public interface MaterialssDao {

	int findCountBymaterial(Map<String, Object> map);

	List<Map<String, Object>> selectmaterial(Map<String, Object> map);

	List<Material> select(Integer mid);

	int toUpdate(Material material);

	int tooUpdate(Material material);

}
