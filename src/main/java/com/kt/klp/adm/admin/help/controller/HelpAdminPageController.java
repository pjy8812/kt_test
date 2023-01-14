package com.kt.klp.adm.admin.help.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;

/**
*
* HelpAdminPageController : APP/WEB(고객센터) page controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.25      Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.25
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/page/help")
public class HelpAdminPageController extends PageController {
	
	public static final String PAGE_NOTICE_TITLE = "공지사항";
	public static final String PAGE_FAQ_TITLE = "FAQ";
	public static final String PAGE_VOC_TITLE = "1:1문의";
	public static final String PAGE_SEND_TITLE = "발송관리";
	public static final String PAGE_MANUAL_TITLE = "매뉴얼";
	public static final String PAGE_BREAD_CRUMB = "홈 > 고객센터 > ";
	
	// 운영환경 분기 
	@Value("${spring.profiles}")
	private String profiles;

	/**
	 * 공지사항
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/notice")
	public String notice(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_NOTICE_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_NOTICE_TITLE);
		return "/page/help/Notice.tiles";
	}
	
	/**
	 * FAQ
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/faq")
	public String faq(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_FAQ_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_FAQ_TITLE);
		return "/page/help/Faq.tiles";
	}
	
	/**
	 * 1:1문의
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/voc")
	public String voc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_VOC_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_VOC_TITLE);
		model.addAttribute("profiles", profiles);
		return "/page/help/Voc.tiles";
	}
	
	/**
	 * (SMS/이메일) 발송관리 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/send")
	public String sms(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_SEND_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_SEND_TITLE);
		return "/page/help/Send.tiles";
	}
	
	
	/**
	 * 매뉴얼
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/manual")
	public String manual(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("pageTitle", PAGE_MANUAL_TITLE);
		model.addAttribute("breadCrumb", PAGE_BREAD_CRUMB+PAGE_MANUAL_TITLE);
		return "/page/help/Manual.tiles";
	}
	
}
