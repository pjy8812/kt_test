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
import com.kt.klp.adm.admin.stats.domain.CarStatisticsVO;
import com.kt.klp.adm.admin.stats.domain.StatisticsVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* StatsCarAdminService : 
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
public class StatsCarAdminService extends AbstractServiceImpl {
	
	public static final String STATISTICS_CAR_API_URL = "/v1/admin/statistics/status/car"; // 차량 통계 
	public static final String STATISTICS_CAR_EXCEL_DOWN_API_URL = "/v1/admin/statistics/status/car/excel"; // 차량 통계 - 엑셀다운로드
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	@Autowired
	protected CommonService commonService;
	
	@Value("${api.ktapi}")
	private String ktapi;
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 차량 통계 - 목록 
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public Map getList(HttpServletRequest request, HttpServletResponse response, SessionVO session, StatisticsVO vo) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		// header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 조회조건
		if(vo.getBasisDate() != null) {
			param.put("basisDate", vo.getBasisDate());
		}
		
		// 시작일자 
		if(vo.getStartDate() != null) {
			param.put("startDate", vo.getStartDate());
		}

		// 종료일자 
		if(vo.getEndDate() != null) {
			param.put("endDate", vo.getEndDate());
		}
		
		String url = String.format(ktapiAdmin + STATISTICS_CAR_API_URL, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			return getListSummary(session, result);
			// return result;
		} else {
			return result;
		}
		
		// return result;
	}
	
	/**
	 * 차량 통계 - 목록 - 엑셀다운로드
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public void getExcel(HttpServletRequest request, HttpServletResponse response, SessionVO session, StatisticsVO vo) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		// header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// 조회조건
		if(vo.getBasisDate() != null) {
			param.put("basisDate", vo.getBasisDate());
		}
		
		// 시작일자 
		if(vo.getStartDate() != null) {
			param.put("startDate", vo.getStartDate());
		}

		// 종료일자 
		if(vo.getEndDate() != null) {
			param.put("endDate", vo.getEndDate());
		}
		
		String url = String.format(ktapiAdmin + STATISTICS_CAR_EXCEL_DOWN_API_URL, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			if(result.get("fileData") != null && result.get("fileData") != null && !result.get("fileData").equals("")) {
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
	public Map getListSummary(SessionVO session, Map map) throws Exception {
		
		if(map != null && map.get("data") != null) {
			
			List<Map> list = (List) map.get("data");
			map.put("dataJson", getJsonString(list));

			List<Map> carTypeList = commonService.listCode(session, "carOption"); 
			
			for(Map item : list) {
				
				// 합계 데이터에서 헤더 추출 
				List headerCodeList = new ArrayList();
				
	            // "unloadedAt": null,
	           //  "carType": "카고",
	           // "carModel": "8t",
				
				if(item.get(StatisticsVO.DATA_TOTAL_FLAG_STRING) != null 
						&& item.get(StatisticsVO.DATA_TOTAL_FLAG_STRING).equals(StatisticsVO.DATA_TOTAL_FLAG_TRUE_STRING)) {
					
					Iterator<String> keys = item.keySet().iterator(); 
			        while(keys.hasNext()){
			            String key = keys.next();
			            
			            if(!key.equals(StatisticsVO.DATA_TOTAL_FLAG_STRING)
			            		&& !key.equals(CarStatisticsVO.CAR_DATA_CAR_TYPE)
			            		&& !key.equals(CarStatisticsVO.CAR_DATA_CAR_MODEL)
			            		&& !key.equals(CarStatisticsVO.CAR_DATA_TOT_CNT)
			            		&& !key.equals(CarStatisticsVO.CAR_DATA_UNLOADED_AT)) {
			            	headerCodeList.add(key);
			            }
			        }
				}
				map.put("headerCodeList", headerCodeList);
				
				Map headerCodeMap = new HashMap();
				// Map carTypeCodeMap = new HashMap();
				
				for(Map codeItem : carTypeList) {
					
					String codeId = codeItem.get("codeId").toString();
					String codeName = codeItem.get("codeName").toString();
					
					if(codeId != null && codeName != null) {
						headerCodeMap.put(codeId, codeName);
					}
				}
				
				map.put("headerCodeMap", headerCodeMap);
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
