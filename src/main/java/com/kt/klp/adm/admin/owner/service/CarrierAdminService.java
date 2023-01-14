package com.kt.klp.adm.admin.owner.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonParseException;

import com.kt.klp.adm.admin.owner.domain.CarrierOwnerVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.HttpUrlMultipartForward;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* CarrierAdminService : 회원관리> 운송대행사관리 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2023.01.12      PJY     Initial creation
* </pre>
*
* @author PJY
* @since 2023.01.12
* @version 1.0.0
* @see
*
*/

@Service("carrierAdminService")
public class CarrierAdminService extends AbstractServiceImpl {
	 
	public static final String API_URL_CARRIER_OWNER_LIST   = "/v1/admin/carrier/list/%d";				// 운송대행사 목록화면 {nowPage}
	public static final String API_URL_CARRIER_SELECT       = "/v1/admin/carrier/info/%s";				// 운송대행사 상세정보 {carrierId}
	public static final String API_URL_CARRIER_CAR_LIST     = "/v1/admin/carrier/car/list";				// 운송대행사 차량정보 조회
	public static final String API_URL_CARRIER_CAR_SAVE     = "/v1/admin/carrier/car/save/%s/%s";       // 운송대행사 차량정보 저장 {carrierId}/{obj}
	public static final String API_URL_CARRIER_CAR_DELETE   = "/v1/admin/carrier/car/delete/%s/%s";     // 운송대행사 차량정보 삭제 {carrierId}/{obj}
	public static final String API_URL_CARRIER_HISTORY_LIST = "/v1/admin/carrier/history/list/%d";		// 운송대행사 변경내역 조회 {nowPage}
	public static final String API_URL_CARRIER_UPDATE       = "/v1/admin/carrier/change_info";			// 운송대행사 수정
	public static final String API_URL_CARRIER_WITHDRAWAL   = "/v1/admin/carrier/approval/withdrawal";  // 운송대행사 탈퇴승인
	public static final String API_URL_CARRIER_SUBID_INSERT = "/v1/admin/carrier/approval/subid/%s";  	// 운송대행사 탈퇴승인
	public static final String API_URL_CARRIER_INSERT       = "/v1/admin/carrier/insert";     			// 운송대행사 등록
	public static final String API_URL_ACCOUNT_INSERT       = "/v1/admin/system/account/insert";        // 관리자 계정 추가

	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 운송대행사 목록
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listCarrierOwner(HttpServletRequest request, SessionVO sessionVO, CarrierOwnerVO vo) throws Exception {
		String apiUrl = String.format(API_URL_CARRIER_OWNER_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		//정렬, 목록 수
		if(vo.getSort() == null) {
			vo.setSort("carrierOwnerJoinDateTime");
			vo.setPagePerRows(vo.getPageSize());
		}
		
		Map<String, Object> param = new HashMap<>();
		param.put("sort", vo.getSort());
		param.put("pagePerRows", vo.getPagePerRows());
		param.put("joinStartDate", vo.getJoinStartDate());
		param.put("joinEndDate", vo.getJoinEndDate());
		param.put("lastUseStartDate", vo.getLastUseStartDate());
		param.put("lastUseEndDate", vo.getLastUseEndDate());
		
		if(vo.getCarrierMemberStatus() != null) param.put("carrierMemberStatus", vo.getCarrierMemberStatus());
		if(vo.getCarrierPaymentCondition() != null) param.put("carrierPaymentCondition", vo.getCarrierPaymentCondition());
		if(vo.getCarrierFileAdminCheckYn() != null) param.put("carrierFileAdminCheckYn", vo.getCarrierFileAdminCheckYn());
		if(vo.getSearchType() != null) param.put("searchType", vo.getSearchType());
		if (vo.getSearchText() != null) param.put("searchText", vo.getSearchText());
			
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
	
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount");
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getNowPage());
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		
		return result;
	}
	
	/**
	 * 운송대행사 차량정보 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectCar(HttpServletRequest request, SessionVO sessionVO, CarrierOwnerVO vo) throws Exception {
		String url = API_URL_CARRIER_CAR_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carrierId", vo.getCarrierId());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		
		if(!result.isEmpty()) {
			if(result.get("carList") != null) {
				List list = (List) result.get("carList");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("carList", list);
			}
		}
		
		return result;
	}	
	
	/**
	 * 운송대행사 상세
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public  Map<String, Object> selectCarrierOwner(HttpServletRequest request, SessionVO sessionVO, CarrierOwnerVO vo) throws Exception {
		String url = String.format(API_URL_CARRIER_SELECT, vo.getCarrierId());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		//마스킹여부값이 빈값일 경우 무조건 마스킹하여 조회
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}else {
			param.put("maskingYn", "Y");
		}
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		UtilFunctions.millisecondListToDate(result); //날짜변환
		
		//첨부파일 등록일시 추가로 인하여 날짜변환 추가 by.2022.04.26 mijin.kim
		if(result.get("fileList") != null) { 
			List list = (List) result.get("fileList");
			UtilFunctions.millisecondListToDate(list); 
			result.put("fileList", list);
		}
		
		return result;
	}
	
	
	/**
	 * 운송대행사 차량정보 저장
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveCarrierCar(HttpServletRequest request, SessionVO sessionVO, String carrierId, String carData) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		String url = String.format(API_URL_CARRIER_CAR_SAVE, carrierId, carData);
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		
		return result;
	}
	
	/**
	 * 운송대행사 차량정보 삭제
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> deleteCarrierCar(HttpServletRequest request, SessionVO sessionVO, String carrierId, String carData) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		String url = String.format(API_URL_CARRIER_CAR_DELETE, carrierId, carData);
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		
		return result;
	}
	
	/**
	 * 운송대행사 변경내역 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listCarrierHistory(HttpServletRequest request, SessionVO sessionVO, CarrierOwnerVO vo) throws Exception {
		//조회 목록 수
		vo.setPagePerRows(5);
		
		String url = String.format(API_URL_CARRIER_HISTORY_LIST, vo.getPageIndex());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carrierId", vo.getCarrierId());
		param.put("pagePerRows", vo.getPagePerRows());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			//페이징
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount"); 
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getPageIndex());
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}
	
	
	/**
	 * 운송대행사 정보수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateCarrier(MultipartHttpServletRequest multipartRequest, SessionVO sessionVO, CarrierOwnerVO vo) throws Exception {
	    Map result = new HashMap<>();

	    //파일확장자가 이미지파일이 아닐 경우 오류
	    List filesList = multipartRequest.getFiles("carrierCorporateRegistrationFile");
	    //logger.debug("{}", filesList.size());
	    if(filesList.size() > 0) {
	      for(int i=0; i< filesList.size(); i++) {
	        MultipartFile file = (MultipartFile) filesList.get(i);
	        String fileName = file.getOriginalFilename();
	        String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();

	        if(!ext.equals("JPG") && !ext.equals("JPGE") && !ext.equals("PNG")  && !ext.equals("GIF") && !ext.equals("PDF")) {
	          result.put("resultCode", "00001");
	          result.put("resultMsg", "파일확장자 오류");
	          return result;
	        }
	      }
	    }
	    
	    filesList = multipartRequest.getFiles("carrierOthersFile");
	    //logger.debug("{}", filesList.size());
	    if(filesList.size() > 0) {
	    	for(int i=0; i< filesList.size(); i++) {
	    		MultipartFile file = (MultipartFile) filesList.get(i);
	    		String fileName = file.getOriginalFilename();
	    		String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
	    		
	    		if(!ext.equals("JPG") && !ext.equals("JPGE") && !ext.equals("PNG")  && !ext.equals("GIF") && !ext.equals("PDF")) {
	    			result.put("resultCode", "00001");
	    			result.put("resultMsg", "파일확장자 오류");
	    			return result;
	    		}
	    	}
	    }
	    
	    
		String url = API_URL_CARRIER_UPDATE;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(multipartRequest));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carrierId", vo.getCarrierId());
		param.put("carrierPaymentCondition", vo.getCarrierPaymentCondition());
		param.put("carrierMemberStatus", vo.getCarrierMemberStatus());
		param.put("carrierFileAdminCheckYn", vo.getCarrierFileAdminCheckYn());
		param.put("carrierHistoryChangeReason", vo.getCarrierHistoryChangeReason());
		
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
		
		//Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 운송대행사 탈퇴(승인)
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> withdrawCarrier(HttpServletRequest request, SessionVO sessionVO) throws Exception {
		String url = API_URL_CARRIER_WITHDRAWAL;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carrierHistoryCarrierId", request.getParameter("carrierId"));
		param.put("carrierHistoryChangeReason", request.getParameter("carrierHistoryChangeReason"));
		param.put("carrierHistoryAmender", sessionVO.getAdminId());
		param.put("carrierHistoryCarrierMemberStatus", "withdrawal");
		//logger.debug("{}", param);
		
		//변경사유를 먼저 등록 후 화주 탈퇴승인 
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 운송대행사 sub Id 등록
	 * @param HttpServletRequest
	 * @param HttpServletResponse
	 * @throws Exception
	 */
	public Map<String, Object> insertSubAccount(HttpServletRequest request, SessionVO sessionVO, CarrierOwnerVO vo, String carrierMasterId) throws Exception {
		String url = String.format(API_URL_CARRIER_SUBID_INSERT, carrierMasterId);
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carrierId", vo.getCarrierId());
		param.put("carrierPassword", vo.getCarrierPassword());
		param.put("carrierCorporateRegistrationNumber", vo.getCarrierCorporateRegistrationNumber());
		param.put("carrierTelephone", vo.getCarrierTelephone());
		param.put("carrierEmail", vo.getCarrierEmail());
		//logger.debug("{}", param);
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		if("00000".equals(result.get("resultCode"))) {
			url = API_URL_ACCOUNT_INSERT;
			
			param.put("adminId", vo.getCarrierId());
			param.put("adminName", result.get("carrierName"));
			param.put("adminPw", vo.getCarrierPassword());
			param.put("adminEmail", vo.getCarrierEmail());
			param.put("adminTelephone", vo.getCarrierTelephone());
			param.put("adminAuthorityGroupSeq", 2);
			
			result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
			
		}
		
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 운송대행사 등록
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarrierOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insertCarrier(HttpServletRequest request, SessionVO sessionVO, CarrierOwnerVO vo) throws Exception {

		String url = API_URL_CARRIER_INSERT;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carrierId", vo.getCarrierId());
		param.put("carrierName", vo.getCarrierName());
		param.put("carrierPassword", vo.getCarrierPassword());
		param.put("carrierCorporateRegistrationNumber", vo.getCarrierCorporateRegistrationNumber());
		param.put("carrierTelephone", vo.getCarrierTelephone());
		param.put("carrierEmail", vo.getCarrierEmail());
		param.put("carrierRecommendId", vo.getCarrierRecommendId());
		param.put("carrierPaymentCondition", vo.getCarrierPaymentCondition());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		
		if("00000".equals(result.get("resultCode"))) {
			url = API_URL_ACCOUNT_INSERT;
			
			param.put("adminId", vo.getCarrierId());
			param.put("adminName", vo.getCarrierName());
			param.put("adminPw", vo.getCarrierPassword());
			param.put("adminEmail", vo.getCarrierEmail());
			param.put("adminTelephone", vo.getCarrierTelephone());
			param.put("adminAuthorityGroupSeq", 2);
			
			result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
			
		}
		//logger.debug("{}", result);
		
		return result;
	}
}