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
import com.kt.klp.adm.admin.help.domain.VocVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.HttpUrlMultipartForward;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* HelpVocAdminService : APP/WEB> 1:1문의 service
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

@Service("helpVocAdminService")
public class HelpVocAdminService extends AbstractServiceImpl {

	public static final String API_URL_VOC_LIST = "/v1/admin/voc/list/%d";				//1:1문의 목록 {nowPage}
	public static final String API_URL_VOC_SELECT = "/v1/admin/voc/info/%s";			//1:1문의 상세 {vocSeq}
	public static final String API_URL_VOC_INSERT = "/v1/admin/voc/insert";				//1:1문의 등록
	public static final String API_URL_VOC_UPDATE = "/v1/admin/voc/update/%s";			//1:1문의 수정
	public static final String API_URL_VOC_DELETE = "/v1/admin/voc/delete/%s";			//1:1문의 삭제
	public static final String API_URL_VOC_ANS_INSERT = "/v1/admin/voc/ans_insert/%s";	//1:1문의 답변 등록
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	
	/**
	 * 1:1문의 목록조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param VocVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listVoc(HttpServletRequest request, SessionVO sessionVO, VocVO vo) throws Exception {
		String apiUrl = String.format(API_URL_VOC_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("vocSearchStartDateBylongType", vo.getVocExposedStartDate());	//등록일 검색시작일
		param.put("vocSearchEndDateBylongType", vo.getVocExposedEndDate());		//등록일 검색종료일
		param.put("vocOwnerClassification", vo.getVocOwnerClassification());	//회원
		param.put("vocStatus", vo.getVocStatus());								//상태
		param.put("vocSearchType", vo.getSearchType());							//검색타입
		param.put("vocSearchText", vo.getSearchText());							//검색어
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("vocList") != null) {
				List list = (List) result.get("vocList");
				UtilFunctions.millisecondListToDate(list);	//날짜변환
				for(int i=0; i<list.size(); i++) {
					Map item = (Map) list.get(i);
					
					//회원 trim 
					if(item.get("vocOwnerClassification") != null) {
						String vocOwnerClassification  = item.get("vocOwnerClassification").toString();
						item.put("vocOwnerClassification", vocOwnerClassification.trim());
					}
				}
				result.put("vocList", list);
			}
			
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount"); //마지막페이지
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
	 * 1:1문의 정보 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param VocVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectVoc(HttpServletRequest request, SessionVO sessionVO, VocVO vo) throws Exception{
		String url = String.format(API_URL_VOC_SELECT, vo.getVocSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "GET", null);
		UtilFunctions.millisecondListToDate(result); //날짜변환
		
		if(result.get("vocContent") != null) {
			String vocContent = result.get("vocContent").toString();
			result.put("vocContent", vocContent.trim());
		}
		
		//답변목록이 있을 경우 날짜 변환
		if(result.get("vocAnswerList") != null) { 
			List vocAnswerList = (List) result.get("vocAnswerList");
			UtilFunctions.millisecondListToDate(vocAnswerList);
			result.put("vocAnswerList", vocAnswerList);
		}
		
		logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 1:1문의 답변 등록
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param VocVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insertVocAnswer(HttpServletRequest request, SessionVO sessionVO, VocVO vo) throws Exception {
		String url  = String.format(API_URL_VOC_ANS_INSERT, vo.getVocSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("vocAnswerId", sessionVO.getAdminId()); //답변자ID
		param.put("vocAnswer", vo.getVocAnswer());		  //답변내용
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 1:1문의 삭제
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param VocVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> deleteVoc(HttpServletRequest request, SessionVO sessionVO, VocVO vo) throws Exception {
		String apiUrl  = String.format(API_URL_VOC_DELETE, vo.getVocSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", null);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 1:1문의 등록/수정
	 * @param MultipartHttpServletRequest
	 * @param SessionVO
	 * @param VocVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveVoc(MultipartHttpServletRequest multipartRequest, SessionVO sessionVO, VocVO vo) throws Exception {
		Map result = new HashMap<>();
		
		//파일확장자가 js, jsp일 경우 확장자 오류 by.2022.04.13 mijin.kim
		List filesList = multipartRequest.getFiles("attachedFiles");
		//logger.debug("{}", filesList.size());
		if(filesList.size()>0) {
			for(int i=0; i< filesList.size(); i++) {
				MultipartFile file = (MultipartFile) filesList.get(i);
				String fileName = file.getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
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
		if(vo.getVocSeq() == null) {
			url = API_URL_VOC_INSERT; //등록
		}else {
			url = String.format(API_URL_VOC_UPDATE, vo.getVocSeq()); //수정
		}
		
		HttpUrlMultipartForward multipart = new HttpUrlMultipartForward(ktapiAdmin+url, "POST", multipartRequest, "UTF-8", null, header);
		multipart.addFormField("vocOwnerId", sessionVO.getAdminId());

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