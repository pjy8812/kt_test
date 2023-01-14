package com.kt.klp.adm.admin.system.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.system.domain.MenuVO;
import com.kt.klp.adm.admin.system.service.SystemMenuAdminService;

import kr.co.iousoft.lib.core.controller.PageController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

/**
*
* systemMenuAdminServiceController : 메뉴 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.11.22       Seongrae Kim     Initial creation
* </pre>
*
* @author PARUCNC Seongrae Kim (akaikarus@parucnc.com)
* @since 2022.11.22
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/system/menu")
public class SystemMenuAdminServiceController extends PageController {
	
	@Resource(name = "systemMenuAdminService")
	protected SystemMenuAdminService systemMenuAdminService;
	
	/**
	 * 공통코드 검색 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String searchCode(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/system/menu/MenuSearch";
	}
	
	/**
	 * 공통코드 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String listCode(HttpServletRequest request, HttpServletResponse response, ModelMap model, MenuVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		model.addAttribute("result", systemMenuAdminService.listMenu(session, vo));
		return "/html/system/menu/MenuList";
	}
	
	/**
	 * 코드그룹/상세 추가/수정 팝업
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public String editMenu(HttpServletRequest request, HttpServletResponse response, ModelMap model, MenuVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		model.addAttribute("data", vo);
		model.addAttribute("result", systemMenuAdminService.listMenu(session, vo));
		
		return "/html/system/menu/MenuEdit";
	}
	
	/**
	 * 코드 중복조회
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/check")
	public @ResponseBody Map checkCode(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		Map result = systemMenuAdminService.checkCode(session, request.getParameter("menuCd"));
		
		return result;
	}
	
	/**
	 * 메뉴 등록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody Map saveMenu(HttpServletRequest request, HttpServletResponse response, ModelMap model, MenuVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		Map result = systemMenuAdminService.saveMenu(session, vo);
		
		return result;
	}
	
	/**
	 * 메뉴 등록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update")
	public @ResponseBody Map updateMenu(HttpServletRequest request, HttpServletResponse response, ModelMap model, MenuVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		Map result = systemMenuAdminService.updateMenu(session, vo);
		
		return result;
	}
	
}
