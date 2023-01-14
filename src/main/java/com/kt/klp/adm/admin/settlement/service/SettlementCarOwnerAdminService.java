package com.kt.klp.adm.admin.settlement.service;

import java.security.PrivateKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.settlement.domain.SettlementCarOwnerVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.CommonTableVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.RSAApiUtil;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* SettlementCarOwnerAdminService : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.25       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.25
* @version 1.0.0
* @see
*
*/
@Service
public class SettlementCarOwnerAdminService extends AbstractServiceImpl {
	
	public static final String CAROWN_SETTLEMENT_SETTLEMENT_API_URL = "/v1/admin/carown/settlement/list/%d"; // 차주 정산 조회 및 검색 - {nowPage}
	public static final String CAROWN_SETTLEMENT_ORDER_API_URL = "/v1/admin/carown/settlement/order/list/%d"; // 차주 정산 조회 및 검색 - {nowPage}
	
	public static final String CAROWN_SETTLEMENT_SETTLEMENT_EXCEL_DOWN_API_URL = "/v1/admin/carown/settlement/excel/down"; // 차주 정산목록 엑셀 다운로드
	public static final String CAROWN_SETTLEMENT_ORDER_EXCEL_DOWN_API_URL = "/v1/admin/carown/settlement/order/excel/down"; // 차주 정산목록 엑셀 다운로드
	
	public static final String CAROWN_SETTLEMENT_INFO_API_URL = "/v1/admin/carown/settlement/info/%s/%d"; // 차주 정산 상세정보
	public static final String CAROWN_SETTLEMENT_DETAIL_EXCEL_DOWN_API_URL = "/v1/admin/carown/settlement/info/excel/down/%s"; // 차주 정산 상세정보 엑셀 다운로드 - {carOwnerSettlementId}
	
	public static final String CAROWN_SETTLEMENT_CANCEL_API_URL = "/v1/admin/carown/settlement/cancel"; // 차주 정산 취소
	public static final String CAROWN_SETTLEMENT_REUPLOAD_API_URL = "/v1/admin/carown/settlement/reupload"; // 취소 후 정산 재요청
	
	public static final String CAROWN_SETTLEMENT_INFO_DETAIL_API_URL = "/v1/admin/carown/settlement/info/detail"; // 선지급 상세 목록
	public static final String CAROWN_SETTLEMENT_PAYMENT_UPDATE_API_URL = "/v1/admin/carown/settlement/payment/update"; // 지급 방법 업데이트

	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	public static final String EXCEL_FILE_NAME_SETTLEMENT_CAROWNER_LIST = "정산_차주정산_목록";
	public static final String EXCEL_FILE_NAME_SETTLEMENT_CAROWNER_DETAIL_LIST = "정산_차주정산_정산상세_목록";

	@Value("${api.ktapi}")
	private String ktapi;
	
	@Value("${api.ktapiAdmin}")
    String ktapiAdmin;
	
	/**
	 * 차주정산 목록 
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public Map getList(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementCarOwnerVO vo) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 계약구분(일반/계약)		
		if(vo.getCarOwnerType() != null) {
			param.put("carOwnerType", vo.getCarOwnerType());
		}
		
		// 정산상태
		if(vo.getCarOwnerSettlementStatus() != null) {
			param.put("carOwnerSettlementStatus", vo.getCarOwnerSettlementStatus());
		}

		// 검색타입
		if(vo.getSearchType() != null) {
			param.put("searchType", vo.getSearchType());
		}
		
		// 검색어
		if(vo.getSearchText() != null) {
			param.put("searchText", vo.getSearchText());
		}
		
		// 마스킹여부
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}
		
		// 정산발생일 검색 시작일
		if(vo.getSettlementCompleteStartDate() != null) {
			param.put("settlementCompleteStartDate", vo.getSettlementCompleteStartDate());
		}
		
		// 정산발생일 검색 종료일
		if(vo.getSettlementCompleteEndDate() != null) {
			param.put("settlementCompleteEndDate", vo.getSettlementCompleteEndDate());
		}

		// 입금완료일 검색 시작일
		if(vo.getSettlementDepositStartDate() != null) {
			param.put("settlementDepositStartDate", vo.getSettlementDepositStartDate());
		}
		
		// 입금완료일 검색 종료일
		if(vo.getSettlementDepositEndDate() != null) {
			param.put("settlementDepositEndDate", vo.getSettlementDepositEndDate());
		}
		
		String url = null;
		
		if(vo.getPageType().equals(vo.PAGE_TYPE_ORDER)) {
			url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_ORDER_API_URL, vo.getPageIndex());
		} else { 
			url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_SETTLEMENT_API_URL, vo.getPageIndex());
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			Map<String, Object> paginationVO = new HashMap<>();
			paginationVO.put("sizeOfData", result.get("listCount") == null ? 0 : (int) result.get("listCount"));
			paginationVO.put("pageIndex", vo.getPageIndex());
			paginationVO.put("pageSize", vo.DEFAULT_PAGE_SIZE);
			String pagination =  new Pagination().setPagination(paginationVO);
			
			result.put("pagination", pagination);
			result.put("maxIndex", UtilFunctions.genListMaxIndex(vo.getPageIndex(), result.get("endPage"), result.get("listCount"), vo.DEFAULT_PAGE_SIZE));
			
			if(result.get("list") != null) {
				
				List<Map> list = (List) result.get("list");
				
				for(Map item : list) {
					
					// 차주일별조회 
					// 정산발생일
					UtilFunctions.makeDateToString(item, "carOwnerSettlementDate");
					
					// 주문건별조회 
					if(vo.getPageType().equals(vo.PAGE_TYPE_ORDER)) {
						
						// 주문등록 
						UtilFunctions.makeDateToStringMin(item, "registerDate");
						
						// 배차완료  
						UtilFunctions.makeDateToStringMin(item, "dispatchDate");
						
						// 상차완료  
						UtilFunctions.makeDateToStringMin(item, "loadingDate");
						
						// 하차완료  
						UtilFunctions.makeDateToStringMin(item, "unloadingDate");
						
						// 주문취소  
						// 오타확인필요 
						UtilFunctions.makeDateToStringNoDataByDashMin(item, "deliveryCancleDate");
						
						// 정산발생일 
						UtilFunctions.makeDateToStringMin(item, "carOwnerSettlementDate");
						
						// 정산완료일 
						UtilFunctions.makeDateToStringNoDataByDashMin(item, "carOwnerSettlementDoneDate");
						
						// 재요청 발생일시 
						UtilFunctions.makeDateToStringMin(item, "carOwnerSettlementResendDate");
						
					} else {
						// 정산완료일
						UtilFunctions.makeDateToString(item, "carOwnerSettlementDoneDate");
					}
					
					if(item.get("tIdInfo") != null) {
						item.put("tIdInfoJson", getJsonString((List) item.get("tIdInfo")));
					}
				}
				
				result.put("list", list);
			}
			
			result.put("resultCode", result.get("resultCode"));
			
			// logger.debug("result={}", result);
			return result;
		
		} else {
			return result;
		}
	}
	
	/**
	 * 차주정산 - 상세
	 * 
	 * @param session
	 * @param carOwnerSettlementId
	 * @param nowPage
	 * @return
	 */
	public Object getDetail(HttpServletRequest request, HttpServletResponse response, SessionVO session, String carOwnerSettlementId, int pageIndex, String maskingYn) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		if(maskingYn != null && maskingYn.equals(SettlementCarOwnerVO.YN_N)) {
			param.put("maskingYn", SettlementCarOwnerVO.YN_N);
		} else {
			param.put("maskingYn", SettlementCarOwnerVO.YN_Y);
		}
		
		String url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_INFO_API_URL, carOwnerSettlementId, pageIndex);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		// 비정상 결과에도 조회 가능한 값 있음 : CNNN 에러 표시를 위해 주석 해제 
		// if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			// 차주 정보
			if(result.get("carownInfo") !=null) {
				
				List carInfoList = (List) result.get("carownInfo");
				if(carInfoList != null && !carInfoList.isEmpty()) {
					
					Map carInfo = (Map) carInfoList.get(0);
					
					PrivateKey apiKey = RSAApiUtil.initPrivate();
					if(carInfo.get("carOwneridOrg") != null) {
						String carOwneridOrg = carInfo.get("carOwneridOrg").toString();
						carOwneridOrg = RSAApiUtil.decryptRSA(carOwneridOrg, apiKey);
						result.put("resultId", carOwneridOrg);
					}
				}
			}
			
			// 정산정보
			if(result.get("setInfo") != null) {
				
				List<Map> list = (List) result.get("setInfo");
				
				if (list != null && !list.isEmpty() && list.get(0) != null) {
					Map item = (Map) list.get(0);
					
					// 정산발생일
					UtilFunctions.makeDateToString(item, "carOwnerSettlementDate");
					
					// 정산완료일
					UtilFunctions.makeDateToStringMin(item, "carOwnerSettlementDoneDate");
					
				}
			}
			
			if(result.get("setList") != null) {
				
				List<Map> list = (List) result.get("setList");
				
				for(Map item : list) {
					
					// 주문등록 일시
					UtilFunctions.makeDateToStringMin(item, "registerDate");
					
					// 배차완료 일시
					UtilFunctions.makeDateToStringMin(item, "dispatchDate");
					
					// 상차완료 일시
					UtilFunctions.makeDateToStringMin(item, "loadingDate");
					
					// 하자완료 일시
					UtilFunctions.makeDateToStringMin(item, "unloadingDate");
					
					// 주문취소 일시
					UtilFunctions.makeDateToStringNoDataByDashMin(item, "deliveryCancleDate");
					
					// 재요청발생 일시
					UtilFunctions.makeDateToStringNoDataByDashMin(item, "carOwnerSettlementResendDate");
					
					// 정산완료일시 일시
					UtilFunctions.makeDateToStringNoDataByDashMin(item, "carOwnerSettlementDoneDate");
					
					if(item.get("tIdInfo") != null) {
						item.put("tIdInfoJson", getJsonString((List) item.get("tIdInfo")));
					}
				}
			}
			
			Map<String, Object> paginationVO = new HashMap<>();
			paginationVO.put("sizeOfData", result.get("listCount") == null ? 0 : (int) result.get("listCount"));
			paginationVO.put("pageIndex", pageIndex);
			paginationVO.put("pageSize", CommonTableVO.DEFAULT_PAGE_SIZE);
			String pagination =  new Pagination().setPagination(paginationVO);
			
			result.put("pagination", pagination);
			result.put("maxIndex", UtilFunctions.genListMaxIndex(pageIndex, result.get("endPage"), result.get("listCount"), CommonTableVO.DEFAULT_PAGE_SIZE));
			
			result.put("resultCode", result.get("resultCode"));
			
			return result;
		
//		} else {
//			return result;
//		}
	}

	/**
	 * 차주정산 - 목록 엑셀다운로드 
	 * 
	 * @param session
	 * @param vo
	 */
	public void getExcel(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementCarOwnerVO vo) throws Exception {
	
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 계약구분(일반/계약)		
		if(vo.getCarOwnerType() != null) {
			param.put("carOwnerType", vo.getCarOwnerType());
		}
		
		// 정산상태
		if(vo.getCarOwnerSettlementStatus() != null) {
			param.put("carOwnerSettlementStatus", vo.getCarOwnerSettlementStatus());
		}

		// 검색타입
		if(vo.getSearchType() != null) {
			param.put("searchType", vo.getSearchType());
		}
		
		// 검색어
		if(vo.getSearchText() != null) {
			param.put("searchText", vo.getSearchText());
		}
		
		// 마스킹여부
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}
		
		// 정산발생일 검색 시작일
		if(vo.getSettlementCompleteStartDate() != null) {
			param.put("settlementCompleteStartDate", vo.getSettlementCompleteStartDate());
		}
		
		// 정산발생일 검색 종료일
		if(vo.getSettlementCompleteEndDate() != null) {
			param.put("settlementCompleteEndDate", vo.getSettlementCompleteEndDate());
		}

		// 입금완료일 검색 시작일
		if(vo.getSettlementDepositStartDate() != null) {
			param.put("settlementDepositStartDate", vo.getSettlementDepositStartDate());
		}
		
		// 입금완료일 검색 종료일
		if(vo.getSettlementDepositEndDate() != null) {
			param.put("settlementDepositEndDate", vo.getSettlementDepositEndDate());
		}
		
		String url = null;
		
		if(vo.getPageType().equals(vo.PAGE_TYPE_ORDER)) {
			url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_ORDER_EXCEL_DOWN_API_URL);
		} else { 
			url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_SETTLEMENT_EXCEL_DOWN_API_URL);
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			if(result.get("fileData") != null && result.get("fileData") != null && !result.get("fileData").equals("")) {
				DownloadFunctions.downloadBase64toFile(request, response, result.get("fileData").toString() ,result.get("fileName") == null ? "tempFileName" : result.get("fileName").toString());
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
	
	/**
	 * 차주정산 상세  - 목록 엑셀다운로드 
	 * 
	 * @param session
	 * @param vo
	 */
	public void getDetailExcel(HttpServletRequest request, HttpServletResponse response, SessionVO session, String carOwnerSettlementId) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_DETAIL_EXCEL_DOWN_API_URL, carOwnerSettlementId);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
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
	
	/**
	 * 차주정산 - 승인 취소 & 승인 취소 재승인 
	 * 
	 * @param session
	 * @param vo
	 */
	public Map cancelSettlement(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementCarOwnerVO vo) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 차주아이디
		if(vo.getCarOwnerId() != null) {
			param.put("carOwnerId", vo.getCarOwnerId());
		}
		
		// 정산아이디
		if(vo.getCarOwnerSettlementId() != null) {
			param.put("carOwnerSettlementId", vo.getCarOwnerSettlementId());
		}

		// 주문아이디
		if(vo.getCarOwnerSettlementOrderId() != null) {
			param.put("carOwnerSettlementOrderId", vo.getCarOwnerSettlementOrderId());
		}
		
		// 정산 상태
		if(vo.getCarOwnerSettlementState() != null) {
			param.put("carOwnerSettlementState", vo.getCarOwnerSettlementState());
		}
		
		String url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_CANCEL_API_URL);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		return result;
		
	}
	
	
	/**
	 * 차주정산 - 승인취소 재승인 - 새 정산ID 발생시키는 경우 
	 * 
	 * @param session
	 * @param vo
	 */
	public Map reuploadSettlement(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementCarOwnerVO vo) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 차주아이디
		if(vo.getCarOwnerId() != null) {
			param.put("carOwnerId", vo.getCarOwnerId());
		}
		
		// 정산아이디
		if(vo.getCarOwnerSettlementId() != null) {
			param.put("carOwnerSettlementId", vo.getCarOwnerSettlementId());
		}
		
		// 주문아이디
		if(vo.getCarOwnerSettlementOrderId() != null) {
			param.put("carOwnerSettlementOrderId", vo.getCarOwnerSettlementOrderId());
		}
		
		// 정산 상태
//		if(vo.getCarOwnerSettlementState() != null) {
//			param.put("carOwnerSettlementState", vo.getCarOwnerSettlementState());
//		}
		
		// 주문번호
		if(vo.getCarOwnerSettlementOrderNumber() != null) {
			param.put("carOwnerSettlementOrderNumber", vo.getCarOwnerSettlementOrderNumber());
		}
		
		String url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_REUPLOAD_API_URL);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		return result;
		
	}
	
	/**
	 * 차주정산 - 정산 상세 정보 - 지급방법 업데이트
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map paymentUpdate(HttpServletRequest request, HttpServletResponse response, SessionVO session) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		String carOwnerSettlementPaymentMethod = request.getParameter("carOwnerSettlementPaymentMethod");
		String carOwnerSettlementId = request.getParameter("carOwnerSettlementId");
		
		param.put("carOwnerSettlementPaymentMethod", carOwnerSettlementPaymentMethod);
		param.put("carOwnerSettlementId", carOwnerSettlementId);
		
		String url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_PAYMENT_UPDATE_API_URL);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 차주정산 - 선지급상세 
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map getDetailPopup(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementCarOwnerVO vo) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 정산아이디
		if(vo.getCarOwnerSettlementId() != null) {
			param.put("carOwnerSettlementId", vo.getCarOwnerSettlementId());
		}
		
		// 주문아이디
		if(vo.getCarOwnerSettlementOrderId() != null) {
			param.put("carOwnerSettlementOrderId", vo.getCarOwnerSettlementOrderId());
		}

		// 주문아이디
		if(vo.getCarOwnerSettlementOrderNumber() != null) {
			param.put("carOwnerSettlementOrderNumber", vo.getCarOwnerSettlementOrderNumber());
		}
		
		String url = String.format(ktapiAdmin + CAROWN_SETTLEMENT_INFO_DETAIL_API_URL);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		String settState = "";
		
		if(vo.getCarOwnerSettlementRootId() != null) {
			
			// 승인 취소 재승인 처리 버튼 활성화 조건에 해당 정산 ID의 상태가 필요하여, 차주정산 상세 API를 호출하여 해당 정산 생태 조회 
			Map setResult = (Map) getDetail(request, response, session, vo.getCarOwnerSettlementRootId(), 1, CommonTableVO.YN_Y);
			
			if(setResult.get("setInfo") != null && !((List) setResult.get("setInfo")).isEmpty() && ((List) setResult.get("setInfo")).get(0) != null) {
				
				Map item = (Map) ((List) setResult.get("setInfo")).get(0);
				
				if(item != null && item.get("carOwnerSettlementState") != null) {
					settState = item.get("carOwnerSettlementState").toString();
				}
			}
		}
		
		result.put("settState", settState);
		logger.debug("getDetailPopup param={}", param);
		logger.debug("getDetailPopupheader={}", header);
		logger.debug("getDetailPopup result={}", result);
		
		return result;
	}
	
	/**
	 * 목록을 Json 문자열로 반환 
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public String getJsonString(List<Map> list) throws Exception {
		
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray(list);
		
		obj.put("list", array);
		return obj.toString();
	}
	
	/**
	 * 문자열을 Json으로 반환 
	 * 
	 * @param jsonStr
	 * @return
	 * @throws Exception
	 */
	public Map getJsonList(String jsonStr) throws Exception {
		
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(jsonStr, Map.class);

	}

}

