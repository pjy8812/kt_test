package com.kt.klp.adm.admin.stats.controller;

import java.net.URLDecoder;
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
import com.kt.klp.adm.admin.stats.domain.DeliveryAmountStatisticsVO;
import com.kt.klp.adm.admin.stats.service.StatsAmountDeliveryAdminService;

import kr.co.iousoft.lib.core.controller.ServiceController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* StatsAmountDeliveryAdminServiceController : 통계> 물량통계> 배송조건별통계
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
@RequestMapping("/ui/service/stats/amount")
public class StatsAmountDeliveryAdminServiceController extends ServiceController {

	@Autowired
	protected StatsAmountDeliveryAdminService amountAdminService;
	
	@Autowired
	protected CommonService commonService;
	
	/**
	 * 배송조건별 검색 폼
	 * from StatsAmountAdminServiceController
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delvy/search")
	public String searchDelvy(HttpServletRequest request, HttpServletResponse response, ModelMap model, DeliveryAmountStatisticsVO vo) throws Exception {
		
		// model.addAttribute("vo", vo);
		return "/html/stats/amount/DelvySearch";
	}
	
	/**
	 * 배송조건별 목록
	 * from StatsAmountAdminServiceController
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delvy/list")
	public String listDelvy(HttpServletRequest request, HttpServletResponse response, ModelMap model, DeliveryAmountStatisticsVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		
		Map result = amountAdminService.listDelvy(request, session, vo);
		model.addAttribute("result", result);
		
		return "/html/stats/amount/DelvyList";
	}
	
	/**
	 * 배송조건별 목록 - 다운로드 
	 * from StatsAmountAdminServiceController
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param JSONdata
	 * @throws Exception
	 */
	@RequestMapping(value = "/delvy/excel/download")
	public void excelDelvy(HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		
		String decodeJSONdata = URLDecoder.decode(JSONdata, "UTF-8");
		decodeJSONdata = UtilFunctions.decodeXss(decodeJSONdata);

		ObjectMapper mapper = new ObjectMapper();
		Map result = mapper.readValue(decodeJSONdata, Map.class);
		
		logger.debug("{}",result);
		DeliveryAmountStatisticsVO vo = new DeliveryAmountStatisticsVO();
		vo.loadMap(result);
		
		SessionVO session = getSessionVO(request, response);
		amountAdminService.getExcel(request, response, session, vo);
	}
	
}
