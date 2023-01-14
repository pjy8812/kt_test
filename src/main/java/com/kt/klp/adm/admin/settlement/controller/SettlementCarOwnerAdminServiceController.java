package com.kt.klp.adm.admin.settlement.controller;

import java.net.URLDecoder;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.settlement.domain.SettlementCarOwnerVO;
import com.kt.klp.adm.admin.settlement.service.SettlementCarOwnerAdminService;

import kr.co.iousoft.lib.core.controller.ServiceController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;


/**
*
* SettlementCarOwnerAdminServiceController : 정산관리> 차주정산 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.25       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.25
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/service/settlement/car")
public class SettlementCarOwnerAdminServiceController extends ServiceController {

	// 운영환경 분기 
	@Value("${spring.profiles}")
	private String profiles;
	
	public static final String[] SETTLEMENT_CAR_OWNER_SETTLEMENT_HEADERS_PROD = {
		"No", "차주명", "차주ID", "회사명", "전화번호", "이메일주소", "지급ID", "지급발생일", "등록건수", "지급건수", "취소건수",
		"총 지급금액", "지급상태", "지급완료일"
	};
	
	public static final String[] SETTLEMENT_CAR_OWNER_SETTLEMENT_HEADERS = {
		"No", "차주명", "차주ID", "회원등록번호", "차주사", "사업자등록번호", "전화번호", "이메일주소", "지급ID", "지급발생일", "등록건수", "전송실패", "지급대상", "취소건수",
		"지급대상금액", "지급완료금액", "지급상태", "지급완료일"
	};
	
	// 20220426
//	public static final String[] SETTLEMENT_CAR_OWNER_SETTLEMENT_HEADERS_PROD = {
//		"No", "회원명", "회원ID", "회사명", "전화번호", "이메일주소", "정산ID", "정산발생일", "등록건수", "정산건수", "취소건수",
//		"총 정산금액", "정산상태", "정산완료일"
//	};
	
	public static final String[] SETTLEMENT_CAR_OWNER_ORDER_HEADERS = {
		"No", "차주명", "차주ID", "지급ID", "주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "배송비", "이동비", 
		"상차지<br>대기비", "하차지<br>대기비", "인수증", "공급가액", "진행상태", "재요청발생일시", "지급완료일시"
	};
	
	public static final String[] SETTLEMENT_CAR_OWNER_ORDER_HEADERS_PROD = {
		"No", "차주명", "차주ID", "지급ID", "주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "배송비", "이동비", "대기비", "인수증", "공급가액", "진행상태", "지급완료일"
	};
	
	// 20220426
//	public static final String[] SETTLEMENT_CAR_OWNER_ORDER_HEADERS_PROD = {
//		"No", "회원명", "회원ID", "정산ID", "주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "배송비", "이동비", "대기비", "인수증", "정산금액" , "승인상태", "정산완료일"
//		// "No", "회원명", "회원ID", "정산ID", "주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "배송비", "이동비", "대기비", "인수증", "정산금액" , "진행상태", "정산완료일"
//	};
	
	public static final String[] SETTLEMENT_CAR_OWNER_DETAIL_HEADERS_PROD = {
		"주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "배송비", "이동비", "대기비", 
		"인수증", "지급금액", "지급상태"
	};
	
	public static final String[] SETTLEMENT_CAR_OWNER_DETAIL_HEADERS = {
		"주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "배송비", "이동비", "상차지<br>대기비", "하차지<br>대기비",
		"인수증", "지급대상금액", "지급완료금액", "지급상태", "재요청발생일시", "지급완료일시", "스마트로 주문번호", "스마트로 결제일시"
	};
	
	// 20220426
//	public static final String[] SETTLEMENT_CAR_OWNER_DETAIL_HEADERS_PROD = {
//		"주문번호", "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "배송비", "이동비", "대기비", 
//		"인수증", "정산금액", "승인상태"
//	};
	
	@Autowired
	protected SettlementCarOwnerAdminService settlementCarOwnerAdminService;

	@Autowired
	protected CommonService commonService;
	
	/**
	 * 정산 - 차주정산 - 검색 폼 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, String pageType) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("settlementStatusList", commonService.listCode(session, "carSettlementStatus"));
		model.addAttribute("settlementApprovalStatus", commonService.listCode(session, "settlementApprovalStatus"));
		// model.addAttribute("carOwnerSettlementStatusList", SettlementCarOwnerVO.SETTLEMENT_STATUS);
		// model.addAttribute("searchTypeTypeList", SettlementCarOwnerVO.SEARCH_TYPE_TYPE);
		model.addAttribute("pageType", pageType);
		
		// TODELETE
//		if(profiles.equals("prod")) {
//			logger.debug("profiles={}", profiles);
//			return "/html/settlement/carown/prod/CarownSearch";
//		}
		
		return "/html/settlement/carown/CarownSearch";
	}
	
	/**
	 * 정산 - 차주정산 - 목록 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestBody SettlementCarOwnerVO vo) throws Exception {
		
		// 마스킹 
		if (vo.getMaskingYn() == null) {
			vo.setMaskingYn("Y");
		}
		
		// logger.debug("vo.getPageType()={}", vo.getPageType());
		// logger.debug("vo.getPageType()={}", vo.getPageType().equals(vo.PAGE_TYPE_ORDER));

		model.addAttribute("pageType", vo.getPageType());
		
		if(vo.getPageType().equals(vo.PAGE_TYPE_ORDER)) {
			
			model.addAttribute("headers", Arrays.asList(SETTLEMENT_CAR_OWNER_ORDER_HEADERS));
			
			// TODELETE
//			if(profiles.equals("prod")) {
//				logger.debug("profiles={}", profiles);
//				model.addAttribute("headers", Arrays.asList(SETTLEMENT_CAR_OWNER_ORDER_HEADERS_PROD));
//			}
		} else { 
			model.addAttribute("headers", Arrays.asList(SETTLEMENT_CAR_OWNER_SETTLEMENT_HEADERS));
			
			// TODELETE
//			if(profiles.equals("prod")) {
//				logger.debug("profiles={}", profiles);
//				model.addAttribute("headers", Arrays.asList(SETTLEMENT_CAR_OWNER_SETTLEMENT_HEADERS_PROD));
//			}
		}
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("result", settlementCarOwnerAdminService.getList(request, response, session, vo));
		
		// TODELETE
//		if(profiles.equals("prod")) {
//			logger.debug("profiles={}", profiles);
//			return "/html/settlement/carown/prod/CarownList";
//		}
	
		return "/html/settlement/carown/CarownList";
	}
	
	/**
	 * 정산 - 차주정산 - 상세
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail/{carOwnerSettlementId}/{pageIndex}")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("carOwnerSettlementId") String carOwnerSettlementId, @PathVariable("pageIndex") int pageIndex, String maskingYn) throws Exception {
		
		// logger.debug("carOwnerSettlementId={}", carOwnerSettlementId);
		// logger.debug("nowPage={}", pageIndex);
		
		model.addAttribute("headers", Arrays.asList(SETTLEMENT_CAR_OWNER_DETAIL_HEADERS));
		
		// TODELETE
//		if(profiles.equals("prod")) {
//			logger.debug("profiles={}", profiles);
//			model.addAttribute("headers", Arrays.asList(SETTLEMENT_CAR_OWNER_DETAIL_HEADERS_PROD));
//		}
		
		model.addAttribute("carOwnerSettlementId", carOwnerSettlementId);
		model.addAttribute("pageIndex", pageIndex);
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("result", settlementCarOwnerAdminService.getDetail(request, response, session, carOwnerSettlementId, pageIndex, maskingYn));

		// TODELETE
//		if(profiles.equals("prod")) {
//			logger.debug("profiles={}", profiles);
//			return "/html/settlement/carown/prod/CarownDetail";
//		}
		
		return "/html/settlement/carown/CarownDetail";
	}
	
	/**
	 * 정산 - 차주정산 - 상세 - 지급방법
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param carOwnerSettlementId
	 * @param carOwnerSettlementPaymentMethod
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/payment/{carOwnerSettlementId}/{carOwnerSettlementPaymentMethod}")
	public String payment(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable(value = "carOwnerSettlementId") String carOwnerSettlementId,
			@PathVariable(value = "carOwnerSettlementPaymentMethod") String carOwnerSettlementPaymentMethod) throws Exception {
		model.addAttribute("carOwnerSettlementId", carOwnerSettlementId);
		model.addAttribute("carOwnerSettlementPaymentMethod", carOwnerSettlementPaymentMethod);
		
		return "/html/settlement/carown/CarownPayMethodPopup";
	}
	
	@RequestMapping(value = "/payment/update")
	public @ResponseBody Map paymentUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		return settlementCarOwnerAdminService.paymentUpdate(request, response, session);
	}
	
	/**
	 * 정산 - 차주정산 - 목록 - 엑셀 다운로드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download")
	public void excelDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		
		String decodeJSONdata = URLDecoder.decode(JSONdata, "UTF-8");
		decodeJSONdata = UtilFunctions.decodeXss(decodeJSONdata);

		// logger.debug("JsonData={}", JSONdata);
		// logger.debug("decodeJSONdata={}", decodeJSONdata);
		
		ObjectMapper mapper = new ObjectMapper();
		Map result = mapper.readValue(decodeJSONdata, Map.class);
		// logger.debug("result={}", result);
		
		SettlementCarOwnerVO vo = new SettlementCarOwnerVO();
		vo.loadMap(result);
		// logger.debug("result={}", vo);
		
		SessionVO session = getSessionVO(request, response);
		settlementCarOwnerAdminService.getExcel(request, response, session, vo);
	}
	
	/**
	 * 정산 - 차주정산 - 상세 - 엑셀 다운로드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/downloadDetail/{carOwnerSettlementId}")
	public void excelDownloadDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("carOwnerSettlementId") String carOwnerSettlementId) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		settlementCarOwnerAdminService.getDetailExcel(request, response, session, carOwnerSettlementId);
	}
	
	/**
	 * 정산 - 차주정산 - 승인 취소 처리 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/cancel/settlement")
	public @ResponseBody Map cancelSettlement(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			SettlementCarOwnerVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		return settlementCarOwnerAdminService.cancelSettlement(request, response, session, vo);
		
	}
	
	/**
	 * 정산 - 차주정산 - 취소후 재승인 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/reupload/settlement")
	public @ResponseBody Map reuploadSettlement(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			SettlementCarOwnerVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		return settlementCarOwnerAdminService.reuploadSettlement(request, response, session, vo);
		
	}
	
	/**
	 * 정산 - 차주정산 - 상세 - 선지급 상세 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail/popup")
	public String getDetailPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			SettlementCarOwnerVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("result", settlementCarOwnerAdminService.getDetailPopup(request, response, session, vo));
		model.addAttribute("vo", vo);
		
		return "/html/settlement/carown/CarownDetailPopup";
		
	}
	
}
