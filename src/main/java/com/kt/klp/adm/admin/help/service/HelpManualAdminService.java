package com.kt.klp.adm.admin.help.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.help.domain.ManualVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.HttpUrlMultipartForward;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* helpManualAdminService : APP/WEB> 매뉴얼 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.17       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.17
* @version 1.0.0
* @see
*
*/

@Service("helpManualAdminService")
public class HelpManualAdminService extends AbstractServiceImpl {

	public static final String API_URL_MANUAL_LIST = "/v1/admin/manual/list/%d";		//매뉴얼 목록조회 {nowPage}
	public static final String API_URL_MANUAL_SELECT = "/v1/admin/manual/info/%s";		//매뉴얼 상세조회 {manualSeq}
	public static final String API_URL_MANUAL_INSERT = "/v1/admin/manual/insert";		//매뉴얼 등록
	public static final String API_URL_MANUAL_UPDATE = "/v1/admin/manual/update/%s";	//매뉴얼 수정 {manualSeq}
	public static final String API_URL_MANUAL_DELETE = "/v1/admin/manual/delete/%s";	//메뉴얼 삭제 {manualSeq}
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 매뉴얼 목록조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ManualVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listManual(HttpServletRequest request, SessionVO sessionVO, ManualVO vo) throws Exception {
		String apiUrl = String.format(API_URL_MANUAL_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param =  new HashMap<>();
		param.put("manualRecipient", vo.getManualRecipient());							//대상	
		param.put("manualCategory", vo.getManualCategory());							//카테고리
		param.put("manualSearchStartDateByLongType", vo.getManualExposedStartDate());	//작성 시작일
		param.put("manualSearchEndDateByLongType", vo.getManualExposedEndDate());		//작성 종료일
		param.put("manualSearchType", vo.getSearchType());								//검색타입
		param.put("manualSearchText", vo.getSearchText());								//검색어
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("manualList") != null) {
				List list = (List) result.get("manualList");
				UtilFunctions.millisecondListToDate(list); //날짜변환 (long -> Date)
				result.put("manualList", list);
			}
			
			if(result.get("listCount") != null) { //페이징 추가
				int listCount  = (int) result.get("listCount");
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount);
				paginationVO.put("pageIndex", vo.getNowPage());
				paginationVO.put("pageSize", vo.getPageSize());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}	
	
	/**
	 * 매뉴얼 상세조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ManualVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectManual(HttpServletRequest request, SessionVO sessionVO, ManualVO vo) throws Exception{
		String url = String.format(API_URL_MANUAL_SELECT, vo.getManualSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "GET", null);
		UtilFunctions.millisecondListToDate(result); //날짜변환
		if(result.get("manualContent") != null) {
			String manualContent = result.get("manualContent").toString();
			result.put("manualContent", manualContent.trim());
		}
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 매뉴얼 삭제
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ManualVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> deleteManual(HttpServletRequest request, SessionVO sessionVO, ManualVO vo) throws Exception {
		String apiUrl  = String.format(API_URL_MANUAL_DELETE, vo.getManualSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", null);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 매뉴얼 등록/수정
	 * @param MultipartHttpServletRequest
	 * @param SessionVO
	 * @param ManualVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveManual(MultipartHttpServletRequest multipartRequest, SessionVO sessionVO, ManualVO vo) throws Exception {
		Map result = new HashMap<>();
		
		//파일확장자가 js, jsp일 경우 확장자 오류 by.2022.04.13 mijin.kim
		List filesList = multipartRequest.getFiles("attachedFiles");
		logger.debug("filesList ={}", filesList.size());
		if(filesList.size()>0) {
			for(int i=0; i< filesList.size(); i++) {
				MultipartFile file = (MultipartFile) filesList.get(i);
				String fileName = file.getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
				logger.debug("{}", fileName);
				logger.debug("{}", ext);
		
				if(ext.equals("JS") || ext.equals("JSP")) {
					result.put("resultCode", "00001");
					result.put("resultMsg", "파일확장자 오류");
					return result;
				}
			}
		}
			
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(multipartRequest));
		
		String url = "";
		if(vo.getManualSeq() == null) {
			url = API_URL_MANUAL_INSERT; //등록
		}else {
			url = String.format(API_URL_MANUAL_UPDATE, vo.getManualSeq()); //수정
		}
		
		HttpUrlMultipartForward multipart = new HttpUrlMultipartForward(ktapiAdmin+url, "POST", multipartRequest, "UTF-8", null, header);
		String response = multipart.finish();
		
    	ObjectMapper mapper = new ObjectMapper();
	    String json = response;
	    
	    try{
	    	result = mapper.readValue(json, Map.class);
	    } catch (JsonParseException e) {
	    	 result.put("error", "JsonParseException");
		}
	    
	    logger.debug("{}", result);
		return result;
	}
	
}
