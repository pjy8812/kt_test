package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
 * <code>GroupAuthVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class GroupAuthVO extends CommonTableVO {
	String groupAuthId;
	String groupId;
	String programId;
	String authReadYn;
	String authCreateYn;
	String authUpdateYn;
	String authDeleteYn;
	
	/**
	 * 
	 */
	public GroupAuthVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public GroupAuthVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	public String getGroupAuthId() {
		return groupAuthId;
	}

	public void setGroupAuthId(String groupAuthId) {
		this.groupAuthId = groupAuthId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getProgramId() {
		return programId;
	}

	public void setProgramId(String programId) {
		this.programId = programId;
	}

	public String getAuthReadYn() {
		return authReadYn;
	}

	public void setAuthReadYn(String authReadYn) {
		this.authReadYn = authReadYn;
	}

	public String getAuthCreateYn() {
		return authCreateYn;
	}

	public void setAuthCreateYn(String authCreateYn) {
		this.authCreateYn = authCreateYn;
	}

	public String getAuthUpdateYn() {
		return authUpdateYn;
	}

	public void setAuthUpdateYn(String authUpdateYn) {
		this.authUpdateYn = authUpdateYn;
	}

	public String getAuthDeleteYn() {
		return authDeleteYn;
	}

	public void setAuthDeleteYn(String authDeleteYn) {
		this.authDeleteYn = authDeleteYn;
	}
}
