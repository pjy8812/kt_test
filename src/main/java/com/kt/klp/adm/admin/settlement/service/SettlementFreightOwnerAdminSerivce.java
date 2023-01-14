package com.kt.klp.adm.admin.settlement.service;

import java.security.PrivateKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.settlement.domain.SettlementFreightOwnerVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.RSAApiUtil;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* SettlementFreightOwnerAdminSerivce : 
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
public class SettlementFreightOwnerAdminSerivce extends AbstractServiceImpl {
	
	public static final String FRGOWN_SETTLEMENT_API_URL = "/v1/admin/frgown/settlement/list/%d"; // 화주 정산목록 조회 및 검색 - {nowPage}
	public static final String FRGOWN_SETTLEMENT_EXCEL_DOWN_API_URL = "/v1/admin/frgown/settlement/excel/down"; // 화주 정산목록 엑셀 다운로드
	public static final String FRGOWN_SETTLEMENT_INFO_API_URL = "/v1/admin/frgown/settlement/info/%s/%d"; // 화주 정산 상세정보 - {freightOwnerSettlementId}/{nowPage}
	public static final String FRGOWN_SETTLEMENT_PAYMENT_UPDATE_API_URL = "/v1/admin/frgown/settlement/payment/update/%s"; // 화주 입금확인 상태 변경 - {freightOwnerSettlementId}
	public static final String FRGOWN_SETTLEMENT_DETAIL_EXCEL_DOWN_API_URL = "/v1/admin/frgown/settlement/info/excel/down/%s"; // 화주 정산 상세정보 엑셀 다운로드 - {freightOwnerSettlementId}
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	public static final String EXCEL_FILE_NAME_SETTLEMENT_FREIGHT_LIST = "정산_화주정산_목록";
	public static final String EXCEL_FILE_NAME_SETTLEMENT_FREIGHT_DETAIL_LIST = "정산_화주정산_정산상세_목록";

	@Value("${api.ktapi}")
	private String ktapi;
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	/**
	 * 화주정산 목록 
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public Map getList(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementFreightOwnerVO vo) throws Exception {
		
		// Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 계약구분(일반/계약)
		if(vo.getFreightOwnerType() != null) {
			param.put("freightOwnerType", vo.getFreightOwnerType());
		}
		
		// 사업자구분(전체/사업자/비사업자)
		if(vo.getFreightMemberType() != null) {
			param.put("freightMemberType", vo.getFreightMemberType());
		}
		
		// 사업자유형(일반/운송사/주선사)
		if(vo.getFreightBusinessType() != null) {
			param.put("freightBusinessType", vo.getFreightBusinessType());
		}
		
		// 정산상태
		if(vo.getFreightOwnerSettlementStatus() != null) {
			param.put("freightOwnerSettlementStatus", vo.getFreightOwnerSettlementStatus());
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
		
		// 월정산횟수 
		if(vo.getFreightOwnerMonthSettlementNum() != null) {
			param.put("freightOwnerMonthSettlementNum", vo.getFreightOwnerMonthSettlementNum());
		}
		
		String url = String.format(ktapiAdmin + FRGOWN_SETTLEMENT_API_URL, vo.getPageIndex());
		
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
					
					// 정산발생일
					UtilFunctions.makeDateToString(item, "freightOwnerSettlementDate");
					
					// 정산완료일
					UtilFunctions.makeDateToString(item, "freightOwnerSettlementDepositDate");
				}
			}
			
			return result;
		
		} else {
			return result;
		}
		
	}
	
	/**
	 * 화주정산 상세 
	 * 
	 * @param session
	 * @param freightOwnerSettlementId
	 * @param nowPage
	 * @return
	 * @throws Exception
	 */
	public Map getDetail(HttpServletRequest request, HttpServletResponse response, SessionVO session, String freightOwnerSettlementId, int nowPage, String maskingYn) throws Exception {
		
		// Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));

		if(maskingYn != null && maskingYn.equals(SettlementFreightOwnerVO.YN_N)) {
			param.put("maskingYn", SettlementFreightOwnerVO.YN_N);
		} else {
			param.put("maskingYn", SettlementFreightOwnerVO.YN_Y);
		}
		
		String url = String.format(ktapiAdmin + FRGOWN_SETTLEMENT_INFO_API_URL, freightOwnerSettlementId, nowPage);
		SettlementFreightOwnerVO vo = new SettlementFreightOwnerVO();
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		// 비정상 결과에도 조회 가능한 값 있음 : CNNN 에러 표시를 위해 주석 해제 
		// if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
		
			// 화주 정보
			if(result.get("frgownInfo") !=null) {
				
				List frgInfoList = (List) result.get("frgownInfo");
				if(frgInfoList != null && !frgInfoList.isEmpty()) {
					
					Map frgInfo = (Map) frgInfoList.get(0);
					
					PrivateKey apiKey = RSAApiUtil.initPrivate();
					if(frgInfo.get("freightOwnerIdOrg") != null) {
						String freightOwnerIdOrg = frgInfo.get("freightOwnerIdOrg").toString();
						freightOwnerIdOrg = RSAApiUtil.decryptRSA(freightOwnerIdOrg, apiKey);
						result.put("resultId", freightOwnerIdOrg);
					}
				}
			}
		
			// 정산정보
			if(result.get("setInfo") != null) {
				
				List<Map> list = (List) result.get("setInfo");
				
				if (list != null && !list.isEmpty() && list.get(0) != null) {
					
					Map item = (Map) list.get(0);
					
					// 정산발생일
					UtilFunctions.makeDateToString(item, "freightOwnerSettlementDate");

					// 입금완료일
					UtilFunctions.makeDateToStringMin(item, "depositDate");
					
					// 완료일시
					UtilFunctions.makeDateToStringMin(item, "freightOwnerSettlementDoneDate");

					// 배차완료 일시
					UtilFunctions.makeDateToStringMin(item, "dispatchDate");
					
					// 상차완료 일시
					UtilFunctions.makeDateToStringMin(item, "loadingDate");
					
					// 하자완료 일시
					UtilFunctions.makeDateToStringMin(item, "unloadingDate");
					
				}
				
			}
			
			// 정산상세 목록
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
					
				}
				// resultMap.put("setList", list);
			}
			
			Map<String, Object> paginationVO = new HashMap<>();
			paginationVO.put("sizeOfData", result.get("listCount") == null ? 0 : (int) result.get("listCount"));
			paginationVO.put("pageIndex", nowPage);
			paginationVO.put("pageSize", vo.DEFAULT_PAGE_SIZE);
			
			String pagination =  new Pagination().setPagination(paginationVO);
			
			result.put("pagination", pagination);
			result.put("resultCode", result.get("resultCode"));

			return result;
			
//		} else {
//			return result;
//		}
	}
	
	/**
	 * 화주정산 목록 - 엑셀다운로드 
	 * 
	 * @param session
	 * @param vo
	 */
	public void getExcel(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementFreightOwnerVO vo) throws Exception {
	
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 계약구분(일반/계약)
		if(vo.getFreightOwnerType() != null) {
			param.put("freightOwnerType", vo.getFreightOwnerType());
		}
		
		// 사업자구분(전체/사업자/비사업자)
		if(vo.getFreightMemberType() != null) {
			param.put("freightMemberType", vo.getFreightMemberType());
		}
		
		// 사업자유형(일반/운송사/주선사)
		if(vo.getFreightBusinessType() != null) {
			param.put("freightBusinessType", vo.getFreightBusinessType());
		}
		
		// 정산상태
		if(vo.getFreightOwnerSettlementStatus() != null) {
			param.put("freightOwnerSettlementStatus", vo.getFreightOwnerSettlementStatus());
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
		
		// 월정산횟수 
		if(vo.getFreightOwnerMonthSettlementNum() != null) {
			param.put("freightOwnerMonthSettlementNum", vo.getFreightOwnerMonthSettlementNum());
		}
		
		String url = String.format(ktapiAdmin + FRGOWN_SETTLEMENT_EXCEL_DOWN_API_URL, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
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
	 * 화주정산 상세 - 목록 엑셀다운로드 
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
		
		String url = String.format(ktapiAdmin + FRGOWN_SETTLEMENT_DETAIL_EXCEL_DOWN_API_URL, carOwnerSettlementId);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
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
	 * 상세페이지 - 목록 엑셀다운로드 
	 * 
	 * @param session
	 * @param vo
	 */
	public Map updatePayment(HttpServletRequest request, HttpServletResponse response, SessionVO session, String carOwnerSettlementId) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin + FRGOWN_SETTLEMENT_PAYMENT_UPDATE_API_URL, carOwnerSettlementId);
		
		param.put("depositDate", request.getParameter("depositDate"));
		
		Map result = WebFunctions.connectApi(url, header, "GET", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		return result;
		
	}
	
}
