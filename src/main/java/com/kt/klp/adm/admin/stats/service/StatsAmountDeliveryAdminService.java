package com.kt.klp.adm.admin.stats.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.stats.domain.DeliveryAmountStatisticsVO;
import com.kt.klp.adm.admin.stats.domain.StatisticsVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* StatsAmountDeliveryAdminService : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.05.02       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.05.02
* @version 1.0.0
* @see
*
*/
@Service
public class StatsAmountDeliveryAdminService extends AbstractServiceImpl {
	
	// 배송조건별
	public static final String API_URL_STATS_DELVY_TON_COUNT = "/v1/admin/statistics/delivery/ton/count"; //배송조건별 - 건수 - 톤급별
	public static final String API_URL_STATS_DELVY_TON_AMOUNT = "/v1/admin/statistics/delivery/ton/amount"; //배송조건별 - 금액 - 톤급별
	public static final String API_URL_STATS_DELVY_FRG_COUNT = "/v1/admin/statistics/delivery/frg/count"; //배송조건별 - 건수 - 제품별
	public static final String API_URL_STATS_DELVY_FRG_AMOUNT = "/v1/admin/statistics/delivery/frg/amount"; //배송조건별 - 금액 - 제품별
	public static final String API_URL_STATS_DELVY_TMP_COUNT = "/v1/admin/statistics/delivery/tmp/count"; //배송조건별 - 건수 - 온도별
	public static final String API_URL_STATS_DELVY_TMP_AMOUNT = "/v1/admin/statistics/delivery/tmp/amount"; //배송조건별 - 금액 - 온도별
	
	public static final String API_URL_STATS_DELVY_TON_COUNT_EXCEL_DOWN = "/v1/admin/statistics/delivery/ton/count/excel"; //배송조건별 - 건수 - 톤급별 - 엑셀 다운로드 
	public static final String API_URL_STATS_DELVY_TON_AMOUNT_EXCEL_DOWN = "/v1/admin/statistics/delivery/ton/amount/excel"; //배송조건별 - 금액 - 톤급별 - 엑셀 다운로드 
	public static final String API_URL_STATS_DELVY_FRG_COUNT_EXCEL_DOWN = "/v1/admin/statistics/delivery/frg/count/excel"; //배송조건별 - 건수 - 제품별 - 엑셀 다운로드 
	public static final String API_URL_STATS_DELVY_FRG_AMOUNT_EXCEL_DOWN = "/v1/admin/statistics/delivery/frg/amount/excel"; //배송조건별 - 금액 - 제품별 - 엑셀 다운로드 
	public static final String API_URL_STATS_DELVY_TMP_COUNT_EXCEL_DOWN = "/v1/admin/statistics/delivery/tmp/count/excel"; //배송조건별 - 건수 - 온도별 - 엑셀 다운로드 
	public static final String API_URL_STATS_DELVY_TMP_AMOUNT_EXCEL_DOWN = "/v1/admin/statistics/delivery/tmp/amount/excel"; //배송조건별 - 금액 - 온도별 - 엑셀 다운로드 
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	@Autowired
	protected CommonService commonService;
	
	/**
	 * 물량 통계 - 배송 조건별  
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listDelvy(HttpServletRequest request, SessionVO session, DeliveryAmountStatisticsVO vo) throws Exception {

		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		// header.put("adminIp", UtilFunctions.getClientIP(request));// header.put("adminIp", UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		if(vo.getBasisDate() != null) {
			param.put("basisDate", vo.getBasisDate());
			
			if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_YEAR)) {
				vo.setEndDate("");
			}
		}
		
		if(vo.getStartDate() != null && !vo.getStartDate().equals("")) {
			param.put("startDate", vo.getStartDate());
		}
		
		if(vo.getEndDate() != null) { // && !vo.getEndDate().equals("")) {
			param.put("endDate", vo.getEndDate());
		}
		
		String url = null;
		
		if (vo.getDataType() != null && vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
			// 건수
			if (vo.getStatsType() != null) {
				if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TON)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TON_COUNT;
					// logger.debug("[배송조건별] 건수 - 톤급별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_FREIGHT_OWNER)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_FRG_COUNT;
					// logger.debug("[배송조건별] 건수 - 제품별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TEMPERATURE)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TMP_COUNT;
					// logger.debug("[배송조건별] 건수 - 온도별");
				}
			}
		} else if (vo.getDataType() != null && vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
			// 금액
			if (vo.getStatsType() != null) {
				if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TON)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TON_AMOUNT;
					// logger.debug("[배송조건별] 금액 - 톤급별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_FREIGHT_OWNER)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_FRG_AMOUNT;
					// logger.debug("[배송조건별] 금액 - 제품별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TEMPERATURE)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TMP_AMOUNT;
					// logger.debug("[배송조건별] 금액 - 온도별");
				}
			}
		}

		if(url == null) {
			return null;
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			return getListSummary(session, result, vo);
		} else {
			return result;
		}
	}
	

	/**
	 * 차량 통계 - 목록 - 엑셀다운로드
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public void getExcel(HttpServletRequest request, HttpServletResponse response, SessionVO session, DeliveryAmountStatisticsVO vo) throws Exception {
		

		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		// header.put("adminIp", UtilFunctions.getClientIP(request));// header.put("adminIp", UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		if(vo.getBasisDate() != null) {
			param.put("basisDate", vo.getBasisDate());
			
			if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_YEAR)) {
				vo.setEndDate("");
			}
		}
		
		if(vo.getStartDate() != null && !vo.getStartDate().equals("")) {
			param.put("startDate", vo.getStartDate());
		}
		
		if(vo.getEndDate() != null) { // && !vo.getEndDate().equals("")) {
			param.put("endDate", vo.getEndDate());
		}
		
		String url = null;
		
		if (vo.getDataType() != null && vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
			// 건수
			if (vo.getStatsType() != null) {
				if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TON)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TON_COUNT_EXCEL_DOWN;
					// logger.debug("[배송조건별] 건수 - 톤급별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_FREIGHT_OWNER)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_FRG_COUNT_EXCEL_DOWN;
					// logger.debug("[배송조건별] 건수 - 제품별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TEMPERATURE)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TMP_COUNT_EXCEL_DOWN;
					// logger.debug("[배송조건별] 건수 - 온도별");
				}
			}
		} else if (vo.getDataType() != null && vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
			// 금액
			if (vo.getStatsType() != null) {
				if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TON)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TON_AMOUNT_EXCEL_DOWN;
					// logger.debug("[배송조건별] 금액 - 톤급별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_FREIGHT_OWNER)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_FRG_AMOUNT_EXCEL_DOWN;
					// logger.debug("[배송조건별] 금액 - 제품별");
				} else if (vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TEMPERATURE)) {
					url = ktapiAdmin + API_URL_STATS_DELVY_TMP_AMOUNT_EXCEL_DOWN;
					// logger.debug("[배송조건별] 금액 - 온도별");
				}
			}
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			if(result.get("fileData") != null && !result.get("fileData").equals("")) {
				DownloadFunctions.downloadBase64toFile(request, response, result.get("fileData").toString() ,result.get("fileName") == null ? "tempFileName" : result.get("fileName").toString() + ".xlsx");
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
		// return result;
	}
	
	/**
	 * 차량 통계 값 가공 
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Map getListSummary(SessionVO session, Map map, DeliveryAmountStatisticsVO vo) throws Exception {
		
		if(map != null && map.get("data") != null) {
			
			List<Map> list = (List) map.get("data");
			
			if(list != null &&  !list.isEmpty()) {
				
				for(Map item : list) {
					// 합계 데이터에서 헤더 추출 
					List headerCodeList = new ArrayList();
					
					if(item.get(vo.DATA_TOTAL_FLAG_STRING) != null && item.get(vo.DATA_TOTAL_FLAG_STRING).equals(vo.DATA_TOTAL_FLAG_TRUE_STRING)) {
						
						Iterator<String> keys = item.keySet().iterator(); 
				        while(keys.hasNext()){
				            String key = keys.next();
				            
				            if(!key.equals(vo.DATA_TOTAL_FLAG_STRING)) {
				            	headerCodeList.add(key);
				            }
				        }
					}
					
					if(item != null && item.get(vo.DELIVERY_DATA_UNLOADED_AT) != null && !item.get(vo.DELIVERY_DATA_UNLOADED_AT).equals("")) {
						String unloadedAtString = item.get(vo.DELIVERY_DATA_UNLOADED_AT).toString();
						
						if(unloadedAtString.length() == 8) {
							unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4, 6) + "-" + unloadedAtString.substring(6);
						} else if(unloadedAtString.length() == 6) {
							unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4);
						}
						
						item.put("unloadedAtString", unloadedAtString);
					}
					
					map.put("headerCodeList", headerCodeList);
					
				}
			}
			
			if(vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TON)) {
				// 톤수별 
//				if(list != null &&  !list.isEmpty()) {
//					
//					for(Map item : list) {
//						// 합계 데이터에서 헤더 추출 
//						List headerCodeList = new ArrayList();
//						
//						if(item.get(vo.DATA_TOTAL_FLAG_STRING) != null && item.get(vo.DATA_TOTAL_FLAG_STRING).equals(vo.DATA_TOTAL_FLAG_TRUE_STRING)) {
//							
//							Iterator<String> keys = item.keySet().iterator(); 
//					        while(keys.hasNext()){
//					            String key = keys.next();
//					            
//					            if(!key.equals(vo.DATA_TOTAL_FLAG_STRING)) {
//					            	headerCodeList.add(key);
//					            }
//					        }
//						}
//						
//						if(item != null && item.get(vo.DELIVERY_DATA_UNLOADED_AT) != null && !item.get(vo.DELIVERY_DATA_UNLOADED_AT).equals("")) {
//							String unloadedAtString = item.get(vo.DELIVERY_DATA_UNLOADED_AT).toString();
//							
//							if(unloadedAtString.length() == 8) {
//								unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4, 6) + "-" + unloadedAtString.substring(6);
//							} else if(unloadedAtString.length() == 6) {
//								unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4);
//							} else if(unloadedAtString.length() == 4) {
//								// Year
//							}
//							
//							item.put("unloadedAtString", unloadedAtString);
//						}
//						
//						map.put("headerCodeList", headerCodeList);
//						
//					}
//				}
				
				List<Map> carTypeList = commonService.listCode(session, "carType"); 
				
				Map headerCodeMap = new HashMap();
				// Map carTypeCodeMap = new HashMap();
				
				for(Map codeItem : carTypeList) {
					
					String codeId = codeItem.get("codeId").toString();
					String codeName = codeItem.get("codeName").toString();
					
					if(codeId != null && codeName != null) {
						headerCodeMap.put(codeId, codeName);
					}
				}
				
				List<Map> carModelList = commonService.listCode(session, "carModel"); 
				
				// Map headerCodeMap = new HashMap();
				
				for(Map codeItem : carModelList) {
					
					String codeId = codeItem.get("codeId").toString();
					String codeName = codeItem.get("codeName").toString();
					
					if(codeId != null && codeName != null ) {
						headerCodeMap.put(codeId, codeName);
					}
				}
				
				map.put("headerCodeMap", headerCodeMap);
				
				// 마지막에 JSON 생성
				map.put("dataJson", getJsonString(list));
				
			} else if(vo.getStatsType().equals(vo.DELIVERY_CATEGORY_FREIGHT_OWNER)) {
				// 제품별 
//				if(list != null &&  !list.isEmpty()) {
//					
//					for(Map item : list) {
//						// 합계 데이터에서 헤더 추출 
//						List headerCodeList = new ArrayList();
//						
//						if(item.get(vo.DATA_TOTAL_FLAG_STRING) != null && item.get(vo.DATA_TOTAL_FLAG_STRING).equals(vo.DATA_TOTAL_FLAG_TRUE_STRING)) {
//							
//							Iterator<String> keys = item.keySet().iterator(); 
//					        while(keys.hasNext()){
//					            String key = keys.next();
//					            
//					            if(!key.equals(vo.DATA_TOTAL_FLAG_STRING)) {
//					            	headerCodeList.add(key);
//					            }
//					        }
//						}
//						
//						if(item != null && item.get(vo.DELIVERY_DATA_UNLOADED_AT) != null && !item.get(vo.DELIVERY_DATA_UNLOADED_AT).equals("")) {
//							String unloadedAtString = item.get(vo.DELIVERY_DATA_UNLOADED_AT).toString();
//							
//							if(unloadedAtString.length() == 8) {
//								unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4, 6) + "-" + unloadedAtString.substring(6);
//							} else if(unloadedAtString.length() == 6) {
//								unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4);
//							} else if(unloadedAtString.length() == 4) {
//								// Year
//							}
//							
//							item.put("unloadedAtString", unloadedAtString);
//						}
//						
//						map.put("headerCodeList", headerCodeList);
//						
//					}
//				}
				
				List<Map> freightTypeList = commonService.listCode(session, "freightType"); 
				
				Map headerCodeMap = new HashMap();
				// Map carTypeCodeMap = new HashMap();
				
				for(Map codeItem : freightTypeList) {
					
					String codeId = codeItem.get("codeId").toString();
					String codeName = codeItem.get("codeName").toString();
					
					if(codeId != null && codeName != null) {
						headerCodeMap.put(codeId, codeName);
					}
				}
				
				map.put("headerCodeMap", headerCodeMap);
				
				// 마지막에 JSON 생성
				map.put("dataJson", getJsonString(list));
				
			} else if(vo.getStatsType().equals(vo.DELIVERY_CATEGORY_TEMPERATURE)) {
				// 온도별 
//				if(list != null &&  !list.isEmpty()) {
//					
//					for(Map item : list) {
//						// 합계 데이터에서 헤더 추출 
//						List headerCodeList = new ArrayList();
//						
//						if(item.get(vo.DATA_TOTAL_FLAG_STRING) != null && item.get(vo.DATA_TOTAL_FLAG_STRING).equals(vo.DATA_TOTAL_FLAG_TRUE_STRING)) {
//							
//							Iterator<String> keys = item.keySet().iterator(); 
//					        while(keys.hasNext()){
//					            String key = keys.next();
//					            
//					            if(!key.equals(vo.DATA_TOTAL_FLAG_STRING)) {
//					            	headerCodeList.add(key);
//					            }
//					        }
//						}
//						
//						if(item != null && item.get(vo.DELIVERY_DATA_UNLOADED_AT) != null && !item.get(vo.DELIVERY_DATA_UNLOADED_AT).equals("")) {
//							String unloadedAtString = item.get(vo.DELIVERY_DATA_UNLOADED_AT).toString();
//							
//							if(unloadedAtString.length() == 8) {
//								unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4, 6) + "-" + unloadedAtString.substring(6);
//							} else if(unloadedAtString.length() == 6) {
//								unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4);
//							} else if(unloadedAtString.length() == 4) {
//								// Year
//							}
//							
//							item.put("unloadedAtString", unloadedAtString);
//						}
//						
//						map.put("headerCodeList", headerCodeList);
//						
//					}
//				}
				
				List<Map> deliveryTemperatureList = commonService.listCode(session, "deliveryTemperature"); 
				
				Map headerCodeMap = new HashMap();
				// Map carTypeCodeMap = new HashMap();
				
				for(Map codeItem : deliveryTemperatureList) {
					
					String codeId = codeItem.get("codeId").toString();
					String codeName = codeItem.get("codeName").toString();
					
					if(codeId != null && codeName != null) {
						headerCodeMap.put(codeId, codeName);
					}
				}
				
				map.put("headerCodeMap", headerCodeMap);
				
				// 마지막에 JSON 생성
				map.put("dataJson", getJsonString(list));
			}
		}
				
		return map;
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
	
}
