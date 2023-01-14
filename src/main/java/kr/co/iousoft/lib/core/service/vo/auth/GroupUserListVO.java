package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <code>GroupUserListVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class GroupUserListVO extends GroupUserVO {
	List<String> userList;
	/**
	 * 
	 */
	public GroupUserListVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public GroupUserListVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	protected void initMemebers() {
		super.initMembers();
		userList = new ArrayList<String>();
	}

	public List<String> getUserList() {
		return userList;
	}

	public void setUserList(List<String> userList) {
		this.userList = userList;
	}
	
	
}
