package com.kt.klp.adm.admin.system.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kt.klp.adm.admin.system.domain.DeviceVO;
import com.kt.klp.adm.admin.system.service.SystemDeviceAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

/**
*
* SystemDeviceAdminServiceController : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.27       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.27
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/service/system/device")
public class SystemDeviceAdminServiceController extends AbstractController {
	
	public static final String[] SYSTEM_DEVICE_HEADERS = {
		"구분", "이용자 ID", "이용자명", "디바이스", "OS", "OS버전", "APP 버전", "첫 로그인", "마지막 접속일시"
	};
	
	@Autowired
	protected SystemDeviceAdminService systemDeviceAdminService;
	
	/**
	 * 시스템 - 단말기 정보 - 검색 폼 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String searchDevice(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "/html/system/device/DeviceSearch";
	}
	
	/**
	 * 시스템 - 단말기 정보 - 목록 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String listDevice(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestBody DeviceVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		logger.debug("vo=={}", vo);
		
		model.addAttribute("headers", Arrays.asList(SYSTEM_DEVICE_HEADERS));
		model.addAttribute("result", systemDeviceAdminService.getList(request, session, vo)); 
		
		return "/html/system/device/DeviceList";
	}
	
	/**
	 * 시스템 - 단말기 정보 - 목록 - 엑셀다운로드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
//	@RequestMapping(value = "/excel/download")
//	public void excelDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
//		// TODO
//		systemDeviceAdminService.makeExcelList(request, response, Arrays.asList(SYSTEM_DEVICE_HEADERS), null);
//	}

}
