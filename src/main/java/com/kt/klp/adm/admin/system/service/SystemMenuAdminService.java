package com.kt.klp.adm.admin.system.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.system.domain.MenuVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* SystemMenuAdminService : 메뉴 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.11.22       Seongrae Kim     Initial creation
* </pre>
*
* @author PARUCNC Seongrae Kim (akaikarus@parucnc.com)
* @since 2022.11.22
* @version 1.0.0
* @see
*
*/

@Service("systemMenuAdminService")
public class SystemMenuAdminService extends AbstractServiceImpl {
	
	public static final String API_URL_MENU_LIST = "/v1/admin/system/menu/list"; //그룹코드 조회 및 검색
	public static final String API_URL_MENU_INSERT = "/v1/admin/system/menu/insert"; //그룹코드 등록
	public static final String API_URL_MENU_UPDATE = "/v1/admin/system/menu/update"; //그룹코드 수정
	public static final String API_URL_MENU_CHECK = "/v1/admin/system/menu/check"; //그룹코드ID 중복조회

	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	
	/**
	 * 메뉴 목록
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listMenu(SessionVO session, MenuVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("useYn", vo.getUseYn()); 
		body.put("searchType", vo.getSearchType());
		body.put("searchText", vo.getSearchText());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_MENU_LIST, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 메뉴코드 중복조회
	 * 
	 * @param session
	 * @param cd
	 * @return
	 */
	public Map checkCode(SessionVO session, String menuCd) {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("menuCd", menuCd);
		
		// url connection
		String url = ktapiAdmin + API_URL_MENU_CHECK;
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 메뉴 등록
	 * 
	 * @param session
	 * @param mode
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map saveMenu(SessionVO session, MenuVO menuVO) {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("menuCd", menuVO.getMenuCd());
		body.put("upMenuCd", menuVO.getUpMenuCd());
		body.put("menuNm", menuVO.getMenuNm());
		body.put("useYn", menuVO.getUseYn());
		body.put("menuSort", menuVO.getMenuSort());
		body.put("menuUrl", menuVO.getMenuUrl());
		body.put("creId", session.getAdminId());
		
		// url connection
		String url = ktapiAdmin + API_URL_MENU_INSERT;
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 메뉴 등록
	 * 
	 * @param session
	 * @param mode
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map updateMenu(SessionVO session, MenuVO menuVO) {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("menuCd", menuVO.getMenuCd());
		body.put("upMenuCd", menuVO.getUpMenuCd());
		body.put("menuNm", menuVO.getMenuNm());
		body.put("useYn", menuVO.getUseYn());
		body.put("menuSort", menuVO.getMenuSort());
		body.put("menuUrl", menuVO.getMenuUrl());
		body.put("modId", session.getAdminId());
		
		// url connection
		String url = ktapiAdmin + API_URL_MENU_UPDATE;
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}

}
