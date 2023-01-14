package com.kt.klp.adm.admin.base.common;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import kr.co.iousoft.lib.core.global.ServiceGlobal;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;
import kr.co.iousoft.lib.exception.NoAuthException;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* PageControllerPointcut : contoller pointcut
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2021.04.02      mijin.kim     Initial creation
* </pre>
*
* @author mijin.kim (mijin.kim@iousoft.co.kr)
* @since 2021.04.02
* @version 1.0.0
* @see
*
*/
@Component
@Aspect
public class PageControllerPointcut {
	
	public static final String  REFRESG_TOKEN_API_URL = "/v1/admin/token"; // refreshToken
	public static final String  AUTHORITY_API_URL = "/v1/admin/authority/list"; // 권한  
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	public static final String API_RESULT_CODE_EXPIRED = "50001"; 
	public static final int REFRESH_TOKEN_MIN = 10; // 만료시간 n분 전 토큰 재발급  
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	@Value("${spring.profiles}")
	private String profiles;
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource(name="serviceGlobal")
	protected ServiceGlobal serviceGlobal;

	@Before("execution(* com.kt.klp.adm.admin..controller.*Controller.*(..))")
	public void beforeServicePointcut(JoinPoint joinPoint) throws Exception {
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		ModelMap model = null;
		for (Object obj: joinPoint.getArgs()) {
			if (obj instanceof HttpServletRequest) request = (HttpServletRequest)obj;
			if (obj instanceof HttpServletResponse) response = (HttpServletResponse)obj;
			if (obj instanceof ModelMap) model = (ModelMap)obj;
		}
		if (request == null) return;

		SessionVO sessionVO = (SessionVO) request.getAttribute("User");
		//logger.debug("sessionVO={}", sessionVO);
		
		if (sessionVO != null && model != null) {
			model.addAttribute("User", sessionVO);
		}
		
		SessionVO session = (SessionVO) serviceGlobal.getSessionVO(request, response);
		
		if(session != null) {
			if(request != null && response != null) {
				//logger.debug("session={}", session);
				session = refreshToken(session);
				//logger.debug("refreshToken={}", session);
				//logger.info("serviceGlobal.setSessionVO");
				serviceGlobal.setSessionVO(request, response, null, session);
			}
		}
		
	}
	
	@Before("execution(* com.kt.klp.adm.admin..controller.*AdminPageController.*(..))")
	public void beforeAdminPagePointcut(JoinPoint joinPoint) throws Exception {
		
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		
		ModelMap model = null;
		
		for (Object obj: joinPoint.getArgs()) {
			if (obj instanceof HttpServletRequest) request = (HttpServletRequest)obj;
			if (obj instanceof HttpServletResponse) response = (HttpServletResponse)obj;
			if (obj instanceof ModelMap) model = (ModelMap)obj;
		}

		if (request == null) return;
		
		SessionVO sessionVO = (SessionVO) serviceGlobal.getSessionVO(request, response);
		
		if (sessionVO != null && model != null) {
			model.addAttribute("User", sessionVO);
		}
		
		// logger.debug("sessionVO={}", sessionVO);
		// logger.debug("request={}", request);
		
		if(sessionVO != null) {
			if(request != null && response != null) {
				Map resultMap = getAuthorization(sessionVO, request);
				Map<String, String> authMap = new HashMap<>();
				Map<String, String> autUriMap = new HashMap<>();
				Map<String, String> autMenuNameMap = new HashMap<>();
				Map<String, String> menuSortMap = new HashMap<>();
				List topMenuList = new ArrayList();
				List subMenuList = new ArrayList();
				if(resultMap != null && resultMap.get("resultCode") != null && resultMap.get("resultCode").equals(API_RESULT_CODE_SUCCESS) 
						&& resultMap.get("adminAuthGroup") != null) {
					
					List<Map> list = (List) resultMap.get("adminAuthGroup");
					for(Map item : list) {

						authMap.put(item.get("menuString").toString(), item.get("authorityCRUD").toString());
						// MAIN MENU - SUB MENU CNT 셋팅
						if (!item.get("childrenCnt").toString().equals("0")) {
							autMenuNameMap.put(item.get("menuUrl").toString(), item.get("childrenCnt").toString());
							
							Map<String, String> topMenuMap = new HashMap<>();
							topMenuMap.put("menuUrl"       , item.get("menuUrl").toString());
							topMenuMap.put("menuNm"        , item.get("menuNm").toString());
							topMenuMap.put("menuSort"      , item.get("menuSort").toString());
							topMenuList.add(topMenuMap);
						}
						
						// SUB MENU URL관리
						if (item.get("childrenCnt").toString().equals("0")) {
							autUriMap.put(item.get("menuUrl").toString(), item.get("authorityCRUD").toString());
							menuSortMap.put(item.get("menuUrl").toString(), item.get("authorityCRUD").toString());
							Map<String, String> subMenuMap = new HashMap<>();
							subMenuMap.put("upMenuNm"      , item.get("upMenuNm").toString());
							subMenuMap.put("menuNm"        , item.get("menuNm").toString());
							subMenuMap.put("menuSort"      , item.get("menuSort").toString());
							subMenuMap.put("menuUrl"       , item.get("menuUrl").toString());
							subMenuMap.put("menuString"    , item.get("menuString").toString());
							subMenuMap.put("authorityCRUD" , item.get("authorityCRUD").toString());
							subMenuList.add(subMenuMap);
						}						
					}
					// 계정관련 권한부여 
					autUriMap.put("/ui/page/login/change", "CRUD");
					
				} else {
					
					if(resultMap != null && resultMap.get("error") != null && resultMap.get("error").equals(LoginVO.INVALID_TOKEN)) {
						// 로그아웃
						request.getSession().removeAttribute("User");
						request.getSession().invalidate();
					}
					
					if((resultMap.get("resultCode") != null && resultMap.get("resultCode").equals(API_RESULT_CODE_EXPIRED))) {
						String page = "redirect:/error/expireLogin";
						ModelAndView modelAndView = new ModelAndView(page);
						throw new ModelAndViewDefiningException(modelAndView);
					}
				}				
				

				
				String pageUri = request.getRequestURI();
				String contextPath = request.getContextPath();
				
				if ("/".equals(contextPath)) contextPath = "";
				
				if (contextPath.length() > 0) {
					pageUri = pageUri.substring(contextPath.length());
				}
				
				// 권한 정보값
				String nowPageAuth = autUriMap.get(pageUri) == null ? null : autUriMap.get(pageUri).toString();
				
				//logger.debug("pageUri={}", pageUri);
				// logger.debug("nowPageAuth={}", nowPageAuth);
				
				//6개월이상 비밀번호변경 안했을경우 무조건 비밀번호 변경하도록 수정 by.2022.04.26 (보안이슈)
				if("Y".equals(sessionVO.getPwFlag())) {
					if(!pageUri.equals("/ui/page/login/change") ) {
						String page = "redirect:/ui/page/login/change";
						ModelAndView modelAndView = new ModelAndView(page);
						throw new ModelAndViewDefiningException(modelAndView);
					}
				}
				
				if(!pageUri.equals("/ui/page/dashboard/index") && (nowPageAuth == null || !nowPageAuth.contains("R"))) {
					// 이동하려는 페이지가 대시보드가 아니고, 권한값이 null 이거나 읽기 권한이 없으면 권한없음 페이지 이동  
					// throw new ServiceException("403", "NO AUTH");
					String page = "redirect:/error/noAuth";
					ModelAndView modelAndView = new ModelAndView(page);
					throw new ModelAndViewDefiningException(modelAndView);
				} else if(pageUri.equals("/ui/page/dashboard/index") && sessionVO.getAdminAuthorityGroupCode().equals(sessionVO.GROUP_CODE_MANUAL_DELIVERY)) {
					// 이동하려는 대시보드이고, 이용자의 권한그룹코드가 수동배차에 해당할 때 권한없음 페이지 이동 
					String page = "redirect:/error/noAuth";
					ModelAndView modelAndView = new ModelAndView(page);
					throw new ModelAndViewDefiningException(modelAndView);
				}
				
				request.setAttribute("_pageUri", pageUri);
				request.setAttribute("authMap", authMap);
				// request.setAttribute("autUriMap", slashToUnderbar(autUriMap));
				request.setAttribute("autUriList", mapToList(autUriMap));
				request.setAttribute("topMenuList", topMenuList);
				request.setAttribute("subMenuList", subMenuList);
				request.setAttribute("autMenuNameMap", autMenuNameMap);
				
				logger.debug("beforeAdminPagePointcut authMap={}", authMap);
				logger.debug("beforeAdminPagePointcut autUriMap={}", autUriMap);
				logger.debug("beforeAdminPagePointcut autMenuNameMap={}", autMenuNameMap);				
			}
		} else {
			throw new NoAuthException("no sessionVO");
		}
	}
	
	@Before("execution(* com.kt.klp.adm.admin..controller.*AdminServiceController.*(..))")
	public void beforeAdminPointcut(JoinPoint joinPoint) throws Exception{
		
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		
		ModelMap model = null;
		
		for (Object obj: joinPoint.getArgs()) {
			if (obj instanceof HttpServletRequest) request = (HttpServletRequest)obj;
			if (obj instanceof HttpServletResponse) response = (HttpServletResponse)obj;
			if (obj instanceof ModelMap) model = (ModelMap)obj;
		}

		if (request == null) return;
		
		SessionVO sessionVO = (SessionVO) serviceGlobal.getSessionVO(request, response);
		
		if(model != null && sessionVO != null) {
			model.addAttribute("User", sessionVO);
		}
		
		if (sessionVO != null) {
			
			if(request != null && response != null) {
				Map resultMap = getAuthorization(sessionVO, request);
				Map<String, String> authMap = new HashMap<>();
				Map<String, String> autUriMap = new HashMap<>();
				if(resultMap != null && resultMap.get("resultCode") != null && resultMap.get("resultCode").equals(API_RESULT_CODE_SUCCESS) 
						&& resultMap.get("adminAuthGroup") != null) {
					
					List<Map> list = (List) resultMap.get("adminAuthGroup");
					for(Map item : list) {
						
						authMap.put(item.get("menuString").toString(), item.get("authorityCRUD").toString());
						
						// SUB MENU URL관리
						if (item.get("childrenCnt").toString().equals("0")) {
							autUriMap.put(item.get("menuUrl").toString(), item.get("authorityCRUD").toString());
						}						
					}
					// 계정관련 권한부여 
					autUriMap.put("/ui/page/login/change", "CRUD");
					
				} else {
					
					if(resultMap != null && resultMap.get("error") != null && resultMap.get("error").equals(LoginVO.INVALID_TOKEN)) {
						// 로그아웃
						request.getSession().removeAttribute("User");
						request.getSession().invalidate();
					}
					
					if((resultMap.get("resultCode") != null && resultMap.get("resultCode").equals(API_RESULT_CODE_EXPIRED))) {
						String page = "redirect:/error/expireLogin";
						ModelAndView modelAndView = new ModelAndView(page);
						throw new ModelAndViewDefiningException(modelAndView);
					}
				}				
				
				
				logger.debug("beforeAdminPointcut authMap={}", authMap);
				logger.debug("beforeAdminPointcut autUriMap={}", autUriMap);
				
				/////////////////////////////////////////////////////////////////
				request.setAttribute("autUriList", mapToList(autUriMap));
			}
		} else {
			throw new NoAuthException("no sessionVO");
		}
	}
	
	
	/**
	 * 권한처리 
	 * 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	protected Map getAuthorization(SessionVO session, HttpServletRequest request) throws Exception {
		
		if(session == null) {
			return null;
		}
		
		Map<String, String> resultMap = new HashMap<>();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		param.put("id", session.getAdminId());
		param.put("refreshToken", session.getRefreshToken());
		
		// 권한 체크 API 
		Map result = WebFunctions.connectApi(ktapiAdmin + AUTHORITY_API_URL, header, "GET", param);
		//logger.debug("log1 : result={}", result);
		//logger.debug("log2 :param={}", param);
		//logger.debug("log3 :header={}", header);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS) 
				&& result.get("adminAuthGroup") != null) {
			
			List<Map> list = (List) result.get("adminAuthGroup");
			
			for(Map item : list) {
				resultMap.put(item.get("menuString").toString(), item.get("authorityCRUD").toString());
				// SUB MENU URL관리
				if (item.get("childrenCnt").toString().equals("0")) {
					resultMap.put(item.get("menuUrl").toString(), item.get("menuString").toString());
				}
			}
			
		} else {
			
			if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
				// 로그아웃
				request.getSession().removeAttribute("User");
				request.getSession().invalidate();
			}
			
			if((result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_EXPIRED))) {
				
				String page = "redirect:/error/expireLogin";
				ModelAndView modelAndView = new ModelAndView(page);
				throw new ModelAndViewDefiningException(modelAndView);
			}
		}
	
		return result;
	}
	
	/**
	 * 하위 메뉴 체크 
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	protected Map getAuthorizationByChildrenMenuName(Map map) throws Exception {

		if(map == null) return null;
		Map<String, Integer> resultMap = new HashMap<>();
		
		Iterator<String> keys = map.keySet().iterator();
		while (keys.hasNext()) {
		    String key = keys.next();
		    
		    Iterator<String> innerKeys = map.keySet().iterator();
		    if(!key.contains("|")) {
		    	int childrenCnt = 0;
		    	
		    	while (innerKeys.hasNext()) {
		    		String innerKey = innerKeys.next();
		    		if(innerKey.contains(key + "|")) {
		    			if(map.get(innerKey) != null && map.get(innerKey).toString().contains("R")) {
		    				childrenCnt++;
		    			}
		    		}
		    	}
		    	
				switch (key) {
				case "회원관리":
					resultMap.put("owner", childrenCnt);
					break;
				case "주문/배송":
					resultMap.put("order", childrenCnt);
					break;
				case "정산":
					resultMap.put("settlement", childrenCnt);
					break;
				case "APP/WEB":
					resultMap.put("help", childrenCnt);
					break;
				case "정책":
					resultMap.put("policy", childrenCnt);
					break;
				case "통계":
					resultMap.put("stats", childrenCnt);
					break;
				case "시스템":
					resultMap.put("system", childrenCnt);
					break;
				default:
					break;
				}
		    }
		    
		}
		
		return resultMap;
	}
	
	/**
	 * 권한관리 - 메뉴명 to Uri 
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	protected Map getAuthorizationByUri(Map map) throws Exception {
		
		if(map == null) return null;
		
		Map<String, String> resultMap = new HashMap<>();
		String commonPath = "/ui/page";
		
		Iterator<String> keys = map.keySet().iterator();
		while (keys.hasNext()) {
		    String key = keys.next();
		    logger.info("getAuthorizationByUri key:[" +  key + "]---" + key);
		    resultMap.put(commonPath + "/owner/frgown", map.get(key).toString());
		    
		    switch (key) {
		    
//		    case "회원관리" :  
//		    	resultMap.put(commonPath + "/owner", map.get(key).toString());
//		    	break;
		    case "회원관리|화주관리" :  
		    	resultMap.put(commonPath + "/owner/frgown", map.get(key).toString());
		    	break;
		    case "회원관리|차주관리" :  
		    	resultMap.put(commonPath + "/owner/carown", map.get(key).toString());
		    	break;
//		    case "주문/배송" :  
//		    	resultMap.put(commonPath + "/order", map.get(key).toString());
//		    	break;
		    case "주문/배송|주문/배송" :  
		    	resultMap.put(commonPath + "/order/mng", map.get(key).toString());
		    	break;
		    case "주문/배송|수동배차" :  
		    	resultMap.put(commonPath + "/order/manual", map.get(key).toString());
		    	break;
//		    case "정산관리" :  
//		    	resultMap.put(commonPath + "/settlement", map.get(key).toString());
//		    	break;
            case "정산|화주정산" :  
            	resultMap.put(commonPath + "/settlement/frgown", map.get(key).toString());
            	break;
            case "정산|차주정산" :  
            	resultMap.put(commonPath + "/settlement/carown", map.get(key).toString());
            	break;
//		    case "APP/WEB" :  
//		    	resultMap.put(commonPath + "/help", map.get(key).toString());
//		    	break;
            case "APP/WEB|공지사항" :  
            	resultMap.put(commonPath + "/help/notice", map.get(key).toString());
            	break;
            case "APP/WEB|FAQ" :  
            	resultMap.put(commonPath + "/help/faq", map.get(key).toString());
            	break;
            case "APP/WEB|1:1문의" :  
            	resultMap.put(commonPath + "/help/voc", map.get(key).toString());
            	break;
            case "APP/WEB|발송관리" :  
            	resultMap.put(commonPath + "/help/send", map.get(key).toString());
            	break;
            case "APP/WEB|매뉴얼" :  
            	resultMap.put(commonPath + "/help/manual", map.get(key).toString());
            	break;
//    		case "정책" :  
//		    	resultMap.put(commonPath + "/policy", map.get(key).toString());
//		    	break;
            case "정책|요금" :  
        		resultMap.put(commonPath + "/policy/charge", map.get(key).toString());
            	break;
            case "정책|패널티" :  
            	resultMap.put(commonPath + "/policy/penalty", map.get(key).toString());
            	break;
            case "정책|약관" :  
            	resultMap.put(commonPath + "/policy/terms", map.get(key).toString());
            	break;
//    		case "통계" :  
//		    	resultMap.put(commonPath + "/stats", map.get(key).toString());
//		    	break;
            case "통계|물량현황" :  
            	resultMap.put(commonPath + "/stats/amount", map.get(key).toString());
            	break;
            case "통계|차량현황" :  
            	resultMap.put(commonPath + "/stats/car", map.get(key).toString());
            	break;
            case "통계|이용자현황" :  
            	resultMap.put(commonPath + "/stats/user", map.get(key).toString());
            	break;
//    		case "시스템" :  
//		    	resultMap.put(commonPath + "/system", map.get(key).toString());
//		    	break;
            case "시스템|계정관리" :  
            	resultMap.put(commonPath + "/system/account", map.get(key).toString());
            	break;
            case "시스템|단말기정보" :  
            	resultMap.put(commonPath + "/system/device", map.get(key).toString());
            	break;
            case "시스템|공통코드" :  
            	resultMap.put(commonPath + "/system/code", map.get(key).toString());
            	break;
            case "시스템|메뉴관리":
            	resultMap.put(commonPath + "/system/menu", map.get(key).toString());
            	break;
            default: 
                     break;
		    }
        }
		
		// 계정관련 권한부여 
		resultMap.put(commonPath + "/login/change", "CRUD");
		
		return resultMap;
	}
	
	/**
	 * slash to underbar
	 * 사용하지 않음.
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
//	protected Map slashToUnderbar(Map map) throws Exception {
//		
//		if(map == null) return null;
//		
//		Map<String, String> resultMap = new HashMap<>();
//
//		Iterator<String> keys = map.keySet().iterator();
//		while (keys.hasNext()) {
//			 String key = keys.next();
//			 resultMap.put(key.replace("/", "_"), map.get(key).toString());
//		}
//		
//		return resultMap;
//	}
	
	/**
	 * Map to List
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	protected List<Map> mapToList(Map map) throws Exception {
		
		if(map == null) return null;
		
		List reusltList = new ArrayList();
		
		Iterator<String> keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			Map<String, String> item = new HashMap<>();
			item.put("key", key);
			item.put("value", map.get(key).toString());
			
			reusltList.add(item);
		}
		
		return reusltList;
	}
	
	/**
	 * accessToken 만료 {REFRESH_TOKEN_MIN}분 전 토큰 재발
	 * 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	protected SessionVO refreshToken(SessionVO session) throws Exception {
	
		if(session == null) return null;
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		param.put("id", session.getAdminId());
		param.put("refreshToken", session.getRefreshToken());
		
		Calendar cal = Calendar.getInstance();
		
//		logger.debug("refresh={}", session.getExpiredDate() - REFRESH_TOKEN_MIN * 60 * 1000);
//		logger.debug("refresh={}", cal.getTimeInMillis());
//		logger.debug("refresh?={}", session.getExpiredDate() - REFRESH_TOKEN_MIN * 60 * 1000 < cal.getTimeInMillis());
		
		if((session.getExpiredDate() - REFRESH_TOKEN_MIN * 60 * 1000 < cal.getTimeInMillis())) {
			Map result = WebFunctions.connectApiJson(ktapiAdmin + REFRESG_TOKEN_API_URL, header, "POST", param);
			logger.debug("result={}", result);
			if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
				if(result.get("access_token") != null && result.get("refresh_token") != null) {
					// API 응답값 오류로 추가 
					session.setAccessToken(result.get("access_token").toString());
					session.setRefreshToken(result.get("refresh_token").toString());
					
					int expiresIn = 0;
					long expiredMillis = 0;
					if(result.get("expires_in") != null) {
						String temp = result.get("expires_in").toString();
						expiresIn =  Integer.parseInt(temp);
						expiredMillis = cal.getTimeInMillis() + (expiresIn * 1000);
					}
					
					session.setExpiredDate(expiredMillis);
				}
			}
		}
		
		return session;
	}
	
}
