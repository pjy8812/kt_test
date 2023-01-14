package com.kt.klp.adm.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.controller.PageController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.RSAUtil;

/**
*
* LoginPageController : 로그인 page controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.26       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.01.26
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping(value = "")
public class LoginPageController extends PageController {
	
	/**
	 * 로그인
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "")
	public String login(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO sessionVO = getSessionVO(request, response);
		
		String targetUrl = request.getParameter("targetUrl");
		if (targetUrl == null) {
			targetUrl = "/page/index";
		}
		
		if (sessionVO != null && targetUrl != null) {
			request.getSession().removeAttribute("targetUrl");
			return "redirect:" + targetUrl;
		}
		
		//RSA키 생성 추가 by 2022.03.28 mijin.kim
		RSAUtil.initRsa(request); 
				
		return "/page/login/Login.tiles.co";
	}
	
	/**
	 * 비밀번호 재설정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
//	@RequestMapping(value = "/ui/page/login/change")
//	public String changePassword(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
//		SessionVO session = getSessionVO(request, response);
//		if(session == null) return "redirect:/";
//		
//		//RSA키 생성 추가 by 2022.03.28 mijin.kim
//		RSAUtil.initRsa(request); 
//		
//		return "/page/login/ChangePassword.tiles";
//	}

}
