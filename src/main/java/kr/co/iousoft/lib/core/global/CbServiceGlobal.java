package kr.co.iousoft.lib.core.global;

import org.springframework.stereotype.Component;

import kr.co.iousoft.lib.core.global.AbstractServiceGlobal;


/**
*
* CbServiceGlobal : 시스템 서비스에서 공통으로 사용할 수 있는 기능을 모은 클래스
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2021.04.01       Byungjin Lim     Initial creation
* 2021.05.04	   Mijin Kim        오류코드 추가
* </pre>
*
* @author IOUSOFT Byungjin Lim (nomja@iousoft.co.kr)
* @since 2021.04.01
* @version 1.0.0
* @see
*
*/
@Component("serviceGlobal")
public class CbServiceGlobal extends AbstractServiceGlobal {
	public static final String SYSTEM_ID = "0";
	public static final String COOKIE_SERVICE_SESSION_ID = "_cb_sid";

	public static final String RESULT_SUCCESS = "success";
	public static final String RESULT_FAIL = "OP0000"; //실패
	public static final String RESULT_DUPLICATE = "OP0001";	//중복
	public static final String RESULT_NETWORK_ACCESS_SQN_NULL = "OPN001"; // network_access_sqn null값 인 경우

	public String getSystemId() {
		return SYSTEM_ID;
	}

	/* (non-Javadoc)
	 * @see com.nomja.lib.global.ServiceGlobal#getSeviceSessionIdName()
	 */
	@Override
	public String getServiceSessionIdName() {
		return COOKIE_SERVICE_SESSION_ID;
	}
}
