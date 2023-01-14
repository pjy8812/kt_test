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
* LoginAdminServiceController : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.14       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.04.14
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping(value = "/ui/page/login")
public class LoginAdminPageController extends PageController {
	
	/**
	 * 비밀번호 재설정
	 * @param request
	 * @param responses
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/change")
	public String changePassword(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);
		if(session == null) return "redirect:/";
		
		//RSA키 생성 추가 by 2022.03.28 mijin.kim
		RSAUtil.initRsa(request); 
		
		return "/page/login/ChangePassword.tiles";
	}

}
