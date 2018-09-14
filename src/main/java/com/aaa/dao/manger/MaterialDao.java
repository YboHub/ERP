package com.aaa.dao.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.manger.Material;

public interface MaterialDao {

	int findCountBymaterial();

	List<Map<String, Object>> selectmaterial(Map<String, Object> map);

	int deletematerial(Material material);

	int addmanger(Material material);

	List<Map<String, Object>> selectmaterialss(Material material);

}
