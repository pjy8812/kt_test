package com.kt.klp.adm.admin.system.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* MenuVO : 메뉴관리 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.11.21       Seongrae Kim     Initial creation
* </pre>
*
* @author PARUCNC Seongrae Kim (akaikarus@parucnc.com)
* @since 2022.11.21
* @version 1.0.0
* @see
*
*/

public class MenuVO extends CommonTableVO {
	
	String useYn;           //사용여부	
	String searchType;      //검색타입
	String searchText;      //검색어
	
	String menuCd;          // 메뉴코드
	String upMenuCd;        // 상위메뉴코드
	String menuNm;          // 메뉴명
	String menuSort;        // 순번
	String menuUrl;         // 메뉴 URL
	String creId;           // 생성자
	String creDate;         // 생성일시
	String modId;           // 수정자
	String modDate;         // 수정일시
	
	
	public MenuVO() {
		// TODO Auto-generated constructor stub
	}	
	
	public MenuVO(Map map) {
		super(map);
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
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

	public String getMenuCd() {
		return menuCd;
	}

	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}

	public String getUpMenuCd() {
		return upMenuCd;
	}

	public void setUpMenuCd(String upMEnuCd) {
		this.upMenuCd = upMEnuCd;
	}

	public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	public String getMenuSort() {
		return menuSort;
	}

	public void setMenuSort(String menuSort) {
		this.menuSort = menuSort;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getCreId() {
		return creId;
	}

	public void setCreId(String creId) {
		this.creId = creId;
	}

	public String getCreDate() {
		return creDate;
	}

	public void setCreDate(String creDate) {
		this.creDate = creDate;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	
}