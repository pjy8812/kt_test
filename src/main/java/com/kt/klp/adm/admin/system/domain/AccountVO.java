package com.kt.klp.adm.admin.system.domain;

import java.util.List;
import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* AccountVO : 계정/권한관리 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.23       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.02.23
* @version 1.0.0
* @see
*
*/

public class AccountVO extends CommonTableVO {
	
	String authGroup;			//권한그룹	
	long adminRegisterStartDateTime;	//생성일 검색 시작일
	long adminRegisterEndDateTime;		//생성일 검색 종료일
	String searchType;			//검색타입
	String searchText;			//검색어
	
	String adminId;				//이용자아이디
	String adminName;			//이용자명
	String adminEmployeeNum;	//사번
	String adminEmail;			//이메일
	String adminTelephone;		//전화번호
	String adminRegisterDate;	//생성일
	
	String groupSeq;
	int adminAuthorityGroupSeq; //권한그룹 seq
	String authGroupName;		//권한그룹명
	String authGroupCode;		//권한그룹코드
	List permissionCheck;		//권한체크
	
	String maskingYn;	//마스킹여부
	
	public AccountVO() {
		// TODO Auto-generated constructor stub
	}	
	
	public AccountVO(Map map) {
		super(map);
	}

	public String getAuthGroup() {
		return authGroup;
	}

	public void setAuthGroup(String authGroup) {
		this.authGroup = authGroup;
	}

	public long getAdminRegisterStartDateTime() {
		return adminRegisterStartDateTime;
	}

	public void setAdminRegisterStartDateTime(long adminRegisterStartDateTime) {
		this.adminRegisterStartDateTime = adminRegisterStartDateTime;
	}

	public long getAdminRegisterEndDateTime() {
		return adminRegisterEndDateTime;
	}

	public void setAdminRegisterEndDateTime(long adminRegisterEndDateTime) {
		this.adminRegisterEndDateTime = adminRegisterEndDateTime;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	public String getAdminEmployeeNum() {
		return adminEmployeeNum;
	}

	public void setAdminEmployeeNum(String adminEmployeeNum) {
		this.adminEmployeeNum = adminEmployeeNum;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminTelephone() {
		return adminTelephone;
	}

	public void setAdminTelephone(String adminTelephone) {
		this.adminTelephone = adminTelephone;
	}

	public String getAdminRegisterDate() {
		return adminRegisterDate;
	}

	public void setAdminRegisterDate(String adminRegisterDate) {
		this.adminRegisterDate = adminRegisterDate;
	}
	
	public String getGroupSeq() {
		return groupSeq;
	}

	public void setGroupSeq(String groupSeq) {
		this.groupSeq = groupSeq;
	}

	public int getAdminAuthorityGroupSeq() {
		return adminAuthorityGroupSeq;
	}

	public void setAdminAuthorityGroupSeq(int adminAuthorityGroupSeq) {
		this.adminAuthorityGroupSeq = adminAuthorityGroupSeq;
	}

	public String getAuthGroupName() {
		return authGroupName;
	}

	public void setAuthGroupName(String authGroupName) {
		this.authGroupName = authGroupName;
	}

	public String getAuthGroupCode() {
		return authGroupCode;
	}

	public void setAuthGroupCode(String authGroupCode) {
		this.authGroupCode = authGroupCode;
	}

	public List getPermissionCheck() {
		return permissionCheck;
	}

	public void setPermissionCheck(List permissionCheck) {
		this.permissionCheck = permissionCheck;
	}

	/**
	 * @return the maskingYn
	 */
	public String getMaskingYn() {
		return maskingYn;
	}

	/**
	 * @param maskingYn the maskingYn to set
	 */
	public void setMaskingYn(String maskingYn) {
		this.maskingYn = maskingYn;
	}
	
}