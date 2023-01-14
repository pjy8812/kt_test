package kr.co.iousoft.lib.core.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.core.vo.LoginVO;

/**
*
* IndexPageController : 주문배송 page controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.12       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.12
* @version 1.0.0
* @see
*
*/

@Controller
public class IndexPageController extends AbstractController {

//	@Autowired
//	protected MenuAuthService menuAuthService;

	@RequestMapping(value="/index")
	public String index1(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		// return "redirect:/ui/page/order/mng"; // TO DELETE for betatest
		return "redirect:/page/index";
	}

	@RequestMapping(value = "/page/index")
	public String init(HttpServletRequest request, HttpServletResponse response, ModelMap model, LoginVO vo) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		
		if(sessionVO != null) {
			if(vo.getAccessToken() != null) {
				request.getSession().removeAttribute("User");
				
				// 셀러노트 
				if(sessionVO.getAdminAuthorityGroupCode().equals(sessionVO.GROUP_CODE_MANUAL_DELIVERY)) {
					return "redirect:/ui/page/order/manual";
				} else {
					return "redirect:/";
				}
			} else {
				return "redirect:/ui/page/dashboard/index";
			}
		}

		return "redirect:/";
	}

	/*
	@RequestMapping(value="/error")
	public String error(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		logger.debug("{}", "error");
		return "/page/error/Error.tiles.co";
	}
	 */

	@RequestMapping(value="/invalid/session")
	public String invalidSession(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/page/error/InvalidSession.tiles.co";
	}

	@RequestMapping(value="/expire/login")
	public String expireLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/page/error/ExpireLogin.tiles.co";
	}
	
	/**
	 * 권한없음 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/error/noAuth")
	public String errorNoAuth(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		if(session.getAdminAuthorityGroupCode().equals(session.GROUP_CODE_MANUAL_DELIVERY)) {
			model.addAttribute("redirectUri", "/ui/page/order/manual");
		} else {
			model.addAttribute("redirectUri", "/ui/page/dashboard/index");
		}
		
		return "/page/error/NoAuth.tiles.co";
	}
	
	/**
	 * 권한없음 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/error/expireLogin")
	public String errorExpireLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		request.getSession().removeAttribute("User");
		request.getSession().invalidate();
		
		return "/page/error/ExpireLogin.tiles.co";
	}


}
