package kr.co.iousoft.lib.core.global;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.LocaleResolver;

import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;
import kr.co.iousoft.lib.util.AESSimpleCrypto;

/**
 *
 * AbstractServiceGlobal : 서비스 공통 기능 처리 중 일반 기능 구현 클래스
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
public class AbstractServiceGlobal implements ApplicationContextAware, InitializingBean, ServiceGlobal {
	protected Logger logger = LogManager.getLogger(getClass());

	// @Value("${operating.portal.secret}") // "TODELETE"
	private String secretKey = "1234567890000ABC";

	@Resource(name = "localeResolver")
	protected LocaleResolver localeResolver;

	@Resource(name = "messageSource")
	protected MessageSource messageSource;

//	@Autowired
//	protected OpUserService opUserService;

	public String serverId = null;
	protected ApplicationContext applicationContext;
	protected WebApplicationContext webApplicationContext;

	String templateRoot = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.context.ApplicationContextAware#setApplicationContext(org
	 * .springframework.context.ApplicationContext)
	 */
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
		if (applicationContext instanceof WebApplicationContext) {
			this.webApplicationContext = (WebApplicationContext) applicationContext;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
	 */
	public void afterPropertiesSet() throws Exception {
		// server_id format [IP ADDRESS]:[CONTEXT_NAME]
		String hostAddress;
		try {
			InetAddress addr = InetAddress.getLocalHost();
			hostAddress = addr.getCanonicalHostName();
			if (hostAddress == null || hostAddress.length() == 0) {
				hostAddress = addr.getHostAddress();
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
			hostAddress = "" + System.currentTimeMillis();
		}
		String contextName = applicationContext.getId();
		if (webApplicationContext != null) {
			ServletContext servletContext = webApplicationContext.getServletContext();
			String contextPath = servletContext.getContextPath();
			contextName = String.format("%s(%s)", servletContext.getServletContextName(), contextPath);
		}

		serverId = String.format("%s:%s", hostAddress, contextName);
		// serverId = UtilFunctions.md5(serverId);
		serverId = AESSimpleCrypto.encrypt(secretKey, serverId);
		logger.debug("this server id is [" + serverId + "]");

	}

	public String getServerId() {
		return serverId;
	}

	public void setSessionVO(HttpServletRequest request, HttpServletResponse response, String serviceSessionId,
			SessionVO sessionObject) {
		if (request != null) {
			request.getSession().setAttribute("User", sessionObject);
			request.getSession().setMaxInactiveInterval(sessionObject.getExpiresIn());
		}
	}

	public void setLocale(HttpServletRequest request, HttpServletResponse response, SessionVO sessionObject) {

		logger.debug("setLocale");
	}

	public String getMessage(String code, String langCd) {
		return getMessage(code, null, new Locale(langCd));
	}

	public String getMessage(String code, Object[] o, String langCd) {
		return getMessage(code, o, new Locale(langCd));
	}

	public String getMessage(String code, Locale locale) {
		return getMessage(code, null, locale);
	}

	public String getMessage(String code, Object[] o, Locale locale) {
		try {
			return messageSource.getMessage(code, o, locale);
		} catch (NoSuchMessageException e) {
			return code + ":" + locale;
		}
	}

	@Override
	public SessionVO getSessionVO(HttpServletRequest request, HttpServletResponse response) {
		SessionVO sessionObject = (SessionVO) request.getSession().getAttribute("User");
		return sessionObject;
	}

	@Override
	public SessionVO getSessionVO(String serviceSessionId) {
		// SessionVO sessionVO = null;
		return null;
	}


	@Override
	public SessionVO login(HttpServletRequest request, HttpServletResponse response, LoginVO loginVO) throws Exception {
		SessionVO sessionVO = null;

		// 사용자 정보조회
//		Map info = opUserService.getUser(loginVO);
//
//		if (info == null) {
//			// 운영포탈 사용자 등록
//			OpUserVO opUserVO = new OpUserVO(loginVO.toMap());
//			opUserVO.setUserId(loginVO.getLoginId());
//			opUserVO.setCreateUserSqn(0);
//			opUserService.insertUser(opUserVO);
//		} else {
//			sessionVO = new SessionVO(info);
//
//			// 운영포탈 사용자 정보수정
//			OpUserVO opUserVO = new OpUserVO(info);
//			opUserVO.setUserName(loginVO.getUserName());
//			opUserVO.setLoginFailCnt(0);
//			opUserVO.setModifyUserSqn(opUserVO.getUserSqn());
//			opUserService.UpdateUser(opUserVO);
//		}
//
//		// 등록 수정된 사용자정보 다시 조회하여 세션 정보 수정 및 로그인 history 등록
//		info = opUserService.getUser(loginVO);
//		sessionVO = new SessionVO(info);
//
//		OpLoginHisVO opLoginHisVO = new OpLoginHisVO(info);
//		opLoginHisVO.setLoginYn(loginVO.getLoginYn());
//		opLoginHisVO.setNote(OpLoginHisVO.NOTE_LOGIN_SUCCESS);
//		opUserService.insertOpLoginHistory(opLoginHisVO);
//
//		setSessionVO(request, response, null, sessionVO);
//		return sessionVO;
		
		return null;
	}

	@Override
	public SessionVO logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		if (sessionVO == null)
			return null;
		request.getSession().removeAttribute("User");

		return sessionVO;
	}

	@Override
	public String getSystemId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServiceSessionIdName() {
		// TODO Auto-generated method stub
		return null;
	}

}
