package com.aaa.service.impl.sell;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.sell.ClientDao;
import com.aaa.entity.Constant;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.Client;
import com.aaa.service.sell.ClientService;
import com.alibaba.fastjson.JSONObject;
@Service
public class ClientServiceImpl implements ClientService {
	@Autowired
	private ClientDao clientDao;
	/**
	 * 获取数据行数
	 */
	@Override
	public int gainTotalLineNum(Map<String, Object> map) {
		return clientDao.gainTotalLineNum(map);
	}
	/**
	 * 客户列表
	 */
	@Override
	public List<Map<String, Object>> selectClient(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return clientDao.selectClient(map);
	}
	/**
	 * 添加客户
	 */
	@Override
	public int insertClient(Client client) {
		try {
			client.setEmpno(clientDao.selectEmpnoByEname(client).getEmpno());
		} catch (NullPointerException e) {
			System.out.println("未选择业务员");
		}
		client.setCarea(client.getProvince()+client.getCity()+client.getArea()+client.getAddress());
		return clientDao.addClient(client);
	}
	/**
	 * 查询编辑客户信息
	 */
	@Override
	public List<Client> selectEditClient(Client client) {
		return clientDao.selectEditClient(client);
	}
	/**
	 * 更该客户信息
	 */
	@Override
	public int updateClient(Client client) {
		client.setEmpno(clientDao.selectEmpnoByEname(client).getEmpno());
		return clientDao.updateClient(client);
	}
	/**
	 * 客户编号生成
	 */
	@Override
	public int updateClientNum(Client client) {
		client.setCno(client.getId()+Constant.CLIENT_NUM);
		return clientDao.updateClientNum(client);
	}
	/**
	 * 根据客户名称查询客户信息
	 */
	@Override
	public List<Client> selectByCname(Client client) {
		return clientDao.selectByCname(client);
	}
	/**
	 * 查询员工名称
	 */
	@Override
	public List<Object> selectEname(HttpSession session) {
		String ename = (String) session.getAttribute("ename");
		Map<String, String> deptMap = clientDao.selectDeptByEname(ename);
		String deptno = deptMap.get("deptno");
		return clientDao.selectEname(deptno);
	}
	/**
	 * 名称唯一性验证
	 */
	@Override
	public String checkClientName(Client client) {
		Client clientInfo = clientDao.selectClientByCname(client);
		boolean result = false;
		if (clientInfo==null) {
			result = true;
		}
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		map.put("valid", result);
		String res = JSONObject.toJSONString(map);
		return res;
	}

}
