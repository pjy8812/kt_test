package com.kt.klp.adm.admin.help.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kt.klp.adm.admin.help.domain.ManualVO;
import com.kt.klp.adm.admin.help.service.HelpAdminService;
import com.kt.klp.adm.admin.help.service.HelpManualAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* HelpManualAdminServiceController : APP/WEB> 매뉴얼 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.04       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.04
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/help/manual")
public class HelpManualAdminServiceController extends AbstractController {
	
	@Autowired
	protected HelpManualAdminService service;
	
	@Autowired
	protected HelpAdminService helpAdminService;
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	/**
	 * 매뉴얼 검색조건 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, ManualVO vo) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		
		//카테고리 - 2022.04.07 faq카테고리 진행 (박웅기차창님 확인완료)
		List faqCategory = helpAdminService.listFaqCategory(sessionVO);
//		logger.debug("{}", faqCategory);
		model.addAttribute("faqCategory", faqCategory);
		
		model.addAttribute("vo", vo);
		return "/html/help/manual/ManualSearch";
	}	
	
	
	/**
	 * 매뉴얼 목록조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, ManualVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.listManual(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/manual/ManualList";
	}	
	
	/**
	 * 매뉴얼 상세조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select")
	public String select(HttpServletRequest request, HttpServletResponse response, ModelMap model, ManualVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		if(vo.getManualSeq() == null) {
			throw new ServiceException("manual is null");
		}
		
		Map<String, Object> result = service.selectManual(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/manual/ManualDetail";
	}	
	
	/**
	 * 매뉴얼 등록/수정화면
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public String edit(HttpServletRequest request, HttpServletResponse response, ModelMap model, ManualVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//카테고리
		List faqCategory = helpAdminService.listFaqCategory(sessionVO);
		//logger.debug("{}", faqCategory);
		model.addAttribute("faqCategory", faqCategory);
		
		if(vo.getManualSeq() != null) {
			Map<String, Object> result = service.selectManual(request, sessionVO, vo);
			model.addAttribute("result", result);
		}
		
		return "/html/help/manual/ManualEdit";
	}
	
	/**
	 * 매뉴얼 삭제
	 * @param request
	 * @param response
	 * @param modelm
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public @ResponseBody Map<String, Object> delete(HttpServletRequest request, HttpServletResponse response, ModelMap modelm, ManualVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getManualSeq() == null) {
			throw new ServiceException("manual is null");
		}
		
		Map result = service.deleteManual(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 매뉴얼 등록/수정
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody Map<String, Object> save(MultipartHttpServletRequest request, HttpServletResponse response, ModelMap model, ManualVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = service.saveManual(request, sessionVO, vo);
		
		return result;
	}
	
}
