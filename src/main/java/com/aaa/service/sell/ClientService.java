package com.aaa.service.sell;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.aaa.entity.PageVo;
import com.aaa.entity.sell.Client;

public interface ClientService {
	
	List<Map<String, Object>> selectClient(PageVo pagevo, Map<String, Object> map);

	List<Client> selectEditClient(Client client);
	
	List<Client> selectByCname(Client client);

	List<Object> selectEname(HttpSession session);
	
	String checkClientName(Client client);
	
	int gainTotalLineNum(Map<String, Object> map);
	
	int insertClient(Client client);

	int updateClient(Client client);

	int updateClientNum(Client client);
}
