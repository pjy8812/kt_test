package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.Map;

/**
 * <code>ProgramGroupUserVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class ProgramGroupUserVO extends ProgramGroupVO {
	String userId;
	
	/**
	 * 
	 */
	public ProgramGroupUserVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public ProgramGroupUserVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
