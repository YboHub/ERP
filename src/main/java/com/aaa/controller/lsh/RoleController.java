package com.aaa.controller.lsh;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.lsh.Positions;
import com.aaa.service.lsh.RoleService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	private List<Map> roleList;//角色信息
	private Integer roleid;//角色id
	private String ids;//菜单id字段串
	/**
	 * 跳转职位信息列表页面
	 * @return
	 */
	@RequestMapping("toRoleList")
	public String toRoleList(){
		return "login/roleList";
	}
	/**
	 * 获取职位信息列表
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("roleList")
	@ResponseBody
	public Object getRoleList(PageVo pageVo,String name,String value){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("value", value);
		map.put("name", name);
		//获取职位列表总行数
		int count=roleService.getAllRoleList(map);
		//获取职位列表集合
		List<Map<String, Object>> proRecordList=roleService.getRoleList(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);
		dg.setRows(proRecordList);
		return dg;
	}
	/**
	 * 获取权限树
	 * @throws IOException
	 */
	@RequestMapping("ztree")
	public String ztree(HttpServletRequest req,Model model,Integer roleid) throws IOException{
		/**
		 * 获取已授权的信息
		 * 
		 * 默认先显示amdin的信息
		 */
		if(roleid==null||roleid==0){
			roleid = 1;
		}
		Set<String> idSet = roleService.findRoleFunByRoleId(roleid);
		
		/**
		 * 获取所有角色信息
		 */
		roleList = roleService.findAllRole();
		model.addAttribute("roleList", roleList);
		model.addAttribute("roleid", roleid);
		/**
		 * 获取所有菜单
		 */
		List<Map> list = roleService.findAllFunction();
		JSONArray array = new JSONArray();//json数组
		for (Map map : list) {
			JSONObject obj = new JSONObject();//json对象
			obj.put("id", map.get("id"));
			obj.put("pId", map.get("pid"));
			obj.put("name", map.get("name"));
			//如果是已授权的菜单 默认选中
			if(idSet.contains(map.get("id").toString())){
				obj.put("checked", true);
			}
			array.add(obj);
		}
		req.setAttribute("zTreeNodes", array);
		return "login/ztree";
	}
	/**
	 * 保存授权信息
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("save")
	@ResponseBody
	public Object saveRoleFunc(Integer roleid, String ids){
		int row=roleService.saveRoleFunc(roleid,ids);
		return row;
	}
	/**
	 * 跳转修改职位页面
	 * @param id
	 * @return
	 */
	@RequestMapping("editRole")
	public String toEditRole(Integer id,Model model){
		//通过id获取职位信息
		List<Map<String, Object>> role=roleService.getPostById(id);
		model.addAttribute("role", role);
		return "login/roleEdit";
	}
	/**
	 * 提交修改职位信息
	 * @param positions
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public boolean toUpdateRole(Positions positions){
		//提交修改职位信息
		return roleService.toUpdateRole(positions);
	}
	/**
	 * 弹出新增页面
	 * @param model
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAddRole(Model model){
		//获取所有部门信息
		List<Map<String, Object>> deptList=roleService.getDeptList();
		model.addAttribute("deptList",deptList);
		return "login/roleAdd";
	}
	/**
	 * 提交新增职位信息
	 * @param positions
	 * @return
	 */
	@RequestMapping("saveRole")
	@ResponseBody
	public boolean toInsertRole(Positions positions){
		//提交新增职位信息
		return roleService.toInsertRole(positions);
	}
	/**
	 * 通过id删除指定职位
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public int delRole(Integer id){
		return roleService.delRole(id);
	}
}
