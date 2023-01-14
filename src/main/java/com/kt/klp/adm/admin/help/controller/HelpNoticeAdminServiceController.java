package com.kt.klp.adm.admin.help.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kt.klp.adm.admin.help.domain.NoticeVO;
import com.kt.klp.adm.admin.help.service.HelpNoticeAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* HelpNoticeAdminServiceController : APP/WEB> 공지사항 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.25       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.25
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/help/notice")
public class HelpNoticeAdminServiceController extends AbstractController {
	
	@Autowired
	protected HelpNoticeAdminService service;

	/**
	 * 공지사항 검색조건 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, NoticeVO vo) throws Exception {
		model.addAttribute("vo", vo);
		return "/html/help/notice/NoticeSearch";
	}	
	
	
	/**
	 * 공지사항 목록조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, NoticeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = service.listNotice(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/notice/NoticeList";
	}	
	
	/**
	 * 공지사항 상세조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select")
	public String select(HttpServletRequest request, HttpServletResponse response, ModelMap model, NoticeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getNoticeSeq() == null) {
			throw new ServiceException("notice is null");
		}
		
		Map<String, Object> result  = service.selectNotice(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/help/notice/NoticeDetail";
	}	
	
	
	/**
	 * 공지사항 등록/수정화면
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public String edit(HttpServletRequest request, HttpServletResponse response, ModelMap model, NoticeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getNoticeSeq() != null) {
			Map<String, Object> result  = service.selectNotice(request, sessionVO, vo);
			model.addAttribute("result", result);
		}
		
		return "/html/help/notice/NoticeEdit";
	}
	
	/**
	 * 공지사항 상단고정, 팝업설정 변경
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update/status")
	public @ResponseBody Map<String, Object> updateStatus(HttpServletRequest request, HttpServletResponse response, ModelMap model, NoticeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getNoticeSeq() == null) {
			throw new ServiceException("notice is null");
		}
		
		Map result = service.updateNoticeStatus(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 공지사항 삭제
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public @ResponseBody Map<String, Object> delete(HttpServletRequest request, HttpServletResponse response, ModelMap model, NoticeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getNoticeSeq() == null) {
			throw new ServiceException("notice is null");
		}
		
		Map result = service.deleteNotice(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 공지사항 등록/수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody Map<String, Object> save(MultipartHttpServletRequest request, HttpServletResponse response, ModelMap model, NoticeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map result = service.saveNotice(request, sessionVO, vo);
		
		return result;
	}
	
}
