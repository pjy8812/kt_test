package com.kt.klp.adm.admin.owner.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.exception.ServiceException;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* OwnerAdminServiceController : 회원관리 service controller
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
@RequestMapping("/ui/service/owner")
public class OwnerAdminServiceController extends AbstractController {
	
	public static final String API_URL_FRGOWN_SMS_EMAIL = "/v1/admin/request/sms_email";				//파일수정요청
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 회원관리 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param type
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/{type}")
	public String popup01(HttpServletRequest request, HttpServletResponse response, ModelMap model
			, @PathVariable String type) throws Exception {
		
		String ownerId = request.getParameter("ownerId");
		
		Map<String, Object> info = new HashMap<>();
		info.put("ownerId", ownerId); 	//차주, 화주ID
		info.put("popupType", type);	//modal popup 구분
		model.addAttribute("info", info);
		
		return "/html/owner/Popup";
	}
	
	/**
	 * 요금조정구간 팝업
	 * @param request
	 * @param response
	 * @param model
	 * @param type
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fareAdjustPopup")
	public String popup02(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String frgownId = request.getParameter("frgownId");
		String corporateRegistrationNumber = request.getParameter("number");
		
		String fareAdjustFrom = "";
		String fareAdjustTo = "";
		
		
		if (request.getParameter("fareAdjustFrom") != null && !"".equals(request.getParameter("fareAdjustFrom"))) {
			fareAdjustFrom = request.getParameter("fareAdjustFrom");
		} else {
			fareAdjustFrom = "-15";
		}
		
		if (request.getParameter("fareAdjustTo") != null && !"".equals(request.getParameter("fareAdjustTo"))) {
			fareAdjustTo = request.getParameter("fareAdjustTo");
		} else {
			fareAdjustTo = "50";
		}
		
		Map<String, Object> info = new HashMap<>();
		info.put("frgownId", frgownId); 	//화주ID
		info.put("corporateRegistrationNumber", corporateRegistrationNumber); 	//사업자번호
		info.put("fareAdjustFrom", fareAdjustFrom); //조정구간  from
		info.put("fareAdjustTo", fareAdjustTo); 	//조정구간  to
		model.addAttribute("info", info);
		
		return "/html/owner/frgown/FrgownFareAdjustPopup";
	}
	
	
	/**
	 * 화주 sms발송
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "{type}/send/sms")
	public @ResponseBody Map<String, Object> sendSms(HttpServletRequest request, HttpServletResponse response, ModelMap model
			, @PathVariable String type) throws Exception {
		SessionVO sessionVO =  getSessionVO(request, response);
		
		String ownerId = request.getParameter("ownerId");
		String fileType = request.getParameter("fileType");
		String msg = "브로캐리에서 '%s: %s' 첨부파일 수정을 요청하였습니다. 확인 후 재업로드 바랍니다.";
		
		if(ownerId == null) {
			throw new ServiceException("id is null");
		}
		
		String url = API_URL_FRGOWN_SMS_EMAIL;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		//회원구분
		String ownerClassification ="";
		String ownerClassificationName = "";
		if(type.equals("frgown")) {
			ownerClassification = "freightOwner";
			ownerClassificationName = "화주";
		}else if(type.equals("carown")) {
			ownerClassification = "carOwner";
			ownerClassificationName = "차주";
		}else {
			throw new ServiceException("ownerClassification error");
		}
		
		Map<String, Object> param = new HashMap<>();
		param.put("ownerClassification", ownerClassification);
		param.put("sendClassification", "SMS");
		param.put("sendMsg", String.format(msg, ownerClassificationName, fileType));
		param.put("ownerId", ownerId);
		//logger.debug("{}", param);
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
}
