package com.kt.klp.adm.admin.stats.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.klp.adm.admin.common.service.CommonService;
import com.kt.klp.adm.admin.stats.domain.StatisticsVO;
import com.kt.klp.adm.admin.stats.service.StatsAmountAdminService;

import kr.co.iousoft.lib.core.controller.AbstractController;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.UtilFunctions;

/**
*
* StatsAmountAdminServiceController : 물량통계 service controller
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.27       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.04.27
* @version 1.0.0
* @see
*
*/

@Controller
@RequestMapping("/ui/service/stats/amount")
public class StatsAmountAdminServiceController extends AbstractController {
	
	public static final String[] FRGOWN_TYPE_ALL_HEADERS = {"", "일반", "운송사", "주선사"};
	public static final String[] FRGOWN_TYPE_EACH_HEADERS = {"", "계약-사업자", "계약-비사업자", "일반-사업자", "일반-비사업자", "수동배차-계약화주"};
	
	@Resource(name = "statsAmountAdminService")
	protected StatsAmountAdminService amountAdminService;
	
	@Autowired
	protected CommonService commonService;
	
	/**
	 * 화주별 탭 - 검색 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/frgown/search")
	public String searchFrgown(HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo) throws Exception {

		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		model.addAttribute("businessType", commonService.listCode(session, "businessType")); //사업자유형
		
		return "/html/stats/amount/FrgownSearch";
	}
	
	/**
	 * 화주별 탭 - 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/frgown/list")
	public String listFrgown(HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		
		Map result = amountAdminService.listFrgown(request, session, vo);
		model.addAttribute("result", result);
		
		if(vo.getFreightOwnerType() != null && vo.getBusinessType() != null) {
			if(vo.getFreightOwnerType().equals("all")) {
				//사업자유형이 전체인 경우
				model.addAttribute("headers", Arrays.asList(FRGOWN_TYPE_ALL_HEADERS));
			} else {
				if(vo.getBusinessType().equals("all")) {
					//사업자구분이 전체인 경우
					model.addAttribute("headers", Arrays.asList(FRGOWN_TYPE_EACH_HEADERS));
				} else {
					List<String> headers = new ArrayList<>();
					headers.add("");
					
					if(vo.getBusinessType().equals("01")) {
						headers.add("계약-사업자");
					} else if(vo.getBusinessType().equals("02")) {
						headers.add("계약-비사업자");
					} else if(vo.getBusinessType().equals("03")) {
						headers.add("일반-사업자");
					} else if(vo.getBusinessType().equals("04")) {
						headers.add("일반-비사업자");
					} else if(vo.getBusinessType().equals("manualDelivery")) {
						headers.add("수동배차-계약화주");
					}
					model.addAttribute("headers", headers);
				}
			}
		}
		
		return "/html/stats/amount/FrgownList";
	}
	
	/**
	 * 구간별 탭 - 검색 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/loc/search")
	public String searchLoc(HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo) throws Exception {

		model.addAttribute("vo", vo);
		return "/html/stats/amount/LocSearch";
	}
	
	/**
	 * 구간별 탭 - 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @param JSONdata
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/loc/list")
	public String listLoc(HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		
		String deJSONdata = UtilFunctions.decodeXss(JSONdata.replaceAll("&quot;", "\""));
		vo.setLocation(new ObjectMapper().readValue(deJSONdata, List.class));
		
		String loadedAt = "";
		String unloadedAt = "";
		
		List<String> locHeaders = new ArrayList<>();
		locHeaders.add("");
		
		List list = vo.getLocation();
		for(int i=0; i<list.size(); i++) {
			Map map = (Map) list.get(i);
			
			//조회된 지역코드를 '상차지 지역명-하차지 지역명' 형태로 반환
			if(map.get("loadedAt") != null && !map.get("loadedAt").equals("all")
				&& map.get("unloadedAt") != null && !map.get("unloadedAt").equals("all")) {
				
				loadedAt = amountAdminService.getLocationNameByCode(map.get("loadedAt").toString());
				unloadedAt = amountAdminService.getLocationNameByCode(map.get("unloadedAt").toString());
				
				locHeaders.add(loadedAt+"-"+unloadedAt);
				model.addAttribute("locHeaders", locHeaders);
			}
		}
		
		Map result = amountAdminService.listLoc(request, session, vo);
		model.addAttribute("result", result);
		
		return "/html/stats/amount/LocList";
	}
	
	/**
	 * 차량별 탭 - 검색 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/car/search")
	public String searchCar(HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo) throws Exception {

		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		model.addAttribute("carType", commonService.listCode(session, "carType")); //차종
		model.addAttribute("carModel", commonService.listCode(session, "carModel")); //톤수
		
		return "/html/stats/amount/CarSearch";
	}
	
	/**
	 * 차량별 탭 - 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @param JSONdata
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/car/list")
	public String listCar(HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		
		SessionVO session = getSessionVO(request, response);
		model.addAttribute("vo", vo);
		model.addAttribute("carType", commonService.listCode(session, "carType")); //차종
		model.addAttribute("carModel", commonService.listCode(session, "carModel")); //톤수
		
		String deJSONdata = UtilFunctions.decodeXss(JSONdata.replaceAll("&quot;", "\""));
		vo.setCarList(new ObjectMapper().readValue(deJSONdata, List.class));
		
		List<String> carHeaders = new ArrayList<>();
		carHeaders.add("");
		
		List list = vo.getCarList();
		for(int i=0; i<list.size(); i++) {
			Map map = (Map) list.get(i);
			
			//조회된 차량코드를 '차종(톤수)' 형태로 반환
			if((map.get("carType") != null && !map.get("carType").equals("all"))
				|| (map.get("carModel") != null && !map.get("carModel").equals("all"))) {
				
				String carType = map.get("carType").toString();
				String carModel = map.get("carModel").toString();
				
				String typeAndModel = amountAdminService.getCarTypeAndModelNameByCode(session, carType, carModel);
				carHeaders.add(typeAndModel);
				model.addAttribute("carHeaders", carHeaders);
			}
		}
		
		Map result = amountAdminService.listCar(request, session, vo);
		model.addAttribute("result", result);
		
		return "/html/stats/amount/CarList";
	}
	
	/**
	 * 엑셀다운로드 
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param vo
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download/{mode}")
	public void downloadExcel(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, StatisticsVO vo) throws Exception {
		SessionVO session = getSessionVO(request, response);
		amountAdminService.excelDownload(request, response, session, vo, mode);
	}
	
	/**
	 * 엑셀다운로드 - 파라미터에 json data 포함
	 * 
	 * @param mode
	 * @param request
	 * @param response
	 * @param model
	 * @param JSONdata
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel/download.json/{mode}")
	public void downloadExcelByJson(@PathVariable("mode") String mode, HttpServletRequest request, HttpServletResponse response, ModelMap model, @RequestParam(value = "JSONdata") String JSONdata) throws Exception {
		
		String decodeJSONdata = URLDecoder.decode(JSONdata, "UTF-8");
		decodeJSONdata = UtilFunctions.decodeXss(decodeJSONdata);

		ObjectMapper mapper = new ObjectMapper();
		Map result = mapper.readValue(decodeJSONdata, Map.class);
		result.remove("JSONdata");
		
		StatisticsVO vo = new StatisticsVO();
		vo.loadMap(result);
		
		SessionVO session = getSessionVO(request, response);
		amountAdminService.excelDownload(request, response, session, vo, mode);
	}
	
}
