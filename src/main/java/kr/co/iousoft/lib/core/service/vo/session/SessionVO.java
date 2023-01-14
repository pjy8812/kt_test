package kr.co.iousoft.lib.core.service.vo.session;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* SessionVO : 세션 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.22       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.02.22
* @version 1.0.0
* @see
*
*/

public class SessionVO extends CommonTableVO {

	public static final String GROUP_CODE_MANUAL_DELIVERY  = "manualDelivery";
	
	String adminId;
	String adminPw;
	
	String adminName;
	String adminTelephone;
	String adminAddress1;
	String adminAddress2;
	String adminEmail;
	int adminAuthorityGroupSeq;		//권한그룹
	String adminAuthorityGroupName;	//권한그룹명
	String adminEmployeeNum;		//사번
	String adminPwModifyDate;		//비밀번호 마지막 수정일시
	String resultCode;
	String resultMsg;
	
	String accessToken;
	String refreshToken;
	String tokenType;				//토큰종류
	int expiresIn;					//토큰만료
	
	Long expiredDate;
	
	List adminAuthGroup;
	String adminAuthorityGroupCode;
	BigDecimal Status;
	String pwFlag; //6개월이상 비밀번호 flag 추가 by.2022.04.26 mijin.kim
	
	public SessionVO() {
		// TODO Auto-generated constructor stub
	}	
	
	public SessionVO(Map map) {
		super(map);
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminAddress1() {
		return adminAddress1;
	}

	public void setAdminAddress1(String adminAddress1) {
		this.adminAddress1 = adminAddress1;
	}

	public String getAdminAddress2() {
		return adminAddress2;
	}

	public void setAdminAddress2(String adminAddress2) {
		this.adminAddress2 = adminAddress2;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public int getAdminAuthorityGroupSeq() {
		return adminAuthorityGroupSeq;
	}

	public void setAdminAuthorityGroupSeq(int adminAuthorityGroupSeq) {
		this.adminAuthorityGroupSeq = adminAuthorityGroupSeq;
	}

	public String getAdminAuthorityGroupName() {
		return adminAuthorityGroupName;
	}

	public void setAdminAuthorityGroupName(String adminAuthorityGroupName) {
		this.adminAuthorityGroupName = adminAuthorityGroupName;
	}

	public String getAdminEmployeeNum() {
		return adminEmployeeNum;
	}

	public void setAdminEmployeeNum(String adminEmployeeNum) {
		this.adminEmployeeNum = adminEmployeeNum;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	public String getTokenType() {
		return tokenType;
	}

	public void setTokenType(String tokenType) {
		this.tokenType = tokenType;
	}

	public int getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(int expiresIn) {
		this.expiresIn = expiresIn;
	}

	public String getAdminPwModifyDate() {
		return adminPwModifyDate;
	}

	public void setAdminPwModifyDate(String adminPwModifyDate) {
		this.adminPwModifyDate = adminPwModifyDate;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public Long getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(Long expiredDate) {
		this.expiredDate = expiredDate;
	}

	public String getAdminTelephone() {
		return adminTelephone;
	}

	public void setAdminTelephone(String adminTelephone) {
		this.adminTelephone = adminTelephone;
	}

	public List getAdminAuthGroup() {
		return adminAuthGroup;
	}

	public void setAdminAuthGroup(List adminAuthGroup) {
		this.adminAuthGroup = adminAuthGroup;
	}

	public String getAdminAuthorityGroupCode() {
		return adminAuthorityGroupCode;
	}

	public void setAdminAuthorityGroupCode(String adminAuthorityGroupCode) {
		this.adminAuthorityGroupCode = adminAuthorityGroupCode;
	}

	public BigDecimal getStatus() {
		return Status;
	}

	public void setStatus(BigDecimal status) {
		Status = status;
	}

	/**
	 * @return the pwFlag
	 */
	public String getPwFlag() {
		return pwFlag;
	}

	/**
	 * @param pwFlag the pwFlag to set
	 */
	public void setPwFlag(String pwFlag) {
		this.pwFlag = pwFlag;
	}
}
