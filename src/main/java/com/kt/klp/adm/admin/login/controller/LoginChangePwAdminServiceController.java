package com.kt.klp.adm.admin.login.controller;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;
import kr.co.iousoft.lib.util.RSAApiUtil;
import kr.co.iousoft.lib.util.RSAUtil;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* LoginChangePwAdminServiceController : 비밀번호 재설정 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.23       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.02.23
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping(value = "/ui/service/login/change")
public class LoginChangePwAdminServiceController extends AbstractController {

	public static final String API_URL_CHANGE_PASSWORD = "/v1/admin/change/password"; //비밀번호 변경
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 비밀번호 재설정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "")
	public @ResponseBody Map changePassword(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		HttpSession session = request.getSession();
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute(RSAUtil.RSA_WEB_KEY);
		String tempPwd = RSAUtil.decryptRsa(privateKey, vo.getAdminPw()); //복호화
		String oldPwd = RSAUtil.decryptRsa(privateKey, vo.getAdminOldPw()); //기존비밀번호
		//logger.debug("tempPwd={}", tempPwd);
		
		PublicKey publickey =  RSAApiUtil.initRsaAPi();
		String temp = RSAApiUtil.encryptRSA(tempPwd, publickey);
		vo.setAdminPw(temp);
		
		String tempOld = RSAApiUtil.encryptRSA(oldPwd, publickey);
		vo.setAdminOldPw(tempOld);
		//logger.debug("temp={}", temp);
		
		// set header
		Map<String, Object> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("adminPw", vo.getAdminPw());
		body.put("adminOldPw", vo.getAdminOldPw());  //기존비밀번호
		logger.debug("body={}", body);
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_CHANGE_PASSWORD, header, "POST", body);
		logger.debug("result={}", result);

		return result;
	}
	
}
