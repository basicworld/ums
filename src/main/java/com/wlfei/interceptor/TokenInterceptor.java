package com.wlfei.interceptor;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wlfei.Annotation.TokenValid;
import com.wlfei.pojo.Sysuser;
import com.wlfei.pojo.Token;
import com.wlfei.service.SysuserService;
import com.wlfei.service.TokenService;

public class TokenInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SysuserService userService;
	@Autowired
	TokenService tokenService;
	private static final Log logger = LogFactory.getLog(TokenInterceptor.class);

	/**
	 * 在业务处理器处理请求之前被调用 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链 如果返回true
	 * 执行下一个拦截器,直到所有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链,
	 * 从最后一个拦截器往回执行所有的postHandle() 接着再从最后一个拦截器往回执行所有的afterCompletion()
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 如果不是映射到方法，直接通过
		if (!(handler instanceof HandlerMethod)) {
			return true;
		}
		HandlerMethod handlerMethod = ((HandlerMethod) handler);

		Method method = handlerMethod.getMethod();
		// 获取方法上的tokenvalid注解
		TokenValid tokenValid = method.getAnnotation(TokenValid.class);

		// 如果方法上有tokenValid注解
		if (tokenValid != null) {
			String tokenString = request.getHeader("TOKEN");
			logger.info("tokenString:::" + tokenString);
			Token token = tokenService.select(tokenString);
			if (null != token) {
				return true;
			}

			logger.warn("未登录用户无法请求" + method.getName() + "方法，跳转至登陆页面");
			response.sendRedirect("login");
			return false;
		}
		return true;

	}

	/**
	 * 在业务处理器处理请求执行完成后,生成视图之前执行的动作 可在modelAndView中加入数据，比如当前时间
	 */

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等
	 * 
	 * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
	 */

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}