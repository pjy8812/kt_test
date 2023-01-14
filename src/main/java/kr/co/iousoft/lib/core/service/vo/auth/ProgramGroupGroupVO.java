package kr.co.iousoft.lib.core.service.vo.auth;

import java.util.Map;

/**
 * <code>ProgramGroupGroupVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class ProgramGroupGroupVO extends ProgramGroupVO {
	String groupId;

	/**
	 * 
	 */
	public ProgramGroupGroupVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public ProgramGroupGroupVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

}
