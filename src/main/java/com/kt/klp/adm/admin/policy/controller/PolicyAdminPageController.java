package com.kt.klp.adm.admin.policy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* PolicyAdminPageController : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.08       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.08
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/page/policy")
public class PolicyAdminPageController extends PageController {

	public static final String PAGE_TITLE_POLICY_TERMS = "약관";
	public static final String PAGE_TITLE_POLICY_TERMS_DETAIL_INSERT = "약관 등록";
	public static final String PAGE_TITLE_POLICY_TERMS_DETAIL_UPDATE = "약관 상세";
	public static final String PAGE_BREAD_CRUMB_POLICY_TERMS = "홈 > 정책관리 > 약관";
	
	public static final String PAGE_TITLE_POLICY_PENALTY = "패널티정책";
	public static final String PAGE_BREAD_CRUMB_POLICY_PENALTY = "홈 > 정책관리 > 패널티정책";
	
	public static final String PAGE_TITLE_POLICY_CHARGE = "요금정책";
	public static final String PAGE_BREAD_CRUMB_POLICY_CHARGE = "홈 > 정책관리 > 요금정책";
	
	/**
	 * 정책 - 약관 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/terms")
	public String terms(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("pageTitle", PAGE_TITLE_POLICY_TERMS);
		model.addAttribute("pageTitleInsert", PAGE_TITLE_POLICY_TERMS_DETAIL_INSERT);
		model.addAttribute("pageTitleUpdate", PAGE_TITLE_POLICY_TERMS_DETAIL_UPDATE);
		
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_POLICY_TERMS);
		
		return "/page/policy/Terms.tiles";
	}
	
	/**
	 * 정책 - 패널티정책
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/penalty")
	public String penalty(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("pageTitle", PAGE_TITLE_POLICY_PENALTY);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_POLICY_PENALTY);
		
		return "/page/policy/Penalty.tiles";
	}
	
	/**
	 * 정책 - 요금정책
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/charge")
	public String charge(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("pageTitle", PAGE_TITLE_POLICY_CHARGE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_POLICY_CHARGE);
		
		return "/page/policy/Charge.tiles";
	}
	
}
