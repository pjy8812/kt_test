package com.kt.klp.adm.admin.help.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* LocationVO : APP/WEB> 위치정보관리대장 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.29       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.04.29
* @version 1.0.0
* @see
*
*/

public class LocationVO extends CommonTableVO{

	String carOwnerId;					//1:1문의 seq
	long createStratDate;		//1:1문의 검색 작성시작일
	long createEndDate;			//1:1문의 검색 작성 종료일
	
	String maskingYn; 			//마스킹여부
	
	//페이징
	int nowPage;						//현재 페이지
	int pagePerRows;
		
	public LocationVO() {};
	public LocationVO(Map map) {
		super(map);
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
	 * @return the createStratDate
	 */
	public long getCreateStratDate() {
		return createStratDate;
	}
	/**
	 * @param createStratDate the createStratDate to set
	 */
	public void setCreateStratDate(long createStratDate) {
		this.createStratDate = createStratDate;
	}
	/**
	 * @return the createEndDate
	 */
	public long getCreateEndDate() {
		return createEndDate;
	}
	/**
	 * @param createEndDate the createEndDate to set
	 */
	public void setCreateEndDate(long createEndDate) {
		this.createEndDate = createEndDate;
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
}
