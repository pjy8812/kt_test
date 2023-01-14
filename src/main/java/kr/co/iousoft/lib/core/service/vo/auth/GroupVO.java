package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
 * <code>GroupVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class GroupVO extends CommonTableVO {
	String groupId;
	String groupCode;
	String groupName;
	String upGroupId;

	/**
	 * 
	 */
	public GroupVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public GroupVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}
	protected void initMembers() {
		super.initMembers();
		upGroupId = "0";
	}

	/**
	 * @return the groupId
	 */
	public String getGroupId() {
		return groupId;
	}

	/**
	 * @param groupId the groupId to set
	 */
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	/**
	 * @return the groupCode
	 */
	public String getGroupCode() {
		return groupCode;
	}

	/**
	 * @param groupCode the groupCode to set
	 */
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	/**
	 * @return the groupName
	 */
	public String getGroupName() {
		return groupName;
	}

	/**
	 * @param groupName the groupName to set
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	/**
	 * @return the upGroupId
	 */
	public String getUpGroupId() {
		return upGroupId;
	}

	/**
	 * @param upGroupId the upGroupId to set
	 */
	public void setUpGroupId(String upGroupId) {
		this.upGroupId = upGroupId;
	}
	
	
}
