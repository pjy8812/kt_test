package com.kt.klp.adm.admin.policy.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.policy.domain.ChargeVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* PolicyPaneltyAdminService : 정책관리> 요금 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.27       mijin.kim     Initial creation
* </pre>
*
* @author IOUSOFT mijin.kim (mijin.kim@iousoft.co.kr)
* @since 2022.04.27
* @version 1.0.0
* @see
*
*/
@Service("policyChargeAdminService")
public class PolicyChargeAdminService extends AbstractServiceImpl {
	//list
	public static final String API_URL_CHARGE_LIST = "/v1/admin/Charge/getChargeMasterByParam";									//목록조회
	
	//select 
	public static final String API_URL_CHARGE_SELECT = "/v1/admin/Charge/getChargeMasterByIdx";									//상세 조회	
	public static final String API_URL_BASE_UNIT_LIST = "/v1/admin/Charge/getChargeBasePriceByIdx";								//기본단가 조회
	public static final String API_URL_WEIGHT_DISTANCE_LIST = "/v1/admin/Charge/getChargeInterchangeWeightByIdx";				//거리별가중치 조회
	public static final String API_URL_WEIGHT_CAR_TYPE_LIST = "/v1/admin/Charge/getChargeCarTypeWeightByIdx";					//차량유형별가중치(차량종류) 조회
	public static final String API_URL_WEIGHT_CAR_OPTION_LIST  = "/v1/admin/Charge/getChargeCarOptionWeightByIdx";				//차량유형별가중치(차량옵션) 조회
	public static final String API_URL_OILCOST_CAR_TYPE_LIST = "/v1/admin/Charge/getChargeCarTypeGasBillByIdx";					//유류비(차량종류) 조회
	public static final String API_URL_OILCOST_CAR_OPTION_LIST  = "/v1/admin/Charge/getChargeCarOptionGasBillByIdx";			//유류비(차량옵션) 조회
	public static final String API_URL_WEIGHT_AREA_LIST = "/v1/admin/Charge/getChargeLocationWeightByIdx";						//지역별가중치 조회
	public static final String API_URL_WEIGHT_NEXTDAY_DROP_SELECT = "/v1/admin/Charge/getChargeOvernightDropoffWeightByIdx";	//익일하차가중치 조회
	public static final String API_URL_MANUAL_COST_LIST = "/v1/admin/Charge/getChargeHandMadeCostByIdx";						//상/하차수작업비용 조회
	public static final String API_URL_WEIGHT_EMERGENCY_SELECT = "/v1/admin/Charge/getChargeEmergencyFreightWeightByIdx";		//긴급화물가중치 조회
	public static final String API_URL_WEIGHT_WOKING_TIME_LIST = "/v1/admin/Charge/getChargeHolidayWeightByIdx";				//작업시간별가중치 조회
	
	//insert
	public static final String API_URL_CHARGE_INSERT = "/v1/admin/Charge/addChargeMaster";								//기본정보 등록
	public static final String API_URL_BASE_UNIT_INSERT = "/v1/admin/Charge/addChargeBasePrice";						//기본단가 등록
	public static final String API_URL_WEIGHT_DISTANCE_INSERT = "/v1/admin/Charge/addChargeInterchangeWeight";			//거리별가중치 등록
	public static final String API_URL_WEIGHT_CAR_TYPE_INSERT = "/v1/admin/Charge/addChargeCarTypeWeight";				//차량유형별가중치(차량종류) 등록
	public static final String API_URL_WEIGHT_CAR_OPTION_INSERT  = "/v1/admin/Charge/addChargeCarOptionWeight";			//차량유형별가중치(차량옵션) 등록
	public static final String API_URL_OILCOST_CAR_TYPE_INSERT = "/v1/admin/Charge/addChargeCarTypeGasBill";			//유류비(차량종류) 등록
	public static final String API_URL_OILCOST_CAR_OPTION_INSERT  = "/v1/admin/Charge/addChargeCarOptionGasBill"; 		//유류비(차량옵션) 등록
	public static final String API_URL_WEIGHT_AREA_INSERT = "/v1/admin/Charge/addChargeLocationWeight";					//지역별가중치 등록
	public static final String API_URL_WEIGHT_NEXTDAY_DROP_INSERT = "/v1/admin/Charge/addChargeOvernightDropoffWeight";	//익일하차가중치 등록
	public static final String API_URL_MANUAL_COST_INSERT= "/v1/admin/Charge/addChargeHandMadeCost";					//상/하차수작업비용 등록
	public static final String API_URL_WEIGHT_EMERGENCY_INSERT = "/v1/admin/Charge/addChargeEmergencyFreightWeight";	//긴급화물가중치 등록
	public static final String API_URL_WEIGHT_WOKING_TIME_INSERT = "/v1/admin/Charge/addChargeHolidayWeight";			//작업시간별가중치 등록
	
	//update
	public static final String API_URL_CHARGE_UPDATE = "/v1/admin/Charge/updChargeMaster";								//기본정보 수정
	public static final String API_URL_BASE_UNIT_UPDATE = "/v1/admin/Charge/updChargeBasePrice";						//기본단가 수정
	public static final String API_URL_WEIGHT_DISTANCE_UPDATE = "/v1/admin/Charge/updChargeInterchangeWeight";			//거리별가중치 수정
	public static final String API_URL_WEIGHT_CAR_TYPE_UPDATE = "/v1/admin/Charge/updChargeCarTypeWeight";				//차량유형별가중치(차량종류) 수정
	public static final String API_URL_WEIGHT_CAR_OPTION_UPDATE  = "/v1/admin/Charge/updChargeCarOptionWeight";			//차량유형별가중치(차량옵션) 수정
	public static final String API_URL_OILCOST_CAR_TYPE_UPDATE = "/v1/admin/Charge/updChargeCarTypeGasBill";			//유류비(차량종류) 수정
	public static final String API_URL_OILCOST_CAR_OPTION_UPDATE  = "/v1/admin/Charge/updChargeCarOptionGasBill"; 		//유류비(차량옵션) 수정
	public static final String API_URL_WEIGHT_AREA_UPDATE = "/v1/admin/Charge/updChargeLocationWeight";					//지역별가중치 수정
	public static final String API_URL_WEIGHT_NEXTDAY_DROP_UPDATE = "/v1/admin/Charge/updChargeOvernightDropoffWeight";	//익일하차가중치 수정
	public static final String API_URL_MANUAL_COST_UPDATE= "/v1/admin/Charge/updChargeHandMadeCost";					//상/하차수작업비용 수정
	public static final String API_URL_WEIGHT_EMERGENCY_UPDATE = "/v1/admin/Charge/updChargeEmergencyFreightWeight";	//긴급화물가중치 수정
	public static final String API_URL_WEIGHT_WOKING_TIME_UPDATE = "/v1/admin/Charge/updChargeHolidayWeight";			//작업시간별가중치 수정
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 요금 목록조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listCharge(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_CHARGE_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		if(vo.getPagePerRows() == 0) {
			vo.setPagePerRows(10);
		}
		
		Map<String, Object> param = new HashMap<>();
		param.put("pageSize", vo.getPagePerRows());
		param.put("page", vo.getNowPage());
		param.put("chargeBasic", vo.getChargeBasic());
		param.put("chargeUse", vo.getChargeUse());
		
		if(vo.getSearchType() != null) {
			if(vo.getSearchType().equals(ChargeVO.SEARCH_TYPE_NAME)) { //요금제명 검색
				param.put("chargeName", vo.getSearchText());
			}else if(vo.getSearchType().equals(ChargeVO.SEARCH_TYPE_WORKER)) { //수정자 검색
				param.put("workerId", vo.getSearchText());
			}
		}
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		
		if(!result.isEmpty()) {
			//페이징추가
			if(result.get("pagenation") != null) {
				Map temp = (Map) result.get("pagenation");
				result.remove("pagenation");
				if(temp.get("totalRecordCount") != null) {
					int listCount = (int) temp.get("totalRecordCount");
					//logger.debug("{}", listCount);
					
					Map<String, Object> paginationVO = new HashMap<>();
					paginationVO.put("sizeOfData", listCount); 
					paginationVO.put("pageIndex", vo.getNowPage());
					paginationVO.put("pageSize", vo.getPagePerRows());
					result.put("paginationVO", paginationVO);
					
					String pagination =  new Pagination().setPagination(paginationVO);
					result.put("pagination", pagination);
				}
			}
		}
		
		//logger.debug("{}", result);
		return result;
	}
	
	/**
	 * 요금 상세조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectCharge(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_CHARGE_SELECT;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApi(ktapiAdmin + url, header, "GET", param);
		
		return result;
	}	
	
	/**
	 * 기준요금단가 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listBaseUnit(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_BASE_UNIT_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 거리별 가중치 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listWeightDistance(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_WEIGHT_DISTANCE_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 차량유형별 가중치 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listWeightCarType(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = new HashMap<>();
		
		//차량형태 목록조회
		String url = API_URL_WEIGHT_CAR_TYPE_LIST;
		Map<String, Object> carType = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		if(!carType.isEmpty()) {
			result.put("carType", carType);
		}
		
		//차량옵션 목록 조회
		url = API_URL_WEIGHT_CAR_OPTION_LIST;
		Map<String, Object> carOption = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		if(!carOption.isEmpty()) {
			result.put("carOption", carOption);
		}
		
		//logger.debug("{}", result);
		return result;
	}
	
	
	/**
	 * 유류비 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listOilCost(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = new HashMap<>();
		
		//차량형태 목록조회
		String url = API_URL_OILCOST_CAR_TYPE_LIST;
		Map<String, Object> carType = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		
		if(!carType.isEmpty()) {
			result.put("carType", carType);
		}
		
		//차량옵션 목록 조회
		url = API_URL_OILCOST_CAR_OPTION_LIST;
		Map<String, Object> carOption = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		if(!carOption.isEmpty()) {
			result.put("carOption", carOption);
		}
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 지역별가중치 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listWeightArea(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = String.format(API_URL_WEIGHT_AREA_LIST, vo.getChargeIdx());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 익일하차 가중치 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectWeightNextDayDrop(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_WEIGHT_NEXTDAY_DROP_SELECT;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	
	/**
	 * 상/하차 수작업 비용 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listManualCost(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_MANUAL_COST_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 긴급화물 가중치 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectWeightEmergency(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_WEIGHT_EMERGENCY_SELECT;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 작업시간별 가중치 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listWeightWorkingTime(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = API_URL_WEIGHT_WOKING_TIME_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("idx", vo.getChargeIdx());
		
		Map<String, Object> result = WebFunctions.connectApiList(ktapiAdmin + url, header, "GET", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 기본정보 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveCharge(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("chargeName", vo.getChargeName());
		param.put("chargeBasic", vo.getChargeBasic());
		param.put("chargeUse", vo.getChargeUse());
		param.put("chargeStartDate", vo.getChargeStartDate());
		param.put("chargeEndDate", vo.getChargeEndDate());
		param.put("chargeMargin", vo.getChargeMargin());
		param.put("workerId", sessionVO.getAdminId());
		param.put("updDate", vo.getUpdDate());
		
		String url = "";
		if(vo.getChargeIdx() == null) {
			url = API_URL_CHARGE_INSERT; //등록
		}else {
			url = API_URL_CHARGE_UPDATE; //수정
			param.put("chargeIdx", vo.getChargeIdx());
		}
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 기본단가 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveBaseUnit(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_BASE_UNIT_INSERT; //등록
		}else if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_BASE_UNIT_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getChargeJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 거리별 가중치 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveWeightDistance(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_WEIGHT_DISTANCE_INSERT; //등록
		}else if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_WEIGHT_DISTANCE_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getChargeJsonStr());
		//logger.debug("{}", jsonStr);
	
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 차량유형 가중치 (차량종류) 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveWeightCarType(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCarTypeCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_WEIGHT_CAR_TYPE_INSERT; //등록
		}else if(vo.getCarTypeCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_WEIGHT_CAR_TYPE_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getCarTypeJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	
	/**
	 * 차량유형 가중치 (차량옵션) 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveWeightCarOption(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCarOptionCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_WEIGHT_CAR_OPTION_INSERT; //등록
		}else if(vo.getCarOptionCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_WEIGHT_CAR_OPTION_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getCarOptionJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 유류비 (차랑종류) 등록/수정 
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveOilCostCarType(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCarTypeCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_OILCOST_CAR_TYPE_INSERT; //등록
		}else if(vo.getCarTypeCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_OILCOST_CAR_TYPE_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getCarTypeJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 유류비 (차량옵션) 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveOilCostCarOption(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCarOptionCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_OILCOST_CAR_OPTION_INSERT; //등록
		}else if(vo.getCarOptionCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_OILCOST_CAR_OPTION_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getCarOptionJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 지역별 가중치 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveWeightArea(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_WEIGHT_AREA_INSERT; //등록
		}else if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_WEIGHT_AREA_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getChargeJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 익일하차 가중치 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveWeightNextdayDrop(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_WEIGHT_NEXTDAY_DROP_INSERT; //등록
		}else if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_WEIGHT_NEXTDAY_DROP_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getChargeJsonStr());
		//logger.debug("{}", jsonStr);

		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 상/하차 수작업비용 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveManualCost(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_MANUAL_COST_INSERT; //등록
		}else if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_MANUAL_COST_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getChargeJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 긴급화물 가중치 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveWeightEmergency(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_WEIGHT_EMERGENCY_INSERT; //등록
		}else if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_WEIGHT_EMERGENCY_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getChargeJsonStr());
		//logger.debug("{}", jsonStr);
				
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 작업시간별 가중치 등록/수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param ChargeVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveWeightWorkingTime(HttpServletRequest request, SessionVO sessionVO, ChargeVO vo) throws Exception {
		String url = "";
		if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_CREATE)) {
			url = API_URL_WEIGHT_WOKING_TIME_INSERT; //등록
		}else if(vo.getCrudType().equals(ChargeVO.CRUD_TYPE_UPDATE)){
			url = API_URL_WEIGHT_WOKING_TIME_UPDATE; //수정
		}else {
			throw new ServiceException("99999", "save type error");
		}
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String jsonStr = UtilFunctions.decodeXss(vo.getChargeJsonStr());
		//logger.debug("{}", jsonStr);
		
		Map<String, Object> result = WebFunctions.connectApiJsonString(ktapiAdmin + url, header, "POST", jsonStr);
		//logger.debug("{}", result);
		
		return result;
	}
}
