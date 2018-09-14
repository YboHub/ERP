package com.aaa.service.impl.lsh;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lsh.UserDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Emp;
import com.aaa.entity.lsh.User;
import com.aaa.service.lsh.UserService;
import com.aaa.utils.MD5Util;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	/**
	 * 获取登陆账号信息
	 */
	@Override
	public List<Map<String, Object>> getLoginUser(User user) {
		return userDao.getLoginUser(user);
	}
	/**
	 * 获取登陆账号权限菜单
	 */
	@Override
	public Map<String, List> findMenuList(Object userid) {
		Map<String, List> map = new LinkedHashMap<String,List>();
		//查询出该用户对应角色的所有权限
		List<Map> list =  userDao.findMenuList(userid);
		for (Map  userMap: list) {
			List<Map> zList = new ArrayList<Map>();//存储子菜单
			String pid = userMap.get("pid").toString();
			if(pid.equals("0")){//如果是顶级菜单
				map.put(userMap.get("name").toString(),zList);
			}else{
				//查询出它的父菜单的名字
				String pname = "";
				for (Map  userMap1: list) {
					if(userMap.get("pid").equals(userMap1.get("id"))){
						pname = userMap1.get("name").toString();
						break;
					}
				}
				//如果map中已经存在父菜单就取出对应的子菜单集合加入
				if(map.get(pname)!=null){
					zList = map.get(pname);
				}
				zList.add(userMap);
			}
		}
		return map;
	}
	/**
	 * 获取用户列表总行数
	 */
	@Override
	public int getAllCountOfUserList(Map<String, Object> map) {
		return userDao.getAllCountOfUserList(map);
	}
	/**
	 * 获取用户列表集合
	 */
	@Override
	public List<Map<String, Object>> getUserList(PageVo pageVo,
			Map<String, Object> map) {
		int begin=pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end=pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return userDao.getUserList(map);
	}
	/**
	 * 获取指定用户信息
	 */
	@Override
	public List<Map<String, Object>> toEditUser(Integer empno) {
		return userDao.toEditUser(empno);
	}
	/**
	 * 获取部门列表
	 */
	@Override
	public List<Map<String, Object>> getDeptList() {
		return userDao.getDeptList();
	}
	/**
	 * 获取职位列表
	 */
	@Override
	public List<Map<String, Object>> getPositionList(Integer empno) {
		return userDao.getPositionList(empno);
	}
	/**
	 * 根据deptno查找该部门的所有职位
	 */
	@Override
	public List<Map<String, Object>> getPostByDeptno(String deptno) {
		return userDao.getPostByDeptno(deptno);
	}
	@Override
	public boolean updateUserInfo(Emp emp, User user) {
		//修改员工表里的员工信息
		int row=userDao.updateEmp(emp);
		//修改登陆表里的账号信息
		int rown=userDao.updateAccount(user);
		boolean flag=false;
		if (row==1&&rown==1) {
			flag=true;
		}
		return flag;
	}
	/**
	 * 删除用户信息
	 */
	@Override
	public int deleteUserInfo(String empno) {
		//获取员工信息
		List<Map<String, Object>> empList=userDao.getEmpInfoByEmpno(empno);
		//获取职位id
		int roleid=(int) empList.get(0).get("id");
		//在用户角色表中删除数据
		userDao.deleteUserRoleInfo(roleid);
		return userDao.deleteUserInfo(empno);
	}
	/**
	 * 通过员工编号获取员工信息
	 */
	@Override
	public List<Map<String, Object>> getEmpInfoByEmpno(String empno) {
		return userDao.getEmpInfoByEmpno(empno);
	}
	/**
	 * 搜索新增的账号在数据库中是否已经存在
	 */
	@Override
	public List<Map<String, Object>> searchAccFormAdmin(String account) {
		return userDao.searchAccFormAdmin(account);
	}
	/**
	 * 向数据中添加新增账号密码
	 */
	@Override
	public boolean saveAcc(User user) {
		//获取账号
		String account=user.getAccount();
		//获取密码
		String pwd=user.getPassword();
		//密码加密
		String password=MD5Util.getMd5(account+MD5Util.getMd5(pwd));
		//加密后的密码放入user中
		user.setPassword(password);
		//向登陆表里添加账号密码
		int row=userDao.saveAcc(user);
		//获取新插入数据id
		int userid=userDao.getUserId(user);
		//获取员工信息
		List<Map<String, Object>> empList=userDao.getEmpInfoByEmpno(user.getEmpno());
		//获取职位id
		int roleid=(int) empList.get(0).get("id");
		//向用户角色表中添加数据
		int num=userDao.saveUserRoleId(userid,roleid);
		boolean flag=false;
		if (row>0&&num>0) {
			flag=true;
		}
		return flag;
	}
	
}
