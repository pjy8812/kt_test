package com.kt.klp.adm.admin.owner.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* FreightOwnerVO : 회원관리> 화주 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.09       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.09
* @version 1.0.0
* @see
*
*/

public class FreightOwnerVO extends CommonTableVO{

	String freightOwnerType; 				//계약구분(일반/계약)		
	String freightOwnerMemberType;			//사업자구분(전체/사업자/비사업자)		
	String freightOwnerBusinessType;		//사업자유형(일반/운송사/주선사)		
	String freightOwnerId;					//회원 ID
	String freightOwnerMemberStatus;		//이용상태(전체/정상/중지/탈퇴요청)		
	int freightOwnerMonthSettlementNum;		//월정산횟수(1회/2회)	
	String freightOwnerFileAdminCheckYN;	//가입서류 확인 여부 
	String maskingYn;						//마스킹여부
	String freightOwnerMasterFlag;          //마스터지정여부
	String freightOwnerPriorityExposure;    //우선노출
	// 2023.01.04 추가
	private String freightOwnerFareAdjustFrom;	
	
	// 2023.01.04 추가
	private String freightOwnerFareAdjustTo;
	
	//변경내역
	String freightOwnerHistoryChangeReason; 	//화주정보 변경사유
	String freightOwnerHistoryAmender;			//화주정보 변경자
	String freightOwnerMemo; 					//화주정보 메모

	//검색
	String joinStartDate;		//회원가입일 검색 시작 날짜		
	String joinEndDate;		//회원가입일 검색 종료 날짜		
	String lastUseStartDate;	//최종이용일 검색 시작 날짜		
	String lastUseEndDate;	//최종이용일 검색 종료날짜		
	String searchType;		//검색어 타입		
	String searchText;		//검색어	
	
	// 2023.01.04 추가
	private String carrierId;
	
	// 2023.01.04 추가
	private String freightOwnerFareCode;
	
	// 2023.01.04 추가
	private String freightOwnerFareApplyDate;
	
	// 2023.01.04 추가
	private String freightOwnerCorporateRegistrationNumber;	
	
	//페이징
	int pagePerRows;	//목록 개수 (10, 20, 50개씩)	
	int nowPage;	//현재 페이지
	
	String sort;	//정렬	

	public FreightOwnerVO() {};
	public FreightOwnerVO(Map map) {
		super(map);
	}
	/**
	 * @return the freightOwnerType
	 */
	public String getFreightOwnerType() {
		return freightOwnerType;
	}
	/**
	 * @param freightOwnerType the freightOwnerType to set
	 */
	public void setFreightOwnerType(String freightOwnerType) {
		this.freightOwnerType = freightOwnerType;
	}
	/**
	 * @return the freightOwnerMemberType
	 */
	public String getFreightOwnerMemberType() {
		return freightOwnerMemberType;
	}
	/**
	 * @param freightOwnerMemberType the freightOwnerMemberType to set
	 */
	public void setFreightOwnerMemberType(String freightOwnerMemberType) {
		this.freightOwnerMemberType = freightOwnerMemberType;
	}
	/**
	 * @return the freightOwnerBusinessType
	 */
	public String getFreightOwnerBusinessType() {
		return freightOwnerBusinessType;
	}
	/**
	 * @param freightOwnerBusinessType the freightOwnerBusinessType to set
	 */
	public void setFreightOwnerBusinessType(String freightOwnerBusinessType) {
		this.freightOwnerBusinessType = freightOwnerBusinessType;
	}
	/**
	 * @return the freightOwnerMemberStatus
	 */
	public String getFreightOwnerMemberStatus() {
		return freightOwnerMemberStatus;
	}
	/**
	 * @param freightOwnerMemberStatus the freightOwnerMemberStatus to set
	 */
	public void setFreightOwnerMemberStatus(String freightOwnerMemberStatus) {
		this.freightOwnerMemberStatus = freightOwnerMemberStatus;
	}
	/**
	 * @return the freightOwnerMonthSettlementNum
	 */
	public int getFreightOwnerMonthSettlementNum() {
		return freightOwnerMonthSettlementNum;
	}
	/**
	 * @param freightOwnerMonthSettlementNum the freightOwnerMonthSettlementNum to set
	 */
	public void setFreightOwnerMonthSettlementNum(int freightOwnerMonthSettlementNum) {
		this.freightOwnerMonthSettlementNum = freightOwnerMonthSettlementNum;
	}
	/**
	 * @return the joinStartDate
	 */
	public String getJoinStartDate() {
		return joinStartDate;
	}
	/**
	 * @param joinStartDate the joinStartDate to set
	 */
	public void setJoinStartDate(String joinStartDate) {
		this.joinStartDate = joinStartDate;
	}
	/**
	 * @return the joinEndDate
	 */
	public String getJoinEndDate() {
		return joinEndDate;
	}
	/**
	 * @param joinEndDate the joinEndDate to set
	 */
	public void setJoinEndDate(String joinEndDate) {
		this.joinEndDate = joinEndDate;
	}
	/**
	 * @return the lastUseStartDate
	 */
	public String getLastUseStartDate() {
		return lastUseStartDate;
	}
	/**
	 * @param lastUseStartDate the lastUseStartDate to set
	 */
	public void setLastUseStartDate(String lastUseStartDate) {
		this.lastUseStartDate = lastUseStartDate;
	}
	/**
	 * @return the lastUseEndDate
	 */
	public String getLastUseEndDate() {
		return lastUseEndDate;
	}
	/**
	 * @param lastUseEndDate the lastUseEndDate to set
	 */
	public void setLastUseEndDate(String lastUseEndDate) {
		this.lastUseEndDate = lastUseEndDate;
	}
	/**
	 * @return the searchType
	 */
	public String getSearchType() {
		return searchType;
	}
	/**
	 * @param searchType the searchType to set
	 */
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	/**
	 * @return the searchText
	 */
	public String getSearchText() {
		return searchText;
	}
	/**
	 * @param searchText the searchText to set
	 */
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	/**
	 * @return the sort
	 */
	public String getSort() {
		return sort;
	}
	/**
	 * @param sort the sort to set
	 */
	public void setSort(String sort) {
		this.sort = sort;
	}
	/**
	 * @return the nowPage
	 */
	public int getNowPage() {
		return nowPage;
	}
	/**
	 * @param nowPage the nowPage to set
	 */
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	/**
	 * @return the freightOwnerId
	 */
	public String getFreightOwnerId() {
		return freightOwnerId;
	}
	/**
	 * @param freightOwnerId the freightOwnerId to set
	 */
	public void setFreightOwnerId(String freightOwnerId) {
		this.freightOwnerId = freightOwnerId;
	}
	/**
	 * @return the freightOwnerHistoryChangeReason
	 */
	public String getFreightOwnerHistoryChangeReason() {
		return freightOwnerHistoryChangeReason;
	}
	/**
	 * @param freightOwnerHistoryChangeReason the freightOwnerHistoryChangeReason to set
	 */
	public void setFreightOwnerHistoryChangeReason(String freightOwnerHistoryChangeReason) {
		this.freightOwnerHistoryChangeReason = freightOwnerHistoryChangeReason;
	}
	/**
	 * @return the freightOwnerHistoryAmender
	 */
	public String getFreightOwnerHistoryAmender() {
		return freightOwnerHistoryAmender;
	}
	/**
	 * @param freightOwnerHistoryAmender the freightOwnerHistoryAmender to set
	 */
	public void setFreightOwnerHistoryAmender(String freightOwnerHistoryAmender) {
		this.freightOwnerHistoryAmender = freightOwnerHistoryAmender;
	}
	/**
	 * @return the freightOwnerFileAdminCheckYN
	 */
	public String getFreightOwnerFileAdminCheckYN() {
		return freightOwnerFileAdminCheckYN;
	}
	/**
	 * @param freightOwnerFileAdminCheckYN the freightOwnerFileAdminCheckYN to set
	 */
	public void setFreightOwnerFileAdminCheckYN(String freightOwnerFileAdminCheckYN) {
		this.freightOwnerFileAdminCheckYN = freightOwnerFileAdminCheckYN;
	}
	/**
	 * @return the pagePerRows
	 */
	public int getPagePerRows() {
		return pagePerRows;
	}
	/**
	 * @param pagePerRows the pagePerRows to set
	 */
	public void setPagePerRows(int pagePerRows) {
		this.pagePerRows = pagePerRows;
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
	/**
	 * @return the freightOwnerMemo
	 */
	public String getFreightOwnerMemo() {
		return freightOwnerMemo;
	}
	/**
	 * @param freightOwnerMemo the freightOwnerMemo to set
	 */
	public void setFreightOwnerMemo(String freightOwnerMemo) {
		this.freightOwnerMemo = freightOwnerMemo;
	}
	
	public String getFreightOwnerMasterFlag() {
		return freightOwnerMasterFlag;
	}

	public void setFreightOwnerMasterFlag(String freightOwnerMasterFlag) {
		this.freightOwnerMasterFlag = freightOwnerMasterFlag;
	}
	
	public String getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}
	
	public String getFreightOwnerPriorityExposure() {
		return freightOwnerPriorityExposure;
	}

	public void setFreightOwnerPriorityExposure(String freightOwnerPriorityExposure) {
		this.freightOwnerPriorityExposure = freightOwnerPriorityExposure;
	}
	
	public String getFreightOwnerFareCode() {
		return freightOwnerFareCode;
	}

	public void setFreightOwnerFareCode(String freightOwnerFareCode) {
		this.freightOwnerFareCode = freightOwnerFareCode;
	}
	
	public String getFreightOwnerFareApplyDate() {
		return freightOwnerFareApplyDate;
	}

	public void setFreightOwnerFareApplyDate(String freightOwnerFareApplyDate) {
		this.freightOwnerFareApplyDate = freightOwnerFareApplyDate;
	}
	
	public String getFreightOwnerFareAdjustFrom() {
		return freightOwnerFareAdjustFrom;
	}

	public void setFreightOwnerFareAdjustFrom(String freightOwnerFareAdjustFrom) {
		this.freightOwnerFareAdjustFrom = freightOwnerFareAdjustFrom;
	}
	
	public String getFreightOwnerFareAdjustTo() {
		return freightOwnerFareAdjustTo;
	}

	public void setFreightOwnerFareAdjustTo(String freightOwnerFareAdjustTo) {
		this.freightOwnerFareAdjustTo = freightOwnerFareAdjustTo;
	}
	
	public String getFreightOwnerCorporateRegistrationNumber() {
		return freightOwnerCorporateRegistrationNumber;
	}

	public void setFreightOwnerCorporateRegistrationNumber(String freightOwnerCorporateRegistrationNumber) {
		this.freightOwnerCorporateRegistrationNumber = freightOwnerCorporateRegistrationNumber;
	}	
}
