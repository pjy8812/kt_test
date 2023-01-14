package com.kt.klp.adm.admin.system.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.system.domain.CodeVO;
import com.kt.klp.adm.admin.system.service.SystemCodeAdminService;

import kr.co.iousoft.lib.core.controller.PageController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

/**
*
* SystemCodeAdminServiceController : 공통코드 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.09       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.02.09
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/system/code")
public class SystemCodeAdminServiceController extends PageController {
	
	@Resource(name = "systemCodeAdminService")
	protected SystemCodeAdminService systemCodeAdminService;
	
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
		return "/html/system/code/CodeSearch";
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
	public String listCode(HttpServletRequest request, HttpServletResponse response, ModelMap model, CodeVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		model.addAttribute("result", systemCodeAdminService.listCode(session, vo));
		return "/html/system/code/CodeList";
	}
	
	/**
	 * 공통코드 상세
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail")
	public String selectCode(HttpServletRequest request, HttpServletResponse response, ModelMap model, CodeVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		model.addAttribute("result", systemCodeAdminService.selectCode(session, vo));
		return "/html/system/code/CodeDetail";
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
	@RequestMapping(value = "/edit/{mode}")
	public String editCode(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, CodeVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		model.addAttribute("mode", mode);
		model.addAttribute("vo", vo);
		//logger.debug("vo={}", vo);
		if(mode.equals("code")) {
			model.addAttribute("codeUseYn", vo.getCodeUseYn()); //코드사용여부 기본값 체크를 위한 값 전달 2022.05.11 추가
			vo.setCodeUseYn("all"); //코드그룹이 사용여부가 'N'일경우 조회가 되지 않아 수정 2022.04.15 mijin.kim 추가
			model.addAttribute("result", systemCodeAdminService.listCode(session, vo));
		}
		
		return "/html/system/code/CodeEdit";
	}
	
	/**
	 * 코드ID 중복조회
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/check/{mode}")
	public @ResponseBody Map checkCode(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		Map result = systemCodeAdminService.checkCode(session, mode, request.getParameter("id"));
		return result;
	}
	
	/**
	 * 코드그룹/상세 등록/수정
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/{mode}")
	public @ResponseBody Map saveCode(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, CodeVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		Map result = systemCodeAdminService.saveCode(session, mode, vo);
		return result;
	}
	
}
