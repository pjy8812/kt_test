package com.kt.klp.adm.admin.help.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* SendVO : APP/WEB> 발송관리 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.03.10       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.03.10
* @version 1.0.0
* @see
*
*/

public class SendVO extends CommonTableVO{

	String sendCategory;
	String sendType;
	String sendTarget;
	String sendStatus;
	String templateName;
	String type;
	String maskingYn;
	
	String sendSeq;
	
	String ownerClassification;	//회원구분
	String ownerId; //회원ID
	
	//검색
	long startDate;
	long endDate;
	String searchType;					//검색어 타입		
	String searchText;					//검색어		
	
	//페이징
	int nowPage;	//현재 페이지

	
	public SendVO() {};
	public SendVO(Map map) {
		super(map);
	}
	/**
	 * @return the sendCategory
	 */
	public String getSendCategory() {
		return sendCategory;
	}
	/**
	 * @param sendCategory the sendCategory to set
	 */
	public void setSendCategory(String sendCategory) {
		this.sendCategory = sendCategory;
	}
	/**
	 * @return the sendType
	 */
	public String getSendType() {
		return sendType;
	}
	/**
	 * @param sendType the sendType to set
	 */
	public void setSendType(String sendType) {
		this.sendType = sendType;
	}
	/**
	 * @return the sendTarget
	 */
	public String getSendTarget() {
		return sendTarget;
	}
	/**
	 * @param sendTarget the sendTarget to set
	 */
	public void setSendTarget(String sendTarget) {
		this.sendTarget = sendTarget;
	}
	/**
	 * @return the sendStatus
	 */
	public String getSendStatus() {
		return sendStatus;
	}
	/**
	 * @param sendStatus the sendStatus to set
	 */
	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}
	/**
	 * @return the templateName
	 */
	public String getTemplateName() {
		return templateName;
	}
	/**
	 * @param templateName the templateName to set
	 */
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
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
	 * @return the sendSeq
	 */
	public String getSendSeq() {
		return sendSeq;
	}
	/**
	 * @param sendSeq the sendSeq to set
	 */
	public void setSendSeq(String sendSeq) {
		this.sendSeq = sendSeq;
	}
	/**
	 * @return the ownerClassification
	 */
	public String getOwnerClassification() {
		return ownerClassification;
	}
	/**
	 * @param ownerClassification the ownerClassification to set
	 */
	public void setOwnerClassification(String ownerClassification) {
		this.ownerClassification = ownerClassification;
	}
	/**
	 * @return the ownerId
	 */
	public String getOwnerId() {
		return ownerId;
	}
	/**
	 * @param ownerId the ownerId to set
	 */
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	/**
	 * @return the startDate
	 */
	public long getStartDate() {
		return startDate;
	}
	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(long startDate) {
		this.startDate = startDate;
	}
	/**
	 * @return the endDate
	 */
	public long getEndDate() {
		return endDate;
	}
	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(long endDate) {
		this.endDate = endDate;
	}
}
