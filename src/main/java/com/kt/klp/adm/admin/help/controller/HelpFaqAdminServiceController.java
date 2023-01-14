package com.kt.klp.adm.admin.help.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kt.klp.adm.admin.help.domain.FaqVO;
import com.kt.klp.adm.admin.help.service.HelpAdminService;
import com.kt.klp.adm.admin.help.service.HelpFaqAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* HelpFaqAdminServiceController : APP/WEB> FAQ service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.27       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.27
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/help/faq")
public class HelpFaqAdminServiceController extends AbstractController {

	@Autowired
	protected HelpFaqAdminService service;
	
	@Autowired
	protected HelpAdminService helpAdminService;
	
	/**
	 * FAQ 검색조건 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, FaqVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		List faqCategory = helpAdminService.listFaqCategory(sessionVO);
		model.addAttribute("faqCategory", faqCategory);
		
		model.addAttribute("vo", vo);
		return "/html/help/faq/FaqSearch";
	}	

	
	/**
	 * FAQ 목록조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, FaqVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = service.listFaq(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/faq/FaqList";
	}	
	
	/**
	 * FAQ 상세조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select")
	public String select(HttpServletRequest request, HttpServletResponse response, ModelMap model, FaqVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getFaqSeq() == null) {
			throw new ServiceException("faq is null");
		}
		
		Map<String, Object> result = service.selectFaq(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/faq/FaqDetail";
	}	
	
	/**
	 * FAQ 등록/수정화면
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public String edit(HttpServletRequest request, HttpServletResponse response, ModelMap model, FaqVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//FAQ카테고리
		List faqCategory = helpAdminService.listFaqCategory(sessionVO);
		model.addAttribute("faqCategory", faqCategory);
		
		if(vo.getFaqSeq() != null) {
			Map<String, Object> info = service.selectFaq(request, sessionVO, vo);
			model.addAttribute("info", info);
		}
		return "/html/help/faq/FaqEdit";
	}
	
	/**
	 * FAQ 삭제
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public @ResponseBody Map<String, Object> delete(HttpServletRequest request, HttpServletResponse response, ModelMap model, FaqVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getFaqSeq() == null) {
			throw new ServiceException("faq is null");
		}
		
		Map result = service.deleteFaq(request, sessionVO, vo);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * FAQ 등록/수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody Map<String, Object> save(HttpServletRequest request, HttpServletResponse response, ModelMap model, FaqVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;		
		Map result = service.saveFaq(multipartRequest, sessionVO, vo);
		//logger.debug("{}", result);
		
		return result;
	}
	
}
