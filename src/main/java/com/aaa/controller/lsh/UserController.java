package com.aaa.controller.lsh;

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
import com.aaa.entity.emp.Emp;
import com.aaa.entity.lsh.User;
import com.aaa.service.lsh.UserService;
import com.aaa.utils.MD5Util;

@Controller
@RequestMapping("login")
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 声明菜单map集合
	 */
	private Map<String,List> menuMap;
	/**
	 * 根据登陆用户获取菜单列表
	 * @return
	 */
	
	@RequestMapping(value="toLogin")
    public String toLogin(){
        return "login/login";
    }
    /*
     * @ModelAttribute，使用该注解能将请求传过来的值封装到对应的user对象的参数名称中去
     */
    @RequestMapping(value="/vaild")
    //@ResponseBody
    public String vail(HttpSession session,User user,Model model){
        String msg="";
        //获取登陆账号信息
        List<Map<String, Object>> userList = userService.getLoginUser(user);
        if(userList.size()<1 || userList==null){
            //没有登录成功
        	msg = "用户名或密码错误";
        }else{
        	//密码加密
          	String password=MD5Util.getMd5(user.getAccount()+MD5Util.getMd5(user.getPassword()));
        	if (userList.get(0).get("account").equals(user.getAccount())&&userList.get(0).get("password").equals(password)) {
        		//如果验证通过,将用户账号的值塞到session中
                session.setAttribute("account", user.getAccount());
                session.setAttribute("ename", userList.get(0).get("ename"));
                session.setAttribute("userId", userList.get(0).get("id"));
                //获取登陆账号权限菜单
        		menuMap = userService.findMenuList(userList.get(0).get("id"));
        		model.addAttribute("menuMap", menuMap);
        		return "login/houtai";
			}else{
				msg="用户名或密码错误";
			}
        }
        model.addAttribute("msg", msg);
		return "login/login";
    }
    
    /**
     * 跳转登陆用户信息列表页面
     */
    @RequestMapping("toUserList")
    public String toUserList(){
    	return "login/usersList";
    }
    /**
     * 获取登陆用户信息列表
     */
    @RequestMapping("userList")
    @ResponseBody
    public Object getUserList(PageVo pageVo,String name,String value){
    	Map<String, Object> map=new HashMap<String, Object>();
		map.put("value", value);
		map.put("name", name);
		//获取用户列表总行数
		int count=userService.getAllCountOfUserList(map);
		//获取用户列表集合
		List<Map<String, Object>> proRecordList=userService.getUserList(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);
		dg.setRows(proRecordList);
		return dg;
    }
    /**
     * 弹出编辑框
     * @param empno
     * @param model
     * @return
     */
    @RequestMapping("toEdit")
    public String toEditUser(Integer empno,Model model){
    	//获取指定用户信息
    	List<Map<String, Object>> users=userService.toEditUser(empno);
    	//获取部门列表
    	List<Map<String, Object>> deptList=userService.getDeptList();
    	//获取职位列表
    	List<Map<String, Object>> positionList=userService.getPositionList(empno);
    	model.addAttribute("users", users.get(0));
    	model.addAttribute("deptList", deptList);
    	model.addAttribute("positionList", positionList);
    	return "login/usersEdit";
    }
    /**
     * 根据deptno查找该部门的所有职位
     * @param deptno
     * @return
     */
    @RequestMapping("getPost")
    @ResponseBody
    public Object getPostByDeptno(String deptno){
    	//根据deptno查找该部门的所有职位
    	List<Map<String, Object>> positionList=userService.getPostByDeptno(deptno);
    	return positionList;
    }
    /**
     * 修改用户信息
     * @return
     */
    @RequestMapping("update")
    @ResponseBody
    public boolean updateUserInfo(Emp emp,User user){
    	return userService.updateUserInfo(emp,user);
    }
    /**
     * 删除用户信息
     * @param empno
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public Object deleteUserInfo(String empno){
    	int row=userService.deleteUserInfo(empno);
    	return row;
    }
    /**
     * 跳转添加用户账号页面
     * @return
     */
    @RequestMapping("toAdd")
    public String toAddUserInfo(){
    	return "login/usersAdd";
    }
    /**
     * 通过员工编号获取员工信息
     * @return
     */
    @RequestMapping("getEmp")
    @ResponseBody
    public Object getEmpInfoByEmpno(String empno){
    	//通过员工编号获取员工信息
    	List<Map<String, Object>> empInfo=userService.getEmpInfoByEmpno(empno);
    	return empInfo;
    }
    /**
     * 搜索新增的账号在数据库中是否已经存在
     * @param account
     * @return
     */
    @RequestMapping("checkAcc")
    @ResponseBody
    public Object searchAccFormAdmin(String account){
    	//搜索新增的账号在数据库中是否已经存在
    	List<Map<String, Object>> acc=userService.searchAccFormAdmin(account);
    	return acc;
    }
    
    /**
     * 向数据中添加新增账号密码
     * @param user
     * @return
     */
    @RequestMapping("save")
    @ResponseBody
    public boolean saveAcc(User user){
    	return userService.saveAcc(user);
    }
    
    
    
    
    
    
    
    
    
}
