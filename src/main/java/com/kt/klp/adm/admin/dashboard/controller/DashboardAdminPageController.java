package com.kt.klp.adm.admin.dashboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* DashboardAdminPageController : 대시보드 page contoller
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
@RequestMapping("/ui/page/dashboard")
public class DashboardAdminPageController extends PageController {
	
	public static final String PAGE_TITLE = "대시보드";
	public static final String PAGE_BREAD_CRUMB = "";
	
	@Value("${spring.profiles}")
	private String profiles;
	
	/**
	 * 대시보드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		// model.addAttribute("pageTitle", PAGE_TITLE);
		// model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB);
		model.addAttribute("profiles", profiles);
		return "/page/dashboard/Index.tiles";
	}
	

}
