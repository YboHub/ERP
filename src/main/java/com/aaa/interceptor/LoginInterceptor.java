package com.aaa.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.aaa.utils.StringUtils;

public class LoginInterceptor implements HandlerInterceptor {
	private static final Logger log = Logger.getLogger(LoginInterceptor.class);
    /**
     * 不拦截的后缀
     */
	private List<String> excludeMappingUrl;//不拦截的后缀通过Spring-mvc.xml配置文件中配置

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}
	/**
	 * 在方法前执行了拦截器
	 * return false 拦截请求
	 * return true 执行我们的控制器
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
//		System.out.println("进入拦截器");
        String url = request.getRequestURI();//获取请求的URL
//      System.out.println(url);
        String postFix = null;       //后缀
        // 查看是否是静态文件，如果是静态文件，放行
        if(StringUtils.isNotEmpty(url)){
            int index = url.lastIndexOf(".");//获取.操作最后出现的位置的下标
            if(index > -1){//说明索引的位置可以以“.”开头
                postFix = url.substring(index);//拿到该URL的后缀
                if(StringUtils.isNotEmpty(postFix)&&excludeMappingUrl.contains(postFix)){
                    //静态文件，默认处理
                    return true;
                }
            }else if(!url.contains("/vaild")&&!url.contains("/toLogin")){
                //判断session是否存在
                HttpSession session = request.getSession();
                if(session.getAttribute("account")==null){
                    //说明session中不存在用户的登录信息
                    //可在这里写关于转发的操作.不存在的情况就转发到登录页面中去
                    log.info("Interceptor：跳转到login页面！");  
                    request.getRequestDispatcher("/index.jsp").forward(request, response); 
                    return false;
                }
                return true;//包含以上两个URL是开始就进入的页面操作
            }
        }
        return true;
	}

	public List<String> getExcludeMappingUrl() {
		return excludeMappingUrl;
	}

	public void setExcludeMappingUrl(List<String> excludeMappingUrl) {
		this.excludeMappingUrl = excludeMappingUrl;
	}

}
