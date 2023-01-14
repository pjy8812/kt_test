package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
 * <code>GroupAuthSaveVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class GroupAuthSaveVO extends CommonTableVO {
	List<String> groupAuthId;
	List<String> groupId;
	List<String> programId;
	List<String> authReadYn;
	List<String> authCreateYn;
	List<String> authUpdateYn;
	List<String> authDeleteYn;

	/**
	 * 
	 */
	public GroupAuthSaveVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public GroupAuthSaveVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}
	
	protected void initMembers() {
		super.initMembers();
		groupAuthId = new ArrayList<String>();
		groupId = new ArrayList<String>();
		programId = new ArrayList<String>();
		authReadYn = new ArrayList<String>();
		authCreateYn = new ArrayList<String>();
		authUpdateYn = new ArrayList<String>();
		authDeleteYn = new ArrayList<String>();
	}

	public List<String> getGroupAuthId() {
		return groupAuthId;
	}

	public void setGroupAuthId(List<String> groupAuthId) {
		this.groupAuthId = groupAuthId;
	}

	public List<String> getGroupId() {
		return groupId;
	}

	public void setGroupId(List<String> groupId) {
		this.groupId = groupId;
	}

	public List<String> getProgramId() {
		return programId;
	}

	public void setProgramId(List<String> programId) {
		this.programId = programId;
	}

	public List<String> getAuthReadYn() {
		return authReadYn;
	}

	public void setAuthReadYn(List<String> authReadYn) {
		this.authReadYn = authReadYn;
	}

	public List<String> getAuthCreateYn() {
		return authCreateYn;
	}

	public void setAuthCreateYn(List<String> authCreateYn) {
		this.authCreateYn = authCreateYn;
	}

	public List<String> getAuthUpdateYn() {
		return authUpdateYn;
	}

	public void setAuthUpdateYn(List<String> authUpdateYn) {
		this.authUpdateYn = authUpdateYn;
	}

	public List<String> getAuthDeleteYn() {
		return authDeleteYn;
	}

	public void setAuthDeleteYn(List<String> authDeleteYn) {
		this.authDeleteYn = authDeleteYn;
	}
}
