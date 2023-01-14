package com.kt.klp.adm.admin.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* OrderAdminPageController : 주문배송 page controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.12       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.12
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/page/order")
public class OrderAdminPageController extends PageController {
	
	public static final String PAGE_TITLE = "주문/배송";
	public static final String PAGE_BREAD_CRUMB = "홈 > 주문/배송 > 주문/배송";
	
	public static final String PAGE_TITLE_MANUAL = "주문/배송(수동배차)";
	public static final String PAGE_BREAD_CRUMB_MANUAL = "홈 > 주문/배송 > 주문/배송(수동배차)";
	
	@Value("${spring.profiles}")
	private String profiles;
	
	/**
	 * 주문/배송
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mng")
	public String managementOrder(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB);
		model.addAttribute("profiles", profiles);
		return "/page/order/Order.tiles";
	}
	
	/**
	 * 주문/배송(수동배차)
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/manual")
	public String managementOrderManual(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_TITLE_MANUAL);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB_MANUAL);
		model.addAttribute("mode", "manual");
		model.addAttribute("profiles", profiles);
		return "/page/order/Order.tiles";
	}
	
}
