package com.kt.klp.adm.admin.policy.domain;

import kr.co.iousoft.lib.core.vo.SearchVO;

/**
*
* AreaVO :  정책관리> 요금> 지역VO
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.05.09       mijin.kim    Initial creation
* </pre>
*
* @author IOUSOFT mijin.kim (mijin.kim@iousoft.co.kr)
* @since 2022.05.09
* @version 1.0.0
* @see
*
*/
public class AreaVO extends SearchVO{
	
	String areaGroupCode;
	String areaGroupName;
	
	//검색어
	String searchType;		//검색어 타입		
	String searchText;		//검색어		
	
	//페이징
	int nowPage;	 //현재 페이지
	int pagePerRows; //목록 개수 (10, 20, 50개씩)	
	/**
	 * @return the areaGroupCode
	 */
	public String getAreaGroupCode() {
		return areaGroupCode;
	}
	/**
	 * @param areaGroupCode the areaGroupCode to set
	 */
	public void setAreaGroupCode(String areaGroupCode) {
		this.areaGroupCode = areaGroupCode;
	}
	/**
	 * @return the areaGroupName
	 */
	public String getAreaGroupName() {
		return areaGroupName;
	}
	/**
	 * @param areaGroupName the areaGroupName to set
	 */
	public void setAreaGroupName(String areaGroupName) {
		this.areaGroupName = areaGroupName;
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
	
}
