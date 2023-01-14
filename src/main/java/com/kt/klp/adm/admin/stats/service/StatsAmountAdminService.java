package com.kt.klp.adm.admin.stats.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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
import com.kt.klp.adm.admin.stats.domain.StatisticsVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* StatsAmountAdminService : 물량통계 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.27       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.04.27
* @version 1.0.0
* @see
*
*/

@Service("statsAmountAdminService")
public class StatsAmountAdminService extends AbstractServiceImpl {

	// 화주별
	public static final String API_URL_STATS_FRGOWN_COUNT = "/v1/admin/statistics/freight/count"; //화주별 - 건수
	public static final String API_URL_STATS_FRGOWN_AMOUNT = "/v1/admin/statistics/freight/amount"; //화주별 - 금액
	
	public static final String API_URL_STATS_EXCEL_FRGOWN_COUNT = "/v1/admin/statistics/freight/count/excel"; //화주별 - 건수
	public static final String API_URL_STATS_EXCEL_FRGOWN_AMOUNT = "/v1/admin/statistics/freight/amount/excel"; //화주별 - 금액
	public static final String API_URL_STATS_EXCEL_FRGOWN_COUNT_TOTAL = "/v1/admin/statistics/freight/count/total/excel"; //화주별 - 건수(전체)
	public static final String API_URL_STATS_EXCEL_FRGOWN_AMOUNT_TOTAL = "/v1/admin/statistics/freight/amount/total/excel"; //화주별 - 금액(전체)
	
	// 구간별
	public static final String API_URL_STATS_LOC_TOTAL_COUNT = "/v1/admin/statistics/interval/total/count"; //구간별 - 건수 - 상차지1이 전체인 경우
	public static final String API_URL_STATS_LOC_TOTAL_AMOUNT = "/v1/admin/statistics/interval/total/amount"; //구간별 - 금액 - 상차지1이 전체인 경우
	public static final String API_URL_STATS_LOC_EACH_COUNT = "/v1/admin/statistics/interval/each/count"; //구간별 - 건수 - 상차지1이 전체가 아닌 경우
	public static final String API_URL_STATS_LOC_EACH_AMOUNT = "/v1/admin/statistics/interval/each/amount"; //구간별 - 금액 - 상차지1이 전체가 아닌 경우
	
	public static final String API_URL_STATS_EXCEL_LOC_TOTAL_COUNT = "/v1/admin/statistics/interval/total/count/excel"; //구간별 - 건수 - 상차지1이 전체인 경우
	public static final String API_URL_STATS_EXCEL_LOC_TOTAL_AMOUNT = "/v1/admin/statistics/interval/total/amount/excel"; //구간별 - 금액 - 상차지1이 전체인 경우
	public static final String API_URL_STATS_EXCEL_LOC_EACH_COUNT = "/v1/admin/statistics/interval/each/count/excel"; //구간별 - 건수 - 상차지1이 전체가 아닌 경우
	public static final String API_URL_STATS_EXCEL_LOC_EACH_AMOUNT = "/v1/admin/statistics/interval/each/amount/excel"; //구간별 - 금액 - 상차지1이 전체가 아닌 경우
	
	// 차량별
	public static final String API_URL_STATS_CAR_COUNT = "/v1/admin/statistics/car/count"; //차량별 - 건수
	public static final String API_URL_STATS_CAR_AMOUNT = "/v1/admin/statistics/car/amount"; //차량별 - 금액

	public static final String API_URL_STATS_EXCEL_CAR_COUNT = "/v1/admin/statistics/car/count/excel"; //차량별 - 건수
	public static final String API_URL_STATS_EXCEL_CAR_AMOUNT = "/v1/admin/statistics/car/amount/excel"; //차량별 - 금액
	public static final String API_URL_STATS_EXCEL_CAR_COUNT_TOTAL = "/v1/admin/statistics/car/count/total/excel"; //차량별 - 건수(전체)
	public static final String API_URL_STATS_EXCEL_CAR_AMOUNT_TOTAL = "/v1/admin/statistics/car/amount/total/excel"; //차량별 - 금액(전체)
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	@Autowired
	protected CommonService commonService;
	
	
	/**
	 * 화주별 탭 - 목록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listFrgown(HttpServletRequest request, SessionVO session, StatisticsVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		if(vo.getBasisDate() != null) {
			if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_YEAR)) {
				//연 기준 - 시작/종료년도가 동일할 경우 endDate 빈값 전송
				if(vo.getStartDate().equals(vo.getEndDate())) {
					vo.setEndDate("");
				}
				
			} else if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_MONTH)) {
				//월 기준 - 날짜 8자리로 들어온경우 일자 제외
				if(vo.getStartDate().length() == 8) {
					vo.setStartDate(vo.getStartDate().substring(0, 6));
				}
				if(vo.getEndDate().length() == 8) {
					vo.setEndDate(vo.getEndDate().substring(0, 6));
				}
			}
		}
		
		// set param
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerType", vo.getFreightOwnerType());
		param.put("businessType", vo.getBusinessType());
		param.put("basisDate", vo.getBasisDate());
		param.put("startDate", vo.getStartDate().replaceAll("-",""));
		param.put("endDate", vo.getEndDate().replaceAll("-",""));
		
		//건수
		String url = ktapiAdmin + API_URL_STATS_FRGOWN_COUNT;
		if(vo.getDataType() != null && vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
			//금액
			url = ktapiAdmin + API_URL_STATS_FRGOWN_AMOUNT;
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals("00000")) {
			result = getListSummary(result);
			
			//그래프 Y축 조정을 위한 일자별 최대값 추출
			List<Integer> maxList = new ArrayList<>();
			
			if(result != null && result.get("data") != null) {
				List<Map> dataList = (List) result.get("data");
				Integer[] intArr = null;
				
				for(Map map : dataList) {
					List<Integer> arrList = new ArrayList<>();
					
					if(map != null) {
						Iterator<String> keys = map.keySet().iterator();
						while(keys.hasNext()) {
							String key = keys.next();
							
							if(!map.get("unloadedAt").equals("Total") && !key.equals("unloadedAt") && !key.equals("unloadedAtString")) {
								arrList.add(Integer.valueOf(map.get(key).toString()));
							}
						}
					}
					
					// List to array
					int arrListSize = arrList.size();
					intArr = arrList.toArray(new Integer[arrListSize]);
					Arrays.sort(intArr, Collections.reverseOrder());
					
					if(intArr.length > 0) {
						maxList.add(intArr[0]);
					}
				}
			}
			result.put("maxList", maxList);
			logger.debug("result={}", result);
			
			return result;
		} else {
			return result;
		}
	}
	
	/**
	 * 구간별 탭 - 목록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listLoc(HttpServletRequest request, SessionVO session, StatisticsVO vo) throws Exception {

		String flag = "";
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		if(vo.getBasisDate() != null) {
			if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_YEAR)) {
				//연 기준 - 시작/종료년도가 동일할 경우 endDate 빈값 전송
				if(vo.getStartDate().equals(vo.getEndDate())) {
					vo.setEndDate("");
				}
				
			} else if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_MONTH)) {
				//월 기준 - 날짜 8자리로 들어온경우 일자 제외
				if(vo.getStartDate().length() == 8) {
					vo.setStartDate(vo.getStartDate().substring(0, 6));
				}
				if(vo.getEndDate().length() == 8) {
					vo.setEndDate(vo.getEndDate().substring(0, 6));
				}
			}
		}
		
		// set param
		Map<String, Object> param = new HashMap<>();
		param.put("location", vo.getLocation());
		param.put("basisDate", vo.getBasisDate());
		param.put("startDate", vo.getStartDate().replaceAll("-",""));
		param.put("endDate", vo.getEndDate().replaceAll("-",""));
		
		String url = "";
		List list = vo.getLocation();
		logger.debug("size = {}", list.size());
		
		if(list.size() == 1) {
			Map map = (Map) list.get(0);

			if(map != null && map.get("loadedAt") != null) {
				String loadedAt = map.get("loadedAt").toString();
				
				if(loadedAt.equals("all")) {
					//상차지1이 전체인 경우
					flag = "all";
					
					if(vo.getDataType() != null) {
						if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
							//건수 - 상차지1이 전체인 경우
							url = ktapiAdmin + API_URL_STATS_LOC_TOTAL_COUNT;
						} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
							//금액 - 상차지1이 전체인 경우
							url = ktapiAdmin + API_URL_STATS_LOC_TOTAL_AMOUNT;
						}
					}
				}
			}
		}
		
		if(url.equals("")) {
			flag = "each";
			
			if(vo.getDataType() != null) {
				if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
					//건수 - 상차지1이 전체가 아닌 경우
					url = ktapiAdmin + API_URL_STATS_LOC_EACH_COUNT;
				} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
					//금액 - 상차지1이 전체가 아닌 경우
					url = ktapiAdmin + API_URL_STATS_LOC_EACH_AMOUNT;
				}
			}
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals("00000")) {
			if(flag.equals("each")) {
				//상차지1이 전체가 아닌경우
				result = getListSummary(result);
				
				//그래프 Y축 조정을 위한 일자별 최대값 추출
				List<Integer> maxList = new ArrayList<>();
				
				if(result != null && result.get("data") != null) {
					List<Map> dataList = (List) result.get("data");
					Integer[] intArr = null;
					
					for(Map map : dataList) {
						List<Integer> arrList = new ArrayList<>();
						
						if(map != null) {
							Iterator<String> keys = map.keySet().iterator();
							while(keys.hasNext()) {
								String key = keys.next();
								
								if(!map.get("totFlag").equals("2") && !key.equals("unloadedAt") && !key.equals("unloadedAtString")) {
									arrList.add(Integer.valueOf(map.get(key).toString()));
								}
							}
						}
						
						// List to array
						int arrListSize = arrList.size();
						intArr = arrList.toArray(new Integer[arrListSize]);
						Arrays.sort(intArr, Collections.reverseOrder());
						
						if(intArr.length > 0) {
							maxList.add(intArr[0]);
						}
					}
				}
				result.put("maxList", maxList);
				logger.debug("result={}", result);
				
			} else if(flag.equals("all")) {
				//상차지1이 전체인 경우
				if(result != null && result.get("data") != null) {
					List<Map> dataList = (List) result.get("data");
					
					//tempCode -> 지역명 추출
					for(Map item : dataList) {
						if(item != null && item.get("tempCode") != null && !item.get("tempCode").toString().equals("null")) {
							String tempCode = item.get("tempCode").toString();
							tempCode = getLocationNameByCode(tempCode);
							item.put("locationName", tempCode);
						}
					}
				}
			}
			return result;
		} else {
			return result;
		}
	}

	/**
	 * 차량별 탭 - 목록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listCar(HttpServletRequest request, SessionVO session, StatisticsVO vo) throws Exception {
		
		String flag = "";
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		if(vo.getBasisDate() != null) {
			if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_YEAR)) {
				//연 기준 - 시작/종료년도가 동일할 경우 endDate 빈값 전송
				if(vo.getStartDate().equals(vo.getEndDate())) {
					vo.setEndDate("");
				}
				
			} else if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_MONTH)) {
				//월 기준 - 날짜 8자리로 들어온경우 일자 제외
				if(vo.getStartDate().length() == 8) {
					vo.setStartDate(vo.getStartDate().substring(0, 6));
				}
				if(vo.getEndDate().length() == 8) {
					vo.setEndDate(vo.getEndDate().substring(0, 6));
				}
			}
		}
		
		// set param
		Map<String, Object> param = new HashMap<>();
		param.put("carList", vo.getCarList());
		param.put("basisDate", vo.getBasisDate());
		param.put("startDate", vo.getStartDate().replaceAll("-",""));
		param.put("endDate", vo.getEndDate().replaceAll("-",""));
		
		String url = ktapiAdmin + API_URL_STATS_CAR_COUNT;
		//건수
		if(vo.getDataType() != null && vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
			//금액
			url = ktapiAdmin + API_URL_STATS_CAR_AMOUNT;
		}
		
		List carList = vo.getCarList();
		logger.debug("size = {}", carList.size());
		
		if(carList.size() == 1) {
			Map map = (Map) carList.get(0);

			if(map != null && map.get("carType") != null) {
				String carType = map.get("carType").toString();
				
				if(carType.equals("all")) {
					//차종1이 전체인 경우
					flag = "all";
				}
			}
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals("00000")) {
			if(flag.equals("")) {
				//차종1이 전체가 아닌경우
				if(result != null && result.get("data") != null) {
					List<Map> dataList = (List) result.get("data");
//					List<Map> data = new ArrayList<>();
//					
//					String tempKey = "";
//					List<String> itemList = new ArrayList<>();
//					
//					//전체 출력된 데이터 중 조회한 차량(차종, 톤수)에 대한 데이터만 추출
//					for(int i=0; i<carList.size(); i++) {
//						Map tempMap = (Map) carList.get(i);
//						
//						if(tempMap != null) {
//							String carType = "";
//							String carModel = "";
//							if(tempMap.get("carType") != null) carType = tempMap.get("carType").toString();
//							if(tempMap.get("carModel") != null) carModel = tempMap.get("carModel").toString();
//							
//							if(carModel.equals("all")) {
//								carModel = "tot";
//							}
//							tempKey = (carType + carModel).toLowerCase();
//							tempKey = "item"+(i+1);
//							itemList.add(tempKey);
//						}
//					}
//
//					for(Map map : dataList) {
//						Map<String, Object> dataMap = new HashMap<>();
//
//						if(map != null) {
//							Iterator<String> keys = map.keySet().iterator();
//							while(keys.hasNext()) {
//								String key = keys.next();
//								
//								if(key.equals("unloadedAt")) {
//									dataMap.put(key, map.get(key));
//								} else if(key.equals("totFlag")) {
//									dataMap.put(key, map.get(key));
//								}
//								
//								for(int j=0; j<itemList.size(); j++) {
//									tempKey = itemList.get(j).toString();
//									if(key.equalsIgnoreCase(tempKey)) {
//										dataMap.put("item"+(j+1), map.get(key));
//									}
//								}
//							}
//							data.add(dataMap);
//						}
//					}
					result.put("data", dataList);
				}
				result = getListSummary(result);
				
				//그래프 Y축 조정을 위한 일자별 최대값 추출
				List<Integer> maxList = new ArrayList<>();
				
				if(result != null && result.get("data") != null) {
					List<Map> dataList = (List) result.get("data");
					Integer[] intArr = null;
					
					for(Map map : dataList) {
						List<Integer> arrList = new ArrayList<>();
						
						if(map != null) {
							Iterator<String> keys = map.keySet().iterator();
							while(keys.hasNext()) {
								String key = keys.next();
								
								if(!map.get("totFlag").equals("2") && !key.equals("unloadedAt") && !key.equals("unloadedAtString")) {
									arrList.add(Integer.valueOf(map.get(key).toString()));
								}
							}
						}
						
						// List to array
						int arrListSize = arrList.size();
						intArr = arrList.toArray(new Integer[arrListSize]);
						Arrays.sort(intArr, Collections.reverseOrder());
						
						if(intArr.length > 0) {
							maxList.add(intArr[0]);
						}
					}
				}
				result.put("maxList", maxList);
				logger.debug("result={}", result);
				
			} else if(flag.equals("all")) {
				//차종1이 전체인 경우
				if(result != null && result.get("data") != null) {
					List<Map> dataList = (List) result.get("data");
					for(Map<String, Object> map : dataList) {
						if(map.get("unloadedAt") != null) {
							String unloadedAt = map.get("unloadedAt").toString();
							map.put("codeName", unloadedAt);
							unloadedAt = getCarModelCodeByName(session, unloadedAt);
							map.put("codeId", unloadedAt);
						}
					}
				}
			}
			return result;
		} else {
			return result;
		}
	}

	/**
	 * 엑셀다운로드
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param vo
	 * @param mode
	 * @throws Exception
	 */
	public void excelDownload(HttpServletRequest request, HttpServletResponse response, SessionVO session, StatisticsVO vo, String mode) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());

		if(vo.getBasisDate() != null) {
			if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_YEAR)) {
				//연 기준 - 시작/종료년도가 동일할 경우 endDate 빈값 전송
				if(vo.getStartDate().equals(vo.getEndDate())) {
					vo.setEndDate("");
				}
				
			} else if(vo.getBasisDate().equals(vo.DATA_BASIS_DATE_MONTH)) {
				//월 기준 - 날짜 8자리로 들어온경우 일자 제외
				if(vo.getStartDate().length() == 8) {
					vo.setStartDate(vo.getStartDate().substring(0, 6));
				}
				if(vo.getEndDate().length() == 8) {
					vo.setEndDate(vo.getEndDate().substring(0, 6));
				}
			}
		}
		
		// set param
		Map<String, Object> param = new HashMap<>();
		if(vo.getFreightOwnerType() != null) param.put("freightOwnerType", vo.getFreightOwnerType());
		if(vo.getBusinessType() != null) param.put("businessType", vo.getBusinessType());
		if(vo.getLocation() != null) param.put("location", vo.getLocation());
		if(vo.getCarList() != null) param.put("carList", vo.getCarList());
		param.put("basisDate", vo.getBasisDate());
		param.put("startDate", vo.getStartDate().replaceAll("-",""));
		param.put("endDate", vo.getEndDate().replaceAll("-",""));
		
		String url = "";
		if(mode.equals("frgown")) {
			//화주별
			if(vo.getFreightOwnerType() != null && vo.getDataType() != null) {
				if(vo.getFreightOwnerType().equals("all")) {
					if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
						//건수 - 유형이 전체인 경우
						url = ktapiAdmin + API_URL_STATS_EXCEL_FRGOWN_COUNT_TOTAL;
					} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
						//금액 - 유형이 전체인 경우
						url = ktapiAdmin + API_URL_STATS_EXCEL_FRGOWN_AMOUNT_TOTAL;
					}
				} else if(!vo.getFreightOwnerType().equals("all")) {
					if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
						//건수 - 유형이 전체가 아닌 경우
						url = ktapiAdmin + API_URL_STATS_EXCEL_FRGOWN_COUNT;
					} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
						//금액 - 유형이 전체가 아닌 경우
						url = ktapiAdmin + API_URL_STATS_EXCEL_FRGOWN_AMOUNT;
					}
				}
			}
			
		} else if(mode.equals("loc")) {
			//구간별
			if(vo.getLocation() != null && vo.getDataType() != null) {
				List list = vo.getLocation();
				logger.debug("size = {}", list.size());
				
				if(list.size() == 1) {
					Map map = (Map) list.get(0);
					
					if(map != null && map.get("loadedAt") != null) {
						String loadedAt = map.get("loadedAt").toString();
						
						if(loadedAt.equals("all")) {
							//상차지1이 전체인 경우
							if(vo.getDataType() != null) {
								if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
									//건수 - 상차지1이 전체인 경우
									url = ktapiAdmin + API_URL_STATS_EXCEL_LOC_TOTAL_COUNT;
								} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
									//금액 - 상차지1이 전체인 경우
									url = ktapiAdmin + API_URL_STATS_EXCEL_LOC_TOTAL_AMOUNT;
								}
							}
						}
					}
				}
				
				if(url.equals("")) {
					if(vo.getDataType() != null) {
						if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
							//건수 - 상차지1이 전체가 아닌 경우
							url = ktapiAdmin + API_URL_STATS_EXCEL_LOC_EACH_COUNT;
						} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
							//금액 - 상차지1이 전체가 아닌 경우
							url = ktapiAdmin + API_URL_STATS_EXCEL_LOC_EACH_AMOUNT;
						}
					}
				}
			}
			
		} else if(mode.equals("car")) {
			//차량별
			if(vo.getCarList() != null && vo.getDataType() != null) {
				List list = vo.getCarList();
				logger.debug("size = {}", list.size());
				
				if(list.size() == 1) {
					Map map = (Map) list.get(0);
					
					if(map != null && map.get("carType") != null) {
						String carType = map.get("carType").toString();
						
						if(carType.equals("all")) {
							//차종1이 전체인 경우
							if(vo.getDataType() != null) {
								if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
									//건수 - 차종1이 전체인 경우
									url = ktapiAdmin + API_URL_STATS_EXCEL_CAR_COUNT_TOTAL;
								} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
									//금액 - 차종1이 전체인 경우
									url = ktapiAdmin + API_URL_STATS_EXCEL_CAR_AMOUNT_TOTAL;
								}
							}
						}
					}
				}
				
				if(url.equals("")) {
					if(vo.getDataType() != null) {
						if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_COUNT)) {
							//건수 - 차종1이 전체가 아닌 경우
							url = ktapiAdmin + API_URL_STATS_EXCEL_CAR_COUNT;
						} else if(vo.getDataType().equals(StatisticsVO.DATA_TYPE_AMOUNT)) {
							//금액 - 차종1이 전체가 아닌 경우
							url = ktapiAdmin + API_URL_STATS_EXCEL_CAR_AMOUNT;
						}
					}
				}
			}
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals("00000")) {
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
	}
	
	/**
	 * 통계 결과값 가공
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Map getListSummary(Map map) throws Exception {
		
		if(map != null && map.get("data") != null) {
			List<Map> list = (List) map.get("data");
			map.put("dataJson", getJsonString(list));
			
			for(Map item : list) {
				
				if(item != null && item.get("unloadedAt") != null && !item.get("unloadedAt").equals(StatisticsVO.DATA_TOTAL_STRING)) {
					String unloadedAtString = item.get("unloadedAt").toString();
					
					if(unloadedAtString.length() == 8) {
						unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4, 6) + "-" + unloadedAtString.substring(6);
					} else if(unloadedAtString.length() == 6) {
						unloadedAtString = unloadedAtString.substring(0, 4) + "-" + unloadedAtString.substring(4);
					}
					
					item.put("unloadedAtString", unloadedAtString);
				}
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
	
	/**
	 * 지역코드에 따른 지역명 반환
	 * 
	 * @param code
	 * @return
	 */
	public String getLocationNameByCode(String code) {
		
		String locName = "";
		
		switch(code) {
			case "00":
				locName = "서울";
				break;
			case "01":
				locName = "대구";
				break;
			case "02":
				locName = "경기";
				break;
			case "03":
				locName = "울산";
				break;
			case "04":
				locName = "인천";
				break;
			case "05":
				locName = "부산";
				break;
			case "06":
				locName = "강원";
				break;
			case "07":
				locName = "경남";
				break;
			case "08":
				locName = "충북";
				break;
			case "09":
				locName = "전북";
				break;
			case "10":
				locName = "세종";
				break;
			case "11":
				locName = "전남";
				break;
			case "12":
				locName = "충남";
				break;
			case "13":
				locName = "광주";
				break;
			case "14":
				locName = "대전";
				break;
			case "15":
				locName = "제주";
				break;
			case "16":
				locName = "경북";
				break;
			default:
				break;
		}
		
		return locName;
	}

	/**
	 * 차종/톤수코드에 따른 코드명 반환
	 * 
	 * @param session
	 * @param carType
	 * @param carModel
	 * @return
	 * @throws Exception
	 */
	public String getCarTypeAndModelNameByCode(SessionVO session, String carType, String carModel) throws Exception {
		
		String typeAndModel = "";
		
		List<Map> carTypeList = commonService.listCode(session, "carType");
		List<Map> carModelList = commonService.listCode(session, "carModel");
		
		for(int i=0; i<carTypeList.size(); i++) {
			Map typeMap = carTypeList.get(i);
			if(typeMap.get("codeId").toString().equals(carType)) {
				String typeName = typeMap.get("codeName").toString();
				
				if(carType.equals("damas") || carType.equals("labo")) {
					typeAndModel = typeName + "(없음)";
				} else if(carModel.equals("all")){
					typeAndModel = typeName + "(전체)";
				} else {
					for(int j=0; j<carModelList.size(); j++) {
						Map modelMap = carModelList.get(j);
						
						if(modelMap.get("codeId").toString().equals(carModel)) {
							String modelName = modelMap.get("codeName").toString();
							typeAndModel = typeName + "(" + modelName + ")";
						}
					}
				}
			}
		}
		
		return typeAndModel;
	}
	
	/**
	 * 톤수코드명에 따른 톤수코드 반환
	 * 
	 * @param session
	 * @param name
	 * @return
	 * @throws Exception
	 */
	private String getCarModelCodeByName(SessionVO session, String name) throws Exception {

		String carModelCode = "";
		
		List<Map> carModelList = commonService.listCode(session, "carModel");
		
		for(int i=0; i<carModelList.size(); i++) {
			Map modelMap = carModelList.get(i);
			if(modelMap.get("codeName").toString().equals(name)) {
				carModelCode = modelMap.get("codeId").toString();
			}
		}
		return carModelCode;
	}
	
}
