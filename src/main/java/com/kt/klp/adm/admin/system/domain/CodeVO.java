package com.kt.klp.adm.admin.system.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* CodeVO : 공통코드 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.28       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.02.28
* @version 1.0.0
* @see
*
*/

public class CodeVO extends CommonTableVO {
	
	String useYn;			//사용여부	
	String searchType;		//검색타입
	String searchText;		//검색어
	
	String codeId;			//코드아이디
	String codeName;		//코드명
	String codeUseYn;		//사용여부
	String codeDescription; //비고
	String codeGroupId;		//그룹코드 아이디
	
	
	public CodeVO() {
		// TODO Auto-generated constructor stub
	}	
	
	public CodeVO(Map map) {
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

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getCodeUseYn() {
		return codeUseYn;
	}

	public void setCodeUseYn(String codeUseYn) {
		this.codeUseYn = codeUseYn;
	}

	public String getCodeDescription() {
		return codeDescription;
	}

	public void setCodeDescription(String codeDescription) {
		this.codeDescription = codeDescription;
	}

	public String getCodeGroupId() {
		return codeGroupId;
	}

	public void setCodeGroupId(String codeGroupId) {
		this.codeGroupId = codeGroupId;
	}
	
}