package kr.co.iousoft.lib.core.global;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.iousoft.lib.core.service.vo.auth.AuthVO;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;

public interface ServiceGlobal {

	String getSystemId();
	String getServerId();
	String getServiceSessionIdName();
	SessionVO getSessionVO(HttpServletRequest request, HttpServletResponse response);
	SessionVO getSessionVO(String serviceSessionId) throws Exception;

	void setSessionVO(HttpServletRequest request, HttpServletResponse response, String serviceSessionId, SessionVO sessionObject);

	void setLocale(HttpServletRequest request, HttpServletResponse response, SessionVO sessionObject);
	public String getMessage(String code, String langCd);
	public String getMessage(String code, Object[] o, String langCd);
	public String getMessage(String code, Locale locale);
	public String getMessage(String code, Object[] o, Locale locale);
// 	public DatabaseDrivenMessageSource getMessageSource();
//	public Locale getDefaultLanguage();

	// public String getServletRoot();

	public SessionVO login(HttpServletRequest request, HttpServletResponse response, LoginVO loginVO) throws Exception;
	public SessionVO logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
