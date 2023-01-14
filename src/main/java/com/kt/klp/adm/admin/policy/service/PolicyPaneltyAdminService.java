package com.kt.klp.adm.admin.policy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.policy.domain.PenaltyVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* PolicyPaneltyAdminService : 정책관리> 패널티 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.10       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.10
* @version 1.0.0
* @see
*
*/
@Service("policyPaneltyAdminService")
public class PolicyPaneltyAdminService extends AbstractServiceImpl {
	
	public static final String PENALTY_TYPE_CAR_OWNER = "carOwnerPenalty";
	public static final String PENALTY_TYPE_FREIGHT_OWNER= "freightOwnerPenalty";
	
	public static final String PENALTY_POLICY_FREIGHT_CANCEL_LIST_API_URL = "/v1/penalty/getAllPenaltyFeeIntervalCancel"; // 화주 - 패널티 위약수수료 배차취소 리스트 전체 조회
	public static final String PENALTY_POLICY_FREIGHT_CANCEL_API_URL = "/v1/penalty/getPenaltyFeeIntervalCancelByIdx"; // 화주 - 패널티 위약수수료 배차취소 리스트 단건 조회
	
	public static final String PENALTY_POLICY_FREIGHT_DELAY_LIST_API_URL = "/v1/penalty/getAllPenaltyFeeLatencyDelay"; // 화주 - 패널티 위약수수료 대기지연 리스트 전체 조회
	public static final String PENALTY_POLICY_FREIGHT_DELAY_API_URL = "/v1/penalty/getPenaltyFeeLatencyDelayByIdx"; // 화주 - 패널티 위약수수료 대기지연 리스트 단건 조회
	
	public static final String PENALTY_POLICY_CAR_CANCEL_LIST_API_URL = "/v1/penalty/getAllPenaltyNextWeekIntervalCancel"; // 차주 - 패널티 차주패널티 배차취소 리스트 전체 조회
	public static final String PENALTY_POLICY_CAR_CANCEL_API_URL = "/v1/penalty/getPenaltyNextWeekIntervalCancelByIdx"; // 차주 - 패널티 차주패널티 배차취소 리스트 단건 조회
	
	public static final String PENALTY_POLICY_CAR_ACCIDENT_LIST_API_URL = "/v1/penalty/getAllPenaltyNextWeekDeliveryAccident"; // 차주 - 패널티 차주패널티 배송사고 리스트 전체 조회
	public static final String PENALTY_POLICY_CAR_ACCIDENT_API_URL = "/v1/penalty/getPenaltyNextWeekDeliveryAccidentByIdx"; // 차주 - 패널티 차주패널티 배송사고 리스트 단건 조회
	
	public static final String PENALTY_POLICY_FREIGHT_CANCEL_INSERT_API_URL = "/v1/penalty/addPenaltyFeeIntervalCancel"; // 화주 - 패널티 위약수수료 배차취소 추가
	public static final String PENALTY_POLICY_FREIGHT_DELAY_INSERT_API_URL = "/v1/penalty/addPenaltyFeeLatencyDelay"; // 화주 - 패널티 위약수수료 대기지연 추가
	public static final String PENALTY_POLICY_CAR_CANCEL_INSERT_API_URL = "/v1/penalty/addPenaltyNextWeekIntervalCancel"; // 차주 - 패널티 차주패널티 배차취소 추가
	public static final String PENALTY_POLICY_CAR_ACCIDENT_INSERT_API_URL = "/v1/penalty/addPenaltyNextWeekDeliveryAccident"; // 차주 - 패널티 차주패널티 배송사고 추가
	
	public static final String PENALTY_POLICY_FREIGHT_CANCEL_UPDATE_API_URL = "/v1/penalty/updPenaltyFeeIntervalCancel"; // 화주 - 패널티 위약수수료 배차취소 수정
	public static final String PENALTY_POLICY_FREIGHT_DELAY_UPDATE_API_URL = "/v1/penalty/updPenaltyFeeLatencyDelay"; // 화주 - 패널티 위약수수료 대기지연 수정
	public static final String PENALTY_POLICY_CAR_CANCEL_UPDATE_API_URL = "/v1/penalty/updPenaltyNextWeekIntervalCancel"; // 차주 - 패널티 차주패널티 배차취소 수정
	public static final String PENALTY_POLICY_CAR_ACCIDENT_UPDATE_API_URL = "/v1/penalty/updPenaltyNextWeekDeliveryAccident"; // 차주 - 패널티 차주패널티 배송사고 수정
	
//	public static final String PENALTY_POLICY_FREIGHT_LIST_API_URL = "/v1/admin/penalty/policy/freight/select"; 	// 화주 위약수수료 조회
//	public static final String PENALTY_POLICY_FREIGHT_INSERT_API_URL = "/v1/admin/penalty/policy/freight/insert"; 	// 화주 위약수수료 등록
//	public static final String PENALTY_POLICY_FREIGHT_UPDATE_API_URL = "/v1/admin/penalty/policy/freight/update"; 	// 화주 위약수수료 수정
//	
//	public static final String PENALTY_POLICY_CAR_LIST_API_URL = "/v1/admin/penalty/policy/car/select"; 	// 차주 위약수수료 조회
//	public static final String PENALTY_POLICY_CAR_INSERT_API_URL = "/v1/admin/penalty/policy/car/insert"; 	// 차주 위약수수료 등록
//	public static final String PENALTY_POLICY_CAR_UPDATE_API_URL = "/v1/admin/penalty/policy/car/update"; 	// 차주 위약수수료 수정
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	public static final String RESULT_CODE_SUCCESS = "00000"; 
	public static final String RESULT_CODE_FAIL = "99999"; 
	
	@Value("${api.ktapiAdmin}")
    String ktapiAdmin;
	
	/**
	 * 패널티 - 화주 - 배차취소 위약 수수료 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getFreightOwnerCancelList(HttpServletRequest request, HttpServletResponse response, SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin + PENALTY_POLICY_FREIGHT_CANCEL_LIST_API_URL);
		Map result = WebFunctions.connectApiList(url, header, "GET", param);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
//		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
//		} else {
//			return result;
//		}
		
		return result;
	}
	
	/**
	 * 패널티 - 화주 - 대기지연 위약 수수료 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getFreightOwnerDelayList(HttpServletRequest request, HttpServletResponse response, SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin + PENALTY_POLICY_FREIGHT_DELAY_LIST_API_URL);
		Map result = WebFunctions.connectApiList(url, header, "GET", param);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
//		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
//		} else {
//			return result;
//		}
		
		return result;
	}
	
	/**
	 * 패널티 - 차주 - 배차취소 패널티 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getCarOwnerCancelList(HttpServletRequest request, HttpServletResponse response, SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin + PENALTY_POLICY_CAR_CANCEL_LIST_API_URL);
		Map result = WebFunctions.connectApiList(url, header, "GET", param);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
//		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
//		} else {
//			return result;
//		}
		
		return result;
	}
	
	/**
	 * 차주 - 배송사고 패널티 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getCarOwnerAccidentList(HttpServletRequest request, HttpServletResponse response, SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin + PENALTY_POLICY_CAR_ACCIDENT_LIST_API_URL);
		Map result = WebFunctions.connectApiList(url, header, "GET", param);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
//		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
//		} else {
//			return result;
//		}
		
		return result;
	}

	/**
	 * 패널티 - 저장 
	 * @param request
	 * @param response
	 * @param session
	 * @param JSONdata
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public Map saveDetail(HttpServletRequest request, HttpServletResponse response, SessionVO session, String JSONdata,
			String type) throws Exception {

		Map result = new HashMap();
		
		ObjectMapper mapper = new ObjectMapper();
		Map dataItem = mapper.readValue(JSONdata, Map.class);
		// Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		switch (type) {
		case PENALTY_TYPE_FREIGHT_OWNER:
			return saveFrgOwnerPenalty(dataItem, param, header, session, mapper, result);
		case PENALTY_TYPE_CAR_OWNER:
			return saveCarOwnerPenalty(dataItem, param, header, session, mapper, result);
		default:
			return result;
		}
	}
	
	/**
	 * 패널티 - 화주 저장 
	 * @param dataItem
	 * @param param
	 * @param header
	 * @param session
	 * @param mapper
	 * @param result
	 * @return
	 * @throws Exception
	 */
	private Map saveFrgOwnerPenalty(Map dataItem, Map param, Map header, SessionVO session, ObjectMapper mapper, Map<String, Object> result) throws Exception {
		
		List cancelList = (List) dataItem.get("cancelList");
		List delayList = (List) dataItem.get("delayList");
		
		List cancelInsertList = new ArrayList();
		List cancelUpdateList = new ArrayList();
		List delayInsertList = new ArrayList();
		List delayUpdateList = new ArrayList();
		
		int totCnt = cancelList.size() + delayList.size();
		int successCnt = 0;
	
		// ObjectMapper mapper = new ObjectMapper();
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		
		for (int i = 0; i < cancelList.size(); i++) {
			Map item = (Map) cancelList.get(i);
			item.put("workerId", session.getAdminId());
			
			if(item != null && item.get("method") != null && item.get("method").equals(PenaltyVO.METHOD_UPDATE)) {
				cancelUpdateList.clear();
				cancelUpdateList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_FREIGHT_CANCEL_UPDATE_API_URL);
				String body = mapper.writeValueAsString(cancelUpdateList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
			} else {
				cancelInsertList.clear();
				cancelInsertList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_FREIGHT_DELAY_INSERT_API_URL);
				String body = mapper.writeValueAsString(cancelInsertList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
			}
		}

		for (int i = 0; i < delayList.size(); i++) {
			Map item = (Map) delayList.get(i);
			item.put("workerId", session.getAdminId());
			
			if(item != null && item.get("method") != null && item.get("method").equals(PenaltyVO.METHOD_UPDATE)) {
				delayUpdateList.clear();
				delayUpdateList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_FREIGHT_DELAY_UPDATE_API_URL);
				String body = mapper.writeValueAsString(delayUpdateList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
				
			} else {
				delayInsertList.clear();
				delayInsertList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_FREIGHT_DELAY_INSERT_API_URL);
				String body = mapper.writeValueAsString(delayInsertList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
			}
		}
		
		if(totCnt == successCnt) {
			result.put("resultCode", RESULT_CODE_SUCCESS);
		} else {
			result.put("resultCode", RESULT_CODE_FAIL);
		}
		
		return result;
	}
	
	/**
	 * 패널티 - 차주 저장 
	 * 
	 * @param dataItem
	 * @param param
	 * @param header
	 * @param session
	 * @param mapper
	 * @param result
	 * @return
	 * @throws Exception
	 */
	private Map saveCarOwnerPenalty(Map dataItem, Map param, Map header, SessionVO session, ObjectMapper mapper, Map<String, Object> result) throws Exception {
		
		List cancelList = (List) dataItem.get("cancelList");
		List accidentList = (List) dataItem.get("accidentList");
		
		List cancelInsertList = new ArrayList();
		List cancelUpdateList = new ArrayList();
		List accidentInsertList = new ArrayList();
		List accidentUpdateList = new ArrayList();
		
		int totCnt = cancelList.size() + accidentList.size();
		int successCnt = 0;
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		
		for (int i = 0; i < cancelList.size(); i++) {
			Map item = (Map) cancelList.get(i);
			item.put("workerId", session.getAdminId());
			
			if(item != null && item.get("method") != null && item.get("method").equals(PenaltyVO.METHOD_UPDATE)) {
				cancelUpdateList.clear();
				cancelUpdateList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_CAR_CANCEL_UPDATE_API_URL);
				String body = mapper.writeValueAsString(cancelUpdateList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
			} else {
				cancelInsertList.clear();
				cancelInsertList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_CAR_CANCEL_INSERT_API_URL);
				String body = mapper.writeValueAsString(cancelInsertList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
			}
		}
		
		for (int i = 0; i < accidentList.size(); i++) {
			Map item = (Map) accidentList.get(i);
			item.put("workerId", session.getAdminId());
			
			if(item != null && item.get("method") != null && item.get("method").equals(PenaltyVO.METHOD_UPDATE)) {
				accidentUpdateList.clear();
				accidentUpdateList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_CAR_ACCIDENT_UPDATE_API_URL);
				String body = mapper.writeValueAsString(accidentUpdateList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
				
			} else {
				accidentInsertList.clear();
				accidentInsertList.add(item);
				
				String url = String.format(ktapiAdmin + PENALTY_POLICY_CAR_ACCIDENT_INSERT_API_URL);
				String body = mapper.writeValueAsString(accidentInsertList);
				Map apiResult = WebFunctions.connectApiJsonString(url, header, "POST", body);
				
				//logger.debug("{}", body);
				//logger.debug("{}", apiResult);
				
				if(apiResult != null && apiResult.get(PenaltyVO.API_RESULT_STATUS) != null && apiResult.get(PenaltyVO.API_RESULT_STATUS).toString().equals(PenaltyVO.API_RESULT_STATUS_SUCCESS)) {
					if(apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT) != null) {
						// successCnt += (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						int resultCnt = (int) apiResult.get(PenaltyVO.API_RESULT_SUCCESS_CNT);
						successCnt = sumAndCheckOverflow(successCnt, resultCnt);
					}
				}
			}
		}
		
		if(totCnt == successCnt) {
			result.put("resultCode", RESULT_CODE_SUCCESS);
		} else {
			result.put("resultCode", RESULT_CODE_FAIL);
		}
		
		return result;
		
	}
	
	// overflow 체크 
	private int sumAndCheckOverflow(int num1, int num2) throws ServiceException {
		if(num1 > 0) {
			if(num2 > Integer.MAX_VALUE - num1) {
				// overflow 체크 
				throw new ServiceException("resultCount Error");
			}
		} else {
			if(num2 < Integer.MIN_VALUE - num1) {
				// overflow 체크 
				throw new ServiceException("resultCount Error");
			}
		}
		
		return num1 + num2;
	}
	
}
