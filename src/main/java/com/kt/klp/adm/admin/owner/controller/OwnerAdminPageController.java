package com.kt.klp.adm.admin.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* OwnerAdminPageController : 회원관리 page controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.19       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.19
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/page/owner")
public class OwnerAdminPageController extends PageController {
	
	public static final String PAGE_CAROWN_TITLE = "차주관리";
	public static final String PAGE_FRGOWN_TITLE = "화주관리";
	public static final String PAGE_CARRIER_TITLE = "운송대행사 관리";
	public static final String PAGE_BREAD_CRUMB = "홈 > 회원관리 > ";

	/**
	 * 화주관리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/frgown")
	public String frgown(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_FRGOWN_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_FRGOWN_TITLE);
		return "/page/owner/Frgown.tiles";
	}
	
	/**
	 * 차주관리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carown")
	public String carown(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_CAROWN_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_CAROWN_TITLE);
		return "/page/owner/Carown.tiles";
	}
	
	/**
	 * 운송대행사 관리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carrier")
	public String carrier(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_CARRIER_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_CARRIER_TITLE);
		return "/page/owner/Carrier.tiles";
	}
	
}
