package com.kt.klp.adm.admin.system.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.system.domain.CodeVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* SystemCodeAdminService : 공통코드 service
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

@Service("systemCodeAdminService")
public class SystemCodeAdminService extends AbstractServiceImpl {
	
	public static final String API_URL_CODE_LIST = "/v1/admin/system/code/list"; //그룹코드 조회 및 검색
	public static final String API_URL_CODE_INSERT = "/v1/admin/system/code/insert"; //그룹코드 등록
	public static final String API_URL_CODE_UPDATE = "/v1/admin/system/code/update"; //그룹코드 수정
	public static final String API_URL_CODE_CHECK = "/v1/admin/system/code/check/code"; //그룹코드ID 중복조회

	public static final String API_URL_CODE_DETAIL_LIST = "/v1/admin/system/code/detail/list"; //상세코드 조회 및 검색
	public static final String API_URL_CODE_DETAIL_INSERT = "/v1/admin/system/code/detail/insert"; //상세코드 등록
	public static final String API_URL_CODE_DETAIL_UPDATE = "/v1/admin/system/code/detail/update"; //상세코드 수정
	public static final String API_URL_CODE_DETAIL_CHECK = "/v1/admin/system/code/detail/check/code"; //상세코드ID 중복조회
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	
	/**
	 * 공통코드 목록
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listCode(SessionVO session, CodeVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("codeUseYn", vo.getCodeUseYn()); 
		body.put("searchType", vo.getSearchType());
		body.put("searchText", vo.getSearchText());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_CODE_LIST, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 공통코드 상세
	 * 
	 * @param session
	 * @param vo
	 * @return
	 */
	public Map selectCode(SessionVO session, CodeVO vo) {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("codeGroupId", vo.getCodeGroupId());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_CODE_DETAIL_LIST, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 코드ID 중복조회
	 * 
	 * @param session
	 * @param mode
	 * @param id
	 * @return
	 */
	public Map checkCode(SessionVO session, String mode, String id) {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		String url = "";
		
		if(mode.equals("group")) {
			url = ktapiAdmin + API_URL_CODE_CHECK;
			body.put("codeGroupId", id);
		} else if(mode.equals("code")) {
			url = ktapiAdmin + API_URL_CODE_DETAIL_CHECK;
			body.put("codeId", id);
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 코드그룹/상세 등록/수정
	 * 
	 * @param session
	 * @param mode
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map saveCode(SessionVO session, String mode, CodeVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		String url = "";
		
		if(vo.getCodeGroupId() == null) {
			//그룹
			body.put("codeGroupId", vo.getCodeId());
			body.put("codeGroupName", vo.getCodeName());
			body.put("codeUseYn", vo.getCodeUseYn());
			body.put("codeDescription", vo.getCodeDescription());
			
			if(mode.equals("insert")) { //등록
				url = ktapiAdmin + API_URL_CODE_INSERT;
			} else if(mode.equals("update")) { //수정
				url = ktapiAdmin + API_URL_CODE_UPDATE;
			}
		} else {
			//상세
			body.put("codeGroupId", vo.getCodeGroupId());
			body.put("codeId", vo.getCodeId());
			body.put("codeName", vo.getCodeName());
			body.put("codeUseYn", vo.getCodeUseYn());
			body.put("codeDescription", vo.getCodeDescription());
			
			if(mode.equals("insert")) { //등록
				url = ktapiAdmin + API_URL_CODE_DETAIL_INSERT;
			} else if(mode.equals("update")) { //수정
				url = ktapiAdmin + API_URL_CODE_DETAIL_UPDATE;
			}
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}

}
