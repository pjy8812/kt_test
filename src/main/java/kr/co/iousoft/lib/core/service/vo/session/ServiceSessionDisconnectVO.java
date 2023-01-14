
package kr.co.iousoft.lib.core.service.vo.session;

import java.util.Date;
import java.util.Map;

/**
 * <code>DleServiceSessionDisconnectVO</code>
 *
 * @author Nomja(nomja@corpdle.com)
 * @since 2021.04.01
 * @version 1.0
 */
public class ServiceSessionDisconnectVO extends ServiceSessionVO {
	public static final String DISCONNECT_REASON_SESSION_TIME_OUT = "SESSION_TIME_OUT";
	public static final String DISCONNECT_REASON_LOGOUT = "LOGOUT";
	
	private Date disconnectDate;
	private String disconnectReason;

	/**
	 * 
	 */
	public ServiceSessionDisconnectVO() {
	}

	/**
	 * @param map
	 */
	public ServiceSessionDisconnectVO(Map map) {
		super(map);
	}	
	
	protected void initMembers() {
		super.initMembers();
		disconnectDate = new Date();
	}

	public Date getDisconnectDate() {
		return disconnectDate;
	}

	public void setDisconnectDate(Date disconnectDate) {
		this.disconnectDate = disconnectDate;
	}

	public String getDisconnectReason() {
		return disconnectReason;
	}

	public void setDisconnectReason(String disconnectReason) {
		this.disconnectReason = disconnectReason;
	}

}
