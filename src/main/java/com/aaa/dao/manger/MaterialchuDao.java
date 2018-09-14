package com.aaa.dao.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.manger.Material;

public interface MaterialchuDao {

	int findCountBymaterial(Map<String, Object> map);

	List<Map<String, Object>> selectmaterial(Map<String, Object> map);

	List<Material> selectma(Material material);

	Double select(String name);

	int update(Material material);

	int up(Material material);

	List<Material> selectbymaterial(Material material);

	int insert(Material material);

	int upda(Material material);

}
