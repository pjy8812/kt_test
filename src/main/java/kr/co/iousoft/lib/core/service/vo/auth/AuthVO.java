package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
 * <code>AuthVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class AuthVO extends CommonTableVO {
	String programId;
	String uri;
	String userId;
	
	boolean read;
	boolean create;
	boolean update;
	boolean delete;
	
	String authIp;

	/**
	 * 
	 */
	public AuthVO() {
	}

	/**
	 * @param map
	 */
	public AuthVO(Map map) {
		super(map);
	}
	
	protected void initMembers() {
		read = false;
		create = false;
		update = false;
		delete = false;
	}

	/**
	 * @return the programId
	 */
	public String getProgramId() {
		return programId;
	}

	/**
	 * @param programId the programId to set
	 */
	public void setProgramId(String programId) {
		this.programId = programId;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String servletRoot, String uri) {
		if (servletRoot != null) {
			setUri(uri.substring(servletRoot.length()));
		} else {
			setUri(uri);
		}
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public boolean hasRead() {
		return read;
	}

	public void setRead(boolean read) {
		this.read = read;
	}

	public boolean hasCreate() {
		return create;
	}

	public void setCreate(boolean create) {
		this.create = create;
	}

	public boolean hasUpdate() {
		return update;
	}

	public void setUpdate(boolean update) {
		this.update = update;
	}

	public boolean hasDelete() {
		return delete;
	}

	public void setDelete(boolean delete) {
		this.delete = delete;
	}

	/**
	 * @return the authIp
	 */
	public String getAuthIp() {
		return authIp;
	}

	/**
	 * @param authIp the authIp to set
	 */
	public void setAuthIp(String authIp) {
		this.authIp = authIp;
	}

}
