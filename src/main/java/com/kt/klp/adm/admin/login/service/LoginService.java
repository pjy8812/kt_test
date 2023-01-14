package com.kt.klp.adm.admin.login.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* LoginService : 로그인 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.03.04       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.03.04
* @version 1.0.0
* @see
*
*/

@Service("loginService")
public class LoginService extends AbstractServiceImpl {
	
	public static final String API_URL_REQUEST_OTP = "/v1/otp/admin/authentication/request"; //인증번호(OTP) 요청
	public static final String API_URL_OTP = "/v1/otp/admin/authentication/%s"; //인증번호(OTP) 검증 {otpNum}
	public static final String API_URL_RESET_PW = "/v1/admin/reset_pw"; //비밀번호 재발급
	
	public static final String API_URL_REQUEST_OTP_TYPE = "sms";
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;


	/**
	 * OTP 요청
	 * @param request
	 * @param vo
	 * @return
	 */
	public Map requestLoginOtp(HttpServletRequest request, LoginVO vo) {
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("id", vo.getAdminId());
		body.put("type", API_URL_REQUEST_OTP_TYPE);
		body.put("ip",  UtilFunctions.getClientIP(request)); // 보안검증으로 인하여 클라이언트IP 추가 2022.04.19 
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_REQUEST_OTP, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * OTP 검증 
	 * @param request
	 * @param vo
	 * @return
	 */
	public Map verifyLoginOtp(HttpServletRequest request, LoginVO vo) {
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("id", vo.getAdminId());
		body.put("ip",  UtilFunctions.getClientIP(request)); // 보안검증으로 인하여 클라이언트IP 추가 2022.04.19 
		
		String url = String.format(ktapiAdmin+API_URL_OTP, vo.getOtpNum());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 임시비밀번호 요청
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 */
	public Map requestTempPassword(HttpServletRequest request, SessionVO session, LoginVO vo) {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("adminId", vo.getAdminId());
		body.put("adminTelephone", vo.getAdminTelephone());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_RESET_PW, header, "POST", body);
		//logger.debug("{}", result);
		
		return result;
	}

}
