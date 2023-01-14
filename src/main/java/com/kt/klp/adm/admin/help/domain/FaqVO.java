package com.kt.klp.adm.admin.help.domain;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* FaqVO : APP/WEB> FAQ vo
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

public class FaqVO extends CommonTableVO{

	String faqSeq;				//FAQ seq
	String faqCategory;			//FAQ 카테고리
	String faqRecipient;		//FAQ 대상
	String faqTitle;			//FAQ 제목
	String faqContent;			//FAQ 내용
	String faqAlwaysPostYn;		//FAQ 상시게시 여부
	long faqExposedStartDate;	//FAQ 노출 시작일시 (검색시 작성일 시작)
	long faqExposedEndDate;		//FAQ 노출 종료일시 (검색시 작성일 종료)
	
	MultipartFile attachedFiles;
	
	//검색
	String searchType;					//검색어 타입		
	String searchText;					//검색어		
	
	//페이징
	int nowPage;						//현재 페이지
		
	public FaqVO() {};
	public FaqVO(Map map) {
		super(map);
	}
	/**
	 * @return the faqSeq
	 */
	public String getFaqSeq() {
		return faqSeq;
	}
	/**
	 * @param faqSeq the faqSeq to set
	 */
	public void setFaqSeq(String faqSeq) {
		this.faqSeq = faqSeq;
	}
	/**
	 * @return the faqCategory
	 */
	public String getFaqCategory() {
		return faqCategory;
	}
	/**
	 * @param faqCategory the faqCategory to set
	 */
	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}
	/**
	 * @return the faqRecipient
	 */
	public String getFaqRecipient() {
		return faqRecipient;
	}
	/**
	 * @param faqRecipient the faqRecipient to set
	 */
	public void setFaqRecipient(String faqRecipient) {
		this.faqRecipient = faqRecipient;
	}
	/**
	 * @return the faqTitle
	 */
	public String getFaqTitle() {
		return faqTitle;
	}
	/**
	 * @param faqTitle the faqTitle to set
	 */
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	/**
	 * @return the faqContent
	 */
	public String getFaqContent() {
		return faqContent;
	}
	/**
	 * @param faqContent the faqContent to set
	 */
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	/**
	 * @return the faqExposedStartDate
	 */
	public long getFaqExposedStartDate() {
		return faqExposedStartDate;
	}
	/**
	 * @param faqExposedStartDate the faqExposedStartDate to set
	 */
	public void setFaqExposedStartDate(long faqExposedStartDate) {
		this.faqExposedStartDate = faqExposedStartDate;
	}
	/**
	 * @return the faqExposedEndDate
	 */
	public long getFaqExposedEndDate() {
		return faqExposedEndDate;
	}
	/**
	 * @param faqExposedEndDate the faqExposedEndDate to set
	 */
	public void setFaqExposedEndDate(long faqExposedEndDate) {
		this.faqExposedEndDate = faqExposedEndDate;
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
	 * @return the faqAlwaysPostYn
	 */
	public String getFaqAlwaysPostYn() {
		return faqAlwaysPostYn;
	}
	/**
	 * @param faqAlwaysPostYn the faqAlwaysPostYn to set
	 */
	public void setFaqAlwaysPostYn(String faqAlwaysPostYn) {
		this.faqAlwaysPostYn = faqAlwaysPostYn;
	}
	/**
	 * @return the attachedFiles
	 */
	public MultipartFile getAttachedFiles() {
		return attachedFiles;
	}
	/**
	 * @param attachedFiles the attachedFiles to set
	 */
	public void setAttachedFiles(MultipartFile attachedFiles) {
		this.attachedFiles = attachedFiles;
	}
}
