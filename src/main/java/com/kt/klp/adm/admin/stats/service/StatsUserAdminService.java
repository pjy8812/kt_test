package com.kt.klp.adm.admin.stats.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.stats.domain.StatisticsVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* StatsUserAdminService : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.05.01       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.05.01
* @version 1.0.0
* @see
*
*/
@Service
public class StatsUserAdminService extends AbstractServiceImpl {
	
	public static final String STATISTICS_MEMBER_API_URL = "/v1/admin/statistics/member"; // 이용자 통계 
	public static final String STATISTICS_MEMBER_EXCEL_DOWN_API_URL = "/v1/admin/statistics/member/excel"; // 이용자 통계 - 엑셀다운로드
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	@Value("${api.ktapi}")
	private String ktapi;
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 이용자 통계 - 목록 
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
		
		String url = String.format(ktapiAdmin + STATISTICS_MEMBER_API_URL, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			return getListSummary(result);
			// return result;
		} else {
			return result;
		}
		
		// return result;
	}
	
	/**
	 * 이용자 통계 - 목록 - 엑셀다운로드
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
		
		String url = String.format(ktapiAdmin + STATISTICS_MEMBER_EXCEL_DOWN_API_URL, vo.getPageIndex());
		
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
	 * 이용자 통계 값 가공 
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Map getListSummary(Map map) throws Exception {
		
		if(map != null && map.get("data") != null) {
			
			List<Map> list = (List) map.get("data");
			map.put("dataJson", getJsonString(list));

			int totCntSummary = 0;
			int freightCntSummary = 0;
			int carCntSummary = 0;
			
			for(Map item : list) {
				
				if(item != null && item.get("loginDate") != null && !item.get("loginDate").equals(StatisticsVO.DATA_TOTAL_STRING)) {
					String loginDateString = item.get("loginDate").toString();
					
					if(loginDateString.length() == 8) {
						loginDateString = loginDateString.substring(0, 4) + "-" + loginDateString.substring(4, 6) + "-" + loginDateString.substring(6);
					} else if(loginDateString.length() == 6) {
						loginDateString = loginDateString.substring(0, 4) + "-" + loginDateString.substring(4);
					}

					item.put("loginDateString", loginDateString);
				}
				
//				if(item != null && item.get("totCnt") != null) {
//					totCntSummary += (int) item.get("totCnt");
//				}
//				
//				if(item != null && item.get("freightCnt") != null) {
//					freightCntSummary += (int) item.get("freightCnt");
//				}
//				
//				if(item != null && item.get("carCnt") != null) {
//					carCntSummary += (int) item.get("carCnt");
//				}
				
			}
			
			map.put("totCntSummary", totCntSummary);
			map.put("freightCntSummary", freightCntSummary);
			map.put("carCntSummary", carCntSummary);
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
