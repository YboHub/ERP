package com.aaa.controller.warehouse;

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
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.warehouseentity.Cpck;
import com.aaa.entity.warehouseentity.StockManager;
import com.aaa.service.warehouseservice.ProOutService;
import com.aaa.service.warehouseservice.StockManagerService;
import com.aaa.utils.GenerateNumber;
import com.aaa.utils.NowTimeUtil;
/**
 * 成品出库单
 * 类名称：ProOutController
 * 类描述： 
 * 创建人：wangyatao
 * 创建时间：2018-8-2 下午10:53:31
 * @version
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("proOut")
public class ProOutController {
	@Autowired
	private ProOutService proOutService;
	/**
	 * 跳转出库列表页面
	 * @return
	 */
	@RequestMapping("toList")
	public String proOutList(){
		return "food/productOutbound/proOutList";
	}
	/**
	 * 成品出库列表页面,模糊查询
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object selectAllStock(PageVo pageVo,String name,String value){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count=proOutService.findCountByMap(map);
		List<Map<String,Object>> proOutList=proOutService.selectProOut(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(proOutList);
		return dg;
	}
	
	/**
	 * 跳转出入库详情页面
	 * @param model
	 * @param orderno
	 * @return
	 */
	@RequestMapping("selOutDetails")
	public String toList(Model model,String orderno){
			model.addAttribute("orderno", orderno);
			return "food/productOutbound/selOutDetails";
	}
	/**
	 * 出库详情列表页面
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param orderno
	 * @return
	 */
	@RequestMapping("datagridOne")
	@ResponseBody
	public Object selOutDetails(PageVo pageVo,String name,String value,String orderno){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("orderno", orderno);
		//获取总行数
		int count=proOutService.findCountByMapOne(map);
		List<Map<String,Object>> pOutList=proOutService.selOutDetails(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(pOutList);
		return dg;
	}
	/**
	 * 库存总量
	 * @param model
	 * @param orderno
	 * @return
	 */
	@RequestMapping("datagridTwo")
	@ResponseBody
	public Object selAllGross(Model model,String orderno){
		List warehouseAll = proOutService.selWareAll(orderno);
		model.addAttribute("warehouseAll",warehouseAll);
		DataGrid dg= new DataGrid();
		dg.setRows(warehouseAll);
		return dg;
	}
	
	@RequestMapping("warehoueAllUnit")
	public String warehouseAllUnit(Model model,String orderno,Integer id){
		model.addAttribute("orderno",orderno);
		model.addAttribute("id",id);
		return "food/productOutbound/proOut";
	}
	/**
	 * 成品出库
	 * @param stockManager
	 * @param model
	 * @return
	 */
	@RequestMapping("outInventory")
	@ResponseBody
	public Object outInventory(HttpSession session,Integer id,Cpck cpck){
		List<Cpck> list=proOutService.selectOrderinfoById(id);//查询表中信息
		String ckname = (String) session.getAttribute("ename");//获取session值
		String rtime = NowTimeUtil.newTime();//自动生成时间
		String prefix = "C";
		String sno = proOutService.selectCKDH();//查询插入表id
		String ckdh = GenerateNumber.generaterNextNumber(sno, prefix);//自动生成出库单号
		Integer row = 0;
		/**
		 * 遍历出库数量
		 * 遍历商品型号
		 */
		for (int i=0;i<list.size();i++) {
			Integer prOut = list.get(i).getPnum();
			Integer pno =list.get(i).getPno();
			Double oldU = proOutService.selectGross(pno);
			if(prOut<oldU){
				row+=1;
			}else{
				row=0;
				break;
			}
		}
		if(row!=0){
			for(int j=0;j<list.size();j++){
				Integer pnum = list.get(j).getPnum();
				Integer pno =list.get(j).getPno();
				String orderno = list.get(j).getOrderno();
				Double oldUnit = proOutService.selectGross(pno);
				cpck.setOldUnit(oldUnit);
				cpck.setPnum(pnum);
				cpck.setPno(pno);
				cpck.setCtime(rtime);
				cpck.setCkname(ckname);
				cpck.setCkdh(ckdh);
				cpck.setOrderno(orderno);
				proOutService.reduceGross(cpck);
				proOutService.insertArod(cpck);
			}
			proOutService.updateProOut(id);
			return row;
		}else{
			return row;
		}
	}
}