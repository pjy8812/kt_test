package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
 * <code>GroupUserVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class GroupUserVO extends CommonTableVO {
	String groupUserId;
	String groupId;
	String userId;

	/**
	 * 
	 */
	public GroupUserVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public GroupUserVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	public String getGroupUserId() {
		return groupUserId;
	}

	public void setGroupUserId(String groupUserId) {
		this.groupUserId = groupUserId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
