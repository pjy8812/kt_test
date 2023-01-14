package com.kt.klp.adm.admin.owner.controller;

import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.owner.domain.CarOwnerVO;
import com.kt.klp.adm.admin.owner.domain.CarrierOwnerVO;
import com.kt.klp.adm.admin.owner.service.CarrierAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;

/**
*
* CarrierAdminServiceController : 회원관리> 운송대행사 관리 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.12.27       Seongrae Kim     Initial creation
* </pre>
*
* @author PARUCNC Seongrae Kim (akaikarus@parucnc.com)
* @since 2022.12.27
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/owner/carrier")
public class CarrierAdminServiceController extends AbstractController {
	
	@Autowired
	protected CarrierAdminService service;
	
	@Autowired
	protected CommonService commonService;
	
	/**
	 * 운송대행사 검색
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
		getCarrierCodeList(sessionVO, model);
		
		model.addAttribute("vo", vo);
		return "/html/owner/carrier/CarrierSearch";
	}	
	
	
	/**
	 * 운송대행사 목록
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//페이지 정보가 없을 경우 1페이지로 조회
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		
		List paymentCondition = commonService.listCode(sessionVO, "paymentCondition");
		List memberStatus = commonService.listCode(sessionVO, "memberStatus");
		
		Map result = service.listCarrierOwner(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("paymentCondition", paymentCondition);
		model.addAttribute("memberStatus", memberStatus);
		model.addAttribute("vo", vo);
		return "/html/owner/carrier/CarrierList";
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
	public String popupCarSelect(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarrierId() == null) {
			 throw new ServiceException("id is null");
		}
		
		List carOption = commonService.listCode(sessionVO, "carOption");
		List carType = commonService.listCode(sessionVO, "carType");
		List carModel = commonService.listCode(sessionVO, "carModel");
		Map result = service.selectCar(request, sessionVO, vo);
		
		List carList = (List) result.get("carList");
		
		setCarOption(carList, carOption, "carrierCarOption");
		setCarOption(carList, carType, "carrierCarType");
		setCarOption(carList, carModel, "carrierCarModel");
		
		model.addAttribute("result", result);
		
		return "/html/owner/carrier/CarrierDetailPopup";
	}
	
	/**
	 * 운송대행사 등록
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/car.upload")
	public String popupCarUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		
		List carOption = commonService.listCode(sessionVO, "carOption");
		List carType = commonService.listCode(sessionVO, "carType");
		List carModel = commonService.listCode(sessionVO, "carModel");
		List packagingType = commonService.listCode(sessionVO, "packagingType");
		
		Map result = service.selectCar(request, sessionVO, vo);
		
		List carList = (List) result.get("carList");
		
		for (int i = 0; i < carList.size(); i++) {
			Map option = (Map) carList.get(i);
			
			if (option.get("carrierCarOption") != null) {
				String[] carrierCarOptions = option.get("carrierCarOption").toString().split(",");
				Map carrierCarMap = new HashMap<>();
				
				for (int j = 0; j < carrierCarOptions.length; j++) {
					if (carrierCarOptions[j].equals("lift")) {
						carrierCarMap.put("lift", carrierCarOptions[j]);
					} else if (carrierCarOptions[j].equals("antiSwing")) {
						carrierCarMap.put("antiSwing", carrierCarOptions[j]);
					} else {
						carrierCarMap.put("option", carrierCarOptions[j]);
					}
				}
				
				option.put("carrierCarOption", carrierCarMap);
				carList.set(i, option);
			}
		}
		
		model.addAttribute("result", result);
		model.addAttribute("carOption", carOption);
		model.addAttribute("carType", carType);
		model.addAttribute("carModel", carModel);
		model.addAttribute("packagingType", packagingType);
		
		return "/html/owner/carrier/CarrierCarInfoPopup";
	}
	
	/**
	 * 운송대행사 상세
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/select")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(vo.getCarrierId() == null) {
			 throw new ServiceException("id is null");
		}
		
		//공통코드 조회
		getCarrierCodeList(sessionVO, model);
		
		Map result = service.selectCarrierOwner(request, sessionVO, vo);
		model.addAttribute("result", result);
		
		model.addAttribute("vo", vo);
		return "/html/owner/carrier/CarrierDetail";
	}
	
	/**
	 * 운송대행사 등록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload")
	public String carrierUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		//공통코드 조회
		getCarrierCodeList(sessionVO, model);
		
		return "/html/owner/carrier/CarrierUpload";
	}
	
	/**
	 * 운송대행사 차량 저장
	 * @param request
	 * @param response
	 * @param model
	 * @param carrierId
	 * @param carData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/car.save")
	public @ResponseBody Map<String, Object> carrierCarSave(HttpServletRequest request, HttpServletResponse response, ModelMap model, String carrierId, String carData) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		
		Map result = service.saveCarrierCar(request, sessionVO, carrierId, carData);
		
		return result;
	}
	
	/**
	 * 운송대행사 차량정보 삭제
	 * @param request
	 * @param response
	 * @param model
	 * @param carrierId
	 * @param carData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/car.delete")
	public @ResponseBody Map<String, Object> carrierCarDelete(HttpServletRequest request, HttpServletResponse response, ModelMap model, String carrierId, String carData) throws Exception {
		SessionVO sessionVO = getSessionVO(request, response);
		
		Map result = service.deleteCarrierCar(request, sessionVO, carrierId, carData);
		
		return result;
	}
	
	/**
	 * 운송대행사 변경내역
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/history.list")
	public String popupHistoryList(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//화주ID가 없을 경우
		if(vo.getCarrierId() == null) {
			throw new ServiceException("id is null");
		}
		
		List memberStatus = commonService.listCode(sessionVO, "memberStatus");
		Map result = service.listCarrierHistory(request, sessionVO, vo);
		
		model.addAttribute("memberStatus", memberStatus);
		model.addAttribute("result", result);
		
		return "/html/owner/carrier/CarrierHistoryPopupList";
	}
	
	/**
	 * 운송대행사 Sub ID 추가 모달 호출
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/account")
	public String popupSubAccount(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		// 운송대행사ID가 없을 경우
		if(vo.getCarrierId() == null) {
			throw new ServiceException("id is null");
		}

		return "/html/owner/carrier/CarrierSubAccountPopup";
	}
	
	/**
	 * 운송대행사 Sub ID 추가
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/account/insert/{carrierMasterId}")
	public @ResponseBody Map<String, Object> insertSubAccount(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo, @PathVariable(value = "carrierMasterId") String carrierMasterId) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//운송대행사ID가 없을 경우 오류표시
		if(vo.getCarrierId() == null) {
			 throw new ServiceException("id is null");
		}
		
		//운송대행사PW가 없을 경우 오류표시
		if (vo.getCarrierPassword() == null) {
			throw new ServiceException("password is null");
		}
		
		Map<String, Object> result = service.insertSubAccount(request, sessionVO, vo, carrierMasterId);
		return result;
	}
	
	/**
	 * 운송대행사 검색/조회 화면에서 사용하는 공통코드 목록 
	 * @param model
	 * @throws Exception
	 */
	private void getCarrierCodeList(SessionVO sessionVO, ModelMap model) throws Exception {
		//구분 
		List carrierOwnerType = commonService.listCode(sessionVO, "carrierOwnerType");
		model.addAttribute("carrierOwnerType", carrierOwnerType);
		
		//이용상태 (회원상태)
		List memberStatus = commonService.listCode(sessionVO, "memberStatus");
		model.addAttribute("memberStatus", memberStatus);
		
		// 결제 조건
		List paymentCondition = commonService.listCode(sessionVO, "paymentCondition"); 
		model.addAttribute("paymentCondition", paymentCondition);
	}
	
	private void setCarOption(List carList, List carOption, String objName) throws Exception {
	
		Iterator<Map> carListIt = carList.iterator();
		Iterator<Map> carOptionIt = carOption.iterator();
		
		while (carListIt.hasNext()) {
			Map listObj = carListIt.next();
			
			String[] carrierCarOption = listObj.get(objName).toString().split(",");
			
			while (carOptionIt.hasNext()) {
				Map optionObj = carOptionIt.next();
				
				for (int i = 0; i < carrierCarOption.length; i++) {
					if (carrierCarOption[i].equals(optionObj.get("codeId").toString())) {
						carrierCarOption[i] = optionObj.get("codeName").toString();
					}
				}
			}
			
			StringBuilder optionResult = new StringBuilder();
			
			for (int i = 0; i < carrierCarOption.length; i++) {
				optionResult.append(carrierCarOption[i]);
				
				if (i < (carrierCarOption.length - 1)) {
					optionResult.append(" / ");
				}
			}
			
			listObj.put(objName, optionResult.toString());
		}
	}

	/**
	 * 운송대행사 정보수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update")
	public @ResponseBody Map<String, Object> update(MultipartHttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//운송대행사ID가 없을 경우 오류표시
		if(vo.getCarrierId() == null) {
			 throw new ServiceException("id is null");
		}

		vo.setCarrierHistoryAmender(sessionVO.getAdminId());
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, Object> result = service.updateCarrier(multipartRequest, sessionVO, vo);
		return result;
	}
	
	/**
	 * 운송대행사 탈퇴(승인)
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdraw")
	public @ResponseBody Map<String, Object> withdraw(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//차주ID가 없을 경우 오류표시
		if(request.getParameter("carrierId") == null) {
			 throw new ServiceException("id is null");
		}
		
		Map<String, Object> result = service.withdrawCarrier(request, sessionVO);
		return result;
	}
	
	/**
	 * 운송대행사 등록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insert")
	public @ResponseBody Map<String, Object> insert(HttpServletRequest request, HttpServletResponse response, ModelMap model, CarrierOwnerVO vo) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		//운송대행사ID가 없을 경우 오류표시
		if(vo.getCarrierId() == null) {
			throw new ServiceException("id is null");
		}
		
		Map<String, Object> result = service.insertCarrier(request, sessionVO, vo);
		return result;
	}

}
