package com.kt.klp.adm.admin.policy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.policy.domain.TermsRevisionVO;
import com.kt.klp.adm.admin.policy.domain.TermsVO;
import com.kt.klp.adm.admin.settlement.domain.SettlementFreightOwnerVO;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;
import kr.co.iousoft.lib.util.Pagination;
import kr.co.iousoft.lib.util.UtilFunctions;
import kr.co.iousoft.lib.util.web.WebFunctions;

/**
*
* PolicyTermsAdminService : 정책관리> 약관 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.08       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.08
* @version 1.0.0
* @see
*
*/ 
@Service("policyTermsAdminService")
public class PolicyTermsAdminService extends AbstractServiceImpl {
	
	public static final String POLICY_TERMS_API_URL = "/v1/admin/policy/terms/list/%d"; // 약관 목록 조회 및 검색 - {nowPage}
	public static final String POLICY_TERMS_INSERT_API_URL = "/v1/admin/policy/terms/insert"; // 약관 등록
	public static final String POLICY_TERMS_INFO_API_URL = "/v1/admin/policy/terms/info/%d"; // 약관 상세 - {termsSeq}
	public static final String POLICY_TERMS_UPDATE_API_URL = "/v1/admin/policy/terms/update/%d"; // 약관 수정 - {termsSeq}
	public static final String POLICY_TERMS_REVISION_INSERT_API_URL = "/v1/admin/policy/terms/revision/insert"; // 약관 개정 추가
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 

	@Value("${api.ktapi}")
	private String ktapi;
	
	@Value("${api.ktapiAdmin}")
    String ktapiAdmin;

	/**
	 * 정책 - 약관 목록 
	 * 
	 * @param session
	 * @param vo
	 * @return
	 */
	public Map getList(SessionVO session, TermsVO vo) throws Exception {
		
		Map resultMap = new HashedMap();
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// 사용여부
		if(vo.getTermsRequiredYn() != null) {
			param.put("termsRequiredYn", vo.getTermsRequiredYn());
		}
		
		// 서비스구분
		if(vo.getTermsServiceClassify() != null) {
			param.put("termsServiceClassify", vo.getTermsServiceClassify());
		}
		
		// 검색타입		
		if(vo.getSearchType() != null) {
			param.put("searchType", vo.getSearchType());
		}
		
		// 검색어
		if(vo.getSearchText() != null) {
			param.put("searchText", vo.getSearchText());
		}
		
		// 검색어
		if(vo.getSearchText() != null) {
			param.put("pagePerRows", vo.getSearchText());
		}
		
		// 검색어
		if(vo.getPagePerRows() != null) {
			param.put("pagePerRows", vo.getPagePerRows());
		}
		
		String url = String.format(ktapiAdmin + POLICY_TERMS_API_URL, vo.getPageIndex());
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
			
			Map<String, Object> paginationVO = new HashMap<>();
			paginationVO.put("sizeOfData", result.get("listCount") == null ? 0 : (int) result.get("listCount"));
			paginationVO.put("pageIndex", vo.getPageIndex());
			paginationVO.put("pageSize", vo.getPagePerRows());
			String pagination =  new Pagination().setPagination(paginationVO);
			
			result.put("pagination", pagination);
			result.put("maxIndex", UtilFunctions.genListMaxIndex(vo.getPageIndex(), result.get("endPage"), result.get("listCount"), vo.getPagePerRows()));
			
			if(result.get("termsList") != null) {
				
				List<Map> list = (List) result.get("termsList");
				
				for(Map item : list) {
					
					// 사용시작일시
					UtilFunctions.makeDateToString(item, "termsUseStartDateByLongType");
					
					// 사용종료일시
					UtilFunctions.makeDateToString(item, "termsUseEndDateByLongType");
					
					// 사용종료일시
					UtilFunctions.makeDateToString(item, "termsRegisterDateByLongType");
				}
				
				result.put("list", list);
			}
			
			result.put("resultCode", result.get("resultCode"));
			
			// logger.debug("result={}", result);
			return result;
		
		} else {
			return result;
		}
	}
	
	/**
	 * 정책 - 약관 - 상세 
	 * @param session
	 * @param termsSeq
	 * @param nowPage
	 * @return
	 * @throws Exception
	 */
	public Map getDetail(SessionVO session, int termsSeq, int nowPage) throws Exception {

		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// logger.debug("SettlementFreightOwnerVO={}", vo);
		
		String url = String.format(ktapiAdmin + POLICY_TERMS_INFO_API_URL, termsSeq);
		SettlementFreightOwnerVO vo = new SettlementFreightOwnerVO();
		
		Map result = WebFunctions.connectApiJson(url, header, "GET", null);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
		// 비정상 결과에도 조회 가능한 값 있음 : CNNN 에러 표시를 위해 주석 해제 
		// if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
				
			// 작성일
			UtilFunctions.makeDateToString(result, "termsRegisterDateByLongType");

			// 사용시작일시
			UtilFunctions.makeDateToString(result, "termsUseStartDateByLongType");

			// 사용종료일시
			UtilFunctions.makeDateToString(result, "termsUseEndDateByLongType");

			if(result.get("revisionList") != null) {
				List<Map> list = (List) result.get("revisionList");
				for(Map item : list) {
				
					// 개정발효일
					UtilFunctions.makeDateToString(item, "termsRevisionEffectiveDateByLongType");
					
					// 사용시작일시
					UtilFunctions.makeDateToString(item, "termsRevisionUseStartDateByLongType");
					
					// 사용종료일시
					UtilFunctions.makeDateToString(item, "termsRevisionUseEndDateByLongType");
					
					// 사용종료일시
					UtilFunctions.makeDateToStringMin(item, "termsRevisionRegisterDateByLongType");
					
					// 따옴표 처리  
					if(item.get("termsRevisionContent") != null) {
						item.put("termsRevisionContent", item.get("termsRevisionContent").toString().replace("\r\n", "<br>").replace("\r", "<br>").replace("\n", "<br>"));
					}
				}
			}
			
			return result;
			
//		} else {
//			return result;
//		}
	}
	
	/**
	 * 정책 - 약관 - 등록/수정 
	 * 
	 * @param session
	 * @param vo
	 * @return
	 */
	public Map save(SessionVO session, TermsVO vo) {

		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());

		String url = String.format(ktapiAdmin);
		if(vo.getMode().equals("insert")) {
			
			// 약관명
			if(vo.getTermsName() != null) {
				param.put("termsName", vo.getTermsName());
			}
			
			// 서비스구분
			if(vo.getTermsServiceClassify() != null) {
				param.put("termsServiceClassify", vo.getTermsServiceClassify());
			}
			
			// 화면구분
			if(vo.getTermsType() != null) {
				param.put("termsType", vo.getTermsType());
			}
//			if(vo.getTermsDisplayClassify() != null) {
//				param.put("termsDisplayClassify", vo.getTermsDisplayClassify());
//			}
			
			// 개정발효일
			if(vo.getTermsRevisionEffectiveDateByLongType() != null) {
				param.put("termsRevisionEffectiveDateByLongType", vo.getTermsRevisionEffectiveDateByLongType());
			}
			
			// 개정버전
			if(vo.getTermsRevisionVersion() != null) {
				param.put("termsRevisionVersion", vo.getTermsRevisionVersion());
			}
			
			// 사용여부
			if(vo.getTermsRequiredYn() != null) {
				param.put("termsRequiredYn", vo.getTermsRequiredYn());
			} else {
				// termsRequiredYn == null 조회안됨 
				param.put("termsRequiredYn", vo.YN_N);
			}
			
			// 사용시작일시
			if(vo.getTermsUseStartDateByLongType() != null) {
				param.put("termsUseStartDateByLongType", vo.getTermsUseStartDateByLongType());
			}
			
			// 사용종료일시
			if(vo.getTermsUseEndDateByLongType() != null) {
				param.put("termsUseEndDateByLongType", vo.getTermsUseEndDateByLongType());
			}
			
			// 내용
			if(vo.getTermsContent() != null) {
				param.put("termsContent", vo.getTermsContent());
			}
			
			url = String.format(ktapiAdmin + POLICY_TERMS_INSERT_API_URL);
			
		} else if(vo.getMode().equals("update")) {
			
			// seq 
			if(vo.getTermsSeq() != null) {
				param.put("termsSeq", vo.getTermsSeq());
			}
			
			// 약관명
			if(vo.getTermsName() != null) {
				param.put("termsName", vo.getTermsName());
			}
			
			// 서비스구분
			if(vo.getTermsServiceClassify() != null) {
				param.put("termsServiceClassify", vo.getTermsServiceClassify());
			}
			
			// 화면구분
			if(vo.getTermsType() != null) {
				param.put("termsType", vo.getTermsType());
			}
			
			// 사용여부
			if(vo.getTermsRequiredYn() != null) {
				param.put("termsRequiredYn", vo.getTermsRequiredYn());
			} else {
				param.put("termsRequiredYn", vo.YN_N);
			}
			
			 // 개정발효일
			if(vo.getTermsRevisionEffectiveDateByLongType() != null) {
				param.put("termsRevisionEffectiveDateByLongType", vo.getTermsRevisionEffectiveDateByLongType());
			}
			
			// 개정버전
			if(vo.getTermsRevisionVersion() != null) {
				param.put("termsRevisionVersion", vo.getTermsRevisionVersion());
			}
			
			// 사용시작일시
			if(vo.getTermsUseStartDateByLongType() != null) {
				param.put("termsUseStartDateByLongType", vo.getTermsUseStartDateByLongType());
			}
			
			// 사용종료일시
			if(vo.getTermsUseEndDateByLongType() != null) {
				param.put("termsUseEndDateByLongType", vo.getTermsUseEndDateByLongType());
			}
			
			// 개정약관seq
			if(vo.getTermsRevisionSeq() != null) {
				param.put("termsRevisionSeq", vo.getTermsRevisionSeq());
			}
			
			// 내용
			if(vo.getTermsContent() != null) {
				param.put("termsContent", vo.getTermsContent());
			}
			
			url = String.format(ktapiAdmin + POLICY_TERMS_UPDATE_API_URL, vo.getTermsSeq());
		
		} else {
			Map result = new HashMap();
			result.put("d", result);
			return result;
		}
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
		return result;
		
	}

	/**
	 * 정책 - 약관 - 개정 추가 
	 * 
	 * @param session
	 * @param vo
	 * @return
	 */
	public Map saveRevision(SessionVO session, TermsRevisionVO vo) {
		
		Map<String, String> header = new HashMap<>();
		Map<String, Object> param = new HashMap<>(); 
		header.put(WebFunctions.HEADER_AUTHORIZATION, session.getAccessToken());
		header.put(WebFunctions.HEADER_X_CONSUMER_CUSTOM_ID, session.getAdminId());
		
		// logger.debug("SettlementFreightOwnerVO={}", vo);
		// param = vo.toMap();
		
		// 약관seq
		if(vo.getTermsRevisionTermsSeq() != null) {
			param.put("termsRevisionTermsSeq", vo.getTermsRevisionTermsSeq());
		}
		
		// 개정버전
		if(vo.getTermsRevisionVersion() != null) {
			param.put("termsRevisionVersion", vo.getTermsRevisionVersion());
		}
		
		// 필수여부		
		if(vo.getTermsRevisionRequiredYn() != null) {
			param.put("termsRevisionRequiredYn", vo.getTermsRevisionRequiredYn());
		}
		
		// 개정발효일
		if(vo.getTermsRevisionEffectiveDateByLongType() != null) {
			param.put("termsRevisionEffectiveDateByLongType", vo.getTermsRevisionEffectiveDateByLongType());
		}
		
		// 사용시작일시	
		if(vo.getTermsRevisionUseStartDateByLongType() != null) {
			param.put("termsRevisionUseStartDateByLongType", vo.getTermsRevisionUseStartDateByLongType());
		}
		 // 사용종료일시
		if(vo.getTermsRevisionUseEndDateByLongType() != null) {
			param.put("termsRevisionUseEndDateByLongType", vo.getTermsRevisionUseEndDateByLongType());
		}
		
		// 내용
		if(vo.getTermsRevisionContent() != null) {
			param.put("termsRevisionContent", vo.getTermsRevisionContent());
		}
		
		String url = String.format(ktapiAdmin + POLICY_TERMS_REVISION_INSERT_API_URL);
		
		Map result = WebFunctions.connectApiJson(url, header, "POST", param);
		
		//logger.debug("{}", param);
		//logger.debug("{}", header);
		//logger.debug("{}", result);
		
		// 비정상 결과에도 조회 가능한 값 있음 : CNNN 에러 표시를 위해 주석 해제
		return result;
//		if(result != null && result.get("resultCode") != null && result.get("resultCode").equals(API_RESULT_CODE_SUCCESS)) {
//			return result;
//		} else {
//			return result;
//		}
		
	}	

}
