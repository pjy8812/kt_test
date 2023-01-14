package com.kt.klp.adm.admin.system.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.system.domain.AccountVO;
import com.kt.klp.adm.admin.system.service.SystemAccountAdminService;

import kr.co.iousoft.lib.core.controller.PageController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* SystemAccountAdminServiceController : 계정/권한관리 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.27       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.01.27
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/system/account")
public class SystemAccountAdminServiceController extends PageController {
	
	@Resource(name = "systemAccountAdminService")
	protected SystemAccountAdminService systemAccountAdminService;
	
	/**
	 * 계정/권한 검색 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String searchAccount(HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {

		SessionVO session = getSessionVO(request, response);
		model.addAttribute("result", systemAccountAdminService.listAuthGroup(request, session, vo));
		model.addAttribute("vo", vo);
		
		return "/html/system/account/AccountSearch";
	}
	
	/**
	 * 계정/권한 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String listAccount(HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("result", systemAccountAdminService.listAccount(request, session, vo));
		
		return "/html/system/account/AccountList";
	}
	
	/**
	 * 관리자 엑셀업로드 팝업
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/upload.popup")
	public String popupUploadExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/system/account/AccountExcelUpload";
	}
	
	/**
	 * 엑셀업로드 샘플 다운로드
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download.sample")
	public void downloadSample(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		systemAccountAdminService.downloadSample(request, response);
	}
	
	/**
	 * 엑셀업로드
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/upload")
	public String uploadExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;	
		
		Map<String, Object> result = systemAccountAdminService.uploadExcel(multipartRequest, session);
		model.addAttribute("result", result);
		
		return "/html/system/account/AccountExcelUploadResult";
	}
	
	/**
	 * 관리자 추가 화면(관리자 상세)
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public String editAccount(HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("result", systemAccountAdminService.selectAccount(request, session, vo));
		model.addAttribute("adminId", vo.getAdminId());
		
		return "/html/system/account/AccountEdit";
	}
	
	/**
	 * 관리자 아이디/사번/이메일/전화번호 중복조회
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/check/{mode}")
	public @ResponseBody Map checkAccount(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);
		return systemAccountAdminService.checkAccount(request, session, mode, request.getParameter("value"));
	}
	
	/**
	 * 비밀번호 재설정
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/resetpw")
	public @ResponseBody Map resetPassword(HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {
		
		if(vo.getAdminId() == null) {
			throw new ServiceException("adminId is null");
		}
		
		SessionVO session = getSessionVO(request, response);
		return systemAccountAdminService.resetPassword(request, session, vo.getAdminId());
	}
	
	/**
	 * 관리자정보 저장(등록/수정)
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/{mode}")
	public @ResponseBody Map saveAccount(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		return systemAccountAdminService.saveAccount(request, session, mode, vo);
	}
	
	/**
	 * 관리자 삭제
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public @ResponseBody Map deleteAccount(HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {
		
		if(vo.getAdminId() == null) {
			throw new ServiceException("adminId is null");
		}
		
		SessionVO session = getSessionVO(request, response);
		return systemAccountAdminService.deleteAccount(request, session, vo.getAdminId());
	}
	
	/**
	 * 권한그룹 설정(목록 조회)
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/group")
	public String listAuthGroup(HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("result", systemAccountAdminService.listAuthGroup(request, session, vo));
		return "/html/system/account/AuthGroup";
	}
	
	/**
	 * 권한그룹 생성/수정 팝업(권한그룹 상세)
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/group/edit.popup")
	public String editGroup(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);

		String groupSeq = request.getParameter("groupSeq");
		model.addAttribute("groupSeq", groupSeq);
		model.addAttribute("result", systemAccountAdminService.selectAuthGroup(request, session, groupSeq));
		
		return "/html/system/account/AuthGroupEdit";
	}
	
	/**
	 * 권한 그룹명/그룹코드 중복조회
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/group/check/{mode}")
	public @ResponseBody Map checkAuthGroup(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO session = getSessionVO(request, response);
		return systemAccountAdminService.checkAuthGroup(request, session, mode, request.getParameter("value"));
	}
	
	/**
	 * 권한설정 저장(등록/수정)
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @param JSONdata
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/group/save/{mode}")
	public @ResponseBody Map saveGroup(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model,	AccountVO vo, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		SessionVO session = getSessionVO(request, response);
		
		String deJSONdata = UtilFunctions.decodeXss(JSONdata.replaceAll("&quot;", "\""));
		vo.setPermissionCheck(new ObjectMapper().readValue(deJSONdata, List.class));

		return systemAccountAdminService.saveGroup(request, session, mode, vo);
	}
	
	/**
	 * 권한그룹 삭제
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/group/delete")
	public @ResponseBody Map deleteAuthGroup(HttpServletRequest request, HttpServletResponse response, ModelMap model, AccountVO vo) throws Exception {
		
		if(vo.getGroupSeq() == null) {
			throw new ServiceException("groupSeq is null");
		}
		
		SessionVO session = getSessionVO(request, response);
		return systemAccountAdminService.deleteAuthGroup(request, session, vo.getGroupSeq());
	}
	
}
