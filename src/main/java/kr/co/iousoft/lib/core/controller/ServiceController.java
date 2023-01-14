package kr.co.iousoft.lib.core.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* ServiceController : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.16       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.16
* @version 1.0.0
* @see
*
*/
public class ServiceController extends AbstractController {
	
	@ExceptionHandler({ Exception.class })
	public @ResponseBody HashMap exception(HttpServletRequest request, Exception exception) throws Exception {
		logger.debug(request.getRequestURL().toString());
		//exception.printStackTrace();

		String message = exception.getLocalizedMessage();
		if (message == null || message.isEmpty()) {
			message = exception.getMessage();
			if (message == null || message.isEmpty()) {
				message = exception.getClass().getName();
			}
		}

		return getResultHashMap("ERROR", message);
	}

	@ExceptionHandler({ ServiceException.class })
	public @ResponseBody HashMap serviceException(HttpServletRequest request, ServiceException exception)
			throws Exception {
		logger.debug(request.getRequestURL().toString());
		exception.printStackTrace();

		String errorCode = exception.getErrorCode();
		if (errorCode == null || errorCode.isEmpty()) {
			errorCode = "ERROR";
		}
		String message = exception.getLocalizedMessage();
		if (message == null || message.isEmpty()) {
			message = exception.getMessage();
			if (message == null || message.isEmpty()) {
				message = exception.getClass().getName();
			}
		}

		return getResultHashMap(errorCode, message);
	}
}
