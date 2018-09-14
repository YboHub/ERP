package com.aaa.interceptor;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;
/**
 * 
 * 类名称：LogAspect
 * 类描述：aop日志
 * @author Aer
 * @date 2018-8-14 下午9:32:58
 * @version
 */
@Aspect
@Service
public class LogAspect {
	private static Logger logger = Logger.getLogger(LogAspect.class);  

	private String requestPath = null ; // 请求地址  
	private String userName = null ; // 用户名  
	private String eMessage = null;	//异常信息
	private Map<?,?> inputParamMap = null ; // 传入参数  
	private Map<String, Object> outputParamMap = null; // 存放输出结果  
	private long startTimeMillis = 0; // 开始时间  
	private long endTimeMillis = 0; // 结束时间  

	/**
	 * 切入点
	 */
	@Pointcut("execution(* com.aaa.service..*.*(..))")
	public void pointCut(){}
	/**
	 * 记录开始时间
	 * @param joinPoint
	 */
	@Before(value="pointCut()")  
	public void doBeforeInServiceLayer(JoinPoint joinPoint) {  
		startTimeMillis = System.currentTimeMillis(); 
	}  

	/** 
	 *  记录结束时间 
	 * @param joinPoint 
	 */  
	@After(value="pointCut()")  
	public void doAfterInServiceLayer(JoinPoint joinPoint) {  
		endTimeMillis = System.currentTimeMillis(); // 记录方法执行完成的时间  
	}  

	/**
	 * 环绕通知获取操作信息
	 * @param pjp
	 * @return
	 * @throws Throwable
	 */
	@Around(value="pointCut()")  
	public Object doAround(ProceedingJoinPoint pjp) throws Throwable {  
		/** 
		 * 1.获取request信息 
		 * 2.根据request获取session 
		 * 3.从session中取出登录用户信息 
		 */  
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();  
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;  
		HttpServletRequest request = sra.getRequest();  
		// 从session中获取用户信息  
		HttpSession session = request.getSession();
		String loginInfo = (String) session.getAttribute("account");  
		if(loginInfo != null && !"".equals(loginInfo)){  
			userName = loginInfo; 
		}else{  
			userName = "用户未登录" ;  
		}  
		// 获取输入参数  
		inputParamMap = request.getParameterMap();  
		// 获取请求地址  
		requestPath = request.getRequestURI();  

		// 执行完方法的返回值：调用proceed()方法，就会触发切入点方法执行  
		outputParamMap = new HashMap<String, Object>();  
		Object result = pjp.proceed();// result的值就是被拦截方法的返回值  
		outputParamMap.put("result", result);  

		return result;  
	}  
	/**
	 * 异常通知
	 */
	@AfterThrowing(value="pointCut()",throwing="e")
	public void exceptionAdvice(JoinPoint jp,Exception e){
		eMessage = e.getMessage();
		printOptLog();  
	}
	/** 
	 * 输出日志  
	 */  
	private void printOptLog() {  
		String optTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startTimeMillis);  
		logger.error("\r\n user："+userName  
				+"  url："+requestPath+"; opration_time：" + optTime + " process_time：" + (endTimeMillis - startTimeMillis) + "ms ;"  
				+" param："+JSONObject.toJSONString(inputParamMap)+";"+"\n result："+JSONObject.toJSONString(outputParamMap)+"exception :"+eMessage);  
	} 

}
