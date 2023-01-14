package com.kt.klp.adm.admin.login.controller;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.login.service.LoginService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;
import kr.co.iousoft.lib.util.RSAApiUtil;
import kr.co.iousoft.lib.util.RSAUtil;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* LoginServiceController : 로그인 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.26       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.01.26
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping(value = "/ui/service/login")
public class LoginServiceController extends AbstractController {
	
	public static final String API_URL_LOGIN = "/v1/admin/login"; 	//로그인
	public static final String API_URL_LOGOUT = "/v1/admin/logout"; //로그아웃

	@Resource(name = "loginService")
	protected LoginService loginService;
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 로그인
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "")
	public @ResponseBody Map login(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		HttpSession session = request.getSession();
		
		//복호화
		PrivateKey privateKey = (PrivateKey) session.getAttribute(RSAUtil.RSA_WEB_KEY);
		String tempPwd = RSAUtil.decryptRsa(privateKey, vo.getAdminPw()); 
		//logger.debug("tempPwd={}", tempPwd);
		
		//API전달을 위해 암호화
		PublicKey publickey =  RSAApiUtil.initRsaAPi();
		String temp = RSAApiUtil.encryptRSA(tempPwd, publickey);
		vo.setAdminPw(temp);
		//logger.debug("temp={}", temp);
		
		//set header
		Map<String, Object> header = new HashMap<>();
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("adminId", vo.getAdminId());
		body.put("adminPw", vo.getAdminPw());
		//logger.debug("body={}", body);
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_LOGIN, header, "POST", body);
		logger.debug("result={}", result);
		
		//복호화
		PrivateKey apiKey = RSAApiUtil.initPrivate();
		if(result.get("adminName") != null) {
			String adminName = result.get("adminName").toString();
			adminName = RSAApiUtil.decryptRSA(adminName, apiKey);
			result.put("adminName", adminName);
		}
		
		
		if(result.get("adminAddress1") != null) {
			String adminAddress1 = result.get("adminAddress1").toString();
			adminAddress1 = RSAApiUtil.decryptRSA(adminAddress1, apiKey);
			result.put("adminAddress1", adminAddress1);
		}
		
		if(result.get("adminAddress2") != null) {
			String adminAddress2 = result.get("adminAddress2").toString();
			adminAddress2 = RSAApiUtil.decryptRSA(adminAddress2, apiKey);
			result.put("adminAddress2", adminAddress2);
		}
		
		if(result.get("adminEmail") != null) {
			String adminEmail = result.get("adminEmail").toString();
			adminEmail = RSAApiUtil.decryptRSA(adminEmail, apiKey);
			result.put("adminEmail", adminEmail);
		}
		
		
		if(result.get("adminAuthorityGroupName") != null) {
			String adminAuthorityGroupName = result.get("adminAuthorityGroupName").toString();
			adminAuthorityGroupName = RSAApiUtil.decryptRSA(adminAuthorityGroupName, apiKey);
			result.put("adminAuthorityGroupName", adminAuthorityGroupName);
		}
		
		if(result.get("adminEmployeeNum") != null) {
			String adminEmployeeNum = result.get("adminEmployeeNum").toString();
			adminEmployeeNum = RSAApiUtil.decryptRSA(adminEmployeeNum, apiKey);
			result.put("adminEmployeeNum", adminEmployeeNum);
		}
		
		if(result.get("adminAuthorityGroupCode") != null) {
			String adminAuthorityGroupCode = result.get("adminAuthorityGroupCode").toString();
			adminAuthorityGroupCode = RSAApiUtil.decryptRSA(adminAuthorityGroupCode, apiKey);
			result.put("adminAuthorityGroupCode", adminAuthorityGroupCode);
		}
		
		
		
		/*
		// otp 검증으로 제외예정 s
		result.put("accessToken", result.get("access_token"));
		result.put("refreshToken", result.get("refresh_token"));
		result.put("tokenType", result.get("token_type"));
		result.put("expiresIn", result.get("expires_in"));
		result.remove("access_token");
		result.remove("refresh_token");
		result.remove("token_type");
		result.remove("expires_in");
		
		if(result != null) {
			if(result.get("resultCode") != null && result.get("resultCode").equals("00000")) {
				SessionVO sessionVO = new SessionVO(result);
				sessionVO.setAdminId(vo.getAdminId());
				
				serviceGlobal.setSessionVO(request, response, null, sessionVO);
			}
		}
		// otp 검증으로 제외예정 e
		*/

		return result;
	}
	
	/**
	 * 로그인 OTP 요청
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/otp.request")
	public @ResponseBody Map requestLoginOtp(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		return loginService.requestLoginOtp(request, vo);
	}
	
	/**
	 * 로그인 OTP 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/otp.popup")
	public String loginOtpPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		return "/html/login/OtpPopup";
	}
	
	/**
	 * 로그인 OTP 검증
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/otp.verify")
	public @ResponseBody Map verifyLoginOtp(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		HttpSession session = request.getSession();
		
		String adminPw = vo.getAdminPw(); //로그인시 비밀번호 재 사용하기 위하여 변수 선언
		//복호화
		PrivateKey privateKey = (PrivateKey) session.getAttribute(RSAUtil.RSA_WEB_KEY);
		String tempPwd = RSAUtil.decryptRsa(privateKey, vo.getAdminPw()); 
		//logger.debug("tempPwd={}", tempPwd);
		
		//API전달을 위해 암호화
		PublicKey publickey =  RSAApiUtil.initRsaAPi();
		String temp = RSAApiUtil.encryptRSA(tempPwd, publickey);
		//logger.debug("temp={}", temp);
		vo.setAdminPw(temp);
		
		Map result = loginService.verifyLoginOtp(request, vo);
		
		if(result != null) {
			if(result.get("resultCode") != null && result.get("resultCode").equals("00000")) {
				vo.setAdminPw(adminPw);
				Map<String, Object> loginInfo = login(request, response, model, vo);
				if(loginInfo != null) {
					loginInfo.put("accessToken", loginInfo.get("access_token"));
					loginInfo.put("refreshToken", loginInfo.get("refresh_token"));
					loginInfo.put("tokenType", loginInfo.get("token_type"));
					loginInfo.put("expiresIn", loginInfo.get("expires_in"));
					loginInfo.remove("access_token");
					loginInfo.remove("refresh_token");
					loginInfo.remove("token_type");
					loginInfo.remove("expires_in");
					logger.debug("loginInfo={}", loginInfo);
					
					if(loginInfo.get("adminPwModifyDate") != null) {
						if(!(loginInfo.get("adminPwModifyDate") instanceof String)) {
							// String 아닐 경우 변환 
							loginInfo.put("adminPwModifyDate", loginInfo.get("adminPwModifyDate").toString());
						}
						
						Date today = new Date();
						//비밀변경일이 6개월 이상일 경우 비밀번호 재설정 화면으로 가도록 추가 2022.04.22
						long adminPwModifyDate = Long.parseLong(loginInfo.get("adminPwModifyDate").toString());
						Date tempAdminPwModifyDate = new Date(adminPwModifyDate);
						Calendar cal = Calendar.getInstance();
						cal.setTime(tempAdminPwModifyDate);
						cal.add(Calendar.DATE, 180);
						
						
						 String pwFlag = "N";
						//model.addAttribute("adminPwModifyDate", session.getAdminPwModifyDate());
						//model.addAttribute("pwDate", cal.getTimeInMillis());
						//model.addAttribute("today", today.getTime());
						if(cal.getTimeInMillis() <= today.getTime()) {
							pwFlag = "Y";
						}
						
						result.put("pwFlag", pwFlag);
						loginInfo.put("pwFlag", pwFlag);
					}
					
					if(loginInfo.get("resultCode") != null && loginInfo.get("resultCode").equals("00000")) {
						
						SessionVO sessionVO = new SessionVO(loginInfo);
						sessionVO.setAdminId(vo.getAdminId());

						// 만료시간 
						Calendar cal = Calendar.getInstance();
						
						// String SDF_YYYYMMDDD_HHMMSS = "yyyy.MM.dd HH:mm:ss";
						// SimpleDateFormat sdf = new SimpleDateFormat(SDF_YYYYMMDDD_HHMMSS);
						// sdf.format(cal.getTime());
						
						long expiredMillis = cal.getTimeInMillis() + ((int) loginInfo.get("expiresIn") * 1000);
						
						// logger.debug("login={}", sdf.format(cal.getTime()));
						// logger.debug("expire={}", sdf.format(expiredMillis));
						
						sessionVO.setExpiredDate(expiredMillis);
						//logger.info("serviceGlobal.setSessionVO");
						serviceGlobal.setSessionVO(request, response, null, sessionVO);
						request.removeAttribute(RSAUtil.RSA_WEB_KEY); //개인키 삭제
					}
				}
			}
		}
		
		return result;
	}
	
	/**
	 * 비밀번호 재설정 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/change.popup")
	public String changePasswordPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		return "/html/login/ChangePasswordPopup";
	}
	
	/**
	 * 임시비밀번호 발송요청
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/change.request")
	public @ResponseBody Map tempPassword(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		return loginService.requestTempPassword(request, session, vo);
	}
	
	/**
	 * 로그아웃
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout")
	public @ResponseBody Map logout(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		
		SessionVO sessionVO = getSessionVO(request, response);
		if (sessionVO == null) return null;
		
		// error, result code 무시하고 로그아웃 처리(2022.03.15 임시적용)
		Map result = new HashMap<>();
		
		if(vo.getAccessToken()==null || vo.getAccessToken().equals("")) {
			// 토큰이 없을경우 api 보내지않고 세션 제거
			logger.debug("access token is null");
			
		} else {
			// set header
			Map<String, Object> header = new HashMap<>();
			header.put(WebFunctions.HEADER_AUTHORIZATION, vo.getAccessToken());
			header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
			header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
			
			result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_LOGOUT, header, "GET", null);
			logger.debug("result={}", result);
		}
		
		request.getSession().removeAttribute("User");
		
		
		/*
		Map result = new HashMap<>();
		
		if(vo.getAccessToken()==null || vo.getAccessToken()=="") {
			logger.debug("access token is null");
			
			// 토큰이 없을경우 api 보내지않고 세션 제거
			SessionVO sessionVO = getSessionVO(request, response);
			if (sessionVO == null) return null;
			request.getSession().removeAttribute("User");
			
		} else {
			// set header
			Map<String, Object> header = new HashMap<>();
			header.put(WebFunctions.HEADER_AUTHORIZATION, vo.getAccessToken());
			header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
			
			result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_LOGOUT, header, "GET", null);
			logger.debug("result={}", result);
			
			if(result != null) {
				if( (result.get("resultCode") != null && result.get("resultCode").equals("00000"))
				|| (result.get("error") != null && result.get("error").equals("invalid_token")) ) {
					
					SessionVO sessionVO = getSessionVO(request, response);
					if (sessionVO == null) return null;
					request.getSession().removeAttribute("User");
				}
			}
		}
		*/

		return result;
	}

}
