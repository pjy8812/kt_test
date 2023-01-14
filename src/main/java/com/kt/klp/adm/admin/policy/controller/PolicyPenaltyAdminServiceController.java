package com.kt.klp.adm.admin.policy.controller;

import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.ImmutableMap;
import com.kt.klp.adm.admin.policy.service.PolicyPaneltyAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* PolicyPenaltyAdminServiceController : 정책관리> 패널티 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.10       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.10
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/service/policy/penalty")
public class PolicyPenaltyAdminServiceController extends AbstractController {
	
	@Autowired
	protected PolicyPaneltyAdminService policyPaneltyAdminService;
	
	public static final String PENALTY_TYPE_CAR_OWNER = "carOwnerPenalty";
	public static final String PENALTY_TYPE_FREIGHT_OWNER= "freightOwnerPenalty";
	
	public static final Map<String, String> CAR_OWNER_PENALTY_LIST = ImmutableMap.of(
		"none" , "없음"
		, "warn" , "경고"
		, "stop" , "배차요청 정지"
	);

	/**
	 * 정책 - 패널티 - 상세 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String type = request.getParameter("pageType");
		SessionVO session = getSessionVO(request, response);
		
		switch (type) {
		case PENALTY_TYPE_CAR_OWNER:
			
			model.addAttribute("statusList", CAR_OWNER_PENALTY_LIST);
			
			model.addAttribute("cancelResult", policyPaneltyAdminService.getCarOwnerCancelList(request, response, session));
			model.addAttribute("accidentResult", policyPaneltyAdminService.getCarOwnerAccidentList(request, response, session));
			
			return "/html/policy/penalty/CarOwnerPenaltyDetail";
		
		case PENALTY_TYPE_FREIGHT_OWNER:
			
			model.addAttribute("cancelResult", policyPaneltyAdminService.getFreightOwnerCancelList(request, response, session));
			model.addAttribute("delayResult", policyPaneltyAdminService.getFreightOwnerDelayList(request, response, session));
			
			return "/html/policy/penalty/FreightOwnerPenaltyDetail";
		
		default:
			return null;
		}
	}
	
	/**
	 * 정책 - 패널티 - 상세 - 저장 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody Map saveDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		
		String type = request.getParameter("pageType");
		
		String decodeJSONdata = URLDecoder.decode(JSONdata, "UTF-8");
		decodeJSONdata = UtilFunctions.decodeXss(decodeJSONdata);
		decodeJSONdata = StringEscapeUtils.unescapeHtml3(decodeJSONdata);

		SessionVO session = getSessionVO(request, response);
		
		return policyPaneltyAdminService.saveDetail(request, response, session, decodeJSONdata, type);
	}
		
}
