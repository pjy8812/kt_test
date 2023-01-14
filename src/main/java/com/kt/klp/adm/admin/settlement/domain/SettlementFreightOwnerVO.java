package com.kt.klp.adm.admin.settlement.domain;

import java.util.Map;

import com.google.common.collect.ImmutableMap;

/**
*
* SettlementFreightOwnerVO : 화주정산 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.16       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.16
* @version 1.0.0
* @see
*
*/
public class SettlementFreightOwnerVO extends SettlementStatusVO {

	// TO CHECK
	public static final Map<String, String> FREIGHT_OWNER_TYPE = ImmutableMap.of(
		"normal", "일반"
		, "contract", "계약"
	);
	
	// TO CHECK
	public static final Map<String, String> FREIGHT_MEMBER_TYPE = ImmutableMap.of(
		"nonBusiness", "비사업자"
		, "business", "사업자"
	);
	
	// TO CHECK
	public static final Map<String, String> FREIGHT_BUSINESS_TYPE = ImmutableMap.of(
		"normal", "일반"
		, "carrier", "운송사"
		, "forwarder", "주선사"
	);
	
	public static final Map<String, String> SEARCH_TYPE_TYPE = ImmutableMap.<String, String>builder()
		.put("freightOwnerName", "회원명")
		.put("freightOwnerId", "회원ID")
		.put("freightOwnerCompanyName", "회사명")
		.put("freightOwnerCorporate", "사업자등록번호")
		.put("freightOwnerPhone", "전화번호")
		.put("freightOwnerEmail", "이메일주소")
		.put("freightOwnerSettlementId", "정산ID")
		.put("freightOwnerTotal", "총 정산금액").build();

	// request
	String freightOwnerType; // 계약구분(일반/계약)
	String freightMemberType; // 사업자구분(전체/사업자/비사업자)		
	String freightBusinessType; // 사업자유형(일반/운송사/주선사)		
	String freightOwnerSettlementStatus; // 정산상태		
	String searchType; // 검색타입		
	String searchText; // 검색어		
	String freightOwnerSettlementId; // 정산아이디
	String maskingYn; // 마스킹여부 
	
	Long settlementCompleteStartDate; // 정산발생일 검색 시작일
	Long settlementCompleteEndDate; // 정산발생일 검색 종료일
	Long settlementDepositStartDate; // 입금완료일 검색 시작일
	Long settlementDepositEndDate; // 입금완료일 검색 종료일
	
	// response
	// String freightOwnerType; // 계약구분
	String freightOwnerMemberType; // 사업자구분
	
	String freightOwnerBusinessType; // 사업자유형
	String freightOwnerName; // 회원명
	String freightOwnerId; // 회원아이디
	String freightOwnerCompany; // 회사명
	String freightOwnerPhone; // 전화번호
	String freightOwnerEmail; // 이메일주소
	String freightOwnerSettlementMonthCount; // 월정산횟수
	String freightOwnerSettlementAdminId; // 정산아이디
	
	Long freightOwnerSettlementDate; // 정산발생일
	int freightOwnerSettlementCount; // 건수
	int totalCharge; // 총 정산금액
	
	// String freightOwnerSettlementStatus; // 정산상태
	
	Long freightOwnerSettlementDepositDate; // 입금완료일
	
	String freightOwnerMonthSettlementNum; // 월 정산횟수 
	
	public SettlementFreightOwnerVO() {
		super();
	}

	public String getFreightOwnerType() {
		return freightOwnerType;
	}

	public void setFreightOwnerType(String freightOwnerType) {
		this.freightOwnerType = freightOwnerType;
	}

	public String getFreightMemberType() {
		return freightMemberType;
	}

	public void setFreightMemberType(String freightMemberType) {
		this.freightMemberType = freightMemberType;
	}

	public String getFreightBusinessType() {
		return freightBusinessType;
	}

	public void setFreightBusinessType(String freightBusinessType) {
		this.freightBusinessType = freightBusinessType;
	}

	public String getFreightOwnerSettlementStatus() {
		return freightOwnerSettlementStatus;
	}

	public void setFreightOwnerSettlementStatus(String freightOwnerSettlementStatus) {
		this.freightOwnerSettlementStatus = freightOwnerSettlementStatus;
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

	public String getFreightOwnerSettlementId() {
		return freightOwnerSettlementId;
	}

	public void setFreightOwnerSettlementId(String freightOwnerSettlementId) {
		this.freightOwnerSettlementId = freightOwnerSettlementId;
	}
	
	public String getMaskingYn() {
		return maskingYn;
	}

	public void setMaskingYn(String maskingYn) {
		this.maskingYn = maskingYn;
	}

	public Long getSettlementCompleteStartDate() {
		return settlementCompleteStartDate;
	}

	public void setSettlementCompleteStartDate(Long settlementCompleteStartDate) {
		this.settlementCompleteStartDate = settlementCompleteStartDate;
	}

	public Long getSettlementCompleteEndDate() {
		return settlementCompleteEndDate;
	}

	public void setSettlementCompleteEndDate(Long settlementCompleteEndDate) {
		this.settlementCompleteEndDate = settlementCompleteEndDate;
	}

	public Long getSettlementDepositStartDate() {
		return settlementDepositStartDate;
	}

	public void setSettlementDepositStartDate(Long settlementDepositStartDate) {
		this.settlementDepositStartDate = settlementDepositStartDate;
	}

	public Long getSettlementDepositEndDate() {
		return settlementDepositEndDate;
	}

	public void setSettlementDepositEndDate(Long settlementDepositEndDate) {
		this.settlementDepositEndDate = settlementDepositEndDate;
	}

	public String getFreightOwnerMemberType() {
		return freightOwnerMemberType;
	}

	public void setFreightOwnerMemberType(String freightOwnerMemberType) {
		this.freightOwnerMemberType = freightOwnerMemberType;
	}

	public String getFreightOwnerBusinessType() {
		return freightOwnerBusinessType;
	}

	public void setFreightOwnerBusinessType(String freightOwnerBusinessType) {
		this.freightOwnerBusinessType = freightOwnerBusinessType;
	}

	public String getFreightOwnerName() {
		return freightOwnerName;
	}

	public void setFreightOwnerName(String freightOwnerName) {
		this.freightOwnerName = freightOwnerName;
	}

	public String getFreightOwnerId() {
		return freightOwnerId;
	}

	public void setFreightOwnerId(String freightOwnerId) {
		this.freightOwnerId = freightOwnerId;
	}

	public String getFreightOwnerCompany() {
		return freightOwnerCompany;
	}

	public void setFreightOwnerCompany(String freightOwnerCompany) {
		this.freightOwnerCompany = freightOwnerCompany;
	}

	public String getFreightOwnerPhone() {
		return freightOwnerPhone;
	}

	public void setFreightOwnerPhone(String freightOwnerPhone) {
		this.freightOwnerPhone = freightOwnerPhone;
	}

	public String getFreightOwnerEmail() {
		return freightOwnerEmail;
	}

	public void setFreightOwnerEmail(String freightOwnerEmail) {
		this.freightOwnerEmail = freightOwnerEmail;
	}

	public String getFreightOwnerSettlementMonthCount() {
		return freightOwnerSettlementMonthCount;
	}

	public void setFreightOwnerSettlementMonthCount(String freightOwnerSettlementMonthCount) {
		this.freightOwnerSettlementMonthCount = freightOwnerSettlementMonthCount;
	}

	public String getFreightOwnerSettlementAdminId() {
		return freightOwnerSettlementAdminId;
	}

	public void setFreightOwnerSettlementAdminId(String freightOwnerSettlementAdminId) {
		this.freightOwnerSettlementAdminId = freightOwnerSettlementAdminId;
	}

	public Long getFreightOwnerSettlementDate() {
		return freightOwnerSettlementDate;
	}

	public void setFreightOwnerSettlementDate(Long freightOwnerSettlementDate) {
		this.freightOwnerSettlementDate = freightOwnerSettlementDate;
	}

	public int getFreightOwnerSettlementCount() {
		return freightOwnerSettlementCount;
	}

	public void setFreightOwnerSettlementCount(int freightOwnerSettlementCount) {
		this.freightOwnerSettlementCount = freightOwnerSettlementCount;
	}

	public int getTotalCharge() {
		return totalCharge;
	}

	public void setTotalCharge(int totalCharge) {
		this.totalCharge = totalCharge;
	}

	public Long getFreightOwnerSettlementDepositDate() {
		return freightOwnerSettlementDepositDate;
	}

	public void setFreightOwnerSettlementDepositDate(Long freightOwnerSettlementDepositDate) {
		this.freightOwnerSettlementDepositDate = freightOwnerSettlementDepositDate;
	}

	public String getFreightOwnerMonthSettlementNum() {
		return freightOwnerMonthSettlementNum;
	}

	public void setFreightOwnerMonthSettlementNum(String freightOwnerMonthSettlementNum) {
		this.freightOwnerMonthSettlementNum = freightOwnerMonthSettlementNum;
	}

}
