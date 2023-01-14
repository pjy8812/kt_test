package com.kt.klp.adm.admin.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* CommonService : 공통 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.18       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.18
* @version 1.0.0
* @see
*
*/

@Service("commonService")
public class CommonService extends AbstractServiceImpl {

	public static final String API_URL_CODE_LIST_BY_GROUP = "/v1/code/%s/list";
	public static final String API_URL_MASKING_HISTORY_INSERT = "/v1/admin/masking/history/insert";
	
	public static final String LDZRCPT_RECEIPT_API_URL = "/v1/admin/ldzrcpt/select/%s"; // 상차 인수증 다운로드 - {orderId}
	public static final String ULDZRCPT_RECEIPT_API_URL = "/v1/admin/uldzrcpt/select/%s"; // 하차 인수증 다운로드 - {orderId}
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	public static final String RECEIPT_TYPE_LOAD = "load"; // 상차지 
	public static final String RECEIPT_TYPE_UNLOAD = "unload"; // 하차지  
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 코드목록 조회
	 * @param GroupCodeId
	 * @return
	 * @throws Exception
	 */
	public List listCode(String GroupCodeId) throws Exception {
		String apiUrl = String.format(API_URL_CODE_LIST_BY_GROUP, GroupCodeId);
		
		Map<String, String> header = new HashMap<>();
		
		Map result = WebFunctions.connectApi(ktapiAdmin + apiUrl, header, "GET", null);
		logger.debug("result={}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") !=  null) {
				List list = (List) result.get("list");
				return list;
			}
		}
		
		return null;
	}	
	
	
	/**
	 *  공통코드 목록조회
	 * @param SessionVO
	 * @param GroupCodeId
	 * @return
	 * @throws Exception
	 */
	public List listCode(SessionVO sessionVO,String GroupCodeId) throws Exception {
		String apiUrl = String.format(API_URL_CODE_LIST_BY_GROUP, GroupCodeId);
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + apiUrl, header, "GET", null);
		logger.debug("result={}", result);
		
		if(!result.isEmpty()) {
			if(result.get("codeList") !=  null) {
				List list = (List) result.get("codeList");
				return list;
			}
		}
		
		return null;
	}

	/**
	 * 마스킹해제사유 등록
	 * @param SessionVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Map insertUnmaskingHistory(SessionVO sessionVO, HttpServletRequest request) throws Exception {
		
		Map result = new HashMap<>();
		
		String maskingHistoryType = request.getParameter("maskingHistoryType");
		String maskingHistoryReason = request.getParameter("maskingHistoryReason");
		String type = "";
		
		if(request.getParameter("type") != null) {
			type = request.getParameter("type");
		}
		
		if(maskingHistoryReason == null || maskingHistoryReason.trim().equals("")) {
			result.put("resultCode", "00001");
			result.put("resultMsg", "마스킹 해제 사유를 입력해주세요.");
			return result;
		}
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("maskingHistoryReason", maskingHistoryReason);
		body.put("maskingHistoryType", maskingHistoryType);
		
		//ktds요청으로 인하여 파일다운로드시 마스킹해제사유 등록 추가 by2022.05.16 mijin.kim
		if(type.equals("download")) {
			body.put("type", "download");
		}else {
			body.put("type", "masking");
		}
		
		result = WebFunctions.connectApiJson(ktapiAdmin + API_URL_MASKING_HISTORY_INSERT, header, "GET", body);
		logger.debug("result={}", result);
		
		return result;
	}	
	
	/**
	 * 인수증 다운로드 - 미리보기 
	 * 
	 * @param sessionVO
	 * @param request
	 * @throws Exception
	 */
	public Map getReceiptFilePreview(HttpServletRequest request, HttpServletResponse response, SessionVO session, String mode, String orderId) throws Exception {
		
		if(mode == null) {
			throw new ServiceException("Receipt Type is Null.");
		}
		
		if(orderId == null) {
			throw new ServiceException("OrderId is Null.");
		} else if(orderId.equals("")) {
			throw new ServiceException("OrderId is empty.");
		}
		
		String url = null;
		
		if(mode.equals(RECEIPT_TYPE_LOAD)) {
			url = String.format(ktapiAdmin + LDZRCPT_RECEIPT_API_URL, orderId);
		} else if (mode.equals(RECEIPT_TYPE_UNLOAD)){ 
			url = String.format(ktapiAdmin + ULDZRCPT_RECEIPT_API_URL, orderId);
		} else {
			throw new ServiceException("Receipt Type Error");
		}
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// Map result = WebFunctions.connectApiJson(url, header, "GET", param);
		// WebFunctions.connectApi(ktapiAdmin + DASHBOARD_FRGOWN_MGMT_API_URL, header, "GET", param);
		Map result = WebFunctions.connectApi(url , header, "GET", param);
		logger.debug("result={}",  result);
		
		return result;
	}
	
	/**
	 * 인수증 다운로드
	 * 
	 * @param sessionVO
	 * @param request
	 * @throws Exception
	 */
	public void getReceiptFile(HttpServletRequest request, HttpServletResponse response, SessionVO session, String mode, String orderId) throws Exception {
		
		if(mode == null) {
			throw new ServiceException("Receipt Type is Null.");
		}
		
		if(orderId == null) {
			throw new ServiceException("OrderId is Null.");
		} else if(orderId.equals("")) {
			throw new ServiceException("OrderId is empty.");
		}
		
		String url = null;
		
		if(mode.equals(RECEIPT_TYPE_LOAD)) {
			url = String.format(ktapiAdmin + LDZRCPT_RECEIPT_API_URL, orderId);
		} else if (mode.equals(RECEIPT_TYPE_UNLOAD)){ 
			url = String.format(ktapiAdmin + ULDZRCPT_RECEIPT_API_URL, orderId);
		} else {
			throw new ServiceException("Receipt Type Error");
		}
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
	
		// Map result = WebFunctions.connectApiJson(url, header, "GET", param);
		Map result = WebFunctions.connectApi(url , header, "GET", param);
		logger.debug("result={}",  result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			if(result.get("fileData") != null && result.get("fileData") != null && !result.get("fileData").equals("")) {
				DownloadFunctions.downloadBase64toFile(request, response, result.get("fileData").toString(), result.get("fileName") == null ? "tempFileName" : result.get("fileName").toString());
			} else {
				throw new ServiceException("Error : fileData is Null or Empty.");
			}
		} else {
			if(result != null) {
				throw new ServiceException(result.toString());
			} else {
				throw new ServiceException("Error");
			}
		}
	}
	
}
