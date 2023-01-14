package com.kt.klp.adm.admin.settlement.domain;

import java.util.Map;

import com.google.common.collect.ImmutableMap;

/**
*
* SettlementCarOwnerVO : 차주정산 vo
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
public class SettlementCarOwnerVO extends SettlementStatusVO {

	public static final String PAGE_TYPE_SETTLEMENT = "settlement";
	public static final String PAGE_TYPE_ORDER = "order";
	
	public static final Map<String, String> SEARCH_TYPE_TYPE = ImmutableMap.<String, String>builder()
		.put("carOwnerName", "회원명")
		.put("carOwnerId", "회원ID")
		.put("carOwnerCompany", "회사명")
		.put("carOwnerCorporateRegistrationNumber", "사업자등록번호")
		.put("carOwnerTelephone", "전화번호")
		.put("carOwnerEmail", "이메일주소")
		.put("carOwnerSettlementId", "정산ID")
		.put("carOwnerBank", "거래은행")
		.put("carOwnerAccount", "계좌번호")
		.put("carOwnerTotalCharge", "총 정산금액").build();
	
	// resquest
	String carOwnerType; // 계약구분(일반/계약)		
	String carOwnerSettlementStatus; // 정산상태		
	String searchType; // 검색타입		
	String searchText; //검색어		
	Long settlementCompleteStartDate; // 정산발생일 검색 시작일		
	Long settlementCompleteEndDate; // 정산발생일 검색 종료일		
	Long settlementDepositStartDate; // 입금완료일 검색 시작일		
	Long settlementDepositEndDate; // 입금완료일 검색 종료일		
	String maskingYn; // 마스킹여부 
	
	// response
	// String carOwnerType;
	String carMemberType;
	String carBusinessType;
	String carOwnerName;
	String carOwnerId;
	String carOwnerCompany;
	String carOwnerPhone;
	String carOwnerEmail;
	String carOwnerSettlementId;
	
	Long carOwnerSettlementDate;
	int carOwnerSettlementCount;
	int totalCharge;
	
	// String carOwnerSettlementStatus;
	Long carOwnerSettlementDepositDate;
	
	String pageType;
	
	// 취소 
	// String carOwnerId;
	// String carOwnerSettlementId;
	String carOwnerSettlementOrderId;
	String carOwnerSettlementSeq;
	String carOwnerSettlementState;
	
	String carOwnerSettlementOrderNumber;
	
	String carOwnerSettlementRootId;
	
	public SettlementCarOwnerVO() {
		super();
	}

	public String getCarOwnerType() {
		return carOwnerType;
	}

	public void setCarOwnerType(String carOwnerType) {
		this.carOwnerType = carOwnerType;
	}

	public String getCarOwnerSettlementStatus() {
		return carOwnerSettlementStatus;
	}

	public void setCarOwnerSettlementStatus(String carOwnerSettlementStatus) {
		this.carOwnerSettlementStatus = carOwnerSettlementStatus;
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

	public String getMaskingYn() {
		return maskingYn;
	}

	public void setMaskingYn(String maskingYn) {
		this.maskingYn = maskingYn;
	}

	public String getCarMemberType() {
		return carMemberType;
	}

	public void setCarMemberType(String carMemberType) {
		this.carMemberType = carMemberType;
	}

	public String getCarBusinessType() {
		return carBusinessType;
	}

	public void setCarBusinessType(String carBusinessType) {
		this.carBusinessType = carBusinessType;
	}

	public String getCarOwnerName() {
		return carOwnerName;
	}

	public void setCarOwnerName(String carOwnerName) {
		this.carOwnerName = carOwnerName;
	}

	public String getCarOwnerId() {
		return carOwnerId;
	}

	public void setCarOwnerId(String carOwnerId) {
		this.carOwnerId = carOwnerId;
	}

	public String getCarOwnerCompany() {
		return carOwnerCompany;
	}

	public void setCarOwnerCompany(String carOwnerCompany) {
		this.carOwnerCompany = carOwnerCompany;
	}

	public String getCarOwnerPhone() {
		return carOwnerPhone;
	}

	public void setCarOwnerPhone(String carOwnerPhone) {
		this.carOwnerPhone = carOwnerPhone;
	}

	public String getCarOwnerEmail() {
		return carOwnerEmail;
	}

	public void setCarOwnerEmail(String carOwnerEmail) {
		this.carOwnerEmail = carOwnerEmail;
	}

	public String getCarOwnerSettlementId() {
		return carOwnerSettlementId;
	}

	public void setCarOwnerSettlementId(String carOwnerSettlementId) {
		this.carOwnerSettlementId = carOwnerSettlementId;
	}

	public Long getCarOwnerSettlementDate() {
		return carOwnerSettlementDate;
	}

	public void setCarOwnerSettlementDate(Long carOwnerSettlementDate) {
		this.carOwnerSettlementDate = carOwnerSettlementDate;
	}

	public int getCarOwnerSettlementCount() {
		return carOwnerSettlementCount;
	}

	public void setCarOwnerSettlementCount(int carOwnerSettlementCount) {
		this.carOwnerSettlementCount = carOwnerSettlementCount;
	}

	public int getTotalCharge() {
		return totalCharge;
	}

	public void setTotalCharge(int totalCharge) {
		this.totalCharge = totalCharge;
	}

	public Long getCarOwnerSettlementDepositDate() {
		return carOwnerSettlementDepositDate;
	}

	public void setCarOwnerSettlementDepositDate(Long carOwnerSettlementDepositDate) {
		this.carOwnerSettlementDepositDate = carOwnerSettlementDepositDate;
	}

	public String getPageType() {
		return pageType;
	}

	public void setPageType(String pageType) {
		this.pageType = pageType;
	}

	public String getCarOwnerSettlementOrderId() {
		return carOwnerSettlementOrderId;
	}

	public void setCarOwnerSettlementOrderId(String carOwnerSettlementOrderId) {
		this.carOwnerSettlementOrderId = carOwnerSettlementOrderId;
	}

	public String getCarOwnerSettlementSeq() {
		return carOwnerSettlementSeq;
	}

	public void setCarOwnerSettlementSeq(String carOwnerSettlementSeq) {
		this.carOwnerSettlementSeq = carOwnerSettlementSeq;
	}

	public String getCarOwnerSettlementState() {
		return carOwnerSettlementState;
	}

	public void setCarOwnerSettlementState(String carOwnerSettlementState) {
		this.carOwnerSettlementState = carOwnerSettlementState;
	}

	public String getCarOwnerSettlementOrderNumber() {
		return carOwnerSettlementOrderNumber;
	}

	public void setCarOwnerSettlementOrderNumber(String carOwnerSettlementOrderNumber) {
		this.carOwnerSettlementOrderNumber = carOwnerSettlementOrderNumber;
	}

	public String getCarOwnerSettlementRootId() {
		return carOwnerSettlementRootId;
	}

	public void setCarOwnerSettlementRootId(String carOwnerSettlementRootId) {
		this.carOwnerSettlementRootId = carOwnerSettlementRootId;
	}
	
}
