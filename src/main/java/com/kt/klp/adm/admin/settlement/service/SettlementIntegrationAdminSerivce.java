package com.kt.klp.adm.admin.settlement.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.settlement.domain.SettlementIntegrationVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.Pagination;
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
* 2022.12.09       PJY     Initial creation
* </pre>
*
* @author PJY
* @since 2022.12.09
* @version 1.0.0
* @see
*
*/
@Service
public class SettlementIntegrationAdminSerivce extends AbstractServiceImpl {
	
	public static final String INTEG_SETTLEMENT_API_URL                   = "/v1/admin/integ/settlement/list/%d"; // 통합 주문 조회 및 검색 - {nowPage}
	public static final String INTEG_SETTLEMENT_EXCEL_DOWN_API_URL        = "/v1/admin/integ/settlement/excel/down"; // 통합 주문 조회 엑셀 다운로드
	public static final String INTEG_SETTLEMENT_INFO_API_URL              = "/v1/admin/integ/settlement/info/%s/%s"; // 통합 주문 조회 상세정보 - {freightOwnerSettlementId}/{nowPage}
	public static final String INTEG_SETTLEMENT_PAYMENT_UPDATE_API_URL    = "/v1/admin/integ/settlement/payment/update/%s"; // 화주 입금확인 상태 변경 - {freightOwnerSettlementId}
	
	public static final String INTEG_SETTLEMENT_FRG_INFO_API_URL          = "/v1/admin/integ/settlement/select/frgown"; // 화주 상세정보
	public static final String INTEG_SETTLEMENT_CAR_INFO_API_URL          = "/v1/admin/integ/settlement/select/carown"; // 차주 상세정보
	
	
	public static final String INTEG_SETTLEMENT_ORDER_DETAIL_API_URL = "/v1/admin/elastic/order/detail"; // 통합 주문조회 주문내역 상세
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	public static final String EXCEL_FILE_NAME_INTEG_SETTLEMENT_LIST        = "정산관리_통합주문조회_목록";
	public static final String EXCEL_FILE_NAME_INTEG_SETTLEMENT_DETAIL_LIST = "정산관리_통합주문조회_상세_목록";

	@Value("${api.ktapi}")
	private String ktapi;
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	/**
	 * 통합 주문조회 목록
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map getList(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementIntegrationVO vo) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 청구상태
		if(vo.getFreightOwnerSettlementState() != null) {
			param.put("freightOwnerSettlementState", vo.getFreightOwnerSettlementState());
		}
		
		// 지급상태
		if(vo.getCarOwnerSettlementState() != null) {
			param.put("carOwnerSettlementState", vo.getCarOwnerSettlementState());
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
		
		// 청구발생일 검색 시작일
		if(vo.getSettlementCompleteDoenStartDate() != null) {
			param.put("settlementCompleteDoenStartDate", vo.getSettlementCompleteDoenStartDate());
		}
		
		// 청구발생일 검색 종료일
		if(vo.getSettlementCompleteDoenEndDate() != null) {
			param.put("settlementCompleteDoenEndDate", vo.getSettlementCompleteDoenEndDate());
		}

		// 정산발생일 검색 시작일
		if(vo.getSettlementCompleteStartDate() != null) {
			param.put("settlementCompleteStartDate", vo.getSettlementCompleteStartDate());
		}
		
		// 정산발생일 검색 종료일
		if(vo.getSettlementCompleteEndDate() != null) {
			param.put("settlementCompleteEndDate", vo.getSettlementCompleteEndDate());
		}
		
		// 청구마감월 시작
		if(vo.getBillMonthStartDate() != null) {
			param.put("billMonthStartDate", vo.getBillMonthStartDate());
		}
		
		// 청구마감월 종료
		if(vo.getBillMonthEndDate() != null) {
			param.put("billMonthEndDate", vo.getBillMonthEndDate());
		}
		
		// 지급마감월 시작
		if(vo.getPayMonthStartDate() != null) {
			param.put("payMonthStartDate", vo.getPayMonthStartDate());
		}
		
		// 지급마감월 종료
		if(vo.getPayMonthEndDate() != null) {
			param.put("payMonthEndDate", vo.getPayMonthEndDate());
		}
		
		
		String url = String.format(ktapiAdmin + INTEG_SETTLEMENT_API_URL, vo.getPageIndex());
		
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
				
				UtilFunctions.millisecondListToDate(list);
				
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
	 * 통합 주문조회 상세
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param freightOwnerSettlementId
	 * @param mode
	 * @param maskingYn
	 * @return
	 * @throws Exception
	 */
	public Map getDetail(HttpServletRequest request, HttpServletResponse response, SessionVO session, String freightOwnerSettlementId, String obj, String maskingYn) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));

		if(maskingYn != null && maskingYn.equals(SettlementIntegrationVO.YN_N)) {
			param.put("maskingYn", SettlementIntegrationVO.YN_N);
		} else {
			param.put("maskingYn", SettlementIntegrationVO.YN_Y);
		}
		
		// mode 인코딩 변경
		obj = URLEncoder.encode(obj, "UTF-8");
		String url = String.format(ktapiAdmin + INTEG_SETTLEMENT_INFO_API_URL, freightOwnerSettlementId, obj);
		
		SettlementIntegrationVO vo = new SettlementIntegrationVO();
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		result.put("resultCode", result.get("resultCode"));

		return result;
	}
	
	/**
	 * 통합주문조회 목록 - 엑셀다운로드
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param vo
	 * @throws Exception
	 */
	public void getExcel(HttpServletRequest request, HttpServletResponse response, SessionVO session, SettlementIntegrationVO vo) throws Exception {
	
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		
		// 청구상태
		if(vo.getFreightOwnerSettlementState() != null) {
			param.put("freightOwnerSettlementState", vo.getFreightOwnerSettlementState());
		}
		
		// 지급상태
		if(vo.getCarOwnerSettlementState() != null) {
			param.put("carOwnerSettlementState", vo.getCarOwnerSettlementState());
		}
		
		// 검색타입
		if(vo.getSearchType() != null) {
			param.put("searchType", vo.getSearchType());
		}
		
		// 검색어
		if(vo.getSearchText() != null) {
			param.put("searchText", vo.getSearchText());
		}
		
		// 정산발생일 검색 시작일
		if(vo.getSettlementCompleteStartDate() != null) {
			param.put("settlementCompleteStartDate", vo.getSettlementCompleteStartDate());
		}
		
		// 정산발생일 검색 종료일
		if(vo.getSettlementCompleteEndDate() != null) {
			param.put("settlementCompleteEndDate", vo.getSettlementCompleteEndDate());
		}

		// 청구마감월 시작
		if(vo.getBillMonthStartDate() != null) {
			param.put("billMonthStartDate", vo.getBillMonthStartDate());
		}
		
		// 청구마감월 종료
		if(vo.getBillMonthEndDate() != null) {
			param.put("billMonthEndDate", vo.getBillMonthEndDate());
		}
		
		// 지급마감월 시작
		if(vo.getPayMonthStartDate() != null) {
			param.put("payMonthStartDate", vo.getPayMonthStartDate());
		}
		
		// 지급마감월 종료
		if(vo.getPayMonthEndDate() != null) {
			param.put("payMonthEndDate", vo.getPayMonthEndDate());
		}
		
		// 마스킹여부
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}
		
		String url = String.format(ktapiAdmin + INTEG_SETTLEMENT_EXCEL_DOWN_API_URL, vo.getPageIndex());
		
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
	 * 통합 주문조회 - 상세 - 차주/화주 정보 조회
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param ownerSettlementId
	 * @param own
	 * @return
	 * @throws Exception
	 */
	public Map getOwner(HttpServletRequest request, HttpServletResponse response, SessionVO session, String ownerSettlementId, String own) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		String url = null;
		String key = null;
		
		if (own.equals("frgown")) {
			url = ktapiAdmin + INTEG_SETTLEMENT_FRG_INFO_API_URL;
			key = "freightOwnerSettlementId";
		} else {
			url = ktapiAdmin + INTEG_SETTLEMENT_CAR_INFO_API_URL;
			key = "carOwnerSettlementId";
		}
		
		param.put(key, ownerSettlementId);
		
		Map result = WebFunctions.connectApi(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 정산 - 통합주문조회 - 상세 - 주문상세
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param orderId
	 * @param maskingYn
	 * @return
	 * @throws Exception
	 */
	public Map getOrderList(HttpServletRequest request, HttpServletResponse response, SessionVO session, String orderId, String maskingYn, List carOptions) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("orderId", orderId);
		param.put("maskingYn", maskingYn);
		
		Map result = WebFunctions.connectApi(ktapiAdmin + INTEG_SETTLEMENT_ORDER_DETAIL_API_URL, header, "GET", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		List list = (List) result.get("result");
		
		result = (Map) list.get(0);
		Map freight = (Map) result.get("freight");
		
		// millisecond To Date
		// 배송 요청일시
		if (result.get("registerCompletedAt") != null) {
			result.put("registerCompletedAt", UtilFunctions.millisecondToDate(result.get("registerCompletedAt"), "yyyy-MM-dd HH:mm"));
		}
		
		// 화물 등록일시
		
		if (freight.get("createdAt") != null) {
			freight.put("createdAt", UtilFunctions.millisecondToDate(freight.get("createdAt"), "yyyy-MM-dd HH:mm"));
		}

		// 상차1 일시
		if (freight.get("loadingCompletedDateTime") != null) {
			freight.put("loadingCompletedDateTime", UtilFunctions.millisecondToDate(freight.get("loadingCompletedDateTime"), "yyyy-MM-dd HH:mm"));
		}
		
		// 하차1 일시
		if (freight.get("unloadingCompletedDateTime") != null) {
			freight.put("unloadingCompletedDateTime", UtilFunctions.millisecondToDate(freight.get("unloadingCompletedDateTime"), "yyyy-MM-dd HH:mm"));
		}
		
		// 예상이동시간 치환
		if (result.get("leadTime") != null) {
			result.put("leadTime", secLeadTimeToMin(result.get("leadTime").toString()));
		}
		
		// 차량 옵션 구분
		List<Map> carOptionList = (List) freight.get("freightCarOptions");
		Map carOptionMap = new HashMap<>();
		carOptionMap.put("liftYn", "N");
		carOptionMap.put("antiSwingYn", "N");
		carOptionMap.put("type", null);
		
		for (int i = 0; i < carOptionList.size(); i++) {
			String option = (String) ((Map) carOptionList.get(i).get("carOption")).get("carOptionE");
			if (option.equals("lift")) {
				carOptionMap.put("liftYn", "Y");
			} else if (option.equals("antiSwing")) {
				carOptionMap.put("antiSwingYn", "Y");
			} else {
				for (int j = 0; j < carOptions.size(); j++) {
					Map tmp = (Map) carOptions.get(j);
					String codeId = (String) tmp.get("codeId");
					String codeName = (String) tmp.get("codeName");
					
					if (codeId.equals(option)) {
						carOptionMap.put("type", codeName);
					}
				}
			}
		}
		
		// 초기 시간 데이터 생성
		List<String> hoursList = setDateTimeList("Hours");
		List<String> minutesList = setDateTimeList("Minutes");
		result.put("hoursList", hoursList);
		result.put("minutesList", minutesList);
		
		result.put("carOption", carOptionMap);
		result.put("freight", freight);
		return result;
		
	}
	
	private List<String> setDateTimeList(String type) {
		List<String> result = new ArrayList<>();
		int loop = 0;
		
		switch (type) {
		case "Hours":
			loop = 24;
			break;
			
		case "Minutes":
			loop = 60;
			break;
			
		default:
			loop = 0;
			break;
		}
		
		for (int i = 0; i < loop; i++) {
			String data = String.valueOf(i);
			// 자리수 검증
			if (data.length() == 1) {
				data = "0" + data;
			}
			result.add(data);
		}
		
		return result;
	}
	
	/**
	 * 예상이동시간 초 -> 분 치환
	 * 
	 * @param value
	 * @return
	 */
	private int secLeadTimeToMin(String value) {
		
		double leadTime = Double.valueOf(value);
		int leadMin = ((int)leadTime)/60;
		
		return leadMin;
	}
	
}
