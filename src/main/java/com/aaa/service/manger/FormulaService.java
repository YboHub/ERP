package com.aaa.service.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Formula;
import com.aaa.entity.manger.Manger;

public interface FormulaService {

	int findCountByplan(Map<String, Object> map);

	List<Formula> selectformula(PageVo pagevo, Map<String, Object> map);

	int delete(Formula formula);

	int addformula(Formula formula);

	List<Manger> selectmangers(Formula formula);

	int updatemanger(Formula formula);

	


}
