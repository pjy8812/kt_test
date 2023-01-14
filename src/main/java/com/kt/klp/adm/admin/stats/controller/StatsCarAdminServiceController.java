package com.kt.klp.adm.admin.stats.controller;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.stats.domain.StatisticsVO;
import com.kt.klp.adm.admin.stats.service.StatsCarAdminService;

import kr.co.iousoft.lib.core.controller.ServiceController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* StatsCarAdminServiceController : 통계> 차량현황 service contoller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.05.02       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.05.02
* @version 1.0.0
* @see
*
*/
@Controller
@RequestMapping("/ui/service/stats/car")
public class StatsCarAdminServiceController extends ServiceController {
	
	@Autowired
	protected StatsCarAdminService statsCarAdminService;

	@Autowired
	protected CommonService commonService;
	
	/**
	 * 차량 통계 - 검색 폼 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap model, String pageType) throws Exception {
		
		// SessionVO session = getSessionVO(request, response);
		
		return "/html/stats/car/CarSearch";
	}
	
	/**
	 * 차량 통계 - 목록 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		
		List carTypeList = commonService.listCode(session, "carType"); 
		
		model.addAttribute("carTypeList", carTypeList);
		model.addAttribute("result", statsCarAdminService.getList(request, response, session, vo));
		
		return "/html/stats/car/CarList";
	}

	/**
	 * 차량 통계 - 목록 - 엑셀 다운로드 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download")
	public void excel(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		
		String decodeJSONdata = URLDecoder.decode(JSONdata, "UTF-8");
		decodeJSONdata = UtilFunctions.decodeXss(decodeJSONdata);

		ObjectMapper mapper = new ObjectMapper();
		Map result = mapper.readValue(decodeJSONdata, Map.class);
		
		StatisticsVO vo = new StatisticsVO();
		vo.loadMap(result);
		
		SessionVO session = getSessionVO(request, response);
		statsCarAdminService.getExcel(request, response, session, vo);
	}
	
}
