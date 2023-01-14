package com.kt.klp.adm.admin.help.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* ManualVO : APP/WEB> 매뉴얼 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.17       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.17
* @version 1.0.0
* @see
*
*/

public class ManualVO extends CommonTableVO{

	String manualRecipient;			//매뉴얼 대상
	String manualCategory;			//매뉴얼 카테고리
	String manualExposedStartDate;	//매뉴얼 게시 시작일
	String manualExposedEndDate;	//매뉴얼 게시 종료일 
	String manualSeq;				//매뉴얼 seq
	String manualTitle;				//매뉴얼 제목
	String manualWriter;			//매뉴얼 작성ID
	String manualContent;			//매뉴얼 내용 
	String manualExposedAlwaysYN;	//매뉴얼 상시게시여부
	String manualExposedAlwaysYn;
	long manualExposedStartDateByLongType;
	long manualExposedEndDateByLongType;

	//검색
	String searchType;					//검색어 타입		
	String searchText;					//검색어		
	
	//페이징
	int nowPage;						//현재 페이지
		
	public ManualVO() {};
	public ManualVO(Map map) {
		super(map);
	}
	/**
	 * @return the manualRecipient
	 */
	public String getManualRecipient() {
		return manualRecipient;
	}
	/**
	 * @param manualRecipient the manualRecipient to set
	 */
	public void setManualRecipient(String manualRecipient) {
		this.manualRecipient = manualRecipient;
	}
	/**
	 * @return the manualCategory
	 */
	public String getManualCategory() {
		return manualCategory;
	}
	/**
	 * @param manualCategory the manualCategory to set
	 */
	public void setManualCategory(String manualCategory) {
		this.manualCategory = manualCategory;
	}
	/**
	 * @return the manualExposedStartDate
	 */
	public String getManualExposedStartDate() {
		return manualExposedStartDate;
	}
	/**
	 * @param manualExposedStartDate the manualExposedStartDate to set
	 */
	public void setManualExposedStartDate(String manualExposedStartDate) {
		this.manualExposedStartDate = manualExposedStartDate;
	}
	/**
	 * @return the manualExposedEndDate
	 */
	public String getManualExposedEndDate() {
		return manualExposedEndDate;
	}
	/**
	 * @param manualExposedEndDate the manualExposedEndDate to set
	 */
	public void setManualExposedEndDate(String manualExposedEndDate) {
		this.manualExposedEndDate = manualExposedEndDate;
	}
	/**
	 * @return the manualSeq
	 */
	public String getManualSeq() {
		return manualSeq;
	}
	/**
	 * @param manualSeq the manualSeq to set
	 */
	public void setManualSeq(String manualSeq) {
		this.manualSeq = manualSeq;
	}
	/**
	 * @return the manualTitle
	 */
	public String getManualTitle() {
		return manualTitle;
	}
	/**
	 * @param manualTitle the manualTitle to set
	 */
	public void setManualTitle(String manualTitle) {
		this.manualTitle = manualTitle;
	}
	/**
	 * @return the manualWriter
	 */
	public String getManualWriter() {
		return manualWriter;
	}
	/**
	 * @param manualWriter the manualWriter to set
	 */
	public void setManualWriter(String manualWriter) {
		this.manualWriter = manualWriter;
	}
	/**
	 * @return the manualContent
	 */
	public String getManualContent() {
		return manualContent;
	}
	/**
	 * @param manualContent the manualContent to set
	 */
	public void setManualContent(String manualContent) {
		this.manualContent = manualContent;
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
	 * @return the manualExposedAlwaysYN
	 */
	public String getManualExposedAlwaysYN() {
		return manualExposedAlwaysYN;
	}
	/**
	 * @param manualExposedAlwaysYN the manualExposedAlwaysYN to set
	 */
	public void setManualExposedAlwaysYN(String manualExposedAlwaysYN) {
		this.manualExposedAlwaysYN = manualExposedAlwaysYN;
	}
	
}
