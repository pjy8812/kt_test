package kr.co.iousoft.lib.core.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.iousoft.lib.core.global.ServiceGlobal;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

public abstract class AbstractInterceptor extends HandlerInterceptorAdapter {

	@Resource(name="serviceGlobal")
	protected ServiceGlobal serviceGlobal;

	protected Logger logger = LogManager.getLogger(getClass());

	protected String page;

	/**
	 *
	 */
	public AbstractInterceptor() {
	}

	/**
	 * @return the page
	 */
	public String getPage() {
		return page;
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(String page) {
		this.page = page;
	}


	/**
	 * @param request
	 * @return
	 */
	protected SessionVO getSessionObject(HttpServletRequest request, HttpServletResponse response) {
		SessionVO sessionVO = serviceGlobal.getSessionVO(request, response);
		logger.debug("{}", sessionVO);
		return sessionVO;
	}

	public abstract boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception;

}
