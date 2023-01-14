package com.kt.klp.adm.admin.system.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* SystemAdminPageController : 시스템 page controller
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

@Controller
@RequestMapping("/ui/page/system")
public class SystemAdminPageController extends PageController {
	
	public static final String PAGE_TITLE_ACCOUNT_AUTH = "계정/권한 관리";
	public static final String PAGE_BREAD_CRUMB_ACCOUNT_AUTH = "홈 > 시스템 > 계정/권한 관리";

	public static final String PAGE_TITLE_DEVICE = "차주 단말기 정보 관리";
	public static final String PAGE_BREAD_CRUMB_ACCOUNT_DEVICE = "홈 > 시스템 > 차주 단말기 정보";
	
	public static final String PAGE_TITLE_COMMON_CODE = "공통코드";
	public static final String PAGE_BREAD_CRUMB_COMMON_CODE = "홈 > 시스템 > 공통코드";
	
	public static final String PAGE_TITLE_MENU_MANAGEMENT = "메뉴관리";
	public static final String PAGE_BREAD_CRUMB_MENU_MANAGEMENT = "홈 > 시스템 > 메뉴관리";


	/**
	 * 시스템 - 관리자 계정/권한 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/account")
	public String account(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_ACCOUNT_AUTH);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_ACCOUNT_AUTH);
		return "/page/system/Account.tiles";
	}
	
	/**
	 * 시스템 - 단말기 정보  
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/device")
	public String device(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_DEVICE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_ACCOUNT_DEVICE);
		return "/page/system/Device.tiles";
	}
	
	/**
	 * 시스템 - 공통코드
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/code")
	public String code(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_COMMON_CODE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_COMMON_CODE);
		return "/page/system/Code.tiles";
	}
	
	/**
	 * 시스템 - 메뉴관리
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/menu")
	public String menu(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	        model.addAttribute("pageTitle", PAGE_TITLE_MENU_MANAGEMENT);
	        model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_MENU_MANAGEMENT);
	        return "/page/system/Menu.tiles";
	}
	
}
