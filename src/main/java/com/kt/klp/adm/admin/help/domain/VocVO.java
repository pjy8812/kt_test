package com.kt.klp.adm.admin.help.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* VocVO : APP/WEB> 1:1문의 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.08       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.08
* @version 1.0.0
* @see
*
*/

public class VocVO extends CommonTableVO{

	String vocSeq;					//1:1문의 seq
	//String vocCategory;			//1:1문의 카테고리 (2022.03.15 삭제됨)
	String vocStatus;				//1:1문의 답변상태
	long vocExposedStartDate;		//1:1문의 검색 작성시작일
	long vocExposedEndDate;			//1:1문의 검색 작성 종료일
	String vocOrderNum;				//1:1문의 주문번호 
	String vocTitle;				//1:1문의 제목
	String vocOwnerClassification;	//1:1문의 대상(등록/수정시 사용)
	String vocContents;				//1:1문의 내용
	String vocOrderId;				//1:1문의 주문ID by 2022.03.29 추가
	
	String vocAnswer; //답변 
	
	//검색
	String searchType;					//검색어 타입		
	String searchText;					//검색어		
	
	//페이징
	int nowPage;						//현재 페이지
		
	public VocVO() {};
	public VocVO(Map map) {
		super(map);
	}
	/**
	 * @return the vocSeq
	 */
	public String getVocSeq() {
		return vocSeq;
	}
	/**
	 * @param vocSeq the vocSeq to set
	 */
	public void setVocSeq(String vocSeq) {
		this.vocSeq = vocSeq;
	}
	/**
	 * @return the vocExposedStartDate
	 */
	public long getVocExposedStartDate() {
		return vocExposedStartDate;
	}
	/**
	 * @param vocExposedStartDate the vocExposedStartDate to set
	 */
	public void setVocExposedStartDate(long vocExposedStartDate) {
		this.vocExposedStartDate = vocExposedStartDate;
	}
	/**
	 * @return the vocExposedEndDate
	 */
	public long getVocExposedEndDate() {
		return vocExposedEndDate;
	}
	/**
	 * @param vocExposedEndDate the vocExposedEndDate to set
	 */
	public void setVocExposedEndDate(long vocExposedEndDate) {
		this.vocExposedEndDate = vocExposedEndDate;
	}
	/**
	 * @return the vocAnswer
	 */
	public String getVocAnswer() {
		return vocAnswer;
	}
	/**
	 * @param vocAnswer the vocAnswer to set
	 */
	public void setVocAnswer(String vocAnswer) {
		this.vocAnswer = vocAnswer;
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
	 * @return the vocOrderNum
	 */
	public String getVocOrderNum() {
		return vocOrderNum;
	}
	/**
	 * @param vocOrderNum the vocOrderNum to set
	 */
	public void setVocOrderNum(String vocOrderNum) {
		this.vocOrderNum = vocOrderNum;
	}
	/**
	 * @return the vocTitle
	 */
	public String getVocTitle() {
		return vocTitle;
	}
	/**
	 * @param vocTitle the vocTitle to set
	 */
	public void setVocTitle(String vocTitle) {
		this.vocTitle = vocTitle;
	}
	/**
	 * @return the vocContents
	 */
	public String getVocContents() {
		return vocContents;
	}
	/**
	 * @param vocContents the vocContents to set
	 */
	public void setVocContents(String vocContents) {
		this.vocContents = vocContents;
	}
	/**
	 * @return the vocStatus
	 */
	public String getVocStatus() {
		return vocStatus;
	}
	/**
	 * @param vocStatus the vocStatus to set
	 */
	public void setVocStatus(String vocStatus) {
		this.vocStatus = vocStatus;
	}
	/**
	 * @return the vocOwnerClassification
	 */
	public String getVocOwnerClassification() {
		return vocOwnerClassification;
	}
	/**
	 * @param vocOwnerClassification the vocOwnerClassification to set
	 */
	public void setVocOwnerClassification(String vocOwnerClassification) {
		this.vocOwnerClassification = vocOwnerClassification;
	}
	/**
	 * @return the vocOrderId
	 */
	public String getVocOrderId() {
		return vocOrderId;
	}
	/**
	 * @param vocOrderId the vocOrderId to set
	 */
	public void setVocOrderId(String vocOrderId) {
		this.vocOrderId = vocOrderId;
	}
}
