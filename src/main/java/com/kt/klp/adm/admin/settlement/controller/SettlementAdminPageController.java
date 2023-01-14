package com.kt.klp.adm.admin.settlement.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* SettlementAdminPageController : 정산관리 page controller
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
@RequestMapping("/ui/page/settlement")
public class SettlementAdminPageController extends PageController {

	public static final String PAGE_TITLE_FREIGHT_OWNER = "화주정산";
	public static final String PAGE_BREAD_CRUMB_FREIGHT_OWNER = "홈 > 정산관리 > 화주정산";
	
	public static final String PAGE_TITLE_CAR_OWNER = "차주정산";
	public static final String PAGE_BREAD_CRUMB_CAR_OWNER = "홈 > 정산관리 > 차주정산";
	
	public static final String PAGE_TITLE_INTEGRATION = "통합 주문조회";
	public static final String PAGE_BREAD_CRUMB_INTEGRATION = "홈 > 정산관리 > 통합 주문조회";
	
	// 운영환경 분기 
	@Value("${spring.profiles}")
	private String profiles;
	
	/**
	 * 정산 - 화주정산 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/frgown")
	public String freightOwner(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("pageTitle", PAGE_TITLE_FREIGHT_OWNER);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_FREIGHT_OWNER);
		
		return "/page/settlement/FreightOwner.tiles";
	}
	
	/**
	 * 정산 - 차주정산 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carown")
	public String carOwner(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("pageTitle", PAGE_TITLE_CAR_OWNER);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_CAR_OWNER);
		
		model.addAttribute("profiles", profiles);
		
		// TODELETE
//		if(profiles.equals("prod")) {
//			logger.debug("profiles={}", profiles);
//			return "/page/settlement/prod/CarOwner.tiles";
//		}
		
		return "/page/settlement/CarOwner.tiles";
	}
	
	/**
	 * 정산 - 통합주문조회
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/integration")
	public String integration(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_INTEGRATION);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_INTEGRATION);
		
		return "/page/settlement/Integration.tiles";
	}
}
