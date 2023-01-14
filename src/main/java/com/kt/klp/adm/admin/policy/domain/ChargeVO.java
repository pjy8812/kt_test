package com.kt.klp.adm.admin.policy.domain;

import kr.co.iousoft.lib.core.vo.SearchVO;

/**
*
* ChargeVO :  정책관리> 요금VO
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.27       mijin.kim    Initial creation
* </pre>
*
* @author IOUSOFT mijin.kim (mijin.kim@iousoft.co.kr)
* @since 2022.04.27
* @version 1.0.0
* @see
*
*/
public class ChargeVO extends SearchVO{
	
	public static final String SEARCH_TYPE_NAME = "name"; 		//검색타입 - 요금명
	public static final String SEARCH_TYPE_WORKER= "worker";	//검색타입 - 수정자
	public static final String CRUD_TYPE_CREATE = "C";			//action - 등록
	public static final String CRUD_TYPE_UPDATE = "U";			//action - 수정
	
	String chargeIdx;		//정책코드
	String chargeName;		//정책이름
	String chargeBasic;		//기본요금제여부
	String chargeUse; 		//사용여부
	String chargeStartDate; //사용기간(시작)
	String chargeEndDate;	//사용기간(종료)
	int chargeMargin;		//마진율
	String workerId;		//작업자ID
	String updDate;			//최종수정일
	
	//등록&수정
	String chargeJsonStr;
	String crudType;
	
	String carTypeJsonStr;
	String carTypeCrudType;
	
	String carOptionJsonStr;
	String carOptionCrudType;
	
	//검색어
	String searchType;		//검색어 타입		
	String searchText;		//검색어		
	
	//페이징
	int nowPage;	 //현재 페이지
	int pagePerRows; //목록 개수 (10, 20, 50개씩)	
	/**
	 * @return the chargeIdx
	 */
	public String getChargeIdx() {
		return chargeIdx;
	}
	/**
	 * @param chargeIdx the chargeIdx to set
	 */
	public void setChargeIdx(String chargeIdx) {
		this.chargeIdx = chargeIdx;
	}
	/**
	 * @return the chargeName
	 */
	public String getChargeName() {
		return chargeName;
	}
	/**
	 * @param chargeName the chargeName to set
	 */
	public void setChargeName(String chargeName) {
		this.chargeName = chargeName;
	}
	/**
	 * @return the chargeBasic
	 */
	public String getChargeBasic() {
		return chargeBasic;
	}
	/**
	 * @param chargeBasic the chargeBasic to set
	 */
	public void setChargeBasic(String chargeBasic) {
		this.chargeBasic = chargeBasic;
	}
	/**
	 * @return the chargeUse
	 */
	public String getChargeUse() {
		return chargeUse;
	}
	/**
	 * @param chargeUse the chargeUse to set
	 */
	public void setChargeUse(String chargeUse) {
		this.chargeUse = chargeUse;
	}
	/**
	 * @return the chargeStartDate
	 */
	public String getChargeStartDate() {
		return chargeStartDate;
	}
	/**
	 * @param chargeStartDate the chargeStartDate to set
	 */
	public void setChargeStartDate(String chargeStartDate) {
		this.chargeStartDate = chargeStartDate;
	}
	/**
	 * @return the chargeEndDate
	 */
	public String getChargeEndDate() {
		return chargeEndDate;
	}
	/**
	 * @param chargeEndDate the chargeEndDate to set
	 */
	public void setChargeEndDate(String chargeEndDate) {
		this.chargeEndDate = chargeEndDate;
	}
	/**
	 * @return the chargeMargin
	 */
	public int getChargeMargin() {
		return chargeMargin;
	}
	/**
	 * @param chargeMargin the chargeMargin to set
	 */
	public void setChargeMargin(int chargeMargin) {
		this.chargeMargin = chargeMargin;
	}
	/**
	 * @return the workerId
	 */
	public String getWorkerId() {
		return workerId;
	}
	/**
	 * @param workerId the workerId to set
	 */
	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}
	/**
	 * @return the updDate
	 */
	public String getUpdDate() {
		return updDate;
	}
	/**
	 * @param updDate the updDate to set
	 */
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
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
	 * @return the chargeJsonStr
	 */
	public String getChargeJsonStr() {
		return chargeJsonStr;
	}
	/**
	 * @param chargeJsonStr the chargeJsonStr to set
	 */
	public void setChargeJsonStr(String chargeJsonStr) {
		this.chargeJsonStr = chargeJsonStr;
	}
	/**
	 * @return the crudType
	 */
	public String getCrudType() {
		return crudType;
	}
	/**
	 * @param crudType the crudType to set
	 */
	public void setCrudType(String crudType) {
		this.crudType = crudType;
	}
	/**
	 * @return the carTypeCrudType
	 */
	public String getCarTypeCrudType() {
		return carTypeCrudType;
	}
	/**
	 * @param carTypeCrudType the carTypeCrudType to set
	 */
	public void setCarTypeCrudType(String carTypeCrudType) {
		this.carTypeCrudType = carTypeCrudType;
	}
	/**
	 * @return the carOptionCrudType
	 */
	public String getCarOptionCrudType() {
		return carOptionCrudType;
	}
	/**
	 * @param carOptionCrudType the carOptionCrudType to set
	 */
	public void setCarOptionCrudType(String carOptionCrudType) {
		this.carOptionCrudType = carOptionCrudType;
	}
	/**
	 * @return the carTypeJsonStr
	 */
	public String getCarTypeJsonStr() {
		return carTypeJsonStr;
	}
	/**
	 * @param carTypeJsonStr the carTypeJsonStr to set
	 */
	public void setCarTypeJsonStr(String carTypeJsonStr) {
		this.carTypeJsonStr = carTypeJsonStr;
	}
	/**
	 * @return the carOptionJsonStr
	 */
	public String getCarOptionJsonStr() {
		return carOptionJsonStr;
	}
	/**
	 * @param carOptionJsonStr the carOptionJsonStr to set
	 */
	public void setCarOptionJsonStr(String carOptionJsonStr) {
		this.carOptionJsonStr = carOptionJsonStr;
	}
}
