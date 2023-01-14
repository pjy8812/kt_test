package com.kt.klp.adm.admin.help.controller;

import java.util.HashMap;
import java.util.List;
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
import com.kt.klp.adm.admin.help.domain.SendVO;
import com.kt.klp.adm.admin.help.domain.SmsVO;
import com.kt.klp.adm.admin.help.service.HelpSendAdminService;
import com.kt.klp.adm.admin.owner.domain.CarOwnerVO;
import com.kt.klp.adm.admin.owner.domain.FreightOwnerVO;
import com.kt.klp.adm.admin.owner.service.CarownAdminService;
import com.kt.klp.adm.admin.owner.service.FrgownAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* HelpSendAdminServiceController : APP/WEB> 발송관리 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.16       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.16
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/help/send")
public class HelpSendAdminServiceController extends AbstractController {

	@Autowired
	protected HelpSendAdminService service;
	
	@Autowired
	protected FrgownAdminService frgownAdminService; //화주 서비스
	
	@Autowired
	protected CarownAdminService carownAdminService; //차주 서비스
	
	@Autowired
	protected CommonService commonService;
	
	
	
	/**
	 * SMS 발송관리 검색조건
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sms/search")
	public String searchSms(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		getSendCodeList(sessionVO, "sms", model);
		
		model.addAttribute("vo", vo);
		return "/html/help/send/SmsSearch";
	}	
	
	/**
	 * SMS 발송관리 목록조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sms/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = service.listSendSms(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/send/SmsList";
	}	
	
	/**
	 * 이메일 발송관리 검색조건
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/email/search")
	public String searchEamil(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		getSendCodeList(sessionVO, "email", model);
			
		model.addAttribute("vo", vo);
		return "/html/help/send/EmailSearch";
	}	
	
	/**
	 * 이메일 발송관리 목록조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/email/list")
	public String ListEamil(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = service.listSendEmail(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/send/EmailList";
	}
	
	/**
	 * 회원정보 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/user")
	public String popupUser(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		
		model.addAttribute("vo", vo);
		return "/html/help/send/UserDetailPopup";
	}
	
	@RequestMapping(value = "/popup/user.select")
	public String popupUserSelect(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getOwnerId() == null) {
			throw new ServiceException("owner id is null");
		}
		
		Map<String, Object> result = new HashMap<>();
		if(vo.getOwnerClassification().equals("frgown")) { 
			//화주 상세
			FreightOwnerVO frgown = new FreightOwnerVO();
			frgown.setFreightOwnerId(vo.getOwnerId());
			frgown.setMaskingYn(vo.getMaskingYn());
			result = frgownAdminService.selectFrgown(request, sessionVO, frgown);
		}else if(vo.getOwnerClassification().equals("carown")) { 
			//차주 상세
			CarOwnerVO carown = new CarOwnerVO();
			carown.setCarOwnerId(vo.getOwnerId());
			carown.setMaskingYn(vo.getMaskingYn());
			result = carownAdminService.selectCarown(request, sessionVO, carown);
		}else {
			throw new ServiceException("ownerClassification error");
		}
		
		result.put("ownerClassification", vo.getOwnerClassification());
		result.put("ownerId", vo.getOwnerId());
		model.addAttribute("result", result);
		
		
		return "/html/help/send/UserDetail";
	}
	
	/**
	 * SMS 발송내용 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/sms.select")
	public String popupSmsDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		if(vo.getSendSeq() == null) {
			throw new ServiceException("send seq is null");
		}
		
		Map<String, Object> result = service.selectSendSmsEmail(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/send/SmsDetailPopup";
	}
	
	/**
	 * Email 발송내용 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/email.select")
	public String popupEmailDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		if(vo.getSendSeq() == null) {
			throw new ServiceException("send seq is null");
		}
		
		Map<String, Object> result = service.selectSendSmsEmail(request, sessionVO, vo);
		model.addAttribute("result", result);
		return "/html/help/send/EmailDetailPopup";
	}
	
	/**
	 * 재발송
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "{type}/resend")
	public @ResponseBody Map<String, Object> resend(HttpServletRequest request, HttpServletResponse response, ModelMap model
			, @PathVariable String type, SendVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		logger.debug("{}", type);
		
		if(vo.getSendSeq() == null) {
			throw new ServiceException("send seq is null");
		}
		
		Map<String, Object> result = new HashMap<>();
		if(type.equals("sms")) {
			result = service.resendSms(request, sessionVO, vo);
		}else if(type.equals("email")) {
			result = service.resendEmail(request, sessionVO, vo);
		}else {
			throw new ServiceException("resend type error");
		}
		return result;
	}
	
	
	/**
	 * 단체문자 발송 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/sms/edit")
	public String popupSmsEdit(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/help/send/SmsEditPopup";
	}
	
	/**
	 * 단체문자발송
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sms/send")
	public @ResponseBody Map<String, Object> save(HttpServletRequest request, HttpServletResponse response, ModelMap model, SmsVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.sendSms(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 발송코드 검색조건 공통코드
	 * @param sessionVO
	 * @param type
	 * @param model
	 * @throws Exception
	 */
	private void getSendCodeList(SessionVO sessionVO, String type, ModelMap model) throws Exception {
		//발송구분
		List sendCategory = commonService.listCode(sessionVO, "sendCategory"); 
		//logger.debug("{}", sendCategory);
		model.addAttribute("sendCategory", sendCategory);
		
		//발송항목 (템플릿명)
		List templateName = commonService.listCode(sessionVO, "templateName"); 
		logger.debug("templateName={}", templateName);
		model.addAttribute("templateName", templateName);
		
		//발송유형 - SMS일 경우만 사용
		if(type.equals("sms")) {
			List sendType = commonService.listCode(sessionVO, "sendType");
			logger.debug("sendType={}", sendType);
			model.addAttribute("sendType", sendType);
		}
		
		//발송대상
		List sendTarget = commonService.listCode(sessionVO, "sendTarget");
		logger.debug("sendTarget={}", sendTarget);
		model.addAttribute("sendTarget", sendTarget);
		
		//발송상태
		List sendStatus = commonService.listCode(sessionVO, "sendStatus");
		logger.debug("sendStatus={}", sendStatus);
		model.addAttribute("sendStatus", sendStatus);
	}
}
