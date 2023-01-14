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

import com.kt.klp.adm.admin.help.domain.LocationVO;
import com.kt.klp.adm.admin.help.domain.VocVO;
import com.kt.klp.adm.admin.help.service.HelpAdminService;
import com.kt.klp.adm.admin.help.service.HelpVocAdminService;
import com.kt.klp.adm.admin.help.service.HelpVocLocationAdminService;
import com.kt.klp.adm.admin.order.domain.OrderVO;
import com.kt.klp.adm.admin.order.service.OrderAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* HelpVocAdminServiceController : APP/WEB> 1:1문의 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.28       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.28
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/help/voc")
public class HelpVocAdminServiceController extends AbstractController {
	
	@Autowired
	protected HelpVocAdminService service; //1:1문의
	
	@Autowired
	protected HelpVocLocationAdminService locationService; //위치정보관리대장
	
	@Autowired
	protected HelpAdminService helpAdminService; 
	
	@Autowired
	protected OrderAdminService orderAdminService;	//주문배송
	
	
	/**
	 * 1:1문의 검색조건 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, VocVO vo) throws Exception {
		model.addAttribute("vo", vo);
		return "/html/help/voc/VocSearch";
	}	
	
	
	/**
	 * 1:1문의 목록조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, VocVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = service.listVoc(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/voc/VocList";
	}	
	
	/**
	 * 1:1문의 상세조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select")
	public String select(HttpServletRequest request, HttpServletResponse response, ModelMap model, VocVO vo) throws Exception {
		if(vo.getVocSeq() == null) {
			throw new ServiceException("voc is null");
		}
		
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.selectVoc(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/voc/VocDetail";
	}	
	
	/**
	 * 1:1문의 등록/수정화면
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public String edit(HttpServletRequest request, HttpServletResponse response, ModelMap model, VocVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		//카테고리
		List faqCategory = helpAdminService.listFaqCategory(sessionVO);
		model.addAttribute("faqCategory", faqCategory);
		
		if(vo.getVocSeq()  != null) {
			Map<String, Object> result = service.selectVoc(request, sessionVO, vo);
			model.addAttribute("result", result);
		}
		
		return "/html/help/voc/VocEdit";
	}
	
	/**
	 * 1:1문의 등록 주문번호찾기 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/order/popup")
	public String orderPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/help/voc/OrderSearchPopup";
	}
	
	/**
	 * 주문번호 조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/order/list")
	public String popupHistoryList(HttpServletRequest request, HttpServletResponse response, ModelMap model, OrderVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = orderAdminService.listOrder(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/voc/OrderSearchPopupList";
	}
	
	/**
	 * 1:1문의 삭제
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public @ResponseBody Map<String, Object> delete(HttpServletRequest request, HttpServletResponse response, ModelMap model, VocVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		if(vo.getVocSeq() == null) {
			throw new ServiceException("voc is null");
		}
		
		Map<String, Object> result = service.deleteVoc(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 1:1문의 등록/수정
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody Map<String, Object> save(HttpServletRequest request, HttpServletResponse response, ModelMap model, VocVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;		
		Map<String, Object> result = service.saveVoc(multipartRequest, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 1:1문의 답변 게시(등록)
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insert/answer")
	public @ResponseBody Map<String, Object> insertAnswer(HttpServletRequest request, HttpServletResponse response, ModelMap model, VocVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);

		if(vo.getVocSeq() == null) {
			throw new ServiceException("voc is null");
		}
		
		//답변게시 
		Map<String, Object> result = service.insertVocAnswer(request, sessionVO, vo);
		
		return result;
	}
	
	
	/**
	 * 위치정보관리대장 검색
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/location/search")
	public String searchLocation(HttpServletRequest request, HttpServletResponse response, ModelMap model, LocationVO vo) throws Exception {
		model.addAttribute("vo", vo);
		return "/html/help/voc/LocationSearch";
	}	
	
	
	/**
	 * 위치정보관리대장 목록
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/location/list")
	public String listLocation(HttpServletRequest request, HttpServletResponse response, ModelMap model, LocationVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = locationService.listLocation(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/voc/LocationList";
	}	
	
	
	/**
	 * 위치정보관리대장 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/location/edit")
	public String editLocation(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/help/voc/LocationEditPopup";
	}	
	
	/**
	 * 위치정보관리대장 저장
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/location/save")
	public @ResponseBody Map<String, Object> saveLocation(HttpServletRequest request, HttpServletResponse response, ModelMap model, LocationVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = locationService.saveLocation(request, sessionVO, vo);
		
		return result;
	}	
}
