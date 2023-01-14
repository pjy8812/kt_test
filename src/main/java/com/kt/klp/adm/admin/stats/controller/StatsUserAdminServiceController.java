package com.kt.klp.adm.admin.stats.controller;

import java.net.URLDecoder;
import java.util.Arrays;
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
import com.kt.klp.adm.admin.stats.service.StatsUserAdminService;

import kr.co.iousoft.lib.core.controller.ServiceController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;
/**
*
* StatsUserAdminServiceController : 통계> 이용자현황 service controller
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
@RequestMapping("/ui/service/stats/user")
public class StatsUserAdminServiceController extends ServiceController {
	
	public static final String[] STATISTICS_USER_HEADERS = {
		"", "전체", "화주", "차주"
	};
	
	@Autowired
	protected StatsUserAdminService statsUserAdminService;

	@Autowired
	protected CommonService commonService;
	
	/**
	 * 이용자 통계 - 검색 폼 
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
		
		return "/html/stats/user/UserSearch";
	}
	
	/**
	 * 이용자 통계 - 목록 
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
		
		model.addAttribute("headers", Arrays.asList(STATISTICS_USER_HEADERS));
		model.addAttribute("result", statsUserAdminService.getList(request, response, session, vo));
		
		return "/html/stats/user/UserList";
	}

	/**
	 * 이용자 통계 - 목록 - 엑셀 다운로드 
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
		statsUserAdminService.getExcel(request, response, session, vo);
	}
	
}
