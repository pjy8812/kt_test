package com.kt.klp.adm.admin.dashboard.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kt.klp.adm.admin.dashboard.service.DashboardAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;

/**
*
* DashboardAdminServiceController : 대시보드 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.26       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.26
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/service/dashboard")
public class DashboardAdminServiceController extends AbstractController {

	@Autowired
	protected DashboardAdminService dashboardAdminService;
	
	/**
	 * 대시보드 - 화주 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/frgown")
	public String freightOwner(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		Map result = dashboardAdminService.getFrgownSummary(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/FreightOwner";
	}
	
	/**
	 * 대시보드 - 차주 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carown")
	public String carOwner(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		Map result = dashboardAdminService.getCarownSummary(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/CarOwner";
	}
	
	/**
	 * 대시보드 - 문의 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/qna")
	public String QnA(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		Map result = dashboardAdminService.getQnaSummary(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/QnA";
	}
	
	/**
	 * 대시보드 - 주문/배송 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/order")
	public String Order(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		SessionVO session = getSessionVO(request, response);

		Map result = dashboardAdminService.getOrderSummary(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/Order";
	}
	
	/**
	 * 대시보드 - 차주정산 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/settlementCarown")
	public String settlementCarown(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		Map result = dashboardAdminService.getSettlementCarownSummary(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/SettlementCarOwner";
	}
	
	/**
	 * 대시보드 - 화주정산 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/settlementFrgown")
	public String settlementFrgown(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		Map result = dashboardAdminService.getSettlementFrgownSummary(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/SettlementFrgOwner";
	}
	
	/**
	 * 대시보드 - 배차지연 처리
	 *  
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delayDispatch")
	public String delayDispatch(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		Map result = dashboardAdminService.getDelayDispatch(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/delayDispatch";
	}
	
	/**
	 * 대시보드 - 비상배차 후 처리
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/emergencyDispatch")
	public String emergencyDispatch(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		Map result = dashboardAdminService.getEmergencyDispatch(session);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/emergencyDispatch";
	}
	
	/**
	 * 대시보드 - 수동배차 후 처리 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/managerDispatch")
	public String ManagerDispatch(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		// 주기적 새로고침 시 accessToken 만료되었을 경우 로그아웃 처리 
		Map result = dashboardAdminService.getManagerDispatch(session);
		
		if(result != null && result.get("error") != null && result.get("error").equals(LoginVO.INVALID_TOKEN)) {
			// 로그아웃
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return "redirect:/expire/login";
		}
		
		model.addAttribute("result", result);
		return "/html/dashboard/managerDispatch";
	}

}
