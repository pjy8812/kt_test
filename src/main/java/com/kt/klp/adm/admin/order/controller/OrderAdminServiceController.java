package com.kt.klp.adm.admin.order.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.order.domain.OrderVO;
import com.kt.klp.adm.admin.order.service.OrderAdminService;
import com.kt.klp.adm.admin.owner.domain.CarOwnerVO;
import com.kt.klp.adm.admin.owner.domain.FreightOwnerVO;
import com.kt.klp.adm.admin.owner.service.CarownAdminService;
import com.kt.klp.adm.admin.owner.service.FrgownAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* OrderAdminServiceController : 주문배송 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.12       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.01.12
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/order")
public class OrderAdminServiceController extends AbstractController {
	
	@Resource(name = "orderAdminService")
	protected OrderAdminService orderAdminService;
	
	@Autowired
	protected CommonService commonService;
	
	@Autowired
	protected FrgownAdminService frgownAdminService;
	
	@Autowired
	protected CarownAdminService carownAdminService;
	
	@Value("${spring.profiles}")
	private String profiles;
	
	/**
	 * 검색 폼
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search/{mode}")
	public String searchOrder(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {

		SessionVO session = getSessionVO(request, response);
		model.addAttribute("adminId", session.getAdminId());
		
		Map<String, Object> dateMap = new HashMap<>();
		
		if(vo.getFreightRegistStartDatetime() != 0) dateMap.put("freRegStart", UtilFunctions.millisecondToDate(vo.getFreightRegistStartDatetime()));
		if(vo.getFreightRegistEndDatetime() != 0) dateMap.put("freRegEnd", UtilFunctions.millisecondToDate(vo.getFreightRegistEndDatetime()));
		if(vo.getLoadingStartDateTime() != 0) dateMap.put("loadStart", UtilFunctions.millisecondToDate(vo.getLoadingStartDateTime()));
		if(vo.getLoadingEndDateTime() != 0) dateMap.put("loadEnd", UtilFunctions.millisecondToDate(vo.getLoadingEndDateTime()));
		if(vo.getUnloadingStartDateTime() != 0) dateMap.put("unloadStart", UtilFunctions.millisecondToDate(vo.getUnloadingStartDateTime()));
		if(vo.getUnloadingEndDateTime() != 0) dateMap.put("unloadEnd", UtilFunctions.millisecondToDate(vo.getUnloadingEndDateTime()));
		model.addAllAttributes(dateMap);
		model.addAttribute("vo", vo);
		
		return "/html/order/OrderSearch";
	}
	
	/**
	 * 목록
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list/{mode}")
	public String listOrder(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		//수동배차 파라미터 들어오지 않을 경우 mode 값에 따라 주문배송/수동배차 구분
		if(vo.getManualDispatch() == null || vo.getManualDispatch().equals("")) {
			if(mode.equals(vo.ORDER_TYPE_ORDER)) {
				vo.setManualDispatch(vo.YN_N);
			} else if(mode.equals(vo.ORDER_TYPE_MANUAL)){
				vo.setManualDispatch(vo.YN_Y);
			} else {
				throw new ServiceException("order mode is null");
			}
		}
		logger.debug("manual = {}", vo.getManualDispatch());
		model.addAttribute("result", orderAdminService.listOrder(request, session, vo));
		model.addAttribute("vo", vo);
		
		return "/html/order/OrderList";
	}
	
	/**
	 * 엑셀업로드 팝업
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/upload.popup/{mode}")
	public String popupUploadExcel(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/order/OrderExcelUploadPopup";
	}
	
	/**
	 * 엑셀업로드 - 화주조회 팝업(검색 폼)
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/freightowner/{mode}")
	public String freightowner(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("mode", mode);
		
		//계약구분
		List freightOwnerType = commonService.listCode(session, "freightOwnerType"); 
		model.addAttribute("freightOwnerType", freightOwnerType);
		
		//사업자구분
		List memberType = commonService.listCode(session, "memberType");
		model.addAttribute("memberType", memberType);
		
		//사업자유형
		List businessType = commonService.listCode(session, "businessType");
		model.addAttribute("businessType", businessType);
		
		return "/html/order/owner/FreightOwnerSearch";
	}
	
	/**
	 * 엑셀업로드 - 화주목록 조회
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/freightowner/list")
	public String listFreightowner(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		// 화주목록
		Map result = frgownAdminService.listFrgown(request, session, vo);
		model.addAttribute("result", result);
		
		return "/html/order/owner/FreightOwnerList";
	}
	
	/**
	 * 엑셀업로드
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/upload/{mode}")
	public @ResponseBody Map uploadExcel(@PathVariable("mode") String mode, MultipartHttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;	
		
		Map<String, Object> result = orderAdminService.uploadExcel(multipartRequest, session, mode, vo, response);
		model.addAttribute("result", result);
		
		return result;
	}
	
	/**
	 * 엑셀업로드 실패 시 분석파일 다운로드
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download.result")
	public void downloadExcelResultFile(HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		if(vo.getSessionKey() != null && !vo.getSessionKey().equals("")) {
			orderAdminService.downloadExcelResultFile(request, response, session, vo);
		}
	}
	
	/**
	 * 엑셀다운로드
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download/{mode}")
	public void downloadExcel(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		// 수동배차 파라미터 들어오지 않을 경우 mode 값에 따라 주문배송/수동배차 구분
		if(vo.getManualDispatch() == null || vo.getManualDispatch().equals("")) {
			if(mode.equals(vo.ORDER_TYPE_ORDER)) {
				vo.setManualDispatch(vo.YN_N);
			} else if(mode.equals(vo.ORDER_TYPE_MANUAL)){
				vo.setManualDispatch(vo.YN_Y);
			} else {
				throw new ServiceException("order mode is null");
			}
		}
		
		Map result = orderAdminService.listOrder(request, session, vo);
		
		if(result != null) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				
				// paginationVO null일 경우 엑셀 No 0으로 일괄 설정 (2022.04.21)
				int num = 0;
				Map paginationVO = new HashMap<>();
				
				if(result.get("paginationVO") != null) {
					paginationVO = (Map) result.get("paginationVO");
					int sizeOfData = 0;
					int pageIndex = 0;
					int pageSize = 0;
					int pageStart = (int) vo.getPageStart();
					
					if(paginationVO.get("sizeOfData") != null) sizeOfData = (int) paginationVO.get("sizeOfData");
					if(paginationVO.get("pageIndex") != null) {
						pageIndex = ((int) paginationVO.get("pageIndex")); 
						if(pageIndex > 0) pageIndex = pageIndex-1;
					}
					if(paginationVO.get("pageSize") != null) pageSize = (int) paginationVO.get("pageSize");
					
					if(sizeOfData >= 0 && pageIndex >= 0 && pageSize >= 0 && pageStart >= 0) {
						num = (sizeOfData - pageIndex * pageSize) - pageStart;
					}
				}
				
				for(int i=0; i<list.size(); i++) {
					Map map = (Map) list.get(i);
					// paginationVO null일 경우 엑셀 No 0으로 일괄 설정 (2022.04.21)
					if(num <= 0) {
						map.put("No", "0");
					} else {
						map.put("No", num-i);
					}
					
					Map freight = (Map) map.get("freight");
					Map freightOwnerInfo = (Map) map.get("freightOwnerInfo");
					Map carOwnerInfo = (Map) map.get("carOwnerInfo");
					Map charge = (Map) map.get("charge");
					
					if(freight != null) {
						Iterator<String> keys = freight.keySet().iterator();
						while(keys.hasNext()) {
							String key = keys.next();
							map.put(key, freight.get(key));
							
							// 상/하차지 주소
							String loadingAddr = freight.get("loadingAddress")+" "+freight.get("loadingDetailAddress");
							String unloadingAddr = freight.get("unloadingAddress")+" "+freight.get("unloadingDetailAddress");
							map.put("loadingFullAddress", loadingAddr);
							map.put("unloadingFullAddress", unloadingAddr);
						}
					}
					if(freightOwnerInfo != null) {
						Iterator<String> keys = freightOwnerInfo.keySet().iterator();
						while(keys.hasNext()) {
							String key = keys.next();
							map.put(key, freightOwnerInfo.get(key));
						}
					}
					if(carOwnerInfo != null) {
						Iterator<String> keys = carOwnerInfo.keySet().iterator();
						while(keys.hasNext()) {
							String key = keys.next();
							map.put(key, carOwnerInfo.get(key));
						}
					}
					if(charge != null) {
						Iterator<String> keys = charge.keySet().iterator();
						while(keys.hasNext()) {
							String key = keys.next();
							map.put(key, charge.get(key));
						}
					}

					// 마진요금 = 화주노출요금 - 차주노출요금으로 처리 (2022.04.21)
					int frgownCharge = 0;
					int carownCharge = 0;
					int marginCharge = 0;
					if(map.get("freightOwnerCharge") != null && map.get("carOwnerCharge") != null) {
						frgownCharge = (int) map.get("freightOwnerCharge");
						carownCharge = (int) map.get("carOwnerCharge");
						
						if(frgownCharge > 0 && carownCharge > 0) {
							marginCharge = frgownCharge-carownCharge;
						}
					}
					map.put("marginCharge", marginCharge);
					
					result.putAll(map);
				}
			}
		}
		
		orderAdminService.downloadExcel(request, response, result, mode);
	}
	
	/**
	 * 상세
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail/{mode}")
	public String selectOrder(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {

		if(vo.getOrderId() == null) {
			throw new ServiceException("orderId is null");
		}
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("authGroupCode", session.getAdminAuthorityGroupCode());
		model.addAttribute("profiles", profiles);
		
		Map result = orderAdminService.selectOrder(request, session, vo);
		model.addAttribute("result", result); //주문상세
		model.addAttribute("history", orderAdminService.listOrderHistory(request, session, vo)); //변경이력
		model.addAttribute("vocList", orderAdminService.listVoc(request, session, vo)); //VOC이력

		// 공통코드
		model.addAttribute("freightType", commonService.listCode(session, "freightType")); //화물종류
		model.addAttribute("deliveryTemperature", commonService.listCode(session, "deliveryTemperature")); //배송온도
		model.addAttribute("packagingType", commonService.listCode(session, "packagingType")); //화물적재종류
		model.addAttribute("freightLoadingSize", commonService.listCode(session, "freightLoadingSize")); //화물사이즈
		model.addAttribute("carModel", commonService.listCode(session, "carModel")); //차량톤수
		model.addAttribute("carType", commonService.listCode(session, "carType")); //차량형태
		model.addAttribute("carOption", commonService.listCode(session, "carOption")); //차량옵션
		model.addAttribute("loadingFreightMethod", commonService.listCode(session, "loadingFreightMethod")); //화물적재방법
		
		return "/html/order/OrderDetail";
	}
	
	/**
	 * 주문취소 팝업
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cancel.popup")
	public String orderCancel(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/order/OrderCancelPopup";
	}
	
	/**
	 * 주문취소
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cancel")
	public @ResponseBody Map orderCancel(HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		
		if(vo.getOrderId() == null) {
			throw new ServiceException("orderId is null");
		}
		
		SessionVO session = getSessionVO(request, response);
		return orderAdminService.orderCancel(request, session, vo);
	}
	
	/**
	 * 주소검색 폼
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addr/search/{mode}")
	public String searchAddr(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("mode", mode);
		return "/html/order/AddressSearch";
	}
	
	/**
	 * 주소검색 결과(목록)
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addr/list/{mode}")
	public String listAddr(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		model.addAttribute("result", orderAdminService.listAddr(vo));
		model.addAttribute("mode", mode);
		return "/html/order/AddressList";
	}
	
	/**
	 * 표준요금 재계산
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/recompute")
	public @ResponseBody Map recomputeCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		Map result = orderAdminService.recomputeCharge(session, vo);
		return result;
	}
	
	/**
	 * 배송추적 팝업
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tracking")
	public String trackOrder(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		SimpleDateFormat format = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		
		Enumeration params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String key = (String) params.nextElement();
			map.put(key, request.getParameter(key));
		  
			if(key.equals("loadingDateTime") && request.getParameter(key) != null && !request.getParameter(key).equals("")) {
				Date loadingDateTime = format.parse(request.getParameter(key));
				map.put(key, sdf.format(loadingDateTime));
			} else if(key.equals("unloadingDateTime") && request.getParameter(key) != null && !request.getParameter(key).equals("")) {
				Date unloadingDateTime = format.parse(request.getParameter(key));
				map.put(key, sdf.format(unloadingDateTime));
			}
		}
		model.addAttribute("info", map);
		
		return "/html/order/OrderTracking.tiles.co";
	}
	
	/**
	 * 배송추적 - 좌표(위경도) 조회
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/coordinate")
	public @ResponseBody Map getCoordinate(HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		
		if(vo.getDeliveryId() == null) {
			throw new ServiceException("deliveryId is null");
		}
		
		SessionVO session = getSessionVO(request, response);
		return orderAdminService.getCoordinate(session, vo);
	}
	
	/**
	 * 비상배차 - 차주조회 팝업
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carowner")
	public String carOwner(HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		model.addAttribute("mode", vo.getMode());
		model.addAttribute("authGroupCode", vo.getAuthGroupCode());
		return "/html/order/owner/CarOwner";
	}
	
	/**
	 * 비상배차 - 차주조회 검색 폼
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carowner/search/{mode}")
	public String searchCarOwner(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("mode", mode);
		return "/html/order/owner/CarOwnerSearch";
	}
	
	/**
	 * 비상배차 - 차주목록 조회
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carowner/list/{mode}")
	public String listCarOwner(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		if(mode.equals("normal")) {
			// 일반차주목록
			vo.setSort("carOwnerJoinDateTime");
			vo.setPagePerRows(10);
			vo.setCarOwnerType("normal");
			Map result = carownAdminService.listCarown(request, session, vo);
			
			// 차주 차량정보 매핑
			if(result != null) {
				if(result.get("list") != null) {
					List list = (List) result.get("list");
					
					for(int i=0; i<list.size(); i++) {
						Map map = (Map) list.get(i);
						
						String carOwnerId = map.get("carOwnerIdOrg").toString();
						vo.setCarOwnerId(carOwnerId);
						
						Map carInfo = carownAdminService.selectCar(request, session, vo);
						if(carInfo != null && !carInfo.isEmpty()) {
							List carList = (List) carInfo.get("carList");
							
							if(carList != null && !carList.isEmpty()) {
								carInfo = (Map) carList.get(0);
								map.put("carInfo", carInfo);
							}
						}
					}
				}
			}
			model.addAttribute("result", result);
			logger.debug("result={}", result);
			
		} else if(mode.equals("emergency")) {
			// 비상차주 목록
			Map result = orderAdminService.listEmerCarown(request, session, vo);
			model.addAttribute("result", result);
		} else {
			throw new ServiceException("carown mode is null");
		}
		model.addAttribute("mode", mode);
		model.addAttribute("carType", commonService.listCode(session, "carType")); //차종
		model.addAttribute("carModel", commonService.listCode(session, "carModel")); //중량
		
		return "/html/order/owner/CarOwnerList";
	}
	
	/**
	 * 비상배차 - 비상차주 등록 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carowner/add")
	public String addCarOwner(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("carType", commonService.listCode(session, "carType")); //차종
		model.addAttribute("carModel", commonService.listCode(session, "carModel")); //중량
		return "/html/order/owner/CarOwnerSave";
	}
	
	/**
	 * 비상배차 - 비상차주 등록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carowner/save")
	public @ResponseBody Map saveCarOwner(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		Map result = orderAdminService.saveEmerCarOwner(request, session, vo);
		return result;
	}
	
	/**
	 * 배차취소 팝업
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/dispatch/cancel.popup")
	public String dispatchCancel(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/order/DispatchCancelPopup";
	}
	
	/**
	 * 배차취소
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/dispatch/cancel")
	public @ResponseBody Map dispatchCancel(HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		
		if(vo.getDeliveryId() == null) {
			throw new ServiceException("deliveryId is null");
		}
		
		SessionVO session = getSessionVO(request, response);
		return orderAdminService.dispatchCancel(session, vo);
	}
	
	/**
	 * 상차완료/하차완료 팝업
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update.orderinfo/{mode}")
	public String updateLoadingAndUnloadingDateTime(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		model.addAttribute("mode", mode);
		model.addAttribute("freightOwnerType", vo.getFreightOwnerType());
		return "/html/order/UpdateOrderInfoPopup";
	}
	
	/**
	 * 상차완료/하차완료 저장
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update.loadunload/{mode}")
	public @ResponseBody Map updateLoadUnload(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		Map result = new HashMap<>();
		
		if(mode.equals("load")) {
			//상차완료
			Map loadCompleted = orderAdminService.insertLoadingCompleted(request, session, vo);
			result.put("loadCompleted", loadCompleted);
		} else if(mode.equals("unload")) {
			//하차완료
			Map unloadCompleted = orderAdminService.insertUnloadingCompleted(request, session, vo);
			result.put("unloadCompleted", unloadCompleted);
		} else {
			throw new ServiceException("load_unload mode is null");
		}
		
		return result;
	}
	
	/**
	 * 비상배차 사유 팝업
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/emer/reason.popup")
	public String insertEmerReason(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/order/EmergencyReasonPopup";
	}
	
	/**
	 * 탭별 변경사항 저장
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @param JSONdata
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update/{mode}")
	public @ResponseBody Map updateOrder(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo
			, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {

		SessionVO session = getSessionVO(request, response);
		Map result = new HashMap<>();
		
		if(mode.equals("tab01")) { //기본정보 탭
			//주문수정
			Map updateOrder = orderAdminService.updateOrder(session, vo);
			result.put("updateOrder", updateOrder);
				
		} else if(mode.equals("tab02")) { //요금조정 탭
			//할증률 저장
			if(vo.getRound() != 0) {
				Map premiumRate = orderAdminService.updatePremiumRate(session, vo);
				result.put("premiumRate", premiumRate);
			}
			
			//위약수수료(대기비) 등록
			if(JSONdata != null && !JSONdata.equals("")) {
				String deJSONdata = UtilFunctions.decodeXss(JSONdata.replaceAll("&quot;", "\""));
				List list = new ObjectMapper().readValue(deJSONdata, List.class);
				
				for(int i=0; i<list.size(); i++) {
					Map map = (Map) list.get(i);
					
					Iterator<String> keys = map.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						
						if(!map.get(key).equals("")) {
							int price = Integer.valueOf(map.get(key).toString().replace(",","").replace("원",""));
							vo.setOwnerSettlementType(key);
							vo.setOwnerSettlementPrice(price);
							
							Map penaltyFee = orderAdminService.updatePenaltyFee(request, session, vo);
							result.put("penaltyFee", penaltyFee);
						}
					}
				}
			}
			
		} else if(mode.equals("tab03")) { //배송정보 탭
			//비상배차 등록
			Map insertEmerDispatch = orderAdminService.insertEmerDispatch(request, session, vo);
			result.put("insertEmerDispatch", insertEmerDispatch);
		} else {
			throw new ServiceException("order detail tab is null");
		}
		
		return result;
	}
	
}
