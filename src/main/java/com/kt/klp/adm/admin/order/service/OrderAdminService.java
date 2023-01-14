package com.kt.klp.adm.admin.order.service;

import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kt.klp.adm.admin.order.domain.OrderVO;
import com.kt.klp.adm.admin.owner.domain.CarOwnerVO;
import com.kt.klp.adm.admin.owner.service.CarownAdminService;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.DownloadFunctions;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.HttpUrlMultipartForward;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* OrderAdminService : 주문배송 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.24       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.01.24
* @version 1.0.0
* @see
*
*/

@Service("orderAdminService")
public class OrderAdminService extends AbstractServiceImpl {

	//ES
	public static final String API_URL_ORDER_LIST = "/v1/admin/elastic/order/list"; //주문배송 목록
	public static final String API_URL_ORDER_DETAIL = "/v1/admin/elastic/order/detail"; //주문배송 상세
	public static final String API_URL_ORDER_LIST_SELLER_NOTE = "/v1/admin/elastic/order/manualdelivery/list"; //주문배송 목록 - 셀러노트 (2022.04.26 적용)
	public static final String API_URL_ORDER_HISTORY = "/v1/admin/elastic/order/history"; //이력관리
	
	//디시젼
	public static final String API_URL_ORDER_INSERT_PENALTY_FEE = "/v1/admin/settlement/upload"; //위약수수료(대기비) 등록
	public static final String API_URL_ORDER_SELECT_PENALTY_FEE = "/v1/admin/settlement/penalty/info"; //위약수수료(이동비/대기비) 조회
	public static final String API_URL_ORDER_LIST_EMER_CAROWNER = "/v1/admin/carown/contract/list/%d"; //비상차주목록 {nowPage}
	public static final String API_URL_ORDER_INSERT_EMER_CAROWNER = "/v1/admin/carown/upload/contract"; //비상차주등록
	public static final String API_URL_ORDER_VOC_LIST = "/v1/admin/voc/list/search/id/%s"; //VOC이력 {vocOrderId}
	
	//요금
	public static final String API_URL_CHARGE_REG_INFO = "/v1/charge/manager/info/registered/%s"; //등록요금정보 {orderId}
	public static final String API_URL_CHARGE_REG_UPDATE_INFO = "/v1/charge/manager/info/%s"; //요금조정이력 {orderId}
	public static final String API_URL_CHARGE_UPDATE_PREMIUM_RATE = "/v1/charge/manager/adjust/premium/%s"; //요금할증률 수정 {orderId}
	public static final String API_URL_CHARGE_RECOMPUTE = "/v1/charge/manager/recompute"; //표준요금 재계산
	
	//주문
	public static final String API_URL_ORDER_UPLOAD_EXCEL = "/v1/orders/_uploadExcel"; //주문내역 엑셀업로드
	public static final String API_URL_ORDER_RESULT_EXCEL = "/v1/orders/_downloadAnalyzedExcel"; //주문내역 엑셀업로드 실패파일 다운로드
	public static final String API_URL_ORDER_CANCEL = "/v1/orders/manager/%s/_cancel"; //주문취소 {orderId}
	public static final String API_URL_ORDER_UPDATE = "/v1/orders/manager/%s"; //주문수정(상하차지, 등록요금) {orderId}
	public static final String API_URL_ORDER_UPDATE_HISTORY = "/v1/orders/manager/%s/_createOrderHistory"; //대기비 변경이력 등록 {orderId}
	
	//배송
	public static final String API_URL_DELIVERY_INSERT_LOADED_SIGN = "/v1/delivery/manager/shipments/%s/loadedWithSign"; //상차완료(첨부파일 O) {deliveryId} - KT API URL 분리됨 (2022.04.27)
	public static final String API_URL_DELIVERY_INSERT_LOADED = "/v1/delivery/manager/shipments/%s/loadedWithoutSign"; //상차완료(첨부파일 X) {deliveryId} - KT API URL 분리됨 (2022.04.27)
	public static final String API_URL_DELIVERY_INSERT_UNLOADED_SIGN = "/v1/delivery/manager/shipments/%s/unloadedWithSign"; //하차완료(첨부파일 O) {deliveryId} - KT API URL 분리됨 (2022.04.27)
	public static final String API_URL_DELIVERY_INSERT_UNLOADED = "/v1/delivery/manager/shipments/%s/unloadedWithoutSign"; //하차완료(첨부파일 X) {deliveryId} - KT API URL 분리됨 (2022.04.27)
	public static final String API_URL_DELIVERY_SELECT_LOAD_UNLOAD = "/v1/delivery/manager/shipments/%s"; //상차완료/하차완료 조회 {deliveryId}
	public static final String API_URL_DELIVERY_DISPATCH_CANCEL = "/v1/delivery/manager/shipments/%s/_cancel"; //배차취소 {deliveryId}
	public static final String API_URL_DELIVERY_COORDINATE = "/v1/delivery/manager/shipments/%s/coordinate"; //배송추적-좌표(위경도) 조회 {deliveryId}
	
	//배차
	public static final String API_URL_DISPATCH_INSERT_EMER = "/v1/dispatch/manager/allocations/_emergencyRequest"; //비상배차 등록
	public static final String API_URL_DISPATCH_SELECT = "/v1/dispatch/manager/allocations"; //배차정보 조회
	
	public static final String API_URL_ADDRESS_LIST = "/address/v1.0/search"; //주소검색
	public static final String API_KEY_ADDRESS = "3cec283c685cad2a055b7b8ad6504dc5903b7e0e839de51b481b78896f187a6c7d4f4eb0"; //주소검색 key
	
	
	@Value("${api.ktapiOrder}")
	private String ktapiOrder; //주문
	
	@Value("${api.ktapiDelivery}")
	private String ktapiDelivery; //배송
	
	@Value("${api.ktapiDispatch}")
	private String ktapiDispatch; //배차
	
	@Value("${api.ktapiCharge}")
	private String ktapiCharge; //요금
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	@Value("${api.ktapiAddr}")
	private String ktapiAddr;
	
	@Value("${spring.profiles}")
	private String profiles;
	
	@Autowired
	protected CarownAdminService carownAdminService;
	

	/**
	 * 목록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listOrder(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String strToday = sdf.format(new Date());
		Date startTime = sdf2.parse(strToday+" 00:00:00");
		Date endTime = sdf2.parse(strToday+" 23:59:59");
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set param
		Map<String, Object> param = new HashMap<>();
		if(vo.getOrderType1() == null || vo.getOrderType1().equals("")) vo.setOrderType1("ALL");
		if(vo.getOrderType2() == null || vo.getOrderType2().equals("")) vo.setOrderType2("ALL");
		if(vo.getDispatchDelay() == null || vo.getDispatchDelay().equals("")) vo.setDispatchDelay("ALL");
		if(vo.getFreightOwnerType() == null || vo.getFreightOwnerType().equals("")) vo.setFreightOwnerType("ALL");
		if(vo.getFreightType() == null || vo.getFreightType().equals("")) vo.setFreightType("ALL");
		if(vo.getEmergencyYn() == null || vo.getEmergencyYn().equals("")) vo.setEmergencyYn("ALL");
		if(vo.getSearchText() == null || vo.getSearchText().equals("")) {
			vo.setSearchType("ORDERNUM"); //검색어 없을경우 검색타입 임의설정
			vo.setSearchText("");
		}
		if(vo.getFreightRegistStartDatetime() == 0) vo.setFreightRegistStartDatetime(startTime.getTime());
		if(vo.getFreightRegistEndDatetime() == 0) vo.setFreightRegistEndDatetime(endTime.getTime());
		if(vo.getLoadingStartDateTime() == 0) vo.setLoadingStartDateTime(startTime.getTime());
		if(vo.getLoadingEndDateTime() == 0) vo.setLoadingEndDateTime(endTime.getTime());
		if(vo.getUnloadingStartDateTime() == 0) vo.setUnloadingStartDateTime(startTime.getTime());
		if(vo.getUnloadingEndDateTime() == 0) vo.setUnloadingEndDateTime(endTime.getTime());
		if(vo.getPageCnt() == 0) vo.setPageCnt(10);
		
		param.put("orderType1", vo.getOrderType1()); //주문상태1
		param.put("orderType2", vo.getOrderType2()); //주문상태2
		param.put("dispatchDelay", vo.getDispatchDelay()); //배차지연
		param.put("freightOwnerType", vo.getFreightOwnerType()); //계약구분
		param.put("freightType", vo.getFreightType()); //화물구분
		param.put("emergencyYn", vo.getEmergencyYn()); //비상배차여부
		param.put("manualDispatch", vo.getManualDispatch()); //수동배차여부
		param.put("searchType", vo.getSearchType());
		if(!vo.getSearchText().equals("")) {
			param.put("searchText", URLEncoder.encode(vo.getSearchText(), "UTF-8"));
		} else {
			param.put("searchText", vo.getSearchText());
		}
		param.put("freightRegistStartDatetime", vo.getFreightRegistStartDatetime());
		param.put("freightRegistEndDatetime", vo.getFreightRegistEndDatetime());
		param.put("loadingStartDateTime", vo.getLoadingStartDateTime());
		param.put("loadingEndDateTime", vo.getLoadingEndDateTime());
		param.put("unloadingStartDateTime", vo.getUnloadingStartDateTime());
		param.put("unloadingEndDateTime", vo.getUnloadingEndDateTime());
		param.put("pageStart", vo.getPageStart());
		param.put("pageCnt", vo.getPageCnt());
		param.put("maskingYn", vo.YN_Y); //목록 마스킹처리(마스킹해제 불가)
		
		String url = "";
		String authGroupCode = session.getAdminAuthorityGroupCode();
		// 주문배송/수동배차 API URL 분리적용 (2022.05.06)
		if(authGroupCode.equals("manualDelivery")) {
			url = ktapiAdmin+API_URL_ORDER_LIST_SELLER_NOTE;
		} else {
			url = ktapiAdmin+API_URL_ORDER_LIST;
		}
		
		Map result = WebFunctions.connectApi(url, header, "GET", param);
		//logger.debug("result={}", result);
		
		if(result != null) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				
				for(int i=0; i<list.size(); i++) {
					Map map = (Map) list.get(i);
					Map freight = (Map) map.get("freight");
					
					Iterator<String> keys = freight.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						
						// 상차일시, 하차일시, 화물등록일 millisecond to date
						if((key.endsWith("DateTime") || key.endsWith("At")) && freight.get(key) != null) {
							freight.put(key, UtilFunctions.millisecondToDate(freight.get(key)));
							map.put("freight", freight);
						}
					}
					
					Iterator<String> key = map.keySet().iterator();
					while(key.hasNext()) {
						String k = key.next();
						
						if(k.equals("leadTime") && map.get(k) != null) {
							// 예상시간 치환
							map.put(k, secLeadTimeToMin(map.get(k).toString()));
						}
					}
				}
				
				if(result.get("pageTot") != null) {
					// 페이징
					Map<String, Object> paginationVO = new HashMap<>();
					paginationVO.put("sizeOfData", (int)result.get("pageTot"));
					paginationVO.put("pageIndex", vo.getPageIndex());
					paginationVO.put("pageSize", (int)vo.getPageCnt());
					result.put("paginationVO", paginationVO);
					
					String pagination =  new Pagination().setPagination(paginationVO);
					result.put("pagination", pagination);
				}
			}
		}
		
		return result;
	}
	
	/**
	 * 엑셀업로드
	 * 
	 * @param multipartRequest
	 * @param session
	 * @param mode
	 * @param vo
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> uploadExcel(MultipartHttpServletRequest multipartRequest, SessionVO session, String mode, OrderVO vo, HttpServletResponse response) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		MultipartFile file = multipartRequest.getFile("file");
		
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
		//logger.debug("fileName = {}", fileName);
		//logger.debug("ext = {}", ext);

		if(!ext.equals("XLS") && !ext.equals("XLSX")) {
			result.put("resultCode", "00001");
			result.put("resultMsg", "파일확장자 오류");
			return result;
		}

		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		String url = ktapiOrder+API_URL_ORDER_UPLOAD_EXCEL;
		logger.debug("{}", url);
		
		HttpUrlMultipartForward multipart = new HttpUrlMultipartForward(url, "POST", multipartRequest, "UTF-8", null, header);
		result = multipart.finishMap();
	    logger.debug("result = {}", result);
		
		return result;
	}
	
	/**
	 * 엑셀업로드 실패 시 분석파일 다운로드
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param vo
	 * @throws Exception
	 */
	public void downloadExcelResultFile(HttpServletRequest request, HttpServletResponse response, SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, Object> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set param
		Map<String, Object> param = new HashMap<>();
		param.put("sessionKey", vo.getSessionKey());
		
		Map result = WebFunctions.connectApiGetFile(ktapiOrder+API_URL_ORDER_RESULT_EXCEL, header, "GET", param);
		//logger.debug("result={}", result);
		
		byte[] fileData = (byte[]) result.get("fileData");
		
        StringBuffer fileName = new StringBuffer();
        fileName.append("주문내역_엑셀업로드오류_");
        fileName.append(System.currentTimeMillis());
        fileName.append(".xlsx");
        
		String contentType = result.get("contentType").toString();
		String disposition = result.get("disposition").toString();
		
		if(result.get("fileData") != null && result.get("fileName") != null
				&& result.get("contentType") != null && result.get("disposition") != null) {
			DownloadFunctions.downloadFile(request, response, fileData, fileName.toString(), contentType, disposition);
		}
	}
	
	/**
	 * 엑셀다운로드
	 * 
	 * @param request
	 * @param response
	 * @param result
	 * @param mode
	 * @throws Exception
	 */
	public void downloadExcel(HttpServletRequest request, HttpServletResponse response, Map result, String mode) throws Exception {

		Calendar cal = Calendar.getInstance();

		StringBuffer fileName = new StringBuffer();
		fileName.append("ORDERLIST_");
		fileName.append(cal.getTimeInMillis());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		DecimalFormat decFormat = new DecimalFormat("###,###");
		
		String[] headers = null;
		String[] columns = null;
		
		if(mode.equals(OrderVO.ORDER_TYPE_ORDER)) {
			//주문배송
			headers = new String[]{
				"No", "주문번호", "주문상태1", "주문상태2", "배차지연", "화물구분", "계약구분",
				"화주ID", "화주명", "배송요청자",
				"상차지", "상차일시", "하차지", "하차일시",
				"예상거리", "예상시간", "화물등록일", "비상배차여부",
				"차주ID", "차주명", "차량번호",
				"표준요금", "마진요금", "할증률", "차주노출요금", "화주노출요금"
			};
			columns = new String[]{
				"No", "orderNumber", "orderStatus", "isUrgentFreight", "dispatchDelay", "freightType", "freightOwnerType",
				"freightOwnerId", "freightOwnerName", "deliveryRequesterName",
				"loadingFullAddress", "loadingDateTime", "unloadingFullAddress", "unloadingDateTime",
				"estimatedDistance", "leadTime", "createdAt", "isEmergency",
				"carOwnerId", "carOwnerName", "carNum",
				"standardCharge", "marginCharge", "premiumRate", "carOwnerCharge", "freightOwnerCharge"
			};
		} else if(mode.equals(OrderVO.ORDER_TYPE_MANUAL)){
			//수동배차
			headers = new String[]{
				"No", "주문번호", "주문상태1", "화물구분", "계약구분",
				"화주ID", "화주명", "배송요청자",
				"상차지", "상차일시", "하차지", "하차일시",
				"예상거리", "예상시간", "화물등록일", "비상배차여부",
				"차주ID", "차주명", "차량번호",
				"표준요금", "마진요금", "할증률", "차주노출요금", "화주노출요금"
			};
			columns = new String[]{
				"No", "orderNumber", "orderStatus", "freightType", "freightOwnerType",
				"freightOwnerId", "freightOwnerName", "deliveryRequesterName",
				"loadingFullAddress", "loadingDateTime", "unloadingFullAddress", "unloadingDateTime",
				"estimatedDistance", "leadTime", "createdAt", "isEmergency",
				"carOwnerId", "carOwnerName", "carNum",
				"standardCharge", "marginCharge", "premiumRate", "carOwnerCharge", "freightOwnerCharge"
			};	
		} else {
			throw new ServiceException("order mode is null");
		}
		
		List list = new ArrayList<>();

		if(result != null) {
			if(result.get("list") != null) {
				list = (List) result.get("list");
				
				for(int i=0; i<list.size(); i++) {
					Map<String, Object> item = (Map) list.get(i);
					
					Iterator<String> keys = item.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						
						if(item.get(key) == null || item.get(key).equals("")) {
							item.put(key, "-");
						} else {
							
							// 주문상태1
							if(key.equals("orderStatus")) {
								switch(item.get(key).toString()) {
									case "CHARGE_CHECKING":
										item.put(key, "요금확인중");
										break;
									case "DELIVERY_REQUESTED":
										item.put(key, "배송요청");
										break;
									case "DISPATCH_COMPLETED":
										item.put(key, "배차완료");
										break;
									case "LOADING_COMPLETED":
										item.put(key, "상차완료");
										break;
									case "UNLOADING_COMPLETED":
										item.put(key, "하차완료");
										break;
									case "ORDER_CANCELED":
										item.put(key, "주문취소");
										break;
									default:
										item.put(key, item.get(key).toString());
										break;
								}
							}
							
							// 주문상태2
							if(key.equals("isUrgentFreight")) {
								if((boolean) item.get(key)) {
									item.put(key, "긴급");
								} else {
									item.put(key, "일반");
								}
							}
							
							// 배차지연여부
							if(key.equals("dispatchDelay")) {
								if(item.get(key).equals("NOMAL")) {
									item.put(key, "정상");
								} else if(item.get(key).equals("DELAY")){
									item.put(key, "지연");
								} else {
									item.put(key, item.get(key));
								}
							}
							
							// 화물구분
							if(key.equals("freightType")) {
								item.put(key, "일반");
							}
							
							// 계약구분
							if(key.equals("freightOwnerType")) {
								switch(item.get(key).toString()) {
									case "FO_C":
										item.put(key, "계약화주");
										break;
									case "FO_G":
										item.put(key, "일반화주");
										break;
									case "manualDelivery":
										item.put(key, "계약화주-수동배차");
										break;
									default:
										item.put(key, item.get(key).toString());
										break;
								}
							}
							
							// 상/하차일시, 화물등록일 날짜포맷
							if(key.equals("loadingDateTime") || key.equals("unloadingDateTime") || key.equals("createdAt")) {
								item.put(key, sdf.format(item.get(key)));
							}
							
							// 예상거리 > km
							if(key.equals("estimatedDistance")) {
								item.put(key, item.get(key)+"km");
							}
							
							// 예상시간 > 분
							if(key.equals("leadTime")) {
								item.put(key, item.get(key)+"분");
							}
							
							// 비상배차여부
							if(key.equals("isEmergency")) {
								if((boolean) item.get(key)) {
									item.put(key, "Y");
								} else {
									item.put(key, "N");
								}
							}
							
							// 할증률 > %
							if(key.equals("premiumRate")) {
								item.put(key, item.get(key)+"%");
							}
							
							// 요금 > 천단위 콤마+"원"
							if(key.endsWith("Charge")) {
								item.put(key, decFormat.format(Integer.valueOf(item.get(key).toString()))+"원");
							}
						}
					}
				}
			}
		}
		
		makeExcel(request, response, fileName.toString(), headers, columns, list);
	}

	/**
	 * 엑셀다운로드
	 * 
	 * @param request
	 * @param response
	 * @param title
	 * @param headers
	 * @param columns
	 * @param list
	 * @throws Exception
	 */
	public void makeExcel(HttpServletRequest request, HttpServletResponse response, String title,
			String[] headers, String[] columns, List list) throws Exception {
		
		XSSFWorkbook workbook = null;
		workbook = new XSSFWorkbook();
		
		XSSFSheet worksheet = workbook.createSheet(title);
		
		XSSFRow row = worksheet.createRow(0);
		for (int i=0; i<headers.length; i++) {
			row.createCell(i).setCellValue(headers[i]);
			
			worksheet.autoSizeColumn(i);
			worksheet.setColumnWidth(i, (worksheet.getColumnWidth(i))+2000);
		}
	    
		if(list != null) {
			for (int i = 0; i < list.size(); i++) {
				row = worksheet.createRow(1+i);
				Map map = (Map) list.get(i);
				
				for (int col=0; col<columns.length; col++) {
					Object val = map.get(columns[col]);
					
					XSSFCell cell = row.createCell(col);
					cell.setCellValue(val==null?"":val.toString());
					
					worksheet.autoSizeColumn(i);
					worksheet.setColumnWidth(i, (worksheet.getColumnWidth(i))+2000);
				}
			}
		}
		
		UtilFunctions.downloadExcel(request, response, workbook, title);
	}
	
	/**
	 * 상세
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map selectOrder(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set param
		Map<String, Object> param = new HashMap<>();
		param.put("orderId", vo.getOrderId());
		
		if(vo.getTab() == null || (vo.getTab() != null && vo.getTab().equals("tab01")))	{
			param.put("maskingYn", vo.getMaskingYn());
		} else {
			param.put("maskingYn", vo.YN_Y);
		}
		
		Map result = WebFunctions.connectApi(ktapiAdmin+API_URL_ORDER_DETAIL, header, "GET", param);
		if(!result.isEmpty()) {
			List list = (List) result.get("result");
			//logger.debug("list={}", result);
			
			if(!list.isEmpty()) {
				result = (Map) list.get(0);
				logger.debug("result={}", result);
			}
		}
		
		if(!result.isEmpty()) {
			// API 조회를 위한 파라미터
			String orderId = vo.getOrderId();
			String orderNumber = "";
			String deliveryId = "";
			String orderStatus = "";
			
			Iterator<String> keys = result.keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				
				// 기본정보 탭 > 배송요청일시 millisecond to date
				if((key.endsWith("DateTime") || key.endsWith("At")) && result.get(key) != null) {
					result.put(key, UtilFunctions.millisecondToDate(result.get(key)));
				}
				
				// 기본정보 탭 > 예상이동시간 치환
				if(key.equals("leadTime") && result.get(key) != null) {
					result.put(key, secLeadTimeToMin(result.get(key).toString()));
				}
			}
			
			Map freight = (Map) result.get("freight");
			
			if(freight != null) {
				keys = freight.keySet().iterator();
				while(keys.hasNext()) {
					String key = keys.next();
					
					// 기본정보 탭 > 화물등록일시, 상/하차일시 millisecond to date
					if((key.endsWith("DateTime") || key.endsWith("At")) && freight.get(key) != null) {
						freight.put(key, UtilFunctions.millisecondToDate(freight.get(key)));
						result.put("freight", freight);
					}
				}
				
				// 기본정보 탭 > 상/하차지 주소정보 조회(요금재계산, 주문수정시 관련 파라미터 필요)
				if(result.get("orderStatus") != null) {
					orderStatus = result.get("orderStatus").toString();
					logger.debug("{}", orderStatus);
					
					// 요금확인중 or 배송요청 상태일 경우에만 요금재계산, 주문수정 가능하여 해당 상태일경우 주소정보 조회
					if(orderStatus.equals("CHARGE_CHECKING") || orderStatus.equals("DELIVERY_REQUESTED")) {
						//상차주소
						vo.setTerms(freight.get("loadingAddress").toString());
						Map loading = listAddr(vo);
						if(loading != null) {
							List list = (List) loading.get("addresses");
							
							if(list != null) {
								loading = (Map) list.get(0);
								result.put("loading", loading);
								logger.debug("info={}", loading);
							}
						}
						
						//하차주소
						vo.setTerms(freight.get("unloadingAddress").toString());
						Map unloading = listAddr(vo);
						if(unloading != null) {
							List list = (List) unloading.get("addresses");
							
							if(list != null) {
								unloading = (Map) list.get(0);
								result.put("unloading", unloading);
								logger.debug("info={}", unloading);
							}
						}
					}
				}
			}
			
			// 주문상세 조회 완료 후 영역별 API 조회
			if(orderId != null && !orderId.equals("")) {
				// 기본정보, 요금정보 탭 > 등록요금정보 조회
				Map regCharge = getRegisterChargeInfo(session, vo);
				result.put("regCharge", regCharge);
				
				// 요금조정 탭 > 요금정보 조회
				Map updateCharge = getUpdateChargeInfo(session, vo);
				result.put("adjustCharge", updateCharge);
				
				// 배송정보 탭 > 배차정보 조회
				Map dispatchInfo = getDispatchInfo(request, session, vo);
				result.put("dispatchInfo", dispatchInfo);
			}
			
			// 요금조정 탭 > 위약수수료(이동비/대기비) 조회
			if(result.get("orderNumber") != null) {
				orderNumber = result.get("orderNumber").toString();
				logger.debug("{}", orderNumber);
				
				if(orderId != null && !orderId.equals("") && orderNumber != null && !orderNumber.equals("")) {
					vo.setOrderNumber(orderNumber);
					
					Map penaltyFee = getPenaltyFee(request, session, vo);
					result.put("penaltyFee", penaltyFee);
				}
			}
			
			// 배송정보 탭 > 상차완료, 하차완료 조회
			if(result.get("deliveryId") != null) {
				deliveryId = result.get("deliveryId").toString();
				logger.debug("{}", deliveryId);
				
				if(deliveryId != null && !deliveryId.equals("")) {
					vo.setDeliveryId(deliveryId);
					
					Map loadUnloadInfo = getLoadUnloadInfo(session, vo);
					result.put("loadUnloadInfo", loadUnloadInfo);
				}
			}
		}
		
		return result;
	}
	
	/**
	 * 상세 > 기본정보 탭 > 주문취소
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map orderCancel(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set body
		Map<String, String> body = new HashMap<>();
		body.put("actorMemo", vo.getActorMemo());
		
		String url = String.format(ktapiOrder+API_URL_ORDER_CANCEL, vo.getOrderId());

		Map result = WebFunctions.connectApiJson(url, header, "PUT", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 기본정보 탭 > 주소검색
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listAddr(OrderVO vo) throws Exception {
		
		// set header
		Map<String, Object> header = new HashMap<>();
		header.put("key", API_KEY_ADDRESS);
		
		// set body
		Map<String, Object> param = new HashMap<>();
		if(vo.getTerms() != null && !vo.getTerms().equals("")) {
			param.put("terms", URLEncoder.encode(vo.getTerms(), "UTF-8"));
		}
		param.put("similarAddress", true);
		param.put("autoCorrection", true);
		param.put("includeGeometry", true);
		param.put("includePostCode", true);
		param.put("includeEntPoints", true);
		param.put("includeEntPoints", true);
		param.put("includeShape", false);
		param.put("pageSize", 9999);
		
		Map result = WebFunctions.connectApi(ktapiAddr+API_URL_ADDRESS_LIST, header, "GET", param);
		
		return result;
	}

	/**
	 * 상세 > 기본정보 탭 > 표준요금 재계산
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map recomputeCharge(SessionVO session, OrderVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		String[] tempArr = new String[0];
		if(vo.getCarOptions() == null) vo.setCarOptions(tempArr);
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("orderID", vo.getOrderId());
		body.put("loadingLat", vo.getLoadingLat());
		body.put("loadingLon", vo.getLoadingLon());
		body.put("unloadingLat", vo.getUnloadingLat());
		body.put("unloadingLon", vo.getUnloadingLon());
		body.put("carModel", vo.getCarModel());
		body.put("carType", vo.getCarType());
		body.put("carOptions", vo.getCarOptions());
		body.put("loadingDateTime", vo.getLoadingDateTime());
		body.put("unloadingDateTime", vo.getUnloadingDateTime());
		body.put("loadingPnu", vo.getLoadingPnu());
		body.put("unloadingPnu", vo.getUnloadingPnu());
		// KT 요청으로 인해 파라미터 추가 (2022.04.19 수정)
		body.put("isUrgentFreight", vo.isUrgentFreight());
		body.put("handworkType", vo.getHandworkType());
		
		Map result = WebFunctions.connectApiJson(ktapiCharge+API_URL_CHARGE_RECOMPUTE, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 기본정보 탭 > 주문수정(상/하차지정보, 요금정보)
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map updateOrder(SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("loadingDateTime", vo.getLoadingDateTime());
		body.put("loadingAddress", vo.getLoadingAddress());
		body.put("loadingDetailAddress", vo.getLoadingDetailAddress());
		body.put("loadingZipCode", vo.getLoadingZipCode());
		body.put("loadingPnu", vo.getLoadingPnu());
		body.put("loadingRbu", vo.getLoadingRbu());
		body.put("loadingLat", vo.getLoadingLat());
		body.put("loadingLon", vo.getLoadingLon());
		body.put("unloadingDateTime", vo.getUnloadingDateTime());
		body.put("unloadingAddress", vo.getUnloadingAddress());
		body.put("unloadingDetailAddress", vo.getUnloadingDetailAddress());
		body.put("unloadingZipCode", vo.getUnloadingZipCode());
		body.put("unloadingPnu", vo.getUnloadingPnu());
		body.put("unloadingRbu", vo.getUnloadingRbu());
		body.put("unloadingLat", vo.getUnloadingLat());
		body.put("unloadingLon", vo.getUnloadingLon());
		body.put("standardCharge", vo.getStandardCharge());
		body.put("actorMemo", vo.getActorMemo());
		if(vo.getAdditionalChargeType() != null) body.put("additionalChargeType", vo.getAdditionalChargeType());
		if(vo.getAdditionalCharge() != 0) body.put("additionalCharge", vo.getAdditionalCharge());
		
		String url = String.format(ktapiOrder+API_URL_ORDER_UPDATE, vo.getOrderId());

		Map result = WebFunctions.connectApiJson(url, header, "PUT", body);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 기본정보, 요금조정 탭 > 등록요금정보 조회
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map getRegisterChargeInfo(SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		String url = String.format(ktapiCharge+API_URL_CHARGE_REG_INFO, vo.getOrderId());

		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 요금조정 탭 > 수정요금정보, 최종요금정보 조회
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map getUpdateChargeInfo(SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		String url = String.format(ktapiCharge+API_URL_CHARGE_REG_UPDATE_INFO, vo.getOrderId());

		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		
		if(result != null) {
			if(result.get("adjustedCharge") != null) {
				List list = (List) result.get("adjustedCharge");
				
				for(int i=0; i<list.size(); i++) {
					Map map = (Map) list.get(i);
					
					String round = map.get("round").toString();
					if(round.equals(vo.CHARGE_PREMIUM_UPDATE)) { //수정요금정보
						result.put("updateCharge", map);
					} else if(round.equals(vo.CHARGE_PREMIUM_LAST)) { //최종요금정보
						result.put("lastCharge", map);
					}
				}
			}
		}
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 요금조정 탭 > 위약수수료(이동비/대기비) 조회
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map getPenaltyFee(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("ownerSettlementOrderId", vo.getOrderId());
		body.put("ownerSettlementOrderNum", vo.getOrderNumber());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_ORDER_SELECT_PENALTY_FEE, header, "POST", body);
		
		if(result != null) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				
				for(int i=0; i<list.size(); i++) {
					Map map = (Map) list.get(i);
					
					String type = map.get("ownerSettlementType").toString();
					if(type.equals("loadingWaitingCharge")) { //상차지대기비
						result.put("loadingWaitingCharge", map);
					} else if(type.equals("unloadingWaitingCharge")) { //하차지대기비
						result.put("unloadingWaitingCharge", map);
					} else if(type.equals("movingCharge")) { //이동비
						result.put("movingCharge", map);
					}
				}
			}
		}
		logger.debug("info={}", result);
		
		return result;
	}

	/**
	 * 상세 > 요금조정 탭 > 할증률 저장
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map updatePremiumRate(SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("premiumRate", vo.getPremiumRate());
		body.put("round", vo.getRound());
		body.put("actorMemo", vo.getActorMemo());
		
		String url = String.format(ktapiCharge+API_URL_CHARGE_UPDATE_PREMIUM_RATE, vo.getOrderId());

		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 상세 > 요금조정 탭 > 위약수수료(대기비) 등록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map updatePenaltyFee(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("ownerSettlementOrderId", vo.getOrderId());
		body.put("ownerSettlementOrderNum", vo.getOrderNumber());
		body.put("ownerSettlementPrice", vo.getOwnerSettlementPrice());
		body.put("ownerSettlementType", vo.getOwnerSettlementType());
		if(vo.getCarOwnerId() != null && !vo.getCarOwnerId().equals("")) body.put("carOwnerId", vo.getCarOwnerId());
		body.put("freightOwnerId", vo.getFreightOwnerId());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_ORDER_INSERT_PENALTY_FEE, header, "POST", body);
		logger.debug("result={}", result);
		
		// 대기비 변경이력 등록 (2022.05.02 추가)
		if(result != null) {
			if(result.get("status") != null && result.get("status").toString().equals("200")) {
				insertOrderHistory(session, vo);
			}
		}
		
		return result;
	}

	/**
	 * 상세 > 요금조정 탭 > 대기비 변경이력 등록
	 * 
	 * @param session
	 * @param vo
	 */
	private void insertOrderHistory(SessionVO session, OrderVO vo) {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);

		Map context = new HashMap<>();
		context.put(vo.getOwnerSettlementType(), vo.getOwnerSettlementPrice());
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("actorMemo", vo.getActorMemo());
		body.put("context", context);
		
		String url = String.format(ktapiOrder+API_URL_ORDER_UPDATE_HISTORY, vo.getOrderId());

		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
	}
	
	/**
	 * 상세 > 배송정보 탭 > 배차정보, 비상배차정보 조회
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map getDispatchInfo(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set param
		Map<String, String> param = new HashMap<>();
		param.put("orderId", vo.getOrderId());

		Map result = WebFunctions.connectApi(ktapiDispatch+API_URL_DISPATCH_SELECT, header, "GET", param);
		
		if(result != null) {
			// 일반배차 > 차주정보조회
			if(result.get("allocation") != null) {
				Map allocation = (Map) result.get("allocation");
				if(allocation.get("carOwnerId") != null) {
					if(allocation.get("carOwnerId") != null && !allocation.get("carOwnerId").equals("")) {
						String carOwnerId = allocation.get("carOwnerId").toString();
						result.put("alloCarownIdOrg", carOwnerId);
					
						CarOwnerVO carownVO = new CarOwnerVO();
						carownVO.setCarOwnerId(carOwnerId);
						if(vo.getTab() != null && vo.getTab().equals("tab03")) carownVO.setMaskingYn(vo.getMaskingYn());
						
						Map carownInfo = carownAdminService.selectCarown(request, session, carownVO);
						carownInfo.remove("fileList");
						result.put("alloCarownInfo", carownInfo);
					}
				}
			}
			
			// 비상배차 > 차주정보조회
			if(result.get("emergency") != null) {
				Map emergency = (Map) result.get("emergency");
				if(emergency.get("carOwnerId") != null) {
					if(emergency.get("carOwnerId") != null && !emergency.get("carOwnerId").equals("")) {
						String carOwnerId = emergency.get("carOwnerId").toString();
						result.put("emerCarownIdOrg", carOwnerId);
					
						CarOwnerVO carownVO = new CarOwnerVO();
						carownVO.setCarOwnerId(carOwnerId);
						if(vo.getTab() != null && vo.getTab().equals("tab03")) carownVO.setMaskingYn(vo.getMaskingYn());
						
						Map carownInfo = carownAdminService.selectCarown(request, session, carownVO);
						carownInfo.remove("fileList");
						result.put("emerCarownInfo", carownInfo);
					}
				}
			}
		}
		logger.debug("info={}", result);
		
		return result;
	}

	/**
	 * 상세 > 배송정보 탭 > 상차완료, 하차완료 조회
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map getLoadUnloadInfo(SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		String url = String.format(ktapiDelivery+API_URL_DELIVERY_SELECT_LOAD_UNLOAD, vo.getDeliveryId());

		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		
		if(result != null && !result.isEmpty()) {
			// millisecond to date
			Iterator<String> keys = result.keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				
				if(key.endsWith("DateTime") && result.get(key) != null) {
					result.put(key, UtilFunctions.millisecondToDate(result.get(key)));
				}
			}
			
			// 이동시간 계산
			if(result.get("loadedDateTime") != null && result.get("unloadedDateTime") != null) {
				Date unloading = (Date) result.get("unloadedDateTime");
				Date loading = (Date) result.get("loadedDateTime");
				
				long diffMin = (unloading.getTime()-loading.getTime()) / (60*1000);
				long mod = (unloading.getTime()-loading.getTime()) / 1000 / 60;
				if(mod >= 1) {
					diffMin += 1;
				}
				result.put("completedMovingTime", diffMin);
			}
		}
		logger.debug("info={}", result);
		
		return result;
	}

	/**
	 * 상세 > 배송정보 탭 > 배송추적 - 좌표(위경도) 조회
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map getCoordinate(SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// {adminId:adminName} 인코딩
		String userName = session.getAdminId() + ":" + session.getAdminName();
		userName = URLEncoder.encode(userName, "UTF-8");
		
		// adminId:{adminName} 인코딩
//		String encName = URLEncoder.encode(session.getAdminName(), "UTF-8");
//		String userName = session.getAdminId() + ":" + encName;
		
		header.put("X-Consumer-Username", userName);
		logger.debug("{}", header);
		
		// set param
		Map<String, String> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		
		String url = String.format(ktapiDelivery+API_URL_DELIVERY_COORDINATE, vo.getDeliveryId());

		Map result = WebFunctions.connectApi(url, header, "GET", param);
		logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 상세 > 배송정보 탭 > 비상배차 > 비상차주 목록조회
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listEmerCarown(HttpServletRequest request, SessionVO session, CarOwnerVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("pagePerRows", vo.getPageSize());
		body.put("searchType", vo.getSearchType());
		body.put("searchText", vo.getSearchText());
		
		String url = String.format(ktapiAdmin+API_URL_ORDER_LIST_EMER_CAROWNER, vo.getNowPage());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		if(result != null) {
			if(result.get("listCount") != null) {
				// 페이징
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", (int)result.get("listCount"));
				paginationVO.put("pageIndex", vo.getNowPage());
				paginationVO.put("pageSize", vo.getPageSize());
//					result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}

	/**
	 * 상세 > 배송정보 탭 > 비상배차 > 비상차주 등록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map saveEmerCarOwner(HttpServletRequest request, SessionVO session, CarOwnerVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("carOwnerName", vo.getCarOwnerName());
		body.put("carOwnerTelephone", vo.getCarOwnerTelephone());
		body.put("carNum", vo.getCarNum());
		body.put("carType", vo.getCarType());
		if(vo.getCarModel() != null) {
			body.put("carModel", vo.getCarModel());
		}
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin+API_URL_ORDER_INSERT_EMER_CAROWNER, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 상세 > 배송정보 탭 > 비상배차 등록
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map insertEmerDispatch(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("carOwnerId", vo.getCarOwnerId());
		body.put("carOwnerType", vo.getCarOwnerType());
		body.put("preCarOwnerId", vo.getPreCarOwnerId());
		body.put("preCarOwnerType", vo.getPreCarOwnerType());
		body.put("preDispatchId", vo.getPreDispatchId());
		
		if(vo.getActorMemo() != null) {
			body.put("actorMemo", vo.getActorMemo());
		} else {
			body.put("cancelReason", vo.getCancelReason());
			if(vo.getCancelMemo() != null && !vo.getCancelMemo().equals("")) {
				body.put("cancelMemo", vo.getCancelMemo());
			}
		}
		
		String url = ktapiDispatch+API_URL_DISPATCH_INSERT_EMER+"?orderId="+vo.getOrderId();
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		//비상배차 등록성공 후 변경된 deliveryId 조회
		if(result.get("status") != null && !result.get("status").equals("")) {
			String status = result.get("status").toString();
			
			if(status.equals("200")) {
				//비상배차 등록성공 후 변경된 deliveryId 즉시조회되지 않아 3초 지연시킨 후 조회처리 (2022.05.19 수정)
				Thread.sleep(3000);
				
				String deliveryId = getEmerDeliveryId(request, session, vo);
				result.put("newDeliveryId", deliveryId);
			}
		}
		logger.debug("result={}", result);
		
		return result;
	}
	
	/**
	 * 비상배차 등록성공 후 변경된 deliveryId 조회
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private String getEmerDeliveryId(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		String deliveryId = "";
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set param
		Map<String, Object> param = new HashMap<>();
		param.put("orderId", vo.getOrderId());
		param.put("maskingYn", vo.YN_Y);
		
		// 주문배송 상세 조회
		Map result = WebFunctions.connectApi(ktapiAdmin+API_URL_ORDER_DETAIL, header, "GET", param);
		
		if(result != null && !result.isEmpty()) {
			List list = (List) result.get("result");
			//logger.debug("list = {}", list);
			
			if(list != null && !list.isEmpty()) {
				result = (Map) list.get(0);
				logger.debug("result = {}", result);
			} else {
				//비상배차 등록성공 후 주문상세 즉시조회되지 않을 경우 예외처리 (2022.05.19)
				throw new ServiceException("detail list is null");
			}
		} else {
			//비상배차 등록성공 후 주문상세 즉시조회되지 않을 경우 예외처리 (2022.05.19)
			throw new ServiceException("detail result is null");
		}
		
		if(result != null && !result.isEmpty()) {
			if(result.get("deliveryId") != null) {
				deliveryId = result.get("deliveryId").toString();
			} else {
				//비상배차 등록성공 후 변경된 deliveryId 즉시조회되지 않을 경우 예외처리 (2022.05.19)
				throw new ServiceException("deliveryId is null");
			}
		} else {
			throw new ServiceException("배차정보 없음");
		}
		logger.debug("{}", deliveryId);
		
		return deliveryId;
	}
	
	/**
	 * 상세 > 배송정보 탭 > 배차취소
	 * 
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map dispatchCancel(SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("cancelReason", vo.getCancelReason());
		if(vo.getCancelMemo() != null && !vo.getCancelMemo().equals("")) {
			body.put("cancelMemo", vo.getCancelMemo());
		}
		
		String url = String.format(ktapiDelivery+API_URL_DELIVERY_DISPATCH_CANCEL, vo.getDeliveryId());

		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result={}", result);
		
		return result;
	}

	/**
	 * 상세 > 배송정보 탭 > 상차완료
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map insertLoadingCompleted(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		Map result = new HashMap<>();
		
		// KT API URL 분리됨 (2022.04.27)
		// API 분리 관련 추가수정 > 첨부파일 있을경우 form-data, 없을경우 json data 전송 (2022.05.18)
		if(request.getParameter("request") != null) {
			// 첨부파일 O
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			
			List files = multipartRequest.getFiles("sign");
			//logger.debug("file = {}", files.size());
			
			if(files.size() > 0) {
				for(int i=0; i<files.size(); i++) {
					MultipartFile file = (MultipartFile) files.get(i);
					
					long maxSize = 10 * 1024 * 1024;
					long fileSize = file.getSize();
					logger.debug("size = {}", fileSize);
					
					String fileName = file.getOriginalFilename();
					String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
					//logger.debug("fileName = {}", fileName);
					//logger.debug("ext = {}", ext);
					
					if(fileSize >= maxSize || !ext.equals("PNG")) {
						result.put("resultCode", "00001");
						result.put("resultMsg", "파일 확장자_용량 오류");
						return result;
					}
				}
			}
			result = loadingCompltetdWithSign(multipartRequest, session, vo);
			
		} else {
			// 첨부파일 X
			result = loadingCompltetdWithoutSign(request, session, vo);
		}
		
		return result;
	}
	
	/**
	 * 상세 > 배송정보 탭 > 상차완료 (첨부파일 O)
	 * 
	 * @param multipartRequest
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map loadingCompltetdWithSign(MultipartHttpServletRequest multipartRequest, SessionVO session, OrderVO vo) throws Exception {
		
		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		String url = String.format(ktapiDelivery+API_URL_DELIVERY_INSERT_LOADED_SIGN, vo.getDeliveryId());
		logger.debug("{}", url);
		
		String reqData = multipartRequest.getParameter("request");
		reqData = UtilFunctions.decodeXss(reqData.replaceAll("&quot;", "\""));
		
		String[] dontSendField = {"deliveryId", "request"};
		
		HttpUrlMultipartForward multipart = new HttpUrlMultipartForward(url, "POST", multipartRequest, "UTF-8", dontSendField, header);
		multipart.addFormField("request", reqData);
		
		Map result = multipart.finishMap();
		logger.debug("result = {}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 배송정보 탭 > 상차완료 (첨부파일 X)
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map loadingCompltetdWithoutSign(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("carOwnerId", vo.getCarOwnerId());
		body.put("completed", vo.getCompleted());
		
		String url = String.format(ktapiDelivery+API_URL_DELIVERY_INSERT_LOADED, vo.getDeliveryId());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result = {}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 배송정보 탭 > 하차완료
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map insertUnloadingCompleted(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {
		
		Map result = new HashMap<>();
		
		// KT API URL 분리됨 (2022.04.27)
		// API 분리 관련 추가수정 > 첨부파일 있을경우 form-data, 없을경우 json data 전송 (2022.05.18)
		if(request.getParameter("request") != null) {
			// 첨부파일 O
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			
			List files = multipartRequest.getFiles("sign");
			//logger.debug("file = {}", files.size());
			
			if(files.size() > 0) {
				for(int i=0; i<files.size(); i++) {
					MultipartFile file = (MultipartFile) files.get(i);
					
					long maxSize = 10 * 1024 * 1024;
					long fileSize = file.getSize();
					logger.debug("size = {}", fileSize);
					
					String fileName = file.getOriginalFilename();
					String ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
					//logger.debug("fileName = {}", fileName);
					//logger.debug("ext = {}", ext);

					if(fileSize >= maxSize || !ext.equals("PNG")) {
						result.put("resultCode", "00001");
						result.put("resultMsg", "파일 확장자_용량 오류");
						return result;
					}
				}
			}
			result = unloadingCompltetdWithSign(multipartRequest, session, vo);
			
		} else {
			// 첨부파일 X
			result = unloadingCompltetdWithoutSign(request, session, vo);
		}
		
		return result;
	}
	
	/**
	 * 상세 > 배송정보 탭 > 하차완료 (첨부파일 O)
	 * 
	 * @param multipartRequest
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map unloadingCompltetdWithSign(MultipartHttpServletRequest multipartRequest, SessionVO session, OrderVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		String url = String.format(ktapiDelivery+API_URL_DELIVERY_INSERT_UNLOADED_SIGN, vo.getDeliveryId());
		logger.debug("{}", url);
		
		String reqData = multipartRequest.getParameter("request");
		reqData = UtilFunctions.decodeXss(reqData.replaceAll("&quot;", "\""));
		
		String[] dontSendField = {"deliveryId", "request"};
		
		HttpUrlMultipartForward multipart = new HttpUrlMultipartForward(url, "POST", multipartRequest, "UTF-8", dontSendField, header);
		multipart.addFormField("request", reqData);
		
		Map result = multipart.finishMap();
		logger.debug("result = {}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 배송정보 탭 > 하차완료 (첨부파일 X)
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 */
	private Map unloadingCompltetdWithoutSign(HttpServletRequest request, SessionVO session, OrderVO vo) {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_X_AUTHENTICATED_SCOPE, WebFunctions.HEADER_X_AUTHENTICATED_SCOPE_VALUE);
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("carOwnerId", vo.getCarOwnerId());
		body.put("completed", vo.getCompleted());
		
		String url = String.format(ktapiDelivery+API_URL_DELIVERY_INSERT_UNLOADED, vo.getDeliveryId());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", body);
		logger.debug("result = {}", result);
		
		return result;
	}
	
	/**
	 * 상세 > 이력정보 탭 > 변경이력 조회
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listOrderHistory(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		// set body
		Map<String, Object> body = new HashMap<>();
		body.put("orderId", vo.getOrderId());
		// 마스킹여부 파라미터 추가 (2022.04.20)
		if(vo.getTab() != null && vo.getTab().equals("tab04")) {
			body.put("maskingYn", vo.getMaskingYn());
		} else {
			body.put("maskingYn", vo.YN_Y);
		}
		
		Map result = WebFunctions.connectApi(ktapiAdmin+API_URL_ORDER_HISTORY, header, "GET", body);
		
		if(result != null) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				
				// millisecond to date
				UtilFunctions.millisecondListToDate(list);
			}
		}
		
		return result;
	}
	
	/**
	 * 상세 > 이력정보 탭 > VOC이력 조회
	 * 
	 * @param request
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map listVoc(HttpServletRequest request, SessionVO session, OrderVO vo) throws Exception {

		// set header
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP, UtilFunctions.getClientIP(request));
		
		String url = String.format(ktapiAdmin+API_URL_ORDER_VOC_LIST, vo.getOrderId());
		
		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		logger.debug("list={}", result);
		
		if(result != null) {
			if(result.get("vocList") != null) {
				List list = (List) result.get("vocList");
				
				// millisecond to date
				UtilFunctions.millisecondListToDate(list);
			}
		}
		
		return result;
	}
	
	/**
	 * 예상이동시간 초 -> 분 치환
	 * 
	 * @param value
	 * @return
	 */
	private int secLeadTimeToMin(String value) {
		
		double leadTime = Double.valueOf(value);
		int leadMin = ((int)leadTime)/60;
		
		return leadMin;
	}
	
}
