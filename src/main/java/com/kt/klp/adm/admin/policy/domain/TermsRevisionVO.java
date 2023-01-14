package com.kt.klp.adm.admin.policy.domain;

/**
*
* TermsRevisionVO : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.03.03       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.03.03
* @version 1.0.0
* @see
*
*/
public class TermsRevisionVO extends TermsVO {

	Integer termsRevisionTermsSeq; // 약관seq
	String termsRevisionVersion; // 개정버전
	String termsRevisionRequiredYn; // 사용여부
	Long termsRevisionEffectiveDateByLongType; // 개정발효일
	Long termsRevisionUseStartDateByLongType; // 사용시작일시
	Long termsRevisionUseEndDateByLongType; // 사용종료일시
	String termsRevisionContent; // 내용

	Integer termsSeq; // seq 
	String termsName; // 약관명		
	String termsServiceClassify; // 서비스구분		
	// String termsDisplayClassify; // 화면구분		
	String termsRequiredYn; // 사용여뷰 
	
	Long termsUseStartDateByLongType; // 사용시작일시		
	Long termsUseEndDateByLongType;	// 사용종료일시		
	String termsContent; // 본문		
	String termsWriter;	// 작성자		
	Long termsRegisterDateByLongType; // 작성일		
	Integer termsRevisionSeq; // 개정약관seq		
	
	public Integer getTermsRevisionTermsSeq() {
		return termsRevisionTermsSeq;
	}

	public void setTermsRevisionTermsSeq(Integer termsRevisionTermsSeq) {
		this.termsRevisionTermsSeq = termsRevisionTermsSeq;
	}

	public String getTermsRevisionVersion() {
		return termsRevisionVersion;
	}

	public void setTermsRevisionVersion(String termsRevisionVersion) {
		this.termsRevisionVersion = termsRevisionVersion;
	}

	public String getTermsRevisionRequiredYn() {
		return termsRevisionRequiredYn;
	}

	public void setTermsRevisionRequiredYn(String termsRevisionRequiredYn) {
		this.termsRevisionRequiredYn = termsRevisionRequiredYn;
	}

	public Long getTermsRevisionEffectiveDateByLongType() {
		return termsRevisionEffectiveDateByLongType;
	}

	public void setTermsRevisionEffectiveDateByLongType(Long termsRevisionEffectiveDateByLongType) {
		this.termsRevisionEffectiveDateByLongType = termsRevisionEffectiveDateByLongType;
	}

	public Long getTermsRevisionUseStartDateByLongType() {
		return termsRevisionUseStartDateByLongType;
	}

	public void setTermsRevisionUseStartDateByLongType(Long termsRevisionUseStartDateByLongType) {
		this.termsRevisionUseStartDateByLongType = termsRevisionUseStartDateByLongType;
	}

	public Long getTermsRevisionUseEndDateByLongType() {
		return termsRevisionUseEndDateByLongType;
	}

	public void setTermsRevisionUseEndDateByLongType(Long termsRevisionUseEndDateByLongType) {
		this.termsRevisionUseEndDateByLongType = termsRevisionUseEndDateByLongType;
	}

	public String getTermsRevisionContent() {
		return termsRevisionContent;
	}

	public void setTermsRevisionContent(String termsRevisionContent) {
		this.termsRevisionContent = termsRevisionContent;
	}

	public Integer getTermsSeq() {
		return termsSeq;
	}

	public void setTermsSeq(Integer termsSeq) {
		this.termsSeq = termsSeq;
	}

	public String getTermsName() {
		return termsName;
	}

	public void setTermsName(String termsName) {
		this.termsName = termsName;
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

	public String getTermsRequiredYn() {
		return termsRequiredYn;
	}

	public void setTermsRequiredYn(String termsRequiredYn) {
		this.termsRequiredYn = termsRequiredYn;
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

	public String getTermsContent() {
		return termsContent;
	}

	public void setTermsContent(String termsContent) {
		this.termsContent = termsContent;
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
	
}
