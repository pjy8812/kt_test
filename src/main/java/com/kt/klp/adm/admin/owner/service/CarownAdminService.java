package com.kt.klp.adm.admin.owner.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.owner.domain.CarOwnerVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* CarownAdminService : 회원관리> 차주관리 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.21       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.21
* @version 1.0.0
* @see
*
*/

@Service("carownAdminService")
public class CarownAdminService extends AbstractServiceImpl {
	 
	public static final String API_URL_CAROWN_LIST = "/v1/admin/carown/list/%d";						//차주 목록화면 {nowPage}
	public static final String API_URL_CAROWN_CAR_LIST = "/v1/admin/carown/car/info";					//차주 차량정보
	public static final String API_URL_CAROWN_SELECT = "/v1/admin/carown/info/%s";						//차주 상세정보 {carOwnerId}
	public static final String API_URL_CAROWN_UPDATE =  "/v1/admin/carown/change_info";					//차주 정보 변경
	public static final String API_URL_CAROWN_DELETE =  "/v1/admin/carown/delete_info";					//차주 정보 삭제
	public static final String API_URL_CAROWN_RECOVERT =  "/v1/admin/carown/recovery_info";				//차주 정보 복구
	public static final String API_URL_CAROWN_PENALTY_LIST = "/v1/admin/carown/penalty/list/%d";		//패널티내역 목록 {nowPage}
	public static final String API_URL_CAROWN_HISTORY_LIST =  "/v1/admin/carown/history/list/%d";		//차주 변경내역 목록 {nowPage}
	public static final String API_URL_CAROWN_HISTORY_INSERT = "/v1/admin/carown/history/insert";		//차주 변경사유 등록 (2022.03.02 삭제됨) 
	public static final String API_URL_CAROWN_WITHDRAWAL = "/v1/admin/carown/approval/withdrawal";  	//차주 탈퇴승인
	public static final String API_URL_CAROWN_DOWNLOAD_SMARTRO = "/v1/admin/carown/download/smartro";	//심사대상 파일 다운로드
	public static final String API_URL_CAROWN_DOWNLOAD_CHECK = "/v1/admin/carown/download/check";		//심사대상 차주가 존재할 경우와 존재하지 않을 경우를 판별 추가 by.2022.05.30
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 차주 목록
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listCarown(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		String apiUrl = String.format(API_URL_CAROWN_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		//정렬, 목록 수
		if(vo.getSort() == null) {
			vo.setSort("carOwnerJoinDateTime");
			vo.setPagePerRows(20);
		}
		
		Map<String, Object> param = new HashMap<>();
		param.put("sort", vo.getSort());
		param.put("pagePerRows", vo.getPagePerRows());
		param.put("joinStartDate", vo.getJoinStartDate());
		param.put("joinEndDate", vo.getJoinEndDate());
		param.put("lastUseStartDate", vo.getLastUseStartDate());
		param.put("lastUseEndDate", vo.getLastUseEndDate());
		param.put("carOwnerDeleteFlag", vo.getCarOwnerDeleteFlag());
		if(vo.getCarOwnerType() != null) param.put("carOwnerType", vo.getCarOwnerType());
		if(vo.getCarOwnerMemberStatus() != null) param.put("carOwnerMemberStatus", vo.getCarOwnerMemberStatus());
		if(vo.getCarOwnerJoinApprovalStatus() != null) param.put("carOwnerJoinApprovalStatus", vo.getCarOwnerJoinApprovalStatus());
		if(vo.getPenalty() != null) param.put("penalty", vo.getPenalty());
		if(vo.getCarOwnerFileAdminCheckYn() != null) param.put("carOwnerFileAdminCheckYn", vo.getCarOwnerFileAdminCheckYn());
		if(vo.getSearchType() != null) {
			param.put("searchType", vo.getSearchType());
			param.put("searchText", vo.getSearchText());
		}
			
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
	
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount");
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getNowPage());
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}
	
	/**
	 * 차주 차량정보 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectCar(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		String url = API_URL_CAROWN_CAR_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		
		if(!result.isEmpty()) {
			if(result.get("carList") != null) {
				List list = (List) result.get("carList");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("carList", list);
			}
		}
		
		return result;
	}	
	
	/**
	 * 차주 상세
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public  Map<String, Object> selectCarown(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		String url = String.format(API_URL_CAROWN_SELECT, vo.getCarOwnerId());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		//마스킹여부값이 빈값일 경우 무조건 마스킹하여 조회
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}else {
			param.put("maskingYn", "Y");
		}
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		UtilFunctions.millisecondListToDate(result); //날짜변환
		
		//첨부파일 등록일시 추가로 인하여 날짜변환 추가 by.2022.04.26 mijin.kim
		if(result.get("fileList") != null) { 
			List list = (List) result.get("fileList");
			UtilFunctions.millisecondListToDate(list); 
			result.put("fileList", list);
		}
		
		return result;
	}	
	
	
	/**
	 * 차주 패널티 내역 목록 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listPenalty(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		//조회 목록 수
		vo.setPagePerRows(5);
		
		String url = String.format(API_URL_CAROWN_PENALTY_LIST, vo.getPageIndex());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		param.put("pagePerRows", vo.getPagePerRows());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			//페이징
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount"); 
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getPageIndex());
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
		
	}
	
	/**
	 * 차주 변경내역 목록 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map listCarownHistory(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		//조회 목록 수
		vo.setPagePerRows(5);
		
		String url = String.format(API_URL_CAROWN_HISTORY_LIST, vo.getPageIndex());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		param.put("pagePerRows", vo.getPagePerRows());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			//페이징
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount"); 
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getPageIndex());
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}
	
	/**
	 * 차주 정보수정 삭제
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> deleteCarown(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		String url = API_URL_CAROWN_DELETE;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 차주 정보수정 복구
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> recoveryCarown(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		String url = API_URL_CAROWN_RECOVERT;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}	
	
	/**
	 * 차주 정보수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateCarown(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		String url = API_URL_CAROWN_UPDATE;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		param.put("carOwnerMemberStatus", vo.getCarOwnerMemberStatus());
		param.put("carOwnerFileAdminCheckYn", vo.getCarOwnerFileAdminCheckYn());
		param.put("carOwnerHistoryChangeReason", vo.getCarOwnerHistoryChangeReason());
		param.put("carOwnerPaymentMethod", vo.getCarOwnerPaymentMethod());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 차주 탈퇴(승인)
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param CarOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> withdrawCarown(HttpServletRequest request, SessionVO sessionVO, CarOwnerVO vo) throws Exception {
		String url = API_URL_CAROWN_WITHDRAWAL;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		param.put("carOwnerHistoryChangeReason", vo.getCarOwnerHistoryChangeReason());
		//logger.debug("{}", param);
		
		//변경사유를 먼저 등록 후 화주 탈퇴승인 
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 지압차주 업로드 샘플파일 다운로드
	 * @param HttpServletRequest
	 * @param HttpServletResponse
	 * @throws Exception
	 */
	public void downloadSample(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Calendar cal = Calendar.getInstance();
		
		String fileName = "지입차주_SAMPLE";
		StringBuffer strbuff = new StringBuffer(fileName);
		
		strbuff.append("_");
		strbuff.append(cal.getTimeInMillis());
		fileName = strbuff.toString();
		
		String headers[] = {"차주명"};

		
		SXSSFWorkbook workbook = null;
		workbook = new SXSSFWorkbook();
		
		SXSSFSheet worksheet = workbook.createSheet(fileName);
		
		SXSSFRow row = worksheet.createRow(0);
		for (int i=0; i<headers.length; i++) {
			//row.createCell(i).setCellValue(headers[i]);
			UtilFunctions.setExcelHeader(workbook, worksheet, row, i, headers[i]);
		}
		
		UtilFunctions.downloadExcelXSSF(request, response, workbook, fileName);
	}
	
	/**
	 * 차주 심사파일 다운로드
	 * @param HttpServletRequest
	 * @param HttpServletResponse
	 * @param SessionVO
	 * @return
	 * @throws Exception
	 */
	public Map downloadSmartro(HttpServletRequest request, HttpServletResponse response, SessionVO sessionVO) throws Exception {
		String url = API_URL_CAROWN_DOWNLOAD_SMARTRO;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "GET", null);
		return result;
	}
	
	/**
	 * 차주 심사파일 다운로드 가능여부 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> checkSmartroFile(HttpServletRequest request, SessionVO sessionVO) throws Exception {
		String apiUrl = API_URL_CAROWN_DOWNLOAD_CHECK;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		//Map<String, Object> param = new HashMap<>();
			
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "GET", null);
		
		return result;
	}
}