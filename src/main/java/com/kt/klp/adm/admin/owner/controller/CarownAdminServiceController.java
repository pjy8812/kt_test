package com.kt.klp.adm.admin.owner.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.owner.domain.CarOwnerVO;
import com.kt.klp.adm.admin.owner.service.CarownAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* CarownAdminServiceController : 회원관리> 차주관리 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.21       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.21
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/owner/carown")
public class CarownAdminServiceController extends AbstractController {
	
	@Autowired
	protected CarownAdminService service;
	
	@Autowired
	protected CommonService commonService;
	
	/**
	 * 차주 검색조건
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		//공통코드 조회
		getCarownCodeList(sessionVO, model);
		
		model.addAttribute("vo", vo);
		return "/html/owner/carown/CarownSearch";
	}	
	
	
	/**
	 * 차주 목록
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		vo.setCarOwnerDeleteFlag("N");
		
		Map result = service.listCarown(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("vo", vo);
		return "/html/owner/carown/CarownList";
	}
	
	/**
	 * 차주 목록
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/historylist")
	public String historylist(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		vo.setCarOwnerDeleteFlag("Y");
		vo.setSort("carOwnerDeleteDateDesc");
		
		Map result = service.listCarown(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("vo", vo);
		return "/html/owner/carown/CarownDeleteHistoryList";
	}	
	
	/**
	 * 차주 삭제 이력 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/deleteHistory.select")
	public String popupDeleteHistorySelect(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		vo.setCarOwnerDeleteFlag("Y");
		
		Map result = service.listCarown(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("vo", vo);
		return "/html/owner/carown/CarownDeleteHistoryList";
	}		
	
	/**
	 * 차주 차량정보 조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/car.select")
	public String popupCarSelect(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}
		
		Map result = service.selectCar(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/owner/carown/CarDetailPopup";
	}	
	
	/**
	 * 차주 상세
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}
		
		//공통코드 조회
		getCarownCodeList(sessionVO, model);
		
		Map result = service.selectCarown(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("vo", vo);
		return "/html/owner/carown/CarownDetail";
	}	
	
	
	
	/**
	 * 차주 패널티 내역 목록 조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/penalty.list")
	public String popupPenaltyList(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}
		
		Map result = service.listPenalty(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/owner/carown/PenaltyPopupList";
	}
	
	/**
	 * 차주 변경내역 목록 조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/history.list")
	public String popupHistoryList(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}
		
		Map result = service.listCarownHistory(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/owner/carown/CarownHistoryPopupList";
	}
	
	/**
	 * 차주 정보 삭제
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/recovery")
	public @ResponseBody Map<String, Object> recovery(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}

		Map<String, Object> result = service.recoveryCarown(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 차주 정보 복구
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public @ResponseBody Map<String, Object> delete(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}

		Map<String, Object> result = service.deleteCarown(request, sessionVO, vo);
		return result;
	}		
	
	/**
	 * 차주 정보수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update")
	public @ResponseBody Map<String, Object> update(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}

		vo.setCarOwnerHistoryAmender(sessionVO.getAdminId());
		
		Map<String, Object> result = service.updateCarown(request, sessionVO, vo);
		return result;
	}
	
	
	/**
	 * 차주 탈퇴(승인)
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdraw")
	public @ResponseBody Map<String, Object> withdraw(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarOwnerId() == null) {
			 throw new ServiceException("id is null");
		}
		
		vo.setCarOwnerHistoryAmender(sessionVO.getAdminId()); 
		
		Map<String, Object> result = service.withdrawCarown(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 차주 검색/조회 화면에서 사용하는 공통코드 목록 
	 * @param model
	 * @throws Exception
	 */
	private void getCarownCodeList(SessionVO sessionVO, ModelMap model) throws Exception {
		//구분 
		List carOwnerType = commonService.listCode(sessionVO, "carOwnerType"); 
		//logger.debug("{}", carOwnerType);
		model.addAttribute("carOwnerType", carOwnerType);
		
		//가입승인상태
		List joinApprovalStatus = commonService.listCode(sessionVO, "joinApprovalStatus"); 
		//logger.debug("{}", joinApprovalStatus);
		model.addAttribute("joinApprovalStatus", joinApprovalStatus);
		
		//이용상태 (회원상태)
		List memberStatus = commonService.listCode(sessionVO, "memberStatus");
		//logger.debug("{}", memberStatus);
		model.addAttribute("memberStatus", memberStatus);
	}
	
	/**
	 * 지압차주 업로드 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/upload")
	public String uploadPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarOwnerVO vo) throws Exception {
		return "/html/owner/carown/CarownUploadPopup";
	}
	
	/**
	 * 지압차주 샘플 다운로드
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/download/sample")
	public void downloadSample(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		service.downloadSample(request, response);
	}
	
	/**
	 * 지압차주 엑셀 업로드
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/upload")
	public void upload(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		//service.downloadSample(request, response);
	}
	
	/**
	 * 심사대상 파일 다운로드
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/download/target")
	public  @ResponseBody Map<String, Object> downloadTarget(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.downloadSmartro(request, response, sessionVO);
		
		return result;
	}
	
	/**
	 * 심사대상 파일 여부 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/check/target")
	public  @ResponseBody Map<String, Object> checkTarget(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.checkSmartroFile(request, sessionVO);
		
		return result;
	}
	
}
