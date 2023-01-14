package com.kt.klp.adm.admin.settlement.controller;

import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.settlement.domain.SettlementIntegrationVO;
import com.kt.klp.adm.admin.settlement.service.SettlementIntegrationAdminSerivce;

import kr.co.iousoft.lib.core.controller.ServiceController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* SettlementIntegrationAdminServiceController : 정산관리> 통합주문조회 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------ㅇ
* 2022.11.30       Seongrae Kim     Initial creation
* </pre>
*
* @author PARUCNC Seongrae Kim (akaikarus@parucnc.com)
* @since 2022.11.30
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/service/settlement/integration")
public class SettlementIntegrationAdminServiceController extends ServiceController {

	public static final String[] SETTLEMENT_INTEGRATION_HEADERS = {
		"No", "주문번호", "정산마감일"
	};
	
	public static final String[] SETTLEMENT_INTEGRATION_ORDER_HEADERS = {
		"주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소"
	};
	
	public static final String[] SETTLEMENT_INTEGRATION_SETTLEMENT_HEADERS = {
		"주문금액", "위약수수료", "인수증"
	};
	
	public static final String[] SETTLEMENT_INTEGRATION_PAYMENT_HEADERS = {
		"배송비", "기타 추가비용", "인수증", "지급금액", "진행상태", "스마트로 주문번호", "스마트로 결제일시"
	};
	
	public static final String[] SETTLEMENT_INTEGRATION_PAYMENT_AMOUNT_HEADERS = {
		"공급가액<br>(배송비+이동비+대기비)", "부가세", "총합"
	};
	
	public static final String[] SETTLEMENT_FREIGHT_OWNER_HEADERS = {
		"화주명", "화주ID", "화주사", "청구ID", "청구금액", "청구마감월", "청구상태"
	};
	
	public static final String[] SETTLEMENT_CAR_OWNER_HEADERS = {
		"차량번호", "차주명","차주ID", "운송대행사", "운송대행사<br>ID", "운송대행사<br>사업자번호", "지급ID", "지급방법", "지급금액", "지급마감월", "지급상태"
	};
	
	@Autowired
	protected SettlementIntegrationAdminSerivce settlementIntegrationAdminSerivce;
	
	@Autowired
	protected CommonService commonService;
	
	/**
	 * 정산 - 화주정산 - 검색 폼 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		model.addAttribute("frgSettlementStatusList", commonService.listCode(session, "frgSettlementStatus"));
		model.addAttribute("carSettlementStatusList", commonService.listCode(session, "carSettlementStatus"));
		
		return "/html/settlement/integration/IntegrationSearch";
	}
	

	/**
	 * 정산 - 통합 주문조회 - 목록 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestBody SettlementIntegrationVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		// 마스킹 
		if (vo.getMaskingYn() == null) {
			vo.setMaskingYn("Y");
		}
		
		Map<String, String[]> headersMap = new HashMap<>();
		headersMap.put("integrationHeaders", SETTLEMENT_INTEGRATION_HEADERS);
		headersMap.put("freightOwnerHeaders", SETTLEMENT_FREIGHT_OWNER_HEADERS);
		headersMap.put("carOwnerHeaders", SETTLEMENT_CAR_OWNER_HEADERS);
		model.addAttribute("headersMap", headersMap);
		
		model.addAttribute("headers", Arrays.asList(SETTLEMENT_FREIGHT_OWNER_HEADERS));
		model.addAttribute("result", settlementIntegrationAdminSerivce.getList(request, response, session, vo));
		
		return "/html/settlement/integration/IntegrationList";
	}
	
	/**
	 * 정산 - 화주정산 - 상세
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail/{freightOwnerSettlementId}/{obj}")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("freightOwnerSettlementId") String freightOwnerSettlementId, @PathVariable("obj") String obj, String maskingYn) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		model.addAttribute("orderHeaders", SETTLEMENT_INTEGRATION_ORDER_HEADERS);
		model.addAttribute("settlementHeaders", SETTLEMENT_INTEGRATION_SETTLEMENT_HEADERS);
		model.addAttribute("paymentHeaders", SETTLEMENT_INTEGRATION_PAYMENT_HEADERS);
		model.addAttribute("amountHeaders", SETTLEMENT_INTEGRATION_PAYMENT_AMOUNT_HEADERS);

		model.addAttribute("freightOwnerSettlementId", freightOwnerSettlementId);
		model.addAttribute("result", settlementIntegrationAdminSerivce.getDetail(request, response, session, freightOwnerSettlementId, obj, maskingYn));
		
		return "/html/settlement/integration/IntegrationDetail";
	}
	
	
	/**
	 * 통합 주문조회 - 상세 - 차주/화주 정보 조회
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param ownerSettlementId
	 * @param own
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select/{ownerSettlementId}/{own}")
	public @ResponseBody Map select(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("ownerSettlementId") String ownerSettlementId, @PathVariable("own") String own) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		return settlementIntegrationAdminSerivce.getOwner(request, response, session, ownerSettlementId, own);
	}
	
	/**
	 * 정산 - 통합주문조회- 목록 - 엑셀 다운로드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download")
	public void excelDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {

		String decodeJSONdata = URLDecoder.decode(JSONdata, "UTF-8");
		decodeJSONdata = UtilFunctions.decodeXss(decodeJSONdata);

		ObjectMapper mapper = new ObjectMapper();
		Map result = mapper.readValue(decodeJSONdata, Map.class);
		
		SettlementIntegrationVO vo = new SettlementIntegrationVO();
		vo.loadMap(result);
		
		SessionVO session = getSessionVO(request, response);
		settlementIntegrationAdminSerivce.getExcel(request, response, session, vo);
	}
	
	/**
	 * 정산 - 통합주문조회 - 상세 - 주문상세
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/order/detail/{orderId}/{maskingYn}")
	public String orderDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@PathVariable("orderId") String orderId, @PathVariable("maskingYn") String maskingYn) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		Map result = null;
		
		model.addAttribute("packagingTypeList", commonService.listCode(session, "packagingType"));
		model.addAttribute("freightTypeList", commonService.listCode(session, "freightType"));
		model.addAttribute("deliveryTemperatureList", commonService.listCode(session, "deliveryTemperature"));
		model.addAttribute("carTypeList", commonService.listCode(session, "carType"));
		model.addAttribute("carModelList", commonService.listCode(session, "carModel"));
		model.addAttribute("loadingFreightMethodList", commonService.listCode(session, "loadingFreightMethod"));
		model.addAttribute("orderId", orderId);
		
		List carOptionList = getCarOption(session);
		model.addAttribute("carOptionList", carOptionList);
		
		result = settlementIntegrationAdminSerivce.getOrderList(request, response, session, orderId, maskingYn, carOptionList);
		
		model.addAttribute("result", result);
		
		return "/html/settlement/integration/IntegrationOrderDetailPopup";
	}
	
	private List getCarOption(SessionVO session) throws Exception {
		List result = commonService.listCode(session, "carOption");
		
		Iterator it = result.iterator();
		
		while (it.hasNext()) {
			Map carOption = (Map) it.next();
			
			if (carOption.get("codeId").equals("lift")) {
				it.remove();
			} else if (carOption.get("codeId").equals("antiSwing")) {
				it.remove();
			}
		}
		
		return result;
	}
}
