
package kr.co.iousoft.lib.core.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.NoAuthException;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* AbstractController :
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2021.04.01       Byungjin Lim     Initial creation
* </pre>
*
* @author IOUSOFT Byungjin Lim (nomja@iousoft.co.kr)
* @since 2021.04.01
* @version 1.0.0
* @see
*
*/

public class PageController extends AbstractController {
	
	protected SessionVO initPage(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		SessionVO sessionVO = serviceGlobal.getSessionVO(request, response);
		model.addAttribute("sessionVO", sessionVO);
		String contextPath = request.getContextPath();
		String pageUri = request.getRequestURI();
		if (!contextPath.equals("/")) {
			pageUri = pageUri.substring(contextPath.length());
		}
		if (pageUri.indexOf("#") > 0) {
			pageUri = pageUri.substring(0, pageUri.indexOf("#"));
		}
		model.addAttribute("pageUri", pageUri);
		
		return sessionVO;
	}

	@ExceptionHandler({ Exception.class })
	public ModelAndView exception(HttpServletRequest request, Exception exception) throws Exception {
		logger.debug(request.getRequestURL().toString());
		exception.printStackTrace();
		ModelAndView model = new ModelAndView();
		String message = exception.getLocalizedMessage();
		if (message == null || message.isEmpty()) {
			message = exception.getMessage();
			if (message == null || message.isEmpty()) {
				message = exception.getClass().getName();
			}
		}
		model.addObject("errorMsg", exception.getLocalizedMessage());
		SessionVO sessionVO = serviceGlobal.getSessionVO(request, null);
		model.addObject("sessionVO", sessionVO);

		logger.debug(exception.getLocalizedMessage());
		return model;
	}
	@ExceptionHandler({ ServiceException.class })
	public ModelAndView serviceException(HttpServletRequest request, ServiceException exception) throws Exception {
		logger.debug(request.getRequestURL().toString());
		logger.debug(exception.getLocalizedMessage());
		exception.printStackTrace();
		
		ModelAndView model = new ModelAndView();
		String message = exception.getLocalizedMessage();
		model.addObject("errorMsg", message);
		SessionVO sessionVO = serviceGlobal.getSessionVO(request, null);
		model.addObject("sessionVO", sessionVO);

		logger.debug(message);
		return model;
	}
	
	@ExceptionHandler({ NoAuthException.class })
	public String noAuthException(HttpServletRequest request, NoAuthException exception) throws Exception {
		logger.debug(request.getRequestURL().toString());
		logger.debug(exception.getLocalizedMessage());
		exception.printStackTrace();
		
		ModelAndView model = new ModelAndView();
		String message = exception.getLocalizedMessage();
		model.addObject("errorMsg", message);

		logger.debug(message);
		return "redirect:/";
	}

}
