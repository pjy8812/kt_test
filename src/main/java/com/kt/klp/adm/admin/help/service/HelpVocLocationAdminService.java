package com.kt.klp.adm.admin.help.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.help.domain.LocationVO;
import com.kt.klp.adm.admin.order.service.OrderAdminService;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* helpVocLocationAdminService : APP/WEB> 1:1문의> 위치정보관리대장 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.29       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.04.29
* @version 1.0.0
* @see
*
*/

@Service("helpVocLocationAdminService")
public class HelpVocLocationAdminService extends AbstractServiceImpl {

	public static final String API_URL_LOCATION_LIST = "/v1/admin/voc/location/list";				
	public static final String API_URL_LOCATION_INSERT = "/v1/admin/voc/location/insert";		
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	
	/**
	 * 위치정보관리대장 목록조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param LocationVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listLocation(HttpServletRequest request, SessionVO sessionVO, LocationVO vo) throws Exception {
		String apiUrl = API_URL_LOCATION_LIST;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		
		Map<String, Object> param = new HashMap<>();
		param.put("nowPage", vo.getNowPage());
		param.put("pagePerRows", 20);
		//createStratDate -> createStartDateByLongType 변경됨 2022.05.02 mijin.kim
		param.put("createStartDateByLongType", vo.getCreateStratDate()); 
		//createEndDate -> createEndDateByLongType 변경됨 2022.05.02 mijin.kim
		param.put("createEndDateByLongType", vo.getCreateEndDate());	
		
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}else {
			param.put("maskingYn", "Y");
		}
		
		if(vo.getCarOwnerId() != null) {
			param.put("carOwnerId", vo.getCarOwnerId());
		}
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		///logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount");
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getNowPage());
				paginationVO.put("pageSize", vo.getPageSize());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}	
	
	/**
	 * 위치정보관리대장 등록
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param LocationVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> saveLocation(HttpServletRequest request, SessionVO sessionVO, LocationVO vo) throws Exception {
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		String url = API_URL_LOCATION_INSERT; //등록
		
		String location = OrderAdminService.API_URL_DELIVERY_COORDINATE;
		location = location.replace("%s", "{deliveryId}");
		
		Map<String, Object> param = new HashMap<>();
		param.put("carOwnerId", vo.getCarOwnerId());
		param.put("location", location);
		param.put("information", "차량위치정보");
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		logger.debug("{}", result);
	    
		return result;
	}
}