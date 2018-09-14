package com.aaa.controller.sell;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.Client;
import com.aaa.service.sell.ClientService;
import com.alibaba.fastjson.JSONObject;
/**
 * 
 * 类名称：ClientController
 * 类描述：客户
 * @author Aer
 * @date 2018-8-6 下午4:16:11
 * @version
 */
@Controller
@RequestMapping("/client")
public class ClientController {
	@Autowired
	private ClientService clientService;
	/**
	 * 跳转列表页面
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(){
		return "sell/client/client_list";
	}
	/**
	 * 列表显示
	 * @param pagevo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = clientService.gainTotalLineNum(map);
		//数据库分页
		List<Map<String,Object>> empList = clientService.selectClient(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(empList);
		return dg;
	}
	/**
	 * 跳转添加页面
	 * @param model
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(Model model, HttpSession session){
		List<Object> enameList = clientService.selectEname(session);
		model.addAttribute("enameList", enameList);
		return "sell/client/client_add";
	}
	/**
	 * 保存添加信息
	 * @param client
	 * @return
	 */
	@RequestMapping("toSave")
	@ResponseBody
	public int toSave(Client client){
		int row = clientService.insertClient(client);
		int upd = 0;
		if (row>0) {
			upd = clientService.updateClientNum(client);
		}
		return upd;
	}
	/**
	 * 跳转编辑页面
	 * @param client
	 * @param model
	 * @return
	 */
	@RequestMapping("toEdit")
	public String toEdit(Client client, Model model, HttpSession session){
		List<Object> enameList = clientService.selectEname(session);
		List<Client> editList = clientService.selectEditClient(client);
		model.addAttribute("enameList", enameList);
		model.addAttribute("editList", editList);
		return "sell/client/client_edit"; 
	}
	/**
	 * 保存更改信息
	 * @param client
	 * @return
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public int toUpdate(Client client){
		int row = clientService.updateClient(client);
		return row;
	}
	/**
	 * 查询客户信息
	 * @param client
	 * @return
	 */
	@RequestMapping("toSelectByCname")
	@ResponseBody
	public Object toSelectByCname(Client client){
		List<Client> clientInfoList = clientService.selectByCname(client);
		return clientInfoList;
	}
	/**
	 * 客户名称唯一性校验
	 * @param client
	 * @return
	 */
	@RequestMapping("checkClientName")
	@ResponseBody
	public String checkClientName(Client client){
		String result = clientService.checkClientName(client);
		return result;
	}
	
}
