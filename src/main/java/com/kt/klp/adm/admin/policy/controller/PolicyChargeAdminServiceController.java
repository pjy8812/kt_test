package com.kt.klp.adm.admin.policy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.policy.domain.AreaVO;
import com.kt.klp.adm.admin.policy.domain.ChargeVO;
import com.kt.klp.adm.admin.policy.service.PolicyChargeAdminService;
import com.kt.klp.adm.admin.system.service.SystemCodeAdminService;

import kr.co.iousoft.lib.core.controller.PageController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

/**
*
* PolicyChargeAdminServiceController : 정책관리> 요금 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.18       mijin.kim     Initial creation
* </pre>
*
* @author IOUSOFT mijin.kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.18
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/policy/charge")
public class PolicyChargeAdminServiceController extends PageController {
	
	@Resource(name = "policyChargeAdminService")
	protected PolicyChargeAdminService service;
	
	@Autowired
	protected CommonService commonService;
	
	@Resource(name = "systemCodeAdminService")
	protected SystemCodeAdminService systemCodeAdminService;
	
	@Value("${spring.profiles}")
	private String profiles;
	
	
	/**
	 * 요금 검색 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String searchCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		model.addAttribute("vo", vo);
		return "/html/policy/charge/ChargeSearch";
	}
	
	/**
	 * 요금목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String listCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.listCharge(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("vo", vo);
		return "/html/policy/charge/ChargeList";
	}
	
	/**
	 * 요금 등록/수정 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public String editCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				model.addAttribute("pageType", "update");
				Map<String, Object> result = service.selectCharge(request, sessionVO, vo);
				model.addAttribute("result", result);
			}else {
				model.addAttribute("pageType", "insert");	
			}
		}else {
			model.addAttribute("pageType", "insert");
		}
		
		model.addAttribute("profiles", profiles);
		return "/html/policy/charge/ChargeEdit";
	}
	
	
	/**
	 * 요금 등록/수정 화면> 기준단가
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/base")
	public String editBase(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.listBaseUnit(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
				
		return "/html/policy/charge/ChargeEditBase";
	}
	
	/**
	 * 요금 등록/수정 화면> 거리별가중치
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/distance")
	public String editDistance(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.listWeightDistance(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
		
		return "/html/policy/charge/ChargeEditDistance";
	}
	
	/**
	 * 요금 등록/수정 화면> 차량유형별 가중치
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/cartype")
	public String editCartype(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차량형태
		List carType = commonService.listCode(sessionVO, "carType");
		model.addAttribute("carType", carType);
		
		//차량옵션
		List carOption = commonService.listCode(sessionVO, "carOption");
		model.addAttribute("carOption", carOption);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.listWeightCarType(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
		
		return "/html/policy/charge/ChargeEditCarType";
	}
	
	/**
	 * 요금 등록/수정 화면> 유류비
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/oilcost")
	public String editOilCost(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차량형태
		List carType = commonService.listCode(sessionVO, "carType");
		model.addAttribute("carType", carType);
		
		//차량옵션
		List carOption = commonService.listCode(sessionVO, "carOption");
		model.addAttribute("carOption", carOption);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.listOilCost(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
				
		return "/html/policy/charge/ChargeEditOilCost";
	}
	
	/**
	 * 요금 등록/수정 화면> 지역별 가중치
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/area")
	public String editArea(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.listWeightArea(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
		
		return "/html/policy/charge/ChargeEditArea";
	}
	
	/**
	 * 요금 등록/수정 화면> 익일하차 가중치
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/nextdaydrop")
	public String editNextDayDrop(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);

		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.selectWeightNextDayDrop(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
		
		return "/html/policy/charge/ChargeEditNextDayDrop";
	}
	
	/**
	 * 요금 등록/수정 화면> 상/하차수작업비용
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/manualcost")
	public String editManualCost(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.listManualCost(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
		
		return "/html/policy/charge/ChargeEditManualCost";
	}
	
	/**
	 * 요금 등록/수정 화면> 긴급화물 가중치
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/emergency")
	public String editEmergency(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.selectWeightEmergency(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
		
		return "/html/policy/charge/ChargeEditEmergency";
	}
	
	/**
	 * 요금 등록/수정 화면> 작업시간별 가중치
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit/wokingtime")
	public String editWokingTime(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		if(vo.getChargeIdx() != null) {
			if(!vo.getChargeIdx().isEmpty()) {
				Map<String, Object> result = service.listWeightWorkingTime(request, sessionVO, vo);
				model.addAttribute("result", result);
			}
		}
		
		return "/html/policy/charge/ChargeEditWokingTime";
	}
	
	/**
	 * 요금정책 저장
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/info")
	public @ResponseBody Map<String, Object> saveChargeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		vo.setUpdDate(df.format(today));
		
		Map<String, Object> result = service.saveCharge(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 기본단가 저장
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/base")
	public @ResponseBody Map<String, Object> saveChargeBase(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		Map<String, Object> result = service.saveBaseUnit(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 거리별 가중치 저장 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/distance")
	public @ResponseBody Map<String, Object> saveChargeDistance(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		Map<String, Object> result = service.saveWeightDistance(request, sessionVO, vo);
		
		return result;
	}
	
	@RequestMapping(value = "/save/cartype")
	public @ResponseBody Map<String, Object> saveChargeCartype(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = new HashMap<>();
		int carTypeSuccCnt = 0;
		int carOptionSuccCnt = 0;
		
		//차량종류
		result = service.saveWeightCarType(request, sessionVO, vo);
		if(result.get("succCnt") != null) {
			carTypeSuccCnt = (int) result.get("succCnt");
		}else {
			return result;
		}
		
		//차량옵션
		result = service.saveWeightCarOption(request, sessionVO, vo);
		if(result.get("succCnt") != null) {
			carOptionSuccCnt = (int) result.get("succCnt");
		}else {
			return result;
		}
		
		int succCnt = carTypeSuccCnt + carOptionSuccCnt;
		result.put("succCnt", succCnt);
		
		return result;
	}
	
	/**
	 * 유류비 저장
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/oilcost")
	public @ResponseBody Map<String, Object> saveChargeOilCost(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = new HashMap<>();
		int carTypeSuccCnt = 0;
		int carOptionSuccCnt = 0;
		
		//차량종류
		result = service.saveOilCostCarType(request, sessionVO, vo);
		if(result.get("succCnt") != null) {
			carTypeSuccCnt = (int) result.get("succCnt");
		}else {
			return result;
		}
		
		//차량옵션
		result = service.saveOilCostCarOption(request, sessionVO, vo);
		if(result.get("succCnt") != null) {
			carOptionSuccCnt = (int) result.get("succCnt");
		}else {
			return result;
		}
		
		
		int succCnt = carTypeSuccCnt + carOptionSuccCnt;
		result.put("succCnt", succCnt);
		
		return result;
	}
	
	/**
	 * 지역별 가중치 저장
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/area")
	public @ResponseBody Map<String, Object> saveChargeArea(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.saveWeightArea(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 익일하차 가중치 저장 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/nextdaydrop")
	public @ResponseBody Map<String, Object> saveChargeNextDayDrop(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.saveWeightNextdayDrop(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 상/하차지 수작업 비용 저장
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/manualcost")
	public @ResponseBody Map<String, Object> saveChargeManualCost(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.saveManualCost(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 긴급화물 가중치 저장
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save/emergency")
	public @ResponseBody Map<String, Object> saveChargeEmergency(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.saveWeightEmergency(request, sessionVO, vo);
		
		return result;
	}
	
	@RequestMapping(value = "/save/wokingtime")
	public @ResponseBody Map<String, Object> saveChargeWokingtime(HttpServletRequest request, HttpServletResponse response, ModelMap model, ChargeVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		Map<String, Object> result = service.saveWeightWorkingTime(request, sessionVO, vo);
		
		return result;
	}
	
	/**
	 * 지역 popup
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/area/popup")
	public String areaPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model, AreaVO vo) throws Exception {
		model.addAttribute("vo", vo);
		return "/html/policy/charge/AreaPopup";
	}
	
	
	/**
	 * 지역 목록조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/area/list")
	public String areaList(HttpServletRequest request, HttpServletResponse response, ModelMap model, AreaVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		/*
		logger.debug("vo={}", vo);
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGroupId(vo.getAreaGroupCode());
		codeVO.setSearchType(vo.getSearchType());
		codeVO.setSearchText(vo.getSearchText());
		logger.debug("codeVO={}", codeVO);
		
		Map<String, Object> result = systemCodeAdminService.selectCode(sessionVO, codeVO);
		
		model.addAttribute("result", result);
		*/
		
		List list = commonService.listCode(sessionVO, vo.getAreaGroupCode());
		model.addAttribute("codeList", list);
		
		return "/html/policy/charge/AreaPopupList";
	}
	
}
