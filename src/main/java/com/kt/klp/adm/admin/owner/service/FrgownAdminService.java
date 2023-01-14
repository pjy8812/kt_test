package com.kt.klp.adm.admin.owner.service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.owner.domain.FreightOwnerVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* FrgownAdminService : 회원관리> 화주관리 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.14       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.14
* @version 1.0.0
* @see
*
*/

@Service("frgownAdminService")
public class FrgownAdminService extends AbstractServiceImpl {
	
	public static final String API_URL_FRGOWN_LIST = "/v1/admin/frgown/list/%d";						//목록조회 {nowPage}
	public static final String API_URL_FRGOWN_SELECT = "/v1/admin/frgown/info/%s";						//상세조회 {freightOwnerId}
	public static final String API_URL_FRGOWN_UPDATE = "/v1/admin/frgown/change_info";					//회원정보 수정
	public static final String API_URL_FRGOWN_WITHDRAWAL = "/v1/admin/frgown/approval/withdrawal";		//회원탈퇴승인
	public static final String API_URL_FRGOWN_PENALTY_LIST = "/v1/admin/frgown/penalty/list/%d";		//위약수수료 목록조회 {nowPage}
	public static final String API_URL_FRGOWN_HISTORY_LIST = "/v1/admin/frgown/history/list/%d";		//변경내역 목록조회 {nowPage}
	public static final String API_URL_FRGOWN_HISTORY_INSERT = "/v1/admin/frgown/history/insert";		//변경내역 저장 (2022.03.01 삭제됨)
	public static final String API_URL_FRGOWN_MASTER_FLAG_UPDATE = "/v1/admin/frgown/update_info";		//마스터지정 수정
	public static final String API_URL_FRGOWN_CARRIER_UPDATE = "/v1/admin/frgown/carrierUpdate/%s";		//운송대행사 수정/{obj}
	public static final String API_URL_FRGOWN_FARE_UPDATE = "/v1/admin/frgown/fareUpdate/%s";	    	//요금제 수정/{obj}
	public static final String API_URL_FRGOWN_FARE_ADJUST_UPDATE = "/v1/admin/frgown/fareAdjustUpdate";    	//요금조정구간 수정/
	public static final String API_URL_FRGOWN_FARE_LIST = "/v1/admin/frgown/fare.list/%d";				//요금제목록조회 {nowPage}
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;
	
	/**
	 * 화주 목록 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listFrgown(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		//정렬이 없을 경우
		if(vo.getSort() == null) {
			vo.setSort("freightOwnerJoinDateTime");
			vo.setPagePerRows(vo.getPageSize());
		}
				
		String url = String.format(API_URL_FRGOWN_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("joinStartDate", vo.getJoinStartDate());
		param.put("joinEndDate", vo.getJoinEndDate());
		param.put("lastUseStartDate", vo.getLastUseStartDate());
		param.put("lastUseEndDate", vo.getLastUseEndDate());
		param.put("sort", vo.getSort());
		param.put("pagePerRows", vo.getPagePerRows());
		
		if(vo.getFreightOwnerType() != null) param.put("freightOwnerType", vo.getFreightOwnerType());
		if(vo.getFreightOwnerMemberType() != null) param.put("freightOwnerMemberType", vo.getFreightOwnerMemberType());
		if(vo.getFreightOwnerBusinessType() != null) param.put("freightOwnerBusinessType", vo.getFreightOwnerBusinessType());
		if(vo.getFreightOwnerMemberStatus() != null) param.put("freightOwnerMemberStatus", vo.getFreightOwnerMemberStatus());
		if(vo.getFreightOwnerMonthSettlementNum() > 0) param.put("freightOwnerMonthSettlementNum", vo.getFreightOwnerMonthSettlementNum());
		if(vo.getFreightOwnerFileAdminCheckYN() != null) param.put("freightOwnerFileAdminCheckYn", vo.getFreightOwnerFileAdminCheckYN());
		if(vo.getSearchType() != null) param.put("searchType", vo.getSearchType());
		if(vo.getSearchText() != null) param.put("searchText", vo.getSearchText());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			//페이징
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount");
				
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getNowPage());
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}
	
	/**
	 * 화주 상세조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectFrgown(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		
		String url = String.format(API_URL_FRGOWN_SELECT, vo.getFreightOwnerId());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		
		//마스킹여부 
		if(vo.getMaskingYn() != null) {
			param.put("maskingYn", vo.getMaskingYn());
		}else {
			param.put("maskingYn", "Y");
		}
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		UtilFunctions.millisecondListToDate(result); 
		//logger.debug("{}", result);
		
		return result;
	}	
	
	
	/**
	 * 화주 위약수수료 내역 목록 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listPlacebofee(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		vo.setPagePerRows(5);
		String url = String.format(API_URL_FRGOWN_PENALTY_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		param.put("pagePerRows", vo.getPagePerRows());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
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
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}
	
	/**
	 * 화주 변경내역 목록 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listFrgownHistory(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		vo.setPagePerRows(5);
		String url = String.format(API_URL_FRGOWN_HISTORY_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		param.put("pagePerRows", vo.getPagePerRows());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
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
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		return result;
	}
	
	
	/**
	 * 화주 정보수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateFrgown(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		String url = API_URL_FRGOWN_UPDATE; 
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		param.put("freightOwnerType", vo.getFreightOwnerType());
		param.put("freightOwnerMemberType", vo.getFreightOwnerMemberType());
		param.put("freightOwnerBusinessType", vo.getFreightOwnerBusinessType());
		param.put("freightOwnerMemberStatus", vo.getFreightOwnerMemberStatus());
		param.put("freightOwnerFileAdminCheckYn", vo.getFreightOwnerFileAdminCheckYN());
		param.put("freightOwnerMonthSettlementNum", vo.getFreightOwnerMonthSettlementNum());
		param.put("freightOwnerPriorityExposure", vo.getFreightOwnerPriorityExposure()); // 우선노출 지정값
		param.put("freightOwnerHistoryChangeReason", vo.getFreightOwnerHistoryChangeReason()); //변경사유
		
		if(vo.getFreightOwnerMemo() != null) { //변경메모가 있을 경우추가
			param.put("freightOwnerMemo", vo.getFreightOwnerMemo());
		}
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 계약화주 운송대행사 수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> carrierUpdate(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo, String obj) throws Exception {
		
		// mode 인코딩 변경
		obj = URLEncoder.encode(obj, "UTF-8");
		
		String url = String.format(ktapiAdmin + API_URL_FRGOWN_CARRIER_UPDATE, obj); 
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 계약화주 요금제 및 요율명 수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> fareUpdate(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo, String obj) throws Exception {
		
		// mode 인코딩 변경
		obj = URLEncoder.encode(obj, "UTF-8");
		
		String url = String.format(ktapiAdmin + API_URL_FRGOWN_FARE_UPDATE, obj); 
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 여요금조정구간 수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> fareAdjustUpdate(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		
		String url = String.format(ktapiAdmin + API_URL_FRGOWN_FARE_ADJUST_UPDATE); 
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		param.put("freightOwnerFareAdjustFrom", vo.getFreightOwnerFareAdjustFrom());
		param.put("freightOwnerFareAdjustTo", vo.getFreightOwnerFareAdjustTo());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}		
	
	/**
	 * 화주 마스터 정보 수정
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateFrgownMasterFlag(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		String url = API_URL_FRGOWN_MASTER_FLAG_UPDATE; 
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		param.put("freightOwnerMasterFlag", vo.getFreightOwnerMasterFlag()); //마스터지정여부
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}	
	
	/**
	 * 화주 탈퇴(승인)
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> withdrawFrgown(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
		String url = API_URL_FRGOWN_WITHDRAWAL;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("freightOwnerId", vo.getFreightOwnerId());
		param.put("freightOwnerHistoryChangeReason", vo.getFreightOwnerHistoryChangeReason()); //변경사유
		//logger.debug("{}", param);
		
		//변경사유를 먼저 등록 후 화주 탈퇴승인 
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 요금제 요율 목록 조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param FreightOwnerVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listFrgownFare(HttpServletRequest request, SessionVO sessionVO, FreightOwnerVO vo) throws Exception {
				
		String url = String.format(API_URL_FRGOWN_FARE_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		//param.put("sort", vo.getSort());
		//param.put("pagePerRows", vo.getPagePerRows());
		//param.put("nowPage", vo.getNowPage());
		param.put("pagePerRows", 20);
		param.put("nowPage", 1);
		vo.setPagePerRows(20);
		
		if(vo.getSearchType() != null) param.put("searchType", vo.getSearchType());
		if(vo.getSearchText() != null) param.put("searchText", vo.getSearchText());
		
		Map<String, Object> result = WebFunctions.connectApiJson(ktapiAdmin + url, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			//페이징
			if(result.get("listCount") != null) {
				int listCount = (int) result.get("listCount");
				
				Map<String, Object> paginationVO = new HashMap<>();
				paginationVO.put("sizeOfData", listCount); 
				paginationVO.put("pageIndex", vo.getNowPage());
				paginationVO.put("pageSize", vo.getPagePerRows());
				result.put("paginationVO", paginationVO);
				
				String pagination =  new Pagination().setPagination(paginationVO);
				result.put("pagination", pagination);
			}
		}
		
		return result;
	}	
	
	
}
