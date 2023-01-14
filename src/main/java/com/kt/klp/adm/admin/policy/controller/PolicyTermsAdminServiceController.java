package com.kt.klp.adm.admin.policy.controller;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.policy.domain.TermsRevisionVO;
import com.kt.klp.adm.admin.policy.domain.TermsVO;
import com.kt.klp.adm.admin.policy.service.PolicyTermsAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

/**
*
* PolicyTermsAdminServiceController : 정책관리> 약관 service controller
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
@RequestMapping("/ui/service/policy/terms")
public class PolicyTermsAdminServiceController extends AbstractController {

	public static final String[] POLICY_TERMS_HEADERS = {
		"No", "약관명", "서비스구분", "필수여부", "개정버전", "사용기간", "수정자", "수정일"
	};
	
	@Autowired
	protected PolicyTermsAdminService policyTermsAdminService;
	
	@Autowired
	protected CommonService commonService;
	
	/**
	 * 정책 - 약관 - 검색 폼 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/policy/terms/TermsSearch";
	}
	
	/**
	 * 정책 - 약관 - 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param pageIndex
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestBody TermsVO vo) throws Exception {
		
		// logger.debug("vo={}", vo);
		model.addAttribute("headers", Arrays.asList(POLICY_TERMS_HEADERS));
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		model.addAttribute("result", policyTermsAdminService.getList(session, vo));

		return "/html/policy/terms/TermsList";
	}
	
	/**
	 * 정책 - 약관 - 상세   
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model, TermsVO vo) throws Exception {
		
		// logger.debug("vo={}", vo);
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("mode", vo.getMode());
		model.addAttribute("session", session);
		
		model.addAttribute("termsTypeList", commonService.listCode(session, "termsType"));
		
		if(vo.getMode().equals("update")) {
			model.addAttribute("result", policyTermsAdminService.getDetail(session, vo.getTermsSeq(), vo.getPageIndex()));
		}
		
		return "/html/policy/terms/TermsDetails";
	}
	
	/**
	 * 정책 - 약관 - 등록/수정
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody Map save(HttpServletRequest request, HttpServletResponse response, ModelMap model, TermsVO vo, String termsRevisionVersion) throws Exception {
		
		// logger.debug("vo={}", vo);
		
		SessionVO session = getSessionVO(request, response);
		return policyTermsAdminService.save(session, vo);
	}
	
	/**
	 * 정책 - 약관 - 개정 저장 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveRevision")
	public @ResponseBody Map saveRevision(HttpServletRequest request, HttpServletResponse response, ModelMap model, TermsRevisionVO vo) throws Exception {
		
		// logger.debug("vo={}", vo);
		
		SessionVO session = getSessionVO(request, response);
		return policyTermsAdminService.saveRevision(session, vo);
	}
	
}
