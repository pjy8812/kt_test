package com.kt.klp.adm.admin.owner.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* CarOwnerVO : 회원관리> 차주 vo
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

public class CarOwnerVO extends CommonTableVO{

	String carOwnerMemberStatus;		//이용상태(전체/정상/중지)		
	String carOwnerJoinApprovalStatus;	//가입승인 상태(전체/정상/대기/실패)
	String penalty;						//패널티 여부(전체/있음/없음)		
	String carOwnerDocument;			//가입서류확인
	String carOwnerId;					//차주ID
	String carOwnerFileAdminCheckYn	; 	//관리자 가입서류 확인여부
	String carOwnerType;
	String maskingYn;					//마스킹여부
	
	//변경내역
	String carOwnerHistoryChangeReason;		//차주정보 변경사유		
	String carOwnerHistoryAmender;			//차주정보 변경자	
		
	//검색
	long joinStartDate;					//회원가입일 검색 시작 날짜		
	long joinEndDate;					//회원가입일 검색 종료 날짜		
	long lastUseStartDate;				//최종이용일 검색 시작 날짜		
	long lastUseEndDate;				//최종이용일 검색 종료날짜		
	String searchType;					//검색어 타입		
	String searchText;					//검색어		
	
	//지급방법 :: 20230102 추가
	private String carOwnerPaymentMethod;	
	
	//페이징
	int pagePerRows;						//목록 개수 (10, 20, 50개씩)	
	int nowPage;						//현재 페이지
	
	String sort;						//정렬	
	
	//비상차주 등록
	String carOwnerName;		//차주이름
	String carOwnerTelephone;	//차주전화번호
	String carNum;				//차량번호
	String carType;				//차종
	String carModel;			//중량
	
	private String carOwnerRecommendId;			//추천인ID
	
	//삭제 플래그 :: 20230102 추가
	private String carOwnerDeleteFlag;		
	
	public CarOwnerVO() {};
	public CarOwnerVO(Map map) {
		super(map);
	}

	/**
	 * @return the carOwnerMemberStatus
	 */
	public String getCarOwnerMemberStatus() {
		return carOwnerMemberStatus;
	}
	/**
	 * @param carOwnerMemberStatus the carOwnerMemberStatus to set
	 */
	public void setCarOwnerMemberStatus(String carOwnerMemberStatus) {
		this.carOwnerMemberStatus = carOwnerMemberStatus;
	}
	/**
	 * @return the carOwnerJoinApprovalStatus
	 */
	public String getCarOwnerJoinApprovalStatus() {
		return carOwnerJoinApprovalStatus;
	}
	/**
	 * @param carOwnerJoinApprovalStatus the carOwnerJoinApprovalStatus to set
	 */
	public void setCarOwnerJoinApprovalStatus(String carOwnerJoinApprovalStatus) {
		this.carOwnerJoinApprovalStatus = carOwnerJoinApprovalStatus;
	}
	/**
	 * @return the penalty
	 */
	public String getPenalty() {
		return penalty;
	}
	/**
	 * @param penalty the penalty to set
	 */
	public void setPenalty(String penalty) {
		this.penalty = penalty;
	}
	/**
	 * @return the carOwnerDocument
	 */
	public String getCarOwnerDocument() {
		return carOwnerDocument;
	}
	/**
	 * @param carOwnerDocument the carOwnerDocument to set
	 */
	public void setCarOwnerDocument(String carOwnerDocument) {
		this.carOwnerDocument = carOwnerDocument;
	}
	/**
	 * @return the joinStartDate
	 */
	public long getJoinStartDate() {
		return joinStartDate;
	}
	/**
	 * @param joinStartDate the joinStartDate to set
	 */
	public void setJoinStartDate(long joinStartDate) {
		this.joinStartDate = joinStartDate;
	}
	/**
	 * @return the joinEndDate
	 */
	public long getJoinEndDate() {
		return joinEndDate;
	}
	/**
	 * @param joinEndDate the joinEndDate to set
	 */
	public void setJoinEndDate(long joinEndDate) {
		this.joinEndDate = joinEndDate;
	}
	/**
	 * @return the lastUseStartDate
	 */
	public long getLastUseStartDate() {
		return lastUseStartDate;
	}
	/**
	 * @param lastUseStartDate the lastUseStartDate to set
	 */
	public void setLastUseStartDate(long lastUseStartDate) {
		this.lastUseStartDate = lastUseStartDate;
	}
	/**
	 * @return the lastUseEndDate
	 */
	public long getLastUseEndDate() {
		return lastUseEndDate;
	}
	/**
	 * @param lastUseEndDate the lastUseEndDate to set
	 */
	public void setLastUseEndDate(long lastUseEndDate) {
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
	 * @return the carOwnerId
	 */
	public String getCarOwnerId() {
		return carOwnerId;
	}
	/**
	 * @param carOwnerId the carOwnerId to set
	 */
	public void setCarOwnerId(String carOwnerId) {
		this.carOwnerId = carOwnerId;
	}
	/**
	 * @return the carOwnerHistoryChangeReason
	 */
	public String getCarOwnerHistoryChangeReason() {
		return carOwnerHistoryChangeReason;
	}
	/**
	 * @param carOwnerHistoryChangeReason the carOwnerHistoryChangeReason to set
	 */
	public void setCarOwnerHistoryChangeReason(String carOwnerHistoryChangeReason) {
		this.carOwnerHistoryChangeReason = carOwnerHistoryChangeReason;
	}
	/**
	 * @return the carOwnerHistoryAmender
	 */
	public String getCarOwnerHistoryAmender() {
		return carOwnerHistoryAmender;
	}
	/**
	 * @param carOwnerHistoryAmender the carOwnerHistoryAmender to set
	 */
	public void setCarOwnerHistoryAmender(String carOwnerHistoryAmender) {
		this.carOwnerHistoryAmender = carOwnerHistoryAmender;
	}
	/**
	 * @return the carOwnerType
	 */
	public String getCarOwnerType() {
		return carOwnerType;
	}
	/**
	 * @param carOwnerType the carOwnerType to set
	 */
	public void setCarOwnerType(String carOwnerType) {
		this.carOwnerType = carOwnerType;
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
	 * @return the carOwnerFileAdminCheckYn
	 */
	public String getCarOwnerFileAdminCheckYn() {
		return carOwnerFileAdminCheckYn;
	}
	/**
	 * @param carOwnerFileAdminCheckYn the carOwnerFileAdminCheckYn to set
	 */
	public void setCarOwnerFileAdminCheckYn(String carOwnerFileAdminCheckYn) {
		this.carOwnerFileAdminCheckYn = carOwnerFileAdminCheckYn;
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
	public String getCarOwnerName() {
		return carOwnerName;
	}
	public void setCarOwnerName(String carOwnerName) {
		this.carOwnerName = carOwnerName;
	}
	public String getCarOwnerTelephone() {
		return carOwnerTelephone;
	}
	public void setCarOwnerTelephone(String carOwnerTelephone) {
		this.carOwnerTelephone = carOwnerTelephone;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public String getCarOwnerRecommendId() {
		return carOwnerRecommendId;
	}
	public void setCarOwnerRecommendId(String carOwnerRecommendId) {
		this.carOwnerRecommendId = carOwnerRecommendId;
	}
	
	public String getCarOwnerDeleteFlag() {
		return carOwnerDeleteFlag;
	}

	public void setCarOwnerDeleteFlag(String carOwnerDeleteFlag) {
		this.carOwnerDeleteFlag = carOwnerDeleteFlag;
	}
	
	public String getCarOwnerPaymentMethod() {
		return carOwnerPaymentMethod;
	}

	public void setCarOwnerPaymentMethod(String carOwnerPaymentMethod) {
		this.carOwnerPaymentMethod = carOwnerPaymentMethod;
	}	
	
}
