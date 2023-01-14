package com.kt.klp.adm.admin.policy.domain;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* PenaltyVO : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.05.09       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.05.09
* @version 1.0.0
* @see
*
*/
public class PenaltyVO extends CommonTableVO {

	public static final String METHOD_INSERT = "insert";
	public static final String METHOD_UPDATE = "update";

	public static final String API_RESULT_SUCCESS_CNT = "succCnt";
	public static final String API_RESULT_STATUS = "status";
	public static final String API_RESULT_STATUS_SUCCESS = "200";
	
	String penaltyFic;
	String nameFic;
	
	String penaltyFld;
	String nameFld;
	
	String month1Type;
	String month2Type;
	String month3Type;
	
	String method;
	String workerId;

	public String getPenaltyFic() {
		return penaltyFic;
	}

	public void setPenaltyFic(String penaltyFic) {
		this.penaltyFic = penaltyFic;
	}

	public String getNameFic() {
		return nameFic;
	}

	public void setNameFic(String nameFic) {
		this.nameFic = nameFic;
	}

	public String getPenaltyFld() {
		return penaltyFld;
	}

	public void setPenaltyFld(String penaltyFld) {
		this.penaltyFld = penaltyFld;
	}

	public String getNameFld() {
		return nameFld;
	}

	public void setNameFld(String nameFld) {
		this.nameFld = nameFld;
	}

	public String getMonth1Type() {
		return month1Type;
	}

	public void setMonth1Type(String month1Type) {
		this.month1Type = month1Type;
	}

	public String getMonth2Type() {
		return month2Type;
	}

	public void setMonth2Type(String month2Type) {
		this.month2Type = month2Type;
	}

	public String getMonth3Type() {
		return month3Type;
	}

	public void setMonth3Type(String month3Type) {
		this.month3Type = month3Type;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}
	
}
