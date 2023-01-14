package kr.co.iousoft.lib.core.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import kr.co.iousoft.lib.core.global.ServiceGlobal;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

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

public class AbstractController {
	protected Logger logger = LogManager.getLogger(getClass());

	@Resource(name = "serviceGlobal")
	protected ServiceGlobal serviceGlobal;
	
	@Value("${api.kthost}")
	private String ktHost;

	@InitBinder
	public void allowEmptyDateBinding(WebDataBinder binder) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, true));
	}

	public HashMap getResultHashMap(String errorCode, String errorMessage) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("errorCode", errorCode);
		map.put("errorMsg", errorMessage);
		HashMap<String, HashMap<String, String>> returnMap = new HashMap<String, HashMap<String, String>>();
		returnMap.put("error", map);
		return returnMap;
	}

	public SessionVO getSessionVO(HttpServletRequest request, HttpServletResponse response) {
		return serviceGlobal.getSessionVO(request, response);
	}
	
	public Map<String, String> getApiHeader() {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("apikey", "mA7LQneJG1uqPEJpyf4ldxoVnNpdeA2C");
		map.put("host", ktHost);
		
		return map;
	}
	
}
