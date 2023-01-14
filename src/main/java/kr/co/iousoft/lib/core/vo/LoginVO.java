package kr.co.iousoft.lib.core.vo;

import java.util.Map;

/**
*
* LoginVO : 로그인 vo
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

public class LoginVO extends CommonTableVO {
	
	public static final String INVALID_TOKEN = "invalid_token";
	
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
	
	String accessToken;
	String refreshToken;
	String tokenType;	//토큰종류
	int expiresIn;		//토큰만료
	
	String otpNum;		//otp번호
	
	String adminOldPw; //기존 비밀번호추가 by.2022.03.31 추가
	String ip; //클라이언트 추가 by.2022.04.19 추가
	
	
	public LoginVO() {
		// TODO Auto-generated constructor stub
	}	
	
	public LoginVO(Map map) {
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

	public String getOtpNum() {
		return otpNum;
	}

	public void setOtpNum(String otpNum) {
		this.otpNum = otpNum;
	}

	public String getAdminTelephone() {
		return adminTelephone;
	}

	public void setAdminTelephone(String adminTelephone) {
		this.adminTelephone = adminTelephone;
	}

	/**
	 * @return the adminOldPw
	 */
	public String getAdminOldPw() {
		return adminOldPw;
	}

	/**
	 * @param adminOldPw the adminOldPw to set
	 */
	public void setAdminOldPw(String adminOldPw) {
		this.adminOldPw = adminOldPw;
	}

	/**
	 * @return the ip
	 */
	public String getIp() {
		return ip;
	}

	/**
	 * @param ip the ip to set
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
}
