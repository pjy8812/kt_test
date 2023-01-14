package com.kt.klp.adm.admin.settlement.controller;

import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
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
import com.kt.klp.adm.admin.settlement.domain.SettlementFreightOwnerVO;
import com.kt.klp.adm.admin.settlement.service.SettlementFreightOwnerAdminSerivce;

import kr.co.iousoft.lib.core.controller.ServiceController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* SettlementFreightAdminServiceController : 정산관리> 화주정산 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.19       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.19
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/service/settlement/frg")
public class SettlementFreightOwnerAdminServiceController extends ServiceController {

	public static final String[] SETTLEMENT_FREIGHT_OWNER_HEADERS = {
		"No", "계약구분", "사업자구분", "사업자유형", "회원번호", "화주명", "화주ID", "사업자번호", "화주사", "대표자명", "전화번호", "이메일주소", "청구", "청구ID", "청구발생일", "건수",
		"총 청구금액", "청구상태", "입금완료일"
	};
	
	public static final String[] SETTLEMENT_FREIGHT_OWNER_DETAIL_HEADERS = {
		"주문번호" , "주문상태", "주문등록", "배차완료", "상차완료", "하차완료", "주문취소", "주문금액", "위약수수료", "인수증"
	};
	
	@Autowired
	protected SettlementFreightOwnerAdminSerivce settlementFreightOwnerAdminSerivce;
	
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
		model.addAttribute("freightOwnerTypeList", commonService.listCode(session, "freightOwnerType"));
		model.addAttribute("freightOwnerSettlementStatusList", commonService.listCode(session, "frgSettlementStatus"));
		model.addAttribute("freightBusinessTypeList", commonService.listCode(session, "businessType"));
		model.addAttribute("freightMemberTypeList", commonService.listCode(session, "memberType"));
		// model.addAttribute("searchTypeTypeList", SettlementFreightOwnerVO.SEARCH_TYPE_TYPE);
		
		return "/html/settlement/frgown/FrgownSearch";
	}
	
	/**
	 * 정산 - 화주정산 - 목록 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestBody SettlementFreightOwnerVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		// 마스킹 
	    if (vo.getMaskingYn() == null) {
	      vo.setMaskingYn("Y");
	    }
		
		model.addAttribute("headers", Arrays.asList(SETTLEMENT_FREIGHT_OWNER_HEADERS));
		model.addAttribute("result", settlementFreightOwnerAdminSerivce.getList(request, response, session, vo));
		
		return "/html/settlement/frgown/FrgownList";
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
	@RequestMapping(value = "/detail/{freightOwnerSettlementId}/{pageIndex}")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@PathVariable("freightOwnerSettlementId") String freightOwnerSettlementId, @PathVariable("pageIndex") int pageIndex, String maskingYn) throws Exception {
		
		SessionVO session = getSessionVO(request, response);

		model.addAttribute("headers", Arrays.asList(SETTLEMENT_FREIGHT_OWNER_DETAIL_HEADERS));
		model.addAttribute("freightOwnerSettlementId", freightOwnerSettlementId);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("result", settlementFreightOwnerAdminSerivce.getDetail(request, response, session, freightOwnerSettlementId, pageIndex, maskingYn));
		
		return "/html/settlement/frgown/FrgownDetail";
	}
	
	/**
	 * 정산 - 화주정산 - 목록 - 엑셀 다운로드 
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
		
		SettlementFreightOwnerVO vo = new SettlementFreightOwnerVO();
		vo.loadMap(result);
		
		SessionVO session = getSessionVO(request, response);
		settlementFreightOwnerAdminSerivce.getExcel(request, response, session, vo);
	}
	
	/**
	 * 정산 - 화주정산 - 상세 - 정산목록 - 엑셀 다운로드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/downloadDetail/{freightOwnerSettlementId}")
	public void excelDownloadDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("freightOwnerSettlementId") String freightOwnerSettlementId) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		settlementFreightOwnerAdminSerivce.getDetailExcel(request, response, session, freightOwnerSettlementId);
		
	}
	
	/**
	 * 정산 - 화주정산 - 상세 - 입금완료 처리 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/update/payment/{freightOwnerSettlementId}")
	public @ResponseBody Map updatePayment(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("freightOwnerSettlementId") String freightOwnerSettlementId) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		return settlementFreightOwnerAdminSerivce.updatePayment(request, response, session, freightOwnerSettlementId);
		
	}
	
	/**
	 * 정산 - 화주정산 - 상세 - 입금완료 팝업
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/update/payment/{freightOwnerSettlementId}")
	public String updatePaymentPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("freightOwnerSettlementId") String freightOwnerSettlementId) throws Exception {

		Map<String, Object> result = new HashMap<>();
		String freightOwnerSettlementPrice = request.getParameter("freightOwnerSettlementPrice");
		SessionVO session = getSessionVO(request, response);
		
		result.put("freightOwnerSettlementPrice", freightOwnerSettlementPrice);
		result.put("freightOwnerSettlementId", freightOwnerSettlementId);
		model.addAttribute("result", result);

		return "/html/settlement/frgown/FrgownPaymentPopup";

	}
}
