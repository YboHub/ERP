package com.aaa.service.impl.manger;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.FormulaDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Formula;
import com.aaa.entity.manger.Manger;
import com.aaa.service.manger.FormulaService;
@Service
public class FormulaServiceImpl implements FormulaService {
@Autowired
private FormulaDao formulaDao;

@Override
public int findCountByplan(Map<String, Object> map) {
	return formulaDao.findCountByplan(map);
}


@Override
public List<Formula> selectformula(PageVo vo, Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	if(begin<0){
		begin=0;
	}
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return formulaDao.selectformula(map);
}


@Override
public int delete(Formula formula) {
	return formulaDao.delete(formula);
}


@Override
public int addformula(Formula formula) {
	return formulaDao.addformula(formula);
}


@Override
public List<Manger> selectmangers(Formula formula) {
	return formulaDao.selectmangers(formula);
}


@Override
public int updatemanger(Formula formula) {
	return formulaDao.updatemanger(formula);
}






}
