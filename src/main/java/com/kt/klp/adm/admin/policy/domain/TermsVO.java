package com.kt.klp.adm.admin.policy.domain;

import com.kt.klp.adm.admin.settlement.domain.SettlementStatusVO;

/**
*
* TermsVO : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.28       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.28
* @version 1.0.0
* @see
*
*/
public class TermsVO extends SettlementStatusVO {

	Integer termsSeq; // seq

	String termsRequiredYn; // 사용여뷰 	
	String termsServiceClassify; // 서비스구분	
	String termsType; // 화면구분
	// String termsDisplayClassify; // 화면구분
	String searchType; // 검색타입		
	String searchText; // 검색어
	
	Integer pagePerRows; // 목록 갯수 

	Long termsUseStartDateByLongType; // 사용시작일시		
	Long termsUseEndDateByLongType; // 사용종료일시		
	Long termsRevisionEffectiveDateByLongType; // 개정발효일
	String termsContent; // 내용
	
	String termsRevisionVersion; // 약관개정버전		
	String termsWriter; // 작성자
	Long termsRegisterDateByLongType; // 작성일
	Integer termsRevisionSeq; // 개정약관seq
	
	String termsName; // 약관명
	
	String mode;

	public Integer getTermsSeq() {
		return termsSeq;
	}

	public void setTermsSeq(Integer termsSeq) {
		this.termsSeq = termsSeq;
	}
	
	public String getTermsRequiredYn() {
		return termsRequiredYn;
	}

	public void setTermsRequiredYn(String termsRequiredYn) {
		this.termsRequiredYn = termsRequiredYn;
	}

	public String getTermsServiceClassify() {
		return termsServiceClassify;
	}

	public void setTermsServiceClassify(String termsServiceClassify) {
		this.termsServiceClassify = termsServiceClassify;
	}

//	public String getTermsDisplayClassify() {
//		return termsDisplayClassify;
//	}
//
//	public void setTermsDisplayClassify(String termsDisplayClassify) {
//		this.termsDisplayClassify = termsDisplayClassify;
//	}

	public String getTermsType() {
		return termsType;
	}

	public void setTermsType(String termsType) {
		this.termsType = termsType;
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

	public Integer getPagePerRows() {
		return pagePerRows;
	}

	public void setPagePerRows(Integer pagePerRows) {
		this.pagePerRows = pagePerRows;
	}

	public Long getTermsUseStartDateByLongType() {
		return termsUseStartDateByLongType;
	}

	public void setTermsUseStartDateByLongType(Long termsUseStartDateByLongType) {
		this.termsUseStartDateByLongType = termsUseStartDateByLongType;
	}

	public Long getTermsUseEndDateByLongType() {
		return termsUseEndDateByLongType;
	}

	public void setTermsUseEndDateByLongType(Long termsUseEndDateByLongType) {
		this.termsUseEndDateByLongType = termsUseEndDateByLongType;
	}

	public Long getTermsRevisionEffectiveDateByLongType() {
		return termsRevisionEffectiveDateByLongType;
	}

	public void setTermsRevisionEffectiveDateByLongType(Long termsRevisionEffectiveDateByLongType) {
		this.termsRevisionEffectiveDateByLongType = termsRevisionEffectiveDateByLongType;
	}

	public String getTermsContent() {
		return termsContent;
	}

	public void setTermsContent(String termsContent) {
		this.termsContent = termsContent;
	}

	public String getTermsRevisionVersion() {
		return termsRevisionVersion;
	}

	public void setTermsRevisionVersion(String termsRevisionVersion) {
		this.termsRevisionVersion = termsRevisionVersion;
	}

	public String getTermsWriter() {
		return termsWriter;
	}

	public void setTermsWriter(String termsWriter) {
		this.termsWriter = termsWriter;
	}

	public Long getTermsRegisterDateByLongType() {
		return termsRegisterDateByLongType;
	}

	public void setTermsRegisterDateByLongType(Long termsRegisterDateByLongType) {
		this.termsRegisterDateByLongType = termsRegisterDateByLongType;
	}

	public Integer getTermsRevisionSeq() {
		return termsRevisionSeq;
	}

	public void setTermsRevisionSeq(Integer termsRevisionSeq) {
		this.termsRevisionSeq = termsRevisionSeq;
	}

	public String getTermsName() {
		return termsName;
	}

	public void setTermsName(String termsName) {
		this.termsName = termsName;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	

	
}
