package com.kt.klp.adm.admin.owner.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.owner.domain.CarOwnerVO;
import com.kt.klp.adm.admin.owner.domain.FreightOwnerVO;
import com.kt.klp.adm.admin.owner.domain.CarrierOwnerVO;
import com.kt.klp.adm.admin.owner.service.CarrierAdminService;
import com.kt.klp.adm.admin.owner.service.FrgownAdminService;

import javassist.expr.NewArray;
import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* FrgownAdminServiceController : 회원관리> 화주관리 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.19       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.01.19
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/owner/frgown")
public class FrgownAdminServiceController extends AbstractController {
	
	@Autowired
	protected FrgownAdminService service;
	
	@Autowired
	protected CarrierAdminService carrierService;	
	
	@Autowired
	protected CommonService commonService;
	
	/**
	 * 화주 검색조건 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		//화주 검색조건에 필요한 공통코드 목록 조회
		getFrgownCodeList(sessionVO, model);
		
		model.addAttribute("vo", vo);
		return "/html/owner/frgown/FrgownSearch";
	}	
	
	
	/**
	 * 화주 목록
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		Map<String, Object> result = service.listFrgown(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("vo", vo);
		return "/html/owner/frgown/FrgownList";
	}	
	
	/**
	 * 화주 상세
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		//화면에 필요한 공통코드 조회
		getFrgownCodeList(sessionVO, model);
		
		Map result = service.selectFrgown(request, sessionVO, vo);
		model.addAttribute("result", result);
	
		model.addAttribute("vo", vo);
		return "/html/owner/frgown/FrgownDetail";
	}
	
	/**
	 * 운송대행사 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/carrier.select/{obj}")
	public String popupCarrierSelect(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo, @PathVariable("obj") String obj) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
				
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		Map result = carrierService.listCarrierOwner(request, sessionVO, vo);
		
		JSONObject paremObj = new JSONObject();
		JSONParser jParser    = new JSONParser();
		FreightOwnerVO info = new FreightOwnerVO();
		// obj 데이터 파싱
		try {
			paremObj = (JSONObject) jParser.parse(obj);
			// 파라미터 정보가 존재하는 경우만
			if (paremObj != null) {
				if (paremObj.get("carrierId") != null && !"".equals(paremObj.get("carrierId"))) {
					String[] tempLsit = paremObj.get("carrierId").toString().split(",");
					List<Map> list = (List) result.get("list");
					for(Map item : list) {

						if(item.get("carrierId") != null) {
							for (int i = 0; i < tempLsit.length; i++) {
								if (tempLsit[0].equals(item.get("carrierId").toString())) {
									item.put("carrierIdCheck", "Y");
									continue;
								} else {
									item.put("carrierIdCheck", "N");
								}
							}				
						}
					}	
					result.put("list", list);
					info.setCarrierId(paremObj.get("carrierId").toString());
				}
				
				if (paremObj.get("frgownId") != null && !"".equals(paremObj.get("frgownId"))) {
					info.setFreightOwnerId(paremObj.get("frgownId").toString());
				}
			}
			
		} catch (Exception e) {
			logger.error("ERROR : modeObj JSONParsing");
			logger.error(e.getMessage());
		}		

		model.addAttribute("result", result);
		model.addAttribute("info", info);
		model.addAttribute("vo", vo);
		
		return "/html/owner/frgown/FrgownCarrierPopup";
	}
	
	/**
	 * 요금제 요율 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/fare.select/{obj}")
	public String popupFareSelect(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo, @PathVariable("obj") String obj) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
				
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		Map<String, Object> result = service.listFrgownFare(request, sessionVO, vo);
		
		JSONObject paremObj = new JSONObject();
		JSONParser jParser    = new JSONParser();
		FreightOwnerVO info = new FreightOwnerVO();
		// obj 데이터 파싱
		try {
			paremObj = (JSONObject) jParser.parse(obj);
			// 파라미터 정보가 존재하는 경우만
			if (paremObj != null) {
				if (paremObj.get("fareCode") != null && !"".equals(paremObj.get("fareCode"))) {
					String[] tempLsit = paremObj.get("fareCode").toString().split(",");
					List<Map> list = (List) result.get("list");
					for(Map item : list) {

						if(item.get("freightOwnerFareCode") != null) {
							for (int i = 0; i < tempLsit.length; i++) {
								if (tempLsit[0].equals(item.get("freightOwnerFareCode").toString())) {
									item.put("fareCodeCheck", "Y");
									continue;
								} else {
									item.put("fareCodeCheck", "N");
								}
							}				
						}
					}	
					result.put("list", list);
					info.setFreightOwnerFareCode(paremObj.get("fareCode").toString());
				}
				
				if (paremObj.get("fareApplyDate") != null && !"".equals(paremObj.get("fareApplyDate"))) {
					info.setFreightOwnerFareApplyDate(paremObj.get("fareApplyDate").toString());
				}
				
				if (paremObj.get("frgownId") != null && !"".equals(paremObj.get("frgownId"))) {
					info.setFreightOwnerId(paremObj.get("frgownId").toString());
				}				
			}
			
		} catch (Exception e) {
			logger.error("ERROR : modeObj JSONParsing");
			logger.error(e.getMessage());
		}		

		model.addAttribute("result", result);
		model.addAttribute("info", info);
		model.addAttribute("vo", vo);
		
		return "/html/owner/frgown/FrgownFarePopup";
	}
	
	/**
	 * 요금제 요율 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/fare.select2")
	public String popupFareSelect(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
				
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		Map<String, Object> result = service.listFrgownFare(request, sessionVO, vo);
		
		model.addAttribute("result", result);
		model.addAttribute("vo", vo);
		
		return "/html/owner/frgown/FrgownFarePopup2";
	}	
	
	/**
	 * 화주 계약정보 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/contract.select")
	public String contractSelectPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		Map result = service.selectFrgown(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		if (vo.getFreightOwnerFareAdjustFrom() == null || "".equals(vo.getFreightOwnerFareAdjustFrom())) {
			vo.setFreightOwnerFareAdjustFrom("-15");
		}
		
		if (vo.getFreightOwnerFareAdjustTo() == null || "".equals(vo.getFreightOwnerFareAdjustTo())) {
			vo.setFreightOwnerFareAdjustTo("50");
		}		
		model.addAttribute("vo", vo);
		
		return "/html/owner/frgown/FrgownContractPopup";
	}	
		
	
	/**
	 * 화주 위약수수료 목록 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/placebofee.list")
	public String placebofeeList(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		Map result = service.listPlacebofee(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/owner/frgown/PlaceboFeePopupList";
	}	
	
	/**
	 * 화주 변경내역 목록 조회
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/history.list")
	public String popupHistoryList(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}

		Map result = service.listFrgownHistory(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		return "/html/owner/frgown/FrgownHistoryPopupList";
	}
	
	
	
	
	/**
	 * 화주 정보수정
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update")
	public @ResponseBody Map<String, Object> update(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		vo.setFreightOwnerHistoryAmender(sessionVO.getAdminId()); 
		Map result = service.updateFrgown(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 화주 마스터 정보 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/master.update")
	public @ResponseBody Map<String, Object> masterUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		Map result = service.updateFrgownMasterFlag(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 계약화주 운송대행사 정보 수정
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carrier/update/{obj}")
	public @ResponseBody Map<String, Object> carrierUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo, @PathVariable("obj") String obj) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		Map result = service.carrierUpdate(request, sessionVO, vo, obj);
		return result;
	}
	
	/**
	 * 요금제 및 요율명 정보 수정
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fare/update/{obj}")
	public @ResponseBody Map<String, Object> fareUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo, @PathVariable("obj") String obj) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		Map result = service.fareUpdate(request, sessionVO, vo, obj);
		return result;
	}
	
	/**
	 * 요금 조정구간 정보 수정
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fareAdjust/update")
	public @ResponseBody Map<String, Object> fareAdjustUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		Map result = service.fareAdjustUpdate(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 요금제 및 요율명/ 요금 조정구간 정보 수정
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fare.adjust/update/{obj}")
	public @ResponseBody Map<String, Object> fareAdjustUpdate2(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo, @PathVariable("obj") String obj) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		Map result = service.fareUpdate(request, sessionVO, vo, obj);
		result = service.fareAdjustUpdate(request, sessionVO, vo);
		return result;
	}		
	
	/**
	 * 화주 탈퇴(승인)
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdraw")
	public @ResponseBody Map<String, Object> withdraw(HttpServletRequest request, HttpServletResponse response, ModelMap model, FreightOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getFreightOwnerId() == null) {
			throw new ServiceException("id is null");
		}
		
		vo.setFreightOwnerHistoryAmender(sessionVO.getAdminId()); 
		Map result = service.withdrawFrgown(request, sessionVO, vo);
		return result;
	}
	
	/**
	 * 화주 검색/조회 화면에서 사용하는 공통코드 목록 
	 * @param model
	 * @throws Exception
	 */
	private void getFrgownCodeList(SessionVO sessionVO, ModelMap model) throws Exception {
		//계약구분 (화주형태)
		List freightOwnerType = commonService.listCode(sessionVO, "freightOwnerType"); 
		//logger.debug("{}", freightOwnerType);
		model.addAttribute("freightOwnerType", freightOwnerType);
		
		//사업자구분 (회원형태)
		List memberType = commonService.listCode(sessionVO, "memberType");
		//logger.debug("{}", memberType);
		model.addAttribute("memberType", memberType);
		
		//사업자유형 (사업사형태)
		List businessType = commonService.listCode(sessionVO, "businessType");
		//logger.debug("{}", businessType);
		model.addAttribute("businessType", businessType);
		
		//이용상태 (회원상태)
		List memberStatus = commonService.listCode(sessionVO, "memberStatus");
		//logger.debug("{}", memberStatus);
		model.addAttribute("memberStatus", memberStatus);
	}
}
