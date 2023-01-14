
package kr.co.iousoft.lib.core.service.vo.session;

import java.util.Date;
import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;


public class ServiceSessionVO extends CommonTableVO {
	private String serviceSessionId;
	private String serverId;
	private String campusId;
	private String userId;
	private Date loginDate;
	private Date lastAccessDate;
	private String userAgent;
	private String clientInfo;
	private String autoLogin;

	/**
	 * 
	 */
	public ServiceSessionVO() {
	}

	public ServiceSessionVO(Map map) {
		super(map);
	}
	
	protected void initMembers() {
		super.initMembers();
		setAutoLogin("N");
	}

	public String getServiceSessionId() {
		return serviceSessionId;
	}

	public void setServiceSessionId(String serviceSessionId) {
		this.serviceSessionId = serviceSessionId;
	}

	public String getServerId() {
		return serverId;
	}

	public String getCampusId() {
		return campusId;
	}

	public void setCampusId(String campusId) {
		this.campusId = campusId;
	}

	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public Date getLastAccessDate() {
		return lastAccessDate;
	}

	public void setLastAccessDate(Date lastAccessDate) {
		this.lastAccessDate = lastAccessDate;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getClientInfo() {
		return clientInfo;
	}

	public void setClientInfo(String clientInfo) {
		this.clientInfo = clientInfo;
	}

	public String getAutoLogin() {
		return autoLogin;
	}

	public void setAutoLogin(String autoLogin) {
		this.autoLogin = autoLogin;
	}

}
