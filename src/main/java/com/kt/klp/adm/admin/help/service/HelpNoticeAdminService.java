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
import com.kt.klp.adm.admin.help.domain.NoticeVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.HttpUrlMultipartForward;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* HelpNoticeAdminService : APP/WEB> 공지사항 service
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

@Service("helpNoticeAdminService")
public class HelpNoticeAdminService extends AbstractServiceImpl {
	
	public static final String API_URL_NOTICE_LIST = "/v1/admin/notice/list/%d";						//목록조회 {nowPage}
	public static final String API_URL_NOTICE_SELECT = "/v1/admin/notice/info/%s";						//상세조회 {noticeSeq}
	public static final String API_URL_NOTICE_INSERT = "/v1/admin/notice/insert";						//등록
	public static final String API_URL_NOTICE_UPDATE = "/v1/admin/notice/update/%s";					//수정	
	public static final String API_URL_NOTICE_LISTDATA_UPDATE = "/v1/admin/notice/listdata/update/%s";	//팝업설정, 상단고정 수정
	public static final String API_URL_NOTICE_DELETE = "/v1/admin/notice/delete/%s";					//삭제
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	
	/**
	 * 공지사항 목록조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param NoticeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listNotice(HttpServletRequest request, SessionVO sessionVO, NoticeVO vo) throws Exception {
		String url = String.format(API_URL_NOTICE_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));

		Map<String, Object> param = new HashMap<>();
		param.put("noticeSearchStartDateBylongType", vo.getNoticeExposedStartDate());
		param.put("noticeSearchEndDateBylongType", vo.getNoticeExposedEndDate());
		
		//대상값이 있을 경우 
		if(vo.getNoticeRecipient() != null) {
			param.put("noticeRecipient", vo.getNoticeRecipient());
		}
		
		//검색어가 있을 경우
		if(vo.getSearchType() != null && vo.getSearchText() != null) {
			param.put("noticeSearchType", vo.getSearchType());
			param.put("noticeSearchText", vo.getSearchText());
		}
		
		//"게시중 상태만"이 체크 되었을 경우
		if(!vo.getNoticeExposedYn().isEmpty()) {
			param.put("noticeExposedYn", vo.getNoticeExposedYn());
		}
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("noticeList") != null) {
				List list = (List) result.get("noticeList");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				for(int i=0; i<list.size(); i++) {
					Map item = (Map) list.get(i);
					
					//팝업설정
					if(item.get("noticePopupSetting") != null) {
						String noticePopupSetting = item.get("noticePopupSetting").toString();
						item.put("noticePopupSetting", noticePopupSetting.trim());
					}
					
					//상단고정
					if(item.get("noticeTopExposed") != null) {
						String noticeTopExposed = item.get("noticeTopExposed").toString();
						item.put("noticeTopExposed", noticeTopExposed.trim());
					}
					
					//상시게시
					if(item.get("noticeAlwaysPostYn") != null) {
						String noticeAlwaysPostYn = item.get("noticeAlwaysPostYn").toString();
						item.put("noticeAlwaysPostYn", noticeAlwaysPostYn.trim());
					}
				}
				result.put("noticeList", list);
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
	 * 공지사항 정보 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param NoticeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectNotice(HttpServletRequest request, SessionVO sessionVO, NoticeVO vo) throws Exception{
		
		String apiUrl = String.format(API_URL_NOTICE_SELECT, vo.getNoticeSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "GET", null);
		UtilFunctions.millisecondListToDate(result); //날짜변환
		
		//팝업설정
		if(result.get("noticePopupSetting") != null) {
			String noticePopupSetting = result.get("noticePopupSetting").toString();
			result.put("noticePopupSetting", noticePopupSetting.trim());
		}
		
		//상단고정
		if(result.get("noticeTopExposed") != null) {
			String noticeTopExposed = result.get("noticeTopExposed").toString();
			result.put("noticeTopExposed", noticeTopExposed.trim());
		}
		
		//상시게시여부
		if(result.get("noticeAlwaysPostYn") != null) {
			String noticeAlwaysPostYn = result.get("noticeAlwaysPostYn").toString();
			result.put("noticeAlwaysPostYn", noticeAlwaysPostYn.trim());
		}
		
		if(result.get("noticeContent") != null) {
			String noticeContent = result.get("noticeContent").toString();
			result.put("noticeContent", noticeContent.trim());
		}
		//logger.debug("{}", result);
		
		return result;
	}
	
	
	/**
	 * 공지사항 상단고정, 팝업설정 변경
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param NoticeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateNoticeStatus(HttpServletRequest request, SessionVO sessionVO, NoticeVO vo) throws Exception {
		String url = String.format(API_URL_NOTICE_LISTDATA_UPDATE, vo.getNoticeSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("noticePopupSetting", vo.getNoticePopupSetting().trim());
		param.put("noticeTopExposed", vo.getNoticeTopExposed().trim());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 공지사항 삭제
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param NoticeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> deleteNotice(HttpServletRequest request, SessionVO sessionVO, NoticeVO vo) throws Exception {
		String apiUrl  = String.format(API_URL_NOTICE_DELETE, vo.getNoticeSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", null);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 공지사항 등록/수정
	 * @param multipartRequest
	 * @param sessionVO
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveNotice(MultipartHttpServletRequest multipartRequest, SessionVO sessionVO, NoticeVO vo) throws Exception {
		Map result = new HashMap<>();

		//파일확장자가 이미지파일이 아닐 경우 오류 by.2022.04.13 mijin.kim
		List filesList = multipartRequest.getFiles("attachedFiles");
		//logger.debug("{}", filesList.size());
		if(filesList.size() > 0) {
			for(int i=0; i< filesList.size(); i++) {
				MultipartFile file = (MultipartFile) filesList.get(i);
				String fileName = file.getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
				//logger.debug("{}", fileName);
				//logger.debug("{}", ext);
		
				
				if(!ext.equals("JPG") && !ext.equals("JPGE") && !ext.equals("PNG")  && !ext.equals("GIF")) {
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
		if(vo.getNoticeSeq() == null) {
			url = API_URL_NOTICE_INSERT; //등록
		}else {
			url = String.format(API_URL_NOTICE_UPDATE, vo.getNoticeSeq()); //수정
		}
		
		HttpUrlMultipartForward multipart = new HttpUrlMultipartForward(ktapiAdmin+url, "POST", multipartRequest, "UTF-8", null, header);
		String response = multipart.finish();
		
    	ObjectMapper mapper = new ObjectMapper();
	    String json = response;
	    
	    try{
	    	result = mapper.readValue(json, Map.class);
	    } catch (JsonParseException e) {
	    	 result.put("error", "JsonParseException");
	    	 e.printStackTrace();
		}
	    //logger.debug("{}", result);
		
		return result;
	}
}
