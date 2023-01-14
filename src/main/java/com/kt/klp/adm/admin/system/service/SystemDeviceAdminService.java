package com.kt.klp.adm.admin.system.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.system.domain.DeviceVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* SystemDeviceAdminService : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.07       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.07
* @version 1.0.0
* @see
*
*/
@Service
public class SystemDeviceAdminService extends AbstractServiceImpl {

	public static final String SYSTEM_DEVICE_API_URL = "/v1/admin/system/terminal/list/%d"; // 차주 단말기 정보조회 및 검색 - {nowPage}
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 
	
	public static final String EXCEL_FILE_NAME_SYSTEM_DEVICE_LIST = "디바이스_목록";

	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	/**
	 * 시스템 - 디바이스 - 목록 
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map getList(HttpServletRequest request, SessionVO session, DeviceVO vo) throws Exception {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// 마스킹 
		param.put("maskingYn", "Y");
		
		// 차주 아이디
		if(vo.getCarOwnerId() != null) {
			param.put("carOwnerId", vo.getCarOwnerId());
		}
		
		// 차주 명
		if(vo.getCarOwnerName() != null) {
			param.put("carOwnerName", vo.getCarOwnerName());
		}
		
		// 차주 단말기 명
		if(vo.getCarOwnerTerminalDevice() != null) {
			param.put("carOwnerTerminalDevice", vo.getCarOwnerTerminalDevice());
		}
		
		// OS
		if(vo.getCarOwnerTerminalOs() != null) {
			if(!vo.getCarOwnerTerminalOs().equals(vo.OS_ALL_TYPE)) {
				param.put("carOwnerTerminalOs", vo.getCarOwnerTerminalOs());
			}
		}
		
		// 첫 로그인 검색 시작 일자
		if(vo.getJoinStartDate() != null) {
			param.put("joinStartDate", vo.getJoinStartDate());
		}
//		if(vo.getFirstLoginStartDate() != null) {
//			param.put("firstLoginStartDate", vo.getFirstLoginStartDate());
//		}
		
		// 첫 로그인 검색 종료 일자
		if(vo.getJoinEndDate() != null) {
			param.put("joinEndDate", vo.getJoinEndDate());
		}
//		if(vo.getFirstLoginEndDate() != null) {
//			param.put("firstLoginEndDate", vo.getFirstLoginEndDate());
//		}
		
		// 최근 접속일 검색 시작 일자
		if(vo.getLastUseStartDate() != null) {
			param.put("lastUseStartDate", vo.getLastUseStartDate());
		}
		
		// 최근 접속일 검색 종료 일자
		if(vo.getLastUseEndDate() != null) {
			param.put("lastUseEndDate", vo.getLastUseEndDate());
		}
		
		String url = String.format(ktapiAdmin + SYSTEM_DEVICE_API_URL, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		logger.debug("param={}", param);
		logger.debug("header={}", header);
		logger.debug("result={}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			Map<String, Object> paginationVO = new HashMap<>();
			paginationVO.put("sizeOfData", result.get("listCount") == null ? 0 : (int) result.get("listCount"));
			paginationVO.put("pageIndex", vo.getPageIndex());
			paginationVO.put("pageSize", vo.DEFAULT_MID_PAGE_SIZE);
			String pagination =  new Pagination().setPagination(paginationVO);
			
			result.put("pagination", pagination);
			result.put("maxIndex", UtilFunctions.genListMaxIndex(vo.getPageIndex(), result.get("endPage"), result.get("listCount"), vo.DEFAULT_MID_PAGE_SIZE));

			if(result.get("list") != null) {
				
				List<Map> list = (List) result.get("list");
				
				for(Map item : list) {
					
					// 첫 로그인 일자
					UtilFunctions.makeDateToStringSecond(item, "carOwnerfirstUseDate");
					
					// 마지막 로그인 일자
					UtilFunctions.makeDateToStringSecond(item, "carOwnerLastUseDate");
				}
			}
			
			return result;
		
		} else {
			return result;
		}
	}
	
	/**
	 * 목록 엑셀다운로드 
	 * 
	 * @param vo
	 * @return
	 * @throws ServiceException
	 */
	public void makeExcelList(HttpServletRequest request, HttpServletResponse response, List<String> headerList, List<Map> list) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		String fileName = EXCEL_FILE_NAME_SYSTEM_DEVICE_LIST + "_" + cal.getTimeInMillis();
		
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook();
		// SXSSFWorkbook workbook = new SXSSFWorkbook(xssfWorkbook, list.size());
		// TO DELETE
		SXSSFWorkbook workbook = new SXSSFWorkbook(xssfWorkbook, 1);
		SXSSFSheet sheet = workbook.createSheet();
		sheet.trackAllColumnsForAutoSizing();
		SXSSFRow row = sheet.createRow(0);

		for (int i = 0; i < headerList.size(); i++) {
			SXSSFCell cell = row.createCell(i);
			cell.setCellValue(headerList.get(i));
			// UtilFunctions.setExcelHeader(workbook, sheet, row, i, headerList.get(i));
		}

		UtilFunctions.downloadExcelXSSF(request, response, workbook, fileName);
	}
	
	
}
