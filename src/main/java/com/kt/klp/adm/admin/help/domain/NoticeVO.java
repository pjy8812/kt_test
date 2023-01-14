package com.kt.klp.adm.admin.help.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* NoticeVO : APP/WEB> 공지사항 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.07       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.07
* @version 1.0.0
* @see
*
*/

public class NoticeVO extends CommonTableVO{

	String noticeSeq;				//공지사항 seq
	String noticeRecipient;			//공지대상 (공통, 화주, 차주)
	String noticeTitle;				//공지사항 제목
	String noticeContent;			//공지사항 내용
	String noticePopupSetting;		//공지사항 팝업설정 여부
	String noticeTopExposed;		//공지사항 상단노출 여부
	long noticeExposedStartDate;	//공지사항 노출 시작일시 (검색시 최종작성일 시작일) 
	long noticeExposedEndDate;		//공지사항 노출 종료일시 (검색시 최종작성일 종료일)
	String noticeAlwaysPostYn;		//공지사항 상시게시 여부
	String noticePopupType; 		//공지사항 팝업타입 by.2022.04.10 추가 
	
	long noticeExposedStartDateByLongType;
	long noticeExposedEndDateByLongType;
	
	//검색
	String searchType;					//검색어 타입		
	String searchText;					//검색어		
	String noticeExposedYn;				//게시중 상태만
	
	//페이징
	int nowPage;	//현재 페이지
	
	public NoticeVO() {};
	public NoticeVO(Map map) {
		super(map);
	}
	/**
	 * @return the noticeSeq
	 */
	public String getNoticeSeq() {
		return noticeSeq;
	}
	/**
	 * @param noticeSeq the noticeSeq to set
	 */
	public void setNoticeSeq(String noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	/**
	 * @return the noticeRecipient
	 */
	public String getNoticeRecipient() {
		return noticeRecipient;
	}
	/**
	 * @param noticeRecipient the noticeRecipient to set
	 */
	public void setNoticeRecipient(String noticeRecipient) {
		this.noticeRecipient = noticeRecipient;
	}
	/**
	 * @return the noticeTitle
	 */
	public String getNoticeTitle() {
		return noticeTitle;
	}
	/**
	 * @param noticeTitle the noticeTitle to set
	 */
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	/**
	 * @return the noticeContent
	 */
	public String getNoticeContent() {
		return noticeContent;
	}
	/**
	 * @param noticeContent the noticeContent to set
	 */
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	/**
	 * @return the noticePopupSetting
	 */
	public String getNoticePopupSetting() {
		return noticePopupSetting;
	}
	/**
	 * @param noticePopupSetting the noticePopupSetting to set
	 */
	public void setNoticePopupSetting(String noticePopupSetting) {
		this.noticePopupSetting = noticePopupSetting;
	}
	/**
	 * @return the noticeTopExposed
	 */
	public String getNoticeTopExposed() {
		return noticeTopExposed;
	}
	/**
	 * @param noticeTopExposed the noticeTopExposed to set
	 */
	public void setNoticeTopExposed(String noticeTopExposed) {
		this.noticeTopExposed = noticeTopExposed;
	}
	/**
	 * @return the noticeExposedStartDate
	 */
	public long getNoticeExposedStartDate() {
		return noticeExposedStartDate;
	}
	/**
	 * @param noticeExposedStartDate the noticeExposedStartDate to set
	 */
	public void setNoticeExposedStartDate(long noticeExposedStartDate) {
		this.noticeExposedStartDate = noticeExposedStartDate;
	}
	/**
	 * @return the noticeExposedEndDate
	 */
	public long getNoticeExposedEndDate() {
		return noticeExposedEndDate;
	}
	/**
	 * @param noticeExposedEndDate the noticeExposedEndDate to set
	 */
	public void setNoticeExposedEndDate(long noticeExposedEndDate) {
		this.noticeExposedEndDate = noticeExposedEndDate;
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
	 * @return the noticeExposedYn
	 */
	public String getNoticeExposedYn() {
		return noticeExposedYn;
	}
	/**
	 * @param noticeExposedYn the noticeExposedYn to set
	 */
	public void setNoticeExposedYn(String noticeExposedYn) {
		this.noticeExposedYn = noticeExposedYn;
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
	 * @return the noticeAlwaysPostYn
	 */
	public String getNoticeAlwaysPostYn() {
		return noticeAlwaysPostYn;
	}
	/**
	 * @param noticeAlwaysPostYn the noticeAlwaysPostYn to set
	 */
	public void setNoticeAlwaysPostYn(String noticeAlwaysPostYn) {
		this.noticeAlwaysPostYn = noticeAlwaysPostYn;
	}
	/**
	 * @return the noticeExposedStartDateByLongType
	 */
	public long getNoticeExposedStartDateByLongType() {
		return noticeExposedStartDateByLongType;
	}
	/**
	 * @param noticeExposedStartDateByLongType the noticeExposedStartDateByLongType to set
	 */
	public void setNoticeExposedStartDateByLongType(long noticeExposedStartDateByLongType) {
		this.noticeExposedStartDateByLongType = noticeExposedStartDateByLongType;
	}
	/**
	 * @return the noticeExposedEndDateByLongType
	 */
	public long getNoticeExposedEndDateByLongType() {
		return noticeExposedEndDateByLongType;
	}
	/**
	 * @param noticeExposedEndDateByLongType the noticeExposedEndDateByLongType to set
	 */
	public void setNoticeExposedEndDateByLongType(long noticeExposedEndDateByLongType) {
		this.noticeExposedEndDateByLongType = noticeExposedEndDateByLongType;
	}
	/**
	 * @return the noticePopupType
	 */
	public String getNoticePopupType() {
		return noticePopupType;
	}
	/**
	 * @param noticePopupType the noticePopupType to set
	 */
	public void setNoticePopupType(String noticePopupType) {
		this.noticePopupType = noticePopupType;
	}
}