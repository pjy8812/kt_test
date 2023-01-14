package com.kt.klp.adm.admin.stats.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* StatsAdminPageController : 통계 page controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.27       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.04.27
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/page/stats")
public class StatsAdminPageController extends PageController {
	
	public static final String PAGE_TITLE_AMOUNT = "물량 통계";
	public static final String PAGE_BREAD_CRUMB_AMOUNT = "홈 > 통계관리 > 물량현황";
	
	public static final String PAGE_TITLE_CAR = "차량 현황";
	public static final String PAGE_BREAD_CRUMB_CAR = "홈 > 통계관리 > 차량현황";
	
	public static final String PAGE_TITLE_USER = "이용자 통계";
	public static final String PAGE_BREAD_CRUMB_USER = "홈 > 통계관리 > 이용자현황";
	
	/**
	 * 통계 - 물량
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/amount")
	public String amountStats(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_AMOUNT);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_AMOUNT);
		return "/page/stats/Amount.tiles";
	}
	
	/**
	 * 통계 - 차량
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/car")
	public String carStats(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_CAR);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_CAR);
		return "/page/stats/Car.tiles";
	}
	
	/**
	 * 통계 - 이용자
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user")
	public String userStats(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_USER);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_USER);
		return "/page/stats/User.tiles";
	}
	
}
