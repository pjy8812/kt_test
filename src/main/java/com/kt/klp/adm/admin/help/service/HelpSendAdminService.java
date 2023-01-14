package com.kt.klp.adm.admin.help.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.help.domain.SendVO;
import com.kt.klp.adm.admin.help.domain.SmsVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* HelpSendAdminService : APP/WEB> 발송관리 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.03.07       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.03.07
* @version 1.0.0
* @see
*
*/

@Service("helpSendAdminService")
public class HelpSendAdminService extends AbstractServiceImpl {
	public static final String API_URL_SEND_SMS = "/v1/admin/send/sms"; 					//sms 발송
	public static final String API_URL_SEND_SMS_LIST = "/v1/admin/send/sms/list/%d";		//sms 목록조회 {nowPage}
	public static final String API_URL_SEND_EMAIL_LIST = "/v1/admin/send/email/list/%d";	//이메일 목록조회 {nowPage}
	public static final String API_URL_SMS_EMAIL_SELECT = "/v1/admin/send/sms_email/%s";	//상세조회 {sendSeq}
	public static final String API_URL_SMS_RESEND = "/v1/admin/resend/sms/%s";				//sms 재발송 {sendSeq}
	public static final String API_URL_EMAIL_RESEND = "/v1/admin/resend/email/%s";			//이메일 재발송 {sendSeq}
	
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	/**
	 * 발송관리 - SMS목록
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param SendVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listSendSms(HttpServletRequest request, SessionVO sessionVO, SendVO vo) throws Exception {
		String apiUrl = String.format(API_URL_SEND_SMS_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param =  new HashMap<>();
		param.put("sendCategory", vo.getSendCategory());	
		param.put("type", vo.getType());		
		param.put("sendType", vo.getSendType());		
		param.put("templateName", vo.getTemplateName());
		param.put("sendStatus", vo.getSendStatus());
		param.put("startDate", vo.getStartDate());
		param.put("endDate", vo.getEndDate());
		param.put("searchType", vo.getSearchType());
		param.put("searchText", vo.getSearchText());
		param.put("type", vo.getSendType());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			if(result.get("listCount") != null) { //페이징 추가
				int listCount	 = (int) result.get("listCount");
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
	 * 발송관리 - SMS 재발송
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param SendVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> resendSms(HttpServletRequest request, SessionVO sessionVO, SendVO vo) throws Exception {
		String apiUrl = String.format(API_URL_SMS_RESEND, vo.getSendSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "GET", null);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 발송관리 - email 목록
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param SendVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> listSendEmail(HttpServletRequest request, SessionVO sessionVO, SendVO vo) throws Exception {
		String apiUrl = String.format(API_URL_SEND_EMAIL_LIST, vo.getNowPage());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param =  new HashMap<>();
		param.put("sendCategory", vo.getSendCategory());	
		param.put("type", vo.getType());		
		param.put("templateName", vo.getTemplateName());
		param.put("sendTarget", vo.getSendTarget());
		param.put("sendStatus", vo.getSendStatus());
		param.put("startDate", vo.getStartDate());
		param.put("endDate", vo.getEndDate());
		param.put("searchType", vo.getSearchType());
		param.put("searchText", vo.getSearchText());
		//param.put("type", vo.getType());
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		//logger.debug("{}", result);
		
		if(!result.isEmpty()) {
			if(result.get("list") != null) {
				List list = (List) result.get("list");
				UtilFunctions.millisecondListToDate(list); //날짜변환
				result.put("list", list);
			}
			
			if(result.get("listCount") != null) { //페이징추가
				int listCount	 = (int) result.get("listCount");
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
	 * 발송관리 - email 재발송
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param SendVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> resendEmail(HttpServletRequest request, SessionVO sessionVO, SendVO vo) throws Exception {
		String apiUrl = String.format(API_URL_EMAIL_RESEND, vo.getSendSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "GET", null);
		//logger.debug("{}", result);
		
		return result;
	}
	
	/**
	 * 발송관리 - sms/email 상세조회
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param SendVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectSendSmsEmail(HttpServletRequest request, SessionVO sessionVO, SendVO vo) throws Exception {
		String apiUrl = String.format(API_URL_SMS_EMAIL_SELECT, vo.getSendSeq());
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "GET", null);
		//logger.debug("{}", result);
		
		UtilFunctions.millisecondListToDate(result); //날짜변환
		
		return result;
	}
	
	/**
	 * 단체문자 발송
	 * @param HttpServletRequest
	 * @param SessionVO
	 * @param SmsVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> sendSms(HttpServletRequest request, SessionVO sessionVO, SmsVO vo) throws Exception {
		
		String apiUrl = API_URL_SEND_SMS;
		
		Map<String, String> header = new HashMap<>();
		header.put(WebFunctions.HEADER_AUTHORIZATION, sessionVO.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, sessionVO.getAdminId());
		header.put(WebFunctions.HEADER_ADMIN_IP , UtilFunctions.getClientIP(request));
		
		Map<String, Object> param = new HashMap<>();
		param.put("ownerClassification", vo.getOwnerClassification());
		param.put("sendMsg", vo.getSendMsg());
		param.put("sendTitle", vo.getSendTitle());
		//logger.debug("{}", param);
		
		Map result = WebFunctions.connectApiJson(ktapiAdmin + apiUrl, header, "POST", param);
		//logger.debug("{}", result);
		
		return result;
	}
}
