
package com.kt.klp.adm.admin.dashboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* DashboardAdminService : 대시보드 service
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
* @since 2022.02.03
* @version 1.0.0
* @see
*
*/
@Service("dashboardAdminService")
public class DashboardAdminService extends AbstractServiceImpl {
	
	public static final String DASHBOARD_ORDERS_API_URL = "/v1/admin/dashboard/order"; // elastic search
	
	public static final String DASHBOARD_ALLOCATION_DELAY_API_URL =  "/v1/admin/dashboard/allocationDelay"; // 배차지연 처리 건수
	public static final String DASHBOARD_ALLOCATION_EMERGENCY_API_URL = "/v1/admin/dashboard/allocationEmergency"; // 비상배차 후 처리 건수
	public static final String DASHBOARD_ALLOCATION_MANAGER_API_URL = "/v1/admin/dashboard/allocationManager"; // 비상배차 후 처리 건수
	 
	public static final String DASHBOARD_FRGOWN_MGMT_API_URL = "/v1/admin/dashboard/frgown/mgmt"; // 화주 이용상태 별 회원수
	public static final String DASHBOARD_CAROWN_MGMT_API_URL = "/v1/admin/dashboard/carown/mgmt"; // 차주 이용상태 별 회원수
	public static final String DASHBOARD_VOC_API_URL = "/v1/admin/dashboard/voc"; // 1:1문의 상태별 건수
	public static final String DASHBOARD_CAROWN_SETTLEMENT_API_URL = "/v1/admin/dashboard/carown/settlement"; // 차주 정산 상태 별 건수
	public static final String DASHBOARD_FRGOWN_SETTLEMENT_API_URL = "/v1/admin/dashboard/frgown/settlement"; // 화주 정산 상태 별 건수 
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 주문/배송 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getOrderSummary(SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_ORDERS_API_URL, header, "GET", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			if(result.get("list") != null) {
				
				List<Map> list = (List) result.get("list");
				
				if(list.isEmpty()) {
					return null;
				}
				
				for(Map item : list) {
					if(item.get("orderStatus") != null) {
						if(item.get("count") == null) {
							resultMap.put(item.get("orderStatus"), 0);
						} else {
							resultMap.put(item.get("orderStatus"), item.get("count"));
						}
					}
				}
			}
			
			// 금일 배송 완료 건수
			if(result.get("deliveryCompleteTodayCount") == null) {
				resultMap.put("deliveryCompleteTodayCount", 0);
			} else {
				resultMap.put("deliveryCompleteTodayCount", result.get("deliveryCompleteTodayCount"));
			}
			
			// 금일 주문 등록 건수
			if(result.get("orderTodayCount") == null) {
				resultMap.put("orderTodayCount", 0);
			} else {
				resultMap.put("orderTodayCount", result.get("orderTodayCount"));
			}
			
			// 요금확인 긴급 건수
			if(result.get("chargeCheckingEmergencyCount") == null) {
				resultMap.put("chargeCheckingEmergencyCount", 0);
			} else {
				resultMap.put("chargeCheckingEmergencyCount", result.get("chargeCheckingEmergencyCount"));
			}
			
			// 요금확인 긴급 건수
			if(result.get("dispatchRequestedEmergencyCount") == null) {
				resultMap.put("dispatchRequestedEmergencyCount", 0);
			} else {
				resultMap.put("dispatchRequestedEmergencyCount", result.get("dispatchRequestedEmergencyCount"));
			}
			
			resultMap.put("resultCode", result.get("resultCode"));
			resultMap.put("resultMsg", result.get("resultMsg"));
			
			return resultMap;
		} else {
			return result;
		}
	}
	
	/**
	 * 화주 이용상태 별 회원수
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getFrgownSummary(SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_FRGOWN_MGMT_API_URL, header, "GET", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			if(result.get("list") != null) {
				
				List<Map> list = (List) result.get("list");
				
				if(list.isEmpty()) {
					return null;
				}
				
				for(Map item : list) {
			
					if(item.get("stateCode") != null) {
						if(item.get("count") == null) {
							resultMap.put(item.get("stateCode"), 0);
						} else {
							resultMap.put(item.get("stateCode"), item.get("count"));
						}
					}
					
					// 상태가 정상이면 가입서류 미확인 값 처리 
					if(item.get("stateCode") != null && item.get("stateCode").equals("normal") 
							&& item.get("unCount") != null) {
						resultMap.put("unCount", item.get("unCount"));
					} else {
						resultMap.put("unCount", 0);
					}
				}
			}
			
			// 총 화주 회원 수	
			if(result.get("freightOwnerTotal") == null) {
				resultMap.put("freightOwnerTotal", 0);
			} else {
				resultMap.put("freightOwnerTotal", result.get("freightOwnerTotal"));
			}
			
			// 신규 회원 수
			if(result.get("freightOwnerNew") == null) {
				resultMap.put("freightOwnerNew", 0);
			} else {
				resultMap.put("freightOwnerNew", result.get("freightOwnerNew"));
			}
			
			// 가입서류 미확인 
			if(result.get("unidentifiedDocs") == null) {
				resultMap.put("unidentifiedDocs", 0);
			} else {
				resultMap.put("unidentifiedDocs", result.get("unidentifiedDocs"));
			}
			
			resultMap.put("resultCode", result.get("resultCode"));
			
			return resultMap;
		} else {
			return result;
		}
	}
	
	/**
	 * 차주 이용상태 별 회원수
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getCarownSummary(SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_CAROWN_MGMT_API_URL, header, "GET", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			if(result.get("list") != null) {
				
				List<Map> list = (List) result.get("list");
				
				if(list.isEmpty()) {
					return null;
				}
				
				for(Map item : list) {
					if(item.get("stateCode") != null) {
						if(item.get("count") == null) {
							resultMap.put(item.get("stateCode"), 0);
						} else {
							resultMap.put(item.get("stateCode"), item.get("count"));
						}
					}
					
					// 상태가 정상이면 가입서류 미확인 값 처리 
					if(item.get("stateCode") != null && item.get("stateCode").equals("normal") 
							&& item.get("unCount") != null) {
						resultMap.put("unCount", item.get("unCount"));
					} else {
						resultMap.put("unCount", 0);
					}
				}
			}
			
			// 총 차주 회원 수	
			if(result.get("carOwnerTotal") == null) {
				resultMap.put("carOwnerTotal", 0);
			} else {
				resultMap.put("carOwnerTotal", result.get("carOwnerTotal"));
			}
			
			// 신규 회원 수
			if(result.get("carOwnerNew") == null) {
				resultMap.put("carOwnerNew", 0);
			} else {
				resultMap.put("carOwnerNew", result.get("carOwnerNew"));
			}
			
			// 가입서류 미확인 
			if(result.get("unidentifiedDocs") == null) {
				resultMap.put("unidentifiedDocs", 0);
			} else {
				resultMap.put("unidentifiedDocs", result.get("unidentifiedDocs"));
			}
			
			resultMap.put("resultCode", result.get("resultCode"));
			
			return resultMap;
		} else {
			return result;
		}
	}
	
	/**
	 * 1:1문의 상태별 건수
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getQnaSummary(SessionVO session) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_VOC_API_URL, header, "GET", param);
		
		return result;
	}
	
	/**
	 * 차주 정산 상태 별 건수
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getSettlementCarownSummary(SessionVO session) throws Exception {

		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_CAROWN_SETTLEMENT_API_URL, header, "GET", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			if(result.get("list") != null) {
				
				List<Map> list = (List) result.get("list");
				
				if(list.isEmpty()) {
					return null;
				}
				
				for(Map item : list) {
					if(item.get("stateCode") != null) {
						if(item.get("count") == null) {
							resultMap.put(item.get("stateCode"), 0);
						} else {
							resultMap.put(item.get("stateCode"), item.get("count"));
						}
					}
				}
			}
			
			if(result.get("listCount") == null) {
				resultMap.put("listCount", 0);
			} else {
				resultMap.put("listCount", result.get("listCount"));
			}
			
			if(result.get("todayCompletedCount") == null) {
				resultMap.put("todayCompletedCount", 0);
			} else {
				resultMap.put("todayCompletedCount", result.get("todayCompletedCount"));
			}
			
			resultMap.put("resultCode", result.get("resultCode"));
			
			return resultMap;
		} else {
			return result;
		}
	}
	
	/**
	 * 화주 정산 상태 별 건수
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getSettlementFrgownSummary(SessionVO session) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_FRGOWN_SETTLEMENT_API_URL, header, "GET", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			if(result.get("list") != null) {
				
				List<Map> list = (List) result.get("list");
				
				if(list.isEmpty()) {
					return null;
				}
				
				for(Map item : list) {
					if(item.get("stateCode") != null) {
						if(item.get("count") == null) {
							resultMap.put(item.get("stateCode"), 0);
						} else {
							resultMap.put(item.get("stateCode"), item.get("count"));
						}
					}
				}
			}
			
			if(result.get("listCount") == null) {
				resultMap.put("listCount", 0);
			} else {
				resultMap.put("listCount", result.get("listCount"));
			}
			
			if(result.get("thisMonthCompletedCount") == null) {
				resultMap.put("thisMonthCompletedCount", 0);
			} else {
				resultMap.put("thisMonthCompletedCount", result.get("thisMonthCompletedCount"));
			}
			
			resultMap.put("resultCode", result.get("resultCode"));
			
			return resultMap;
		} else {
			return result;
		}
	}
	
	/**
	 * 배차지연 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getDelayDispatch(SessionVO session) throws Exception {

		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_ALLOCATION_DELAY_API_URL, header, "GET", param);
	
		//logger.debug("param={}", param);
		//logger.debug("header={}", header);
		//logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 비상배차
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getEmergencyDispatch(SessionVO session) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_ALLOCATION_EMERGENCY_API_URL, header, "GET", param);
		
		//logger.debug("param={}", param);
		//logger.debug("header={}", header);
		//logger.debug("result={}", result);
		
		return result;
		
	}
	
	/**
	 * 수동배차
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map getManagerDispatch(SessionVO session) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		Map result = WebFunctions.connectApi(ktapiAdmin + DASHBOARD_ALLOCATION_MANAGER_API_URL, header, "GET", param);
		
		//logger.debug("param={}", param);
		//logger.debug("header={}", header);
		//logger.debug("result={}", result);
		
		return result;
	}
	
}
