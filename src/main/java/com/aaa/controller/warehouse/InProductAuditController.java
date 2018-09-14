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
import com.aaa.entity.warehouseentity.StockManager;
import com.aaa.service.warehouseservice.InProductAuditService;
import com.aaa.utils.GenerateNumber;
import com.aaa.utils.NowTimeUtil;
/**
 * 
 * 类名称：InProductAuditController
 * 类描述： 成品入库审核
 * 创建人：wangyatao
 * 创建时间：2018-8-16 下午8:09:55
 * @version
 */
@Controller
@RequestMapping("inProAut")
public class InProductAuditController {
	@Autowired
	private InProductAuditService inProductAudit;
	/**
	 * 跳转成品入库审核页面
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(){
		return "food/inProAutList";
	}
	/**
	 * 成品入库审核列表,模糊搜索
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object selectAllInpro(PageVo pageVo,String name,String value){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count=inProductAudit.findCountByMap(map);
		List<Map<String,Object>> foodList=inProductAudit.selectAllInpro(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(foodList);
		return dg;
	}
	/**
	 * 跳转入库单详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("audDetails")
	public String toList(Model model,Integer id){
			model.addAttribute("id", id);
			return "food/auditDetails";
	}
	/**
	 * 审核详情列表,模糊搜索
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param id
	 * @return
	 */
	@RequestMapping("datagridOne")
	@ResponseBody
	public Object selectAllDetails(PageVo pageVo,String name,String value,Integer id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("id", id);
		//获取总行数
		int count=inProductAudit.findCountByMapOne(map);
		List<Map<String,Object>> AuditList=inProductAudit.selectAllDetails(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(AuditList);
		return dg;
	}
	/**
	 * 跳转点击入库审核界面
	 * @param stockManager
	 * @param model
	 * @return
	 */
	@RequestMapping("ProductAudit")
	public String ProductAudit(StockManager stockManager,Model model){
		List<Map> editList = inProductAudit.productAudit(stockManager);
		model.addAttribute("editList", editList);
		return "food/productAudit";
	}
	/**
	 * 成品审核(通过)
	 * @param stockManager
	 * @return
	 */
	@RequestMapping("passVerification")
	@ResponseBody
	public Object savePeoInc(StockManager stockManager,HttpSession session){
		String PurList=inProductAudit.rukudanhao();
		String sno=PurList;
		String prefix="C";
		String danhao=GenerateNumber.generaterNextNumber(sno, prefix);
		String Nowtime=NowTimeUtil.newTime();
		String qualityname = (String) session.getAttribute("ename");
		stockManager.setAudittime(Nowtime);
		stockManager.setVerifyman(qualityname);
		stockManager.setRkdh(danhao);
		int row  =  inProductAudit.savepassVerification(stockManager);
		int rowtwo  =  inProductAudit.savepassVerificationtwo(stockManager);
		return row;
	}
	/**
	 * 成品审核(驳回)
	 * @param stockManager
	 * @return
	 */
	@RequestMapping("failedPass")
	@ResponseBody
	public Object failedPass(StockManager stockManager,HttpSession session,Integer id){
		inProductAudit.selectStockById(id);//查询驳回量
		String scripList = inProductAudit.rkdhScrip();//生成入库单号
		String sno = scripList;
		String prefix="R";
		String rkdh = GenerateNumber.generaterNextNumber(sno, prefix);
		String Nowtime = NowTimeUtil.newDateTime();
		String rname = (String) session.getAttribute("ename");
		stockManager.setAudittime(Nowtime);
		stockManager.setVerifyman(rname);
		stockManager.setRkdh(rkdh);
		Double oldUnit = inProductAudit.selectZong();//查询废品库存总量
		stockManager.setZong(oldUnit);
		inProductAudit.addFeiPZong(stockManager);//驳回  添加到废品库存总量
		int row  =  inProductAudit.failedPass(stockManager);//驳回成功修改状态
		int  rowthree = inProductAudit.insertWaste(stockManager);//驳回信息添加到废品入库记录中
		return row;
	}
}
