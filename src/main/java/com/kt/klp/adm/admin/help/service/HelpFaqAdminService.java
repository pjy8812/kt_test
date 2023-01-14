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
import com.kt.klp.adm.admin.help.domain.FaqVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.HttpUrlMultipartForward;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* HelpFaqAdminService : APP/WEB> FAQ service
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

@Service("helpFaqAdminService")
public class HelpFaqAdminService extends AbstractServiceImpl {

	public static final String API_URL_FAQ_LIST = "/v1/admin/faq/list/%d"; 		//목록조회 {nowPage}
	public static final String API_URL_FAQ_SELECT = "/v1/admin/faq/info/%s";	//상세조회 {faqSeq}
	public static final String API_URL_FAQ_INSERT = "/v1/admin/faq/insert";		//등록
	public static final String API_URL_FAQ_UPDATE = "/v1/admin/faq/update/%s";	//수정 {faqSeq}
	public static final String API_URL_FAQ_DELETE = "/v1/admin/faq/delete/%s";	//삭제 {faqSeq}
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * FAQ 목록조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FaqVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listFaq(HttpServletRequest request, SessionVO sessionVO, FaqVO vo) throws Exception {
		String apiUrl = String.format(API_URL_FAQ_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("faqRecipient", vo.getFaqRecipient());						//대상	
		param.put("faqCategory", vo.getFaqCategory());							//카테고리
		param.put("faqSearchStartDateBylongType", vo.getFaqExposedStartDate());	//작성시작일
		param.put("faqSearchEndDateBylongType", vo.getFaqExposedEndDate());		//작성종료일
		param.put("faqSearchType", vo.getSearchType());							//검색타입
		param.put("faqSearchText", vo.getSearchText());							//검색조건
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		logger.debug("result={}", result);
		
		if(!result.isEmpty()) {
			if(result.get("faqList") != null) {
				List list = (List) result.get("faqList");
				UtilFunctions.millisecondListToDate(list); //날짜변환 (long -> Date)
				result.put("faqList", list);
			}
			
			if(result.get("listCount") != null) { //페이징 추가
				int listCount = (int) result.get("listCount");
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
	 * FAQ정보 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FaqVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectFaq(HttpServletRequest request, SessionVO sessionVO, FaqVO vo) throws Exception{
		String apiUrl = String.format(API_URL_FAQ_SELECT, vo.getFaqSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "GET", null);
		//logger.debug("{}", result);
		
		UtilFunctions.millisecondListToDate(result); //날짜변환
		if(result.get("faqContent") != null) {
			String faqContent = result.get("faqContent").toString();
			result.put("faqContent", faqContent.trim());
		}
		
		return result;
	}
	
	/**
	 * FAQ 삭제
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FaqVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> deleteFaq(HttpServletRequest request, SessionVO sessionVO, FaqVO vo) throws Exception {
		String apiUrl  = String.format(API_URL_FAQ_DELETE, vo.getFaqSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", null);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * FAQ 등록/수정
	 * @param MultipartHttpServletRequest
	 * @param SessionVO
	 * @param FaqVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveFaq(MultipartHttpServletRequest multipartRequest, SessionVO sessionVO, FaqVO vo) throws Exception {
		Map result = new HashMap<>();
		
		//파일확장자가 js, jsp일 경우 확장자 오류 by.2022.04.13 mijin.kim
		List filesList = multipartRequest.getFiles("attachedFiles");
		//logger.debug("{}", filesList.size());
		if(filesList.size() > 0) {
			for(int i=0; i< filesList.size(); i++) {
				MultipartFile file = (MultipartFile) filesList.get(i);
				String fileName = file.getOriginalFilename(); //파일명
				String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase(); //확장자
				//logger.debug("{}", fileName);
				//logger.debug("{}", ext);
		
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
		if(vo.getFaqSeq() == null) {
			url = API_URL_FAQ_INSERT; //등록
		}else {
			url = String.format(API_URL_FAQ_UPDATE, vo.getFaqSeq()); //수정
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
	    
	    //logger.debug("{}", result);
		
		return result;
	}
	
}
