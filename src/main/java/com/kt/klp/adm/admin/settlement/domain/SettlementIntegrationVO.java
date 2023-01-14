package com.kt.klp.adm.admin.settlement.domain;

import java.util.Map;

import com.google.common.collect.ImmutableMap;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* SettlementStatusVO : 통합주문 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.12.09       PJY     Initial creation
* </pre>
*
* @author PJY
* @since 2022.12.09
* @version 1.0.0
* @see
*
*/
public class SettlementIntegrationVO extends CommonTableVO {
	
	public static final Map<String, String> SETTLEMENT_STATUS = ImmutableMap.<String, String>builder()
			.put("settlementStandby", "청구대기")
			.put("settlementRequested", "청구중")
			.put("settlementCompleted", "정산완료")
			.put("settlementFailed", "청구실패")
			.put("cancelRequested", "취소진행")
			.put("cancelCompleted", "취소완료")
			.put("confirmRequired", "입금확인필요")
			.put("settlementProgress", "청구진행")
			.put("sendFailed", "전송실패")
			.put("deferred", "연체").build();


	public static final Map<String, String> SETTLEMENT_STATUS2 = ImmutableMap.<String, String>builder()
			.put("settlementStandby", "지급대기")
			.put("settlementRequested", "지급중")
			.put("settlementCompleted", "지급완료")
			.put("settlementFailed", "지급실패")
			.put("sendFailed", "전송실패").build();

	
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
	
	String freightOwnerSettlementOrderNum;            // 주문번호
    String freightOwnerSettlementDoenDate;            // 정산마감일
    String freightOwnerName;                          // 화주명
    String freightOwnerId;                            // 화주ID
    String freightOwnerCompany;                       // 화주사
    String freightOwnerSettlementId;                  // 청구ID
    String freightOwnerSettlementPrice;               // 청구금액
    String freightOwnerSettlementYyyymm;              // 청구마감월
    String freightOwnerSettlementState;               // 청구상태
	String freightOwnerSettlementStateName;           // 청구상태명
    String carNum;                                    // 차량번호
    String carOwnerName;                              // 차주명
    String carOwnerId;                                // 차주ID
	String carrierName;                               // 운송대행사
    String carrierId;                                 // 운송대행사ID
    String carrierCorporateRegistrationNumber;        // 운송대행사사업자등록번호
	String carOwnerSettlementId;                      // 지급ID
    String carOwnerSettlementPaymentMethod;           // 지급방법
    String carOwnerSettlementPaymentMethodName;       // 지급방법명
	String carOwnerSettlementPrice;                   // 지급금액
    String carOwnerSettlementYyyymmdd;                // 지급마감월
    String carOwnerSettlementState;                   // 지급상태
    String carOwnerSettlementStateName;               // 지급상태
	String maskingYn;                                 // 마스킹유무
	
	Long settlementCompleteDoenStartDate; // 정산마감일 검색 시작일		
	Long settlementCompleteDoenEndDate;   // 정산마감일 검색 종료일		
	
	Long settlementCompleteStartDate; // 청구발생일 검색 시작일		
	Long settlementCompleteEndDate;   // 청구발생일 검색 종료일		
	
	String payMonthStartDate;   //청구마감월 시작
    String payMonthEndDate;     //청구마감월 끝
    String billMonthStartDate;  //지급마감월 시작 
    String billMonthEndDate;    //지급마감월 끝
	
	String searchType; // 검색타입		
	String searchText; // 검색어		
	
	
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

	public String getFreightOwnerSettlementOrderNum() {
		return freightOwnerSettlementOrderNum;
	}

	public void setFreightOwnerSettlementOrderNum(String freightOwnerSettlementOrderNum) {
		this.freightOwnerSettlementOrderNum = freightOwnerSettlementOrderNum;
	}

	public String getFreightOwnerSettlementDoenDate() {
		return freightOwnerSettlementDoenDate;
	}

	public void setFreightOwnerSettlementDoenDate(String freightOwnerSettlementDoenDate) {
		this.freightOwnerSettlementDoenDate = freightOwnerSettlementDoenDate;
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

	public String getFreightOwnerSettlementId() {
		return freightOwnerSettlementId;
	}

	public void setFreightOwnerSettlementId(String freightOwnerSettlementId) {
		this.freightOwnerSettlementId = freightOwnerSettlementId;
	}

	public String getFreightOwnerSettlementPrice() {
		return freightOwnerSettlementPrice;
	}

	public void setFreightOwnerSettlementPrice(String freightOwnerSettlementPrice) {
		this.freightOwnerSettlementPrice = freightOwnerSettlementPrice;
	}

	public String getFreightOwnerSettlementYyyymm() {
		return freightOwnerSettlementYyyymm;
	}

	public void setFreightOwnerSettlementYyyymm(String freightOwnerSettlementYyyymm) {
		this.freightOwnerSettlementYyyymm = freightOwnerSettlementYyyymm;
	}

	public String getFreightOwnerSettlementState() {
		return freightOwnerSettlementState;
	}

	public void setFreightOwnerSettlementState(String freightOwnerSettlementState) {
		this.freightOwnerSettlementState = freightOwnerSettlementState;
	}

	public String getFreightOwnerSettlementStateName() {
		return freightOwnerSettlementStateName;
	}

	public void setFreightOwnerSettlementStateName(String freightOwnerSettlementStateName) {
		this.freightOwnerSettlementStateName = freightOwnerSettlementStateName;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
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

	public String getCarOwnerSettlementId() {
		return carOwnerSettlementId;
	}

	public void setCarOwnerSettlementId(String carOwnerSettlementId) {
		this.carOwnerSettlementId = carOwnerSettlementId;
	}

	public String getCarOwnerSettlementPaymentMethod() {
		return carOwnerSettlementPaymentMethod;
	}

	public void setCarOwnerSettlementPaymentMethod(String carOwnerSettlementPaymentMethod) {
		this.carOwnerSettlementPaymentMethod = carOwnerSettlementPaymentMethod;
	}

	public String getCarOwnerSettlementPaymentMethodName() {
		return carOwnerSettlementPaymentMethodName;
	}

	public void setCarOwnerSettlementPaymentMethodName(String carOwnerSettlementPaymentMethodName) {
		this.carOwnerSettlementPaymentMethodName = carOwnerSettlementPaymentMethodName;
	}

	public String getCarOwnerSettlementPrice() {
		return carOwnerSettlementPrice;
	}

	public void setCarOwnerSettlementPrice(String carOwnerSettlementPrice) {
		this.carOwnerSettlementPrice = carOwnerSettlementPrice;
	}

	public String getCarOwnerSettlementYyyymmdd() {
		return carOwnerSettlementYyyymmdd;
	}

	public void setCarOwnerSettlementYyyymmdd(String carOwnerSettlementYyyymmdd) {
		this.carOwnerSettlementYyyymmdd = carOwnerSettlementYyyymmdd;
	}

	public String getCarOwnerSettlementState() {
		return carOwnerSettlementState;
	}

	public void setCarOwnerSettlementState(String carOwnerSettlementState) {
		this.carOwnerSettlementState = carOwnerSettlementState;
	}

	public String getCarOwnerSettlementStateName() {
		return carOwnerSettlementStateName;
	}

	public void setCarOwnerSettlementStateName(String carOwnerSettlementStateName) {
		this.carOwnerSettlementStateName = carOwnerSettlementStateName;
	}

	public String getMaskingYn() {
		return maskingYn;
	}

	public void setMaskingYn(String maskingYn) {
		this.maskingYn = maskingYn;
	}

	public String getPayMonthStartDate() {
		return payMonthStartDate;
	}

	public void setPayMonthStartDate(String payMonthStartDate) {
		this.payMonthStartDate = payMonthStartDate;
	}

	public String getPayMonthEndDate() {
		return payMonthEndDate;
	}

	public void setPayMonthEndDate(String payMonthEndDate) {
		this.payMonthEndDate = payMonthEndDate;
	}

	public String getBillMonthStartDate() {
		return billMonthStartDate;
	}

	public void setBillMonthStartDate(String billMonthStartDate) {
		this.billMonthStartDate = billMonthStartDate;
	}

	public String getBillMonthEndDate() {
		return billMonthEndDate;
	}

	public void setBillMonthEndDate(String billMonthEndDate) {
		this.billMonthEndDate = billMonthEndDate;
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

	public Long getSettlementCompleteDoenStartDate() {
		return settlementCompleteDoenStartDate;
	}

	public void setSettlementCompleteDoenStartDate(Long settlementCompleteDoenStartDate) {
		this.settlementCompleteDoenStartDate = settlementCompleteDoenStartDate;
	}

	public Long getSettlementCompleteDoenEndDate() {
		return settlementCompleteDoenEndDate;
	}

	public void setSettlementCompleteDoenEndDate(Long settlementCompleteDoenEndDate) {
		this.settlementCompleteDoenEndDate = settlementCompleteDoenEndDate;
	}

    public String getCarrierName() {
		return carrierName;
	}

	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}

	public String getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}

	public String getCarrierCorporateRegistrationNumber() {
		return carrierCorporateRegistrationNumber;
	}

	public void setCarrierCorporateRegistrationNumber(String carrierCorporateRegistrationNumber) {
		this.carrierCorporateRegistrationNumber = carrierCorporateRegistrationNumber;
	}

	
}
