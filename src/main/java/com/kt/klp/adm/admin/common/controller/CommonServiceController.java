package com.kt.klp.adm.admin.common.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.common.service.CommonService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

/**
 *
 * CommonServiceController : 공통 service controller
 * <p>
 *
 * <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2021.01.21      mijin.kim     Initial creation
 * </pre>
 *
 * @author mijin.kim (mijin.kim@iousoft.co.kr)
 * @since 2021.01.21
 * @version 1.0.0
 * @see
 *
 */

@Controller
@RequestMapping(value = "/ui/service/common")
public class CommonServiceController extends AbstractController {

	@Autowired
	protected CommonService commonService;
	
	/**
	 * 변경사유
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/reason")
	public String popupReason(HttpServletRequest request, HttpServletResponse response, ModelMap model
			) throws Exception {
		String paramId = request.getParameter("paramId");
		String paramType = request.getParameter("paramType");
		
		model.addAttribute("paramId", paramId);
		model.addAttribute("paramType", paramType);  //수정, 탈퇴등 
		
		return "/html/common/UpdateReasonPopup";
	}	
	
	/**
	 * 마스킹해제사유 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/reason.unmasking")
	public String popupReasonUnmasking(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String maskingHistoryType = request.getParameter("maskingHistoryType");
		model.addAttribute("maskingHistoryType", maskingHistoryType);
		
		if(request.getParameter("type") != null) {
			String type = request.getParameter("type");
			model.addAttribute("type", type);
		}
	
		return "/html/common/UnmaskingReasonPopup";
	}
	
	/**
	 * 마스킹해제사유 등록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/unmasking")
	public @ResponseBody Map insertUnmaskingHistory(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		Map result = commonService.insertUnmaskingHistory(session, request);
		
		return result;
	}


	/**
	 * 인수증 다운로드 미리보기 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/receipt/preview/{mode}/{orderId}")
	public @ResponseBody Map previewReceiptFile(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("mode") String mode, @PathVariable("orderId") String orderId) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		return commonService.getReceiptFilePreview(request, response, session, mode, orderId);
	}
	
	/**
	 * 인수증 다운로드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/receipt/download/{mode}/{orderId}")
	public void downloadReceiptFile(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("mode") String mode, @PathVariable("orderId") String orderId) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		commonService.getReceiptFile(request, response, session, mode, orderId);
	}
	
	
}
