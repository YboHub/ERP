package com.aaa.dao.sell;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.sell.Client;

public interface ClientDao {

	int gainTotalLineNum(Map<String, Object> map);

	List<Map<String, Object>> selectClient(Map<String, Object> map);

	int addClient(Client client);

	List<Client> selectEditClient(Client client);

	int updateClient(Client client);

	int updateClientNum(Client client);

	List<Client> selectByCname(Client client);

	List<Object> selectCname();

	Client selectEmpnoByEname(Client client);

	Client selectEnameByEmpno(Client client);

	List<Object> selectEname(@Param("deptno")String deptno);

	Map<String, String> selectDeptByEname(@Param("ename")String ename);

	Client selectClientByCname(Client client);

}
