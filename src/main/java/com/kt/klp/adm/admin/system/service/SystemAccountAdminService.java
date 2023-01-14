package com.kt.klp.adm.admin.system.service;

import java.io.InputStream;
import java.security.PrivateKey;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.system.domain.AccountVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.RSAApiUtil;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.HttpUrlMultipartForward;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* SystemAccountAdminService : 계정/권한관리 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.27       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.01.27
* @version 1.0.0
* @see
*
*/

@Service("systemAccountAdminService")
public class SystemAccountAdminService extends AbstractServiceImpl {
	
	public static final String API_URL_ACCOUNT_LIST = "/v1/admin/system/account/list/%d"; //계정/권한정보 조회 및 검색 ${nowPage}
	public static final String API_URL_ACCOUNT_INSERT_EXCEL = "/v1/admin/system/account/insert/excel"; //엑셀로 관리자 추가
	public static final String API_URL_ACCOUNT_INFO = "/v1/admin/system/account/info/%s"; //관리자 계정 상세정보 조회 ${adminId}
	public static final String API_URL_ACCOUNT_CHECK_ID = "/v1/admin/system/account/check/id"; //관리자 아이디 중복조회
	public static final String API_URL_ACCOUNT_CHECK_EMPLOYEE_NUM = "/v1/admin/system/account/check/employee_num"; //관리자 사번 중복조회
	public static final String API_URL_ACCOUNT_CHECK_EMAIL = "/v1/admin/system/account/check/email"; //관리자 이메일 중복조회
	public static final String API_URL_ACCOUNT_CHECK_PHONE = "/v1/admin/system/account/check/telephone"; //관리자 전화번호 중복조회
	public static final String API_URL_ACCOUNT_RESET_PASSWORD = "/v1/admin/system/account/reset_pw/%s"; //비밀번호 초기화 ${adminId}
	public static final String API_URL_ACCOUNT_INSERT = "/v1/admin/system/account/insert"; //관리자 계정 추가
	public static final String API_URL_ACCOUNT_UPDATE = "/v1/admin/system/account/update/%s"; //관리자 계정 수정 ${adminId}
	public static final String API_URL_ACCOUNT_DELETE = "/v1/admin/system/account/delete/%s"; //관리자 계정 삭제 ${adminId}
	
	public static final String API_URL_AUTH_GROUP_LIST = "/v1/admin/system/auth_group/list/%d"; //권한그룹 목록 조회
	public static final String API_URL_AUTH_GROUP_INFO = "/v1/admin/system/auth_group/info/%s"; //권한그룹 상세 조회 {groupSeq}
	public static final String API_URL_AUTH_GROUP_CHECK_NAME = "/v1/admin/system/auth_group/check_group"; //권한그룹명 중복조회
	public static final String API_URL_AUTH_GROUP_CHECK_CODE = "/v1/admin/system/auth_group/check_code"; //권한그룹코드 중복조회
	public static final String API_URL_AUTH_GROUP_INSERT = "/v1/admin/system/auth_group/insert"; //권한그룹 생성
	public static final String API_URL_AUTH_GROUP_UPDATE = "/v1/admin/system/auth_group/update/%s"; //권한그룹 수정 ${groupSeq}
	public static final String API_URL_AUTH_GROUP_DELETE = "/v1/admin/system/auth_group/delete/%s"; //권한그룹 삭제 ${groupSeq}
	
	// excel error list
	public static final String EXCEL_ERROR_ADMIN_NAME_NULL = "이용자명 누락";
	public static final String EXCEL_ERROR_ADMIN_ID_NULL = "이용자ID 누락";
	public static final String EXCEL_ERROR_ADMIN_ID_FORMAT = "이용자ID 형식 오류";
	public static final String EXCEL_ERROR_ADMIN_ID_DUPLICATE = "이용자ID 중복";
	public static final String EXCEL_ERROR_EMP_NUM_FORMAT = "사번 형식 오류";
	public static final String EXCEL_ERROR_EMP_NUM_DUPLICATE = "사번 중복";
	public static final String EXCEL_ERROR_AUTH_GROUP_CODE_NULL = "권한그룹코드 누락";
	public static final String EXCEL_ERROR_AUTH_GROUP_CODE_FORMAT = "권한그룹코드 형식 오류";
	public static final String EXCEL_ERROR_EMAIL_NULL = "이메일 누락";
	public static final String EXCEL_ERROR_EMAIL_FORMAT = "이메일 형식 오류";
	public static final String EXCEL_ERROR_EMAIL_DUPLICATE = "이메일 중복";
	public static final String EXCEL_ERROR_PHONE_NULL = "전화번호 누락";
	public static final String EXCEL_ERROR_PHONE_FORMAT = "전화번호 형식 오류";
	public static final String EXCEL_ERROR_PHONE_DUPLICATE  = "전화번호 중복";
	public static final String EXCEL_ERROR_HEARDER_ERROR = "엑셀상단 형식 오류";
	
	public static final int EXCEL_HEADER_ROW = 0;
	public static final int EXCEL_DATA_START_ROW = 1;
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	
	/**
	 * 계정/권한 목록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listAccount(HttpServletRequest request, SessionVO session, AccountVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		if(vo.getAdminAuthorityGroupSeq() != 0) {
			body.put("adminAuthorityGroupSeq", vo.getAdminAuthorityGroupSeq());
		}
		body.put("adminRegisterStartDateTime", vo.getAdminRegisterStartDateTime());
		body.put("adminRegisterEndDateTime", vo.getAdminRegisterEndDateTime());
		
		if(vo.getSearchText() != null && !vo.getSearchText().equals("")) {
			body.put("searchType", vo.getSearchType());
			body.put("searchText", vo.getSearchText());
		}
		
		if(vo.getMaskingYn() != null) {
			body.put("maskingYn", vo.getMaskingYn());
		}else {
			body.put("maskingYn", "Y");
		}
		
		String url = String.format(ktapiAdmin+API_URL_ACCOUNT_LIST, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		PrivateKey apiKey = RSAApiUtil.initPrivate();
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				
				//adminOriginalId 복호화
				for(int i=0; i<list.size();i++) {
					Map item = (Map) list.get(i);
					if(item.get("adminOriginalId") != null) {
						String adminOriginalId = item.get("adminOriginalId").toString();
						adminOriginalId = RSAApiUtil.decryptRSA(adminOriginalId, apiKey);
						item.put("adminOriginalId", adminOriginalId);
					}
				}
				
				// millisecond to date
				UtilFunctions.millisecondListToDate(list);
				
				if(result.get("listCount") != null) {
					// 페이징
					Map<String, Object> paginationVO = new HashMap<>();
					paginationVO.put("sizeOfData", (int)result.get("listCount"));
					paginationVO.put("pageIndex", vo.getPageIndex());
					paginationVO.put("pageSize", vo.DEFAULT_MID_PAGE_SIZE);
					result.put("paginationVO", paginationVO);
					
					String pagination =  new Pagination().setPagination(paginationVO);
					result.put("pagination", pagination);
				}
			}
		}
		
		return result;
	}
	
	/**
	 * 관리자 상세
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map selectAccount(HttpServletRequest request, SessionVO session, AccountVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin+API_URL_ACCOUNT_INFO, vo.getAdminId());
		
		Map<String, Object> param = new HashMap<>();
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}else {
			param.put("maskingYn", "Y");
		}
		logger.debug("param={}", param);
		
		PrivateKey apiKey = RSAApiUtil.initPrivate();
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		logger.debug("result={}", result);
		
		
		if(result.get("info") != null) {
			Map info = (Map) result.get("info");
			//복호화
			if(info.get("adminName") != null) {
				String adminName = info.get("adminName").toString();
				adminName = RSAApiUtil.decryptRSA(adminName, apiKey);
				logger.debug("{}", adminName);
				info.put("adminName", adminName);
			}
			
			if(info.get("adminId") != null) {
				String adminId = info.get("adminId").toString();
				adminId = RSAApiUtil.decryptRSA(adminId, apiKey);
				logger.debug("{}", adminId);
				info.put("adminId", adminId);
			}
			
			if(info.get("adminEmployeeNum") != null) {
				String adminEmployeeNum = info.get("adminEmployeeNum").toString();
				adminEmployeeNum = RSAApiUtil.decryptRSA(adminEmployeeNum, apiKey);
				logger.debug("{}", adminEmployeeNum);
				info.put("adminEmployeeNum", adminEmployeeNum);
			}
			
			if(info.get("adminTelephone") != null) {
				String adminTelephone = info.get("adminTelephone").toString();
				adminTelephone = RSAApiUtil.decryptRSA(adminTelephone, apiKey);
				logger.debug("{}", adminTelephone);
				info.put("adminTelephone", adminTelephone);
			}
			
			if(info.get("adminEmail") != null) {
				String adminEmail = info.get("adminEmail").toString();
				adminEmail = RSAApiUtil.decryptRSA(adminEmail, apiKey);
				logger.debug("{}", adminEmail);
				info.put("adminEmail", adminEmail);
			}
		}
		
		logger.debug("info={}", result);
		
		// 권한그룹 목록 조회
		result.put("authGroupList", listAuthGroup(request, session, vo));
		
		return result;
	}
	
	/**
	 * 관리자 아이디/사번/이메일/전화번호 중복조회
	 * 
	 * @param request
	 * @param session
	 * @param mode
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public Map checkAccount(HttpServletRequest request, SessionVO session, String mode, String value) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put(mode, value);
		
		String url = "";
		
		switch (mode) {
			case "adminId":
				url = ktapiAdmin + API_URL_ACCOUNT_CHECK_ID;
				break;
			case "adminEmployeeNum":
				url = ktapiAdmin + API_URL_ACCOUNT_CHECK_EMPLOYEE_NUM;
				break;
			case "adminEmail":
				url = ktapiAdmin + API_URL_ACCOUNT_CHECK_EMAIL;
				break;
			case "adminTelephone":
				url = ktapiAdmin + API_URL_ACCOUNT_CHECK_PHONE;
				break;
			default:
				break;
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		//logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 비밀번호 재설정
	 * 
	 * @param request
	 * @param session
	 * @param adminId
	 * @return
	 * @throws Exception
	 */
	public Map resetPassword(HttpServletRequest request, SessionVO session, String adminId) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin+API_URL_ACCOUNT_RESET_PASSWORD, adminId);
		
		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		//logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 관리자정보 저장(등록/수정)
	 * 
	 * @param request
	 * @param session
	 * @param mode
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map saveAccount(HttpServletRequest request, SessionVO session, String mode, AccountVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		
		String url = "";
		//logger.debug("mode={}", mode);
		
		if(mode.equals("insert")) { //등록
			url = ktapiAdmin + API_URL_ACCOUNT_INSERT;
			body.put("adminId", vo.getAdminId());
			body.put("adminEmployeeNum", vo.getAdminEmployeeNum());
			body.put("adminName", vo.getAdminName());
			body.put("adminAuthorityGroupSeq", vo.getAdminAuthorityGroupSeq());
			body.put("adminEmail", vo.getAdminEmail());
			body.put("adminTelephone", vo.getAdminTelephone());
		} else if(mode.equals("update")) { //수정
			url = String.format(ktapiAdmin+API_URL_ACCOUNT_UPDATE, vo.getAdminId());
			body.put("adminName", vo.getAdminName());
			body.put("adminAuthorityGroupSeq", vo.getAdminAuthorityGroupSeq());
			body.put("adminEmail", vo.getAdminEmail());
			body.put("adminTelephone", vo.getAdminTelephone());
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		//logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 관리자 삭제
	 * 
	 * @param request
	 * @param session
	 * @param adminId
	 * @return
	 * @throws Exception
	 */
	public Map deleteAccount(HttpServletRequest request, SessionVO session, String adminId) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin+API_URL_ACCOUNT_DELETE, adminId);
		
		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		//logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 엑셀업로드 샘플 다운로드
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void downloadSample(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Calendar cal = Calendar.getInstance();

		StringBuffer fileName = new StringBuffer();
		fileName.append("USER_SAMPLE_");
		fileName.append(cal.getTimeInMillis());
		
		String headers[] = {
			"이용자명*", "이용자ID*", "사번", "권한그룹코드*", "이메일*", "전화번호*"
		};
		
		makeExcel(request, response, fileName.toString(), headers);
	}

	/**
	 * 엑셀업로드 샘플 다운로드
	 * 
	 * @param request
	 * @param response
	 * @param title
	 * @param headers
	 * @throws Exception
	 */
	public void makeExcel(HttpServletRequest request, HttpServletResponse response, String title, String[] headers) throws Exception {
		
		XSSFWorkbook workbook = null;
		workbook = new XSSFWorkbook();
		
		XSSFSheet worksheet = workbook.createSheet(title);
		
		XSSFRow row = worksheet.createRow(0);
		for (int i=0; i<headers.length; i++) {
			row.createCell(i).setCellValue(headers[i]);
			
			worksheet.autoSizeColumn(i);
			worksheet.setColumnWidth(i, (worksheet.getColumnWidth(i))+2000);
		}
		
		//셀 메모 추가
		addComment(workbook, worksheet, 0, 1, title, "영문, 숫자만 입력");
		addComment(workbook, worksheet, 0, 2, title, "영문, 숫자만 입력");
		addComment(workbook, worksheet, 0, 3, title, "영문, 숫자만 입력");
		addComment(workbook, worksheet, 0, 5, title, "숫자만 입력");
		
		UtilFunctions.downloadExcel(request, response, workbook, title);
	}
	
	/**
	 * 엑셀파일 내 셀 메모 삽입
	 * 
	 * @param workbook
	 * @param sheet
	 * @param rowIdx
	 * @param colIdx
	 * @param author
	 * @param memo
	 * @throws Exception
	 */
    public void addComment(Workbook workbook, Sheet sheet, int rowIdx, int colIdx, String author, String memo) throws Exception {
        
    	CreationHelper factory = workbook.getCreationHelper();

        //메모위치 지정
        ClientAnchor anchor = factory.createClientAnchor();
        anchor.setCol1(colIdx + 1);
        anchor.setCol2(colIdx + 3);
        anchor.setRow1(rowIdx + 1);
        anchor.setRow2(rowIdx + 3);

        Drawing drawing = sheet.createDrawingPatriarch();
        Comment comment = drawing.createCellComment(anchor);
        comment.setString(factory.createRichTextString(memo));
        comment.setAuthor(author);

        //기존 셀을 가져오거나 새로운 셀 생성하여 메모삽입
        Cell cell = getOrCreateCell(sheet, rowIdx, colIdx);
        cell.setCellComment(comment);
    }
    
    public Cell getOrCreateCell(Sheet sheet, int rowIdx, int colIdx) throws Exception {
        Row row = sheet.getRow(rowIdx);
        if (row == null) {
            row = sheet.createRow(rowIdx);
        }

        Cell cell = row.getCell(colIdx);
        if (cell == null) {
            cell = row.createCell(colIdx);
        }

        return cell;
    }
	
	/**
	 * 엑셀업로드
	 * 
	 * @param multipartRequest
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> uploadExcel(MultipartHttpServletRequest multipartRequest, SessionVO session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		Map result = new HashMap<>();
		
		MultipartFile file = multipartRequest.getFile("excelFile");
		//logger.debug("uploadFile = {}", file);
		
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
		//logger.debug("fileName = {}", fileName);
		//logger.debug("ext = {}", ext);

		if(!ext.equals("XLS") && !ext.equals("XLSX")) {
			map.put("resultCode", "00001");
			map.put("resultMsg", "파일확장자 오류");
			result.put("result", map);
			return result;
			
		} else {
			String headers[] = {
				"이용자명*", "이용자ID*", "사번", "권한그룹코드*", "이메일*", "전화번호*"
			};
				
			InputStream is = file.getInputStream();
			XSSFWorkbook workbook = new XSSFWorkbook(is);
			XSSFSheet worksheet = workbook.getSheetAt(EXCEL_HEADER_ROW);
			XSSFRow row = null;
			
			// total row count
			int rows = worksheet.getPhysicalNumberOfRows();
			map.put("totalRowCount", rows - EXCEL_DATA_START_ROW); // real data row count
			
			// header
			row = worksheet.getRow(EXCEL_HEADER_ROW);
			Boolean headerCheckFlag = row.getPhysicalNumberOfCells() == headers.length;
			if(headerCheckFlag) {
				for (int i = 0; i < headers.length; i++) {
					if(!headers[i].equals(row.getCell(i).toString())) {
						headerCheckFlag = false;
						break;
					}
				}
			}
			
			if(!headerCheckFlag) {
				//엑셀 상단양식이 다른경우 
				map.put("headerError", EXCEL_ERROR_HEARDER_ERROR);
			} else {
				int resultSuccess = 0;
				int resultFail = 0;
				
				List<Map<String, Object>> failList = new ArrayList<>();
				
				//엑셀 내 중복체크를 위한 목록
				List<String> tempIdList = new ArrayList<>();		//아이디
				List<String> tempEmpNumList = new ArrayList<>();	//사번
				List<String> tempEmailList = new ArrayList<>();		//이메일
				List<String> tempPhoneList = new ArrayList<>();		//전화번호
				
				String columns[] = {
					"adminName", "adminId", "adminEmployeeNum", "authGroupCode", "adminEmail", "adminTelephone"
				};	
				
				// read rows
				for (int rowIndex = EXCEL_DATA_START_ROW; rowIndex < rows; rowIndex++) {
					
					boolean isOK = true;
					Map<String, Object> item = new HashMap<>();
					List<String> error = new ArrayList<String>();
					item.put("rowNum", (rowIndex+1));
					//logger.debug("rowIndex={}", rowIndex);
					
					//check excel data list
					row = worksheet.getRow(rowIndex);
					for (int i = 0; i < columns.length; i++) {
						switch (columns[i]) {
						case "adminName" : //이용자명
							if(row.getCell(i) == null) { 
								isOK = false;
								error.add(EXCEL_ERROR_ADMIN_NAME_NULL);
							} else { 
								String adminName = row.getCell(i).toString();
								if(adminName.trim().equals("")) { // blank
									isOK = false;
									error.add(EXCEL_ERROR_ADMIN_NAME_NULL);
								} else {
									adminName = adminName.trim().replaceAll("(^\\p{Z}+|\\p{Z}+$)", ""); //좌우공백제거
								}
							}
							break;
						case "adminId" : //이용자ID
							if(row.getCell(i) == null) {
								isOK = false;
								error.add(EXCEL_ERROR_ADMIN_ID_NULL);
							} else {
								//숫자만 입력된 경우 셀 형식 변경
								if(row.getCell(i).getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
									row.getCell(i).setCellType(XSSFCell.CELL_TYPE_STRING);
								}
								
								String adminId = row.getCell(i).toString().toLowerCase();
								if(adminId.trim().equals("")) {  //blank
									isOK = false;
									error.add(EXCEL_ERROR_ADMIN_ID_NULL);
								} else {
									if(!UtilFunctions.checkFormatValue(adminId)) { //형식체크
										isOK = false;
										error.add(EXCEL_ERROR_ADMIN_ID_FORMAT);
									} else {
										if(tempIdList.contains(adminId)) { //엑셀내부 이용자ID 중복체크
											isOK = false;
											error.add(EXCEL_ERROR_ADMIN_ID_DUPLICATE);
										} else {
											tempIdList.add(adminId);
										}
									}
								} 
							}
							break;
						case "adminEmployeeNum" : //사번
							if(row.getCell(i) != null) { // null
								//숫자만 입력된 경우 셀 형식 변경
								if(row.getCell(i).getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
									row.getCell(i).setCellType(XSSFCell.CELL_TYPE_STRING);
								}
								
								String adminEmpNum = row.getCell(i).toString();
								if(!adminEmpNum.trim().equals("")) { //blank
									if(!UtilFunctions.checkFormatValue(adminEmpNum)) { //형식체크
										isOK = false;
										error.add(EXCEL_ERROR_EMP_NUM_FORMAT);
									} else {
										if(tempEmpNumList.contains(adminEmpNum)) { //엑셀내부 사번 중복체크
											isOK = false;
											error.add(EXCEL_ERROR_EMP_NUM_DUPLICATE);
										} else {
											adminEmpNum = adminEmpNum.trim().replaceAll("(^\\p{Z}+|\\p{Z}+$)", ""); //좌우공백제거
											tempEmpNumList.add(adminEmpNum);
										}
									}
								}
							} 
							break;
						case "authGroupCode" : //권한그룹코드
							if(row.getCell(i) == null) { 
								isOK = false;
								error.add(EXCEL_ERROR_AUTH_GROUP_CODE_NULL);
							} else {
								//숫자만 입력된 경우 셀 형식 변경
								if(row.getCell(i).getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
									row.getCell(i).setCellType(XSSFCell.CELL_TYPE_STRING);
								}
								
								String authGroupCode = row.getCell(i).toString();
								if(authGroupCode.trim().equals("")) { // blank
									isOK = false;
									error.add(EXCEL_ERROR_AUTH_GROUP_CODE_NULL);
								} else {
									if(!UtilFunctions.checkFormatValue(authGroupCode)) { //형식체크
										isOK = false;
										error.add(EXCEL_ERROR_AUTH_GROUP_CODE_FORMAT);
									} else {
										authGroupCode = authGroupCode.trim().replaceAll("(^\\p{Z}+|\\p{Z}+$)", ""); //좌우공백제거
									}
								}
							}
							break;
						case "adminEmail" :
							if(row.getCell(i) == null) { // null
								isOK = false; 
								error.add(EXCEL_ERROR_EMAIL_NULL);
							} else { 
								String email = row.getCell(i).toString();
								if(email.trim().equals("")) { //blank
									isOK = false; 
									error.add(EXCEL_ERROR_EMAIL_NULL);
								} else {
									if(!UtilFunctions.checkFormatEmail(email)) { //형식체크
										isOK = false;
										error.add(EXCEL_ERROR_EMAIL_FORMAT);
									} else {
										if(tempEmailList.contains(email)) { //엑셀내부 email 중복체크
											isOK = false;
											error.add(EXCEL_ERROR_EMAIL_DUPLICATE);
										} else {
											tempEmailList.add(email);
										}
									}
								}
							}
							break;
						case "adminTelephone" :
							if(row.getCell(i) == null) { // null
								isOK = false; 
								error.add(EXCEL_ERROR_PHONE_NULL);
							} else { 
								//숫자만 입력된 경우 셀 형식 변경
								if(row.getCell(i).getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
									row.getCell(i).setCellType(XSSFCell.CELL_TYPE_STRING);
								}
								
								String phone = row.getCell(i).toString();
								if(phone.trim().equals("")) { //blank
									isOK = false; 
									error.add(EXCEL_ERROR_PHONE_NULL);
								} else {
									if(!UtilFunctions.checkFormatPhone(phone)) { //형식체크
										isOK = false;
										error.add(EXCEL_ERROR_PHONE_FORMAT);
									} else {
										if(tempPhoneList.contains(phone)) { //엑셀내부 전화번호 중복체크
											isOK = false;
											error.add(EXCEL_ERROR_PHONE_DUPLICATE);
										} else {
											tempPhoneList.add(phone);
										}
									}
								}
							}
							break;
						default :
							break;
						}
					}
					
					if (isOK) {
						resultSuccess++;
					} else {
						resultFail++;
						item.put("error", error);
						failList.add(item);
					}
				}
				
				// 전체 성공인 경우 엑셀 업로드 api 전송
				if(rows-EXCEL_DATA_START_ROW == resultSuccess) {
					
					// set header
					Map<String, String> header = new HashMap<>();
					header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
					header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
					header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(multipartRequest));
					
					String url = ktapiAdmin+API_URL_ACCOUNT_INSERT_EXCEL;
					logger.debug("excel upload url={}", url);
					
					HttpUrlMultipartForward multipart = new HttpUrlMultipartForward(url, "POST", multipartRequest, "UTF-8", null, header);
					String response = multipart.finish();
					
					ObjectMapper mapper = new ObjectMapper();
					String json = response;
					
					try {
						result = mapper.readValue(json, Map.class);
						
						// millisecond to date
						if(result.get("date") != null) {
							result.put("date", UtilFunctions.millisecondToDate(result.get("date")));
						}
					} catch (JsonParseException e) {
						result.put("error", "JsonParseException");
						e.printStackTrace();
					}
					map.put("result", result);
				}
				
				map.put("successCnt", resultSuccess);
				map.put("failCnt", resultFail);
				map.put("failList", failList);
			}
		}
		
		logger.debug("result = {}", map);
		return map;
	}
	
	/**
	 * 권한그룹 설정(목록 조회)
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listAuthGroup(HttpServletRequest request, SessionVO session, AccountVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin+API_URL_AUTH_GROUP_LIST, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		logger.debug("result={}", result);
		
		if(!result.isEmpty()) {
			if(result.get("listCount") != null) {
				// 페이징
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", (int) result.get("listCount"));
				paginationVO.put("pageIndex", vo.getPageIndex());
				paginationVO.put("pageSize", vo.DEFAULT_MID_PAGE_SIZE);
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}
	
	/**
	 * 권한그룹 상세
	 * 
	 * @param request
	 * @param session
	 * @param groupSeq
	 * @return
	 * @throws Exception
	 */
	public Map selectAuthGroup(HttpServletRequest request, SessionVO session, String groupSeq) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));

		if(groupSeq == null) {
			groupSeq = "0";
		}

		String url = String.format(ktapiAdmin+API_URL_AUTH_GROUP_INFO, groupSeq);
		
		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 권한 그룹명/그룹코드 중복조회
	 * 
	 * @param request
	 * @param session
	 * @param mode
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public Map checkAuthGroup(HttpServletRequest request, SessionVO session, String mode, String value) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put(mode, value);
		
		String url = "";
		
		if(mode.equals("authorityGroupName")) {
			url = ktapiAdmin + API_URL_AUTH_GROUP_CHECK_NAME;
		} else if(mode.equals("authorityGroupCode")) {
			url = ktapiAdmin + API_URL_AUTH_GROUP_CHECK_CODE;
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		//logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 권한설정 저장(등록/수정)
	 * 
	 * @param request
	 * @param session
	 * @param mode
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map saveGroup(HttpServletRequest request, SessionVO session, String mode, AccountVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("authGroupName", vo.getAuthGroupName());
		body.put("authGroupCode", vo.getAuthGroupCode());
		body.put("permissionCheck", vo.getPermissionCheck());
		
		String url = "";
		
		if(mode.equals("insert")) { //등록
			url = ktapiAdmin + API_URL_AUTH_GROUP_INSERT;
		} else if(mode.equals("update")) { //수정
			url = String.format(ktapiAdmin+API_URL_AUTH_GROUP_UPDATE, vo.getAdminAuthorityGroupSeq());
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
    /**
     * 권한그룹 삭제
     * 
     * @param request
     * @param session
     * @param groupSeq
     * @return
     * @throws Exception
     */
	public Map deleteAuthGroup(HttpServletRequest request, SessionVO session, String groupSeq) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin+API_URL_AUTH_GROUP_DELETE, groupSeq);
		
		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		//logger.debug("result={}", result);
		
		return result;
	}

}
