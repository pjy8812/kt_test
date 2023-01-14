package com.kt.klp.adm.admin.owner.domain;

import org.springframework.web.multipart.MultipartFile;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* CarOwnerVO : 회원관리> 운송대행사 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2023.01.02       Seongrae Kim     Initial creation
* </pre>
*
* @author PARUCNC Seongrae Kim (akaikarus@parucnc.com)
* @since 2023.01.02
* @version 1.0.0
* @see
*
*/

public class CarrierOwnerVO extends CommonTableVO{

	String carrierId;								// 운송대행사ID
	String carrierCorporateRegistrationNumber;		// 사업자등록번호
	String carrierName;								// 운송대행사명
	String consumerId;								// 사용자ID
	String carrierPassword;							// 비밀번호
	String carrierTelephone;						// 전화번호
	String carrierEmail;							// 이메일
	String carrierRecommendId;						// 추천인ID
	String carrierJoinDateTime;						// 회원가입일
	String carrierPaymentCondition;					// 결제조건
	String carrierMemberStatus;						// 회원상태
	String carrierFileAdminCheckYn;					// 파일확인여부(관리자)
	String carrierLastUseDate;						// 최종이용일
	String carrierWithdrawalYn;						// 탈퇴여부
	String carrierWithdrawalDate;					// 탈퇴일시
	String carrierModifyDate;						// 수정일시
	String carrierPasswordModifyDate;				// 비밀번호 마지막 수정일시
	String carrierMasterYn;							// 마스터여부
	String carrierSnsId;							// sns간편로그인id
	String carrierMonthSettlementNum;				// 월정산횟수
	String carrierUseYn;							// 운송대행사활동여부
	String maskingYn;								// 마스킹 여부
		
	// 검색
	long joinStartDate;								// 회원가입일 검색 시작 날짜
	long joinEndDate;								// 회원가입일 검색 종료 날짜
	long lastUseStartDate;							// 최종이용일 검색 시작 날짜
	long lastUseEndDate;							// 최종이용일 검색 종료날짜
	String searchType;								// 검색어 타입
	String searchText;								// 검색어

	//변경내역
	String carrierHistoryChangeReason;				//운송대행사정보 변경사유		
	String carrierHistoryAmender;					//운송대행사정보 변경자	

	/**사업자등록증*/
	private MultipartFile carrierCorporateRegistrationFile;

	/**기타*/
	private MultipartFile carrierOthersFile;

	// 페이징
	int pagePerRows;								// 목록 개수 (10, 20, 50개씩)
	int nowPage;									// 현재 페이지
	
	String sort;									// 정렬

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

	public String getCarrierName() {
		return carrierName;
	}

	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}

	public String getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(String consumerId) {
		this.consumerId = consumerId;
	}

	public String getCarrierPassword() {
		return carrierPassword;
	}

	public void setCarrierPassword(String carrierPassword) {
		this.carrierPassword = carrierPassword;
	}

	public String getCarrierTelephone() {
		return carrierTelephone;
	}

	public void setCarrierTelephone(String carrierTelephone) {
		this.carrierTelephone = carrierTelephone;
	}

	public String getCarrierEmail() {
		return carrierEmail;
	}

	public void setCarrierEmail(String carrierEmail) {
		this.carrierEmail = carrierEmail;
	}

	public String getCarrierRecommendId() {
		return carrierRecommendId;
	}

	public void setCarrierRecommendId(String carrierRecommendId) {
		this.carrierRecommendId = carrierRecommendId;
	}

	public String getCarrierJoinDateTime() {
		return carrierJoinDateTime;
	}

	public void setCarrierJoinDateTime(String carrierJoinDateTime) {
		this.carrierJoinDateTime = carrierJoinDateTime;
	}

	public String getCarrierPaymentCondition() {
		return carrierPaymentCondition;
	}

	public void setCarrierPaymentCondition(String carrierPaymentCondition) {
		this.carrierPaymentCondition = carrierPaymentCondition;
	}

	public String getCarrierMemberStatus() {
		return carrierMemberStatus;
	}

	public void setCarrierMemberStatus(String carrierMemberStatus) {
		this.carrierMemberStatus = carrierMemberStatus;
	}

	public String getCarrierFileAdminCheckYn() {
		return carrierFileAdminCheckYn;
	}

	public void setCarrierFileAdminCheckYn(String carrierFileAdminCheckYn) {
		this.carrierFileAdminCheckYn = carrierFileAdminCheckYn;
	}

	public String getCarrierLastUseDate() {
		return carrierLastUseDate;
	}

	public void setCarrierLastUseDate(String carrierLastUseDate) {
		this.carrierLastUseDate = carrierLastUseDate;
	}

	public String getCarrierWithdrawalYn() {
		return carrierWithdrawalYn;
	}

	public void setCarrierWithdrawalYn(String carrierWithdrawalYn) {
		this.carrierWithdrawalYn = carrierWithdrawalYn;
	}

	public String getCarrierWithdrawalDate() {
		return carrierWithdrawalDate;
	}

	public void setCarrierWithdrawalDate(String carrierWithdrawalDate) {
		this.carrierWithdrawalDate = carrierWithdrawalDate;
	}

	public String getCarrierModifyDate() {
		return carrierModifyDate;
	}

	public void setCarrierModifyDate(String carrierModifyDate) {
		this.carrierModifyDate = carrierModifyDate;
	}

	public String getCarrierPasswordModifyDate() {
		return carrierPasswordModifyDate;
	}

	public void setCarrierPasswordModifyDate(String carrierPasswordModifyDate) {
		this.carrierPasswordModifyDate = carrierPasswordModifyDate;
	}

	public String getCarrierMasterYn() {
		return carrierMasterYn;
	}

	public void setCarrierMasterYn(String carrierMasterYn) {
		this.carrierMasterYn = carrierMasterYn;
	}

	public String getCarrierSnsId() {
		return carrierSnsId;
	}

	public void setCarrierSnsId(String carrierSnsId) {
		this.carrierSnsId = carrierSnsId;
	}

	public String getCarrierMonthSettlementNum() {
		return carrierMonthSettlementNum;
	}

	public void setCarrierMonthSettlementNum(String carrierMonthSettlementNum) {
		this.carrierMonthSettlementNum = carrierMonthSettlementNum;
	}

	public String getCarrierUseYn() {
		return carrierUseYn;
	}

	public void setCarrierUseYn(String carrierUseYn) {
		this.carrierUseYn = carrierUseYn;
	}

	public long getJoinStartDate() {
		return joinStartDate;
	}

	public void setJoinStartDate(long joinStartDate) {
		this.joinStartDate = joinStartDate;
	}

	public long getJoinEndDate() {
		return joinEndDate;
	}

	public void setJoinEndDate(long joinEndDate) {
		this.joinEndDate = joinEndDate;
	}

	public long getLastUseStartDate() {
		return lastUseStartDate;
	}

	public void setLastUseStartDate(long lastUseStartDate) {
		this.lastUseStartDate = lastUseStartDate;
	}

	public long getLastUseEndDate() {
		return lastUseEndDate;
	}

	public void setLastUseEndDate(long lastUseEndDate) {
		this.lastUseEndDate = lastUseEndDate;
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

	public int getPagePerRows() {
		return pagePerRows;
	}

	public void setPagePerRows(int pagePerRows) {
		this.pagePerRows = pagePerRows;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getCarrierHistoryChangeReason() {
		return carrierHistoryChangeReason;
	}

	public void setCarrierHistoryChangeReason(String carrierHistoryChangeReason) {
		this.carrierHistoryChangeReason = carrierHistoryChangeReason;
	}

	public String getCarrierHistoryAmender() {
		return carrierHistoryAmender;
	}

	public void setCarrierHistoryAmender(String carrierHistoryAmender) {
		this.carrierHistoryAmender = carrierHistoryAmender;
	}

	public MultipartFile getCarrierCorporateRegistrationFile() {
		return carrierCorporateRegistrationFile;
	}

	public void setCarrierCorporateRegistrationFile(MultipartFile carrierCorporateRegistrationFile) {
		this.carrierCorporateRegistrationFile = carrierCorporateRegistrationFile;
	}

	public MultipartFile getCarrierOthersFile() {
		return carrierOthersFile;
	}

	public void setCarrierOthersFile(MultipartFile carrierOthersFile) {
		this.carrierOthersFile = carrierOthersFile;
	}

	public String getMaskingYn() {
		return maskingYn;
	}

	public void setMaskingYn(String maskingYn) {
		this.maskingYn = maskingYn;
	}

	
}
