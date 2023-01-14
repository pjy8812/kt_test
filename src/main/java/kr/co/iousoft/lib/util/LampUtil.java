package kr.co.iousoft.lib.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import kr.co.iousoft.lib.core.global.CbServiceGlobal;
import kr.co.iousoft.lib.core.vo.LoginVO;

public class LampUtil {

	/**
	 * 개인정보처리 대량대상자 (mapper id)
	 * @param operation
	 * @return
	 */
	public static String getMultiTarget(String operation) {
		if(operation.indexOf("trans/trinfo/list") > -1 || operation.indexOf("trans/trinfo/excel/download")> -1) {
			//운송정보관리> 목록, 엑셀다운로드
			return "selectListTrinfo";
		}else if(operation.indexOf("admin/kt/list") > -1) {
			//관리자설정> KT운영자 관리
			return "selectListAdminOpUserList";
		}else if(operation.indexOf("admin/sp/list") > -1) {
			//관리자설정> 서비스포탈 사용자 관리
			return "selectListAdminSpUserList";
		}else if(operation.indexOf("sms/send/history/list") > -1 || operation.indexOf("sms/send/history/excel/download") > -1) {
			//SMS발송이력> 목록, 엑셀다운로드
			return "selectListSmsSendLog";
		}
		return null;
	}

	/**
	 * 개인정보리스트
	 * @param operation
	 * @return
	 */
	public static String getPersonalInfoList(String operation) {
		List<String> temp = new ArrayList<>();
		if(operation.indexOf("trans/trinfo/list") > -1) { //운송정보관리> 목록
			temp.add("shipperName");
			temp.add("truckerName");
			temp.add("receiverName");
			temp.add("ldzAddrBase");
			temp.add("uldzAddrBase");
		}else if(operation.indexOf("trans/trinfo/detail/shipper") > -1) { //운송정보관리> 화주정보
			temp.add("shipperUid");
			temp.add("shipperName");
			temp.add("shipperMobile");
			temp.add("shipperCorpUid");
			temp.add("shipperCorpCorpno");
		}else if(operation.indexOf("trans/trinfo/detail/trucker") > -1) { //운송정보관리> 기사정보
			temp.add("truckerUid");
			temp.add("truckerName");
			temp.add("truckerMobile");
			temp.add("truckerCorpno");
			temp.add("truckerCorpUid");
			temp.add("truckerCorpCorpno");
			temp.add("truckerCorpMgrName");
			temp.add("truckerCorpMgrMobile");
			temp.add("vehicleRegno");
		}else if(operation.indexOf("trans/trinfo/detail/receiver") > -1) { //운송정보관리> 인수자정보
			temp.add("receiverUid");
			temp.add("receiverName");
			temp.add("receiverMobile");
			temp.add("receiverCorpUid");
			temp.add("receiverCorpCorpno");
		}else if(operation.indexOf("trans/trinfo/detail/ldz") > -1) { //운송정보관리> 상차정보
			temp.add("ldzAddrBase");
			temp.add("ldzAddrDetl");
			temp.add("ldzAddrLat");
			temp.add("ldzAddrLng");
		}else if(operation.indexOf("trans/trinfo/detail/uldz") > -1) { //운송정보관리> 하차정보
			temp.add("uldzAddrBase");
			temp.add("uldzAddrDetl");
			temp.add("uldzAddrLat");
			temp.add("uldzAddrLng");
		}else if(operation.indexOf("trans/trinfo/excel") > -1) { //운송정보관리> 엑셀다운로드
			temp.add("shipperUid");
			temp.add("shipperName");
			temp.add("shipperMobile");
			temp.add("shipperCorpUid");
			temp.add("shipperCorpCorpno");
			temp.add("truckerUid");
			temp.add("truckerName");
			temp.add("truckerMobile");
			temp.add("truckerCorpno");
			temp.add("truckerCorpUid");
			temp.add("truckerCorpCorpno");
			temp.add("truckerCorpMgrName");
			temp.add("truckerCorpMgrMobile");
			temp.add("vehicleRegno");
			temp.add("receiverUid");
			temp.add("receiverName");
			temp.add("receiverMobile");
			temp.add("receiverCorpUid");
			temp.add("receiverCorpCorpno");
			temp.add("ldzAddrBase");
			temp.add("ldzAddrDetl");
			temp.add("ldzAddrLat");
			temp.add("ldzAddrLng");
			temp.add("uldzAddrBase");
			temp.add("uldzAddrDetl");
			temp.add("uldzAddrLat");
			temp.add("uldzAddrLng");
		}else if(operation.indexOf("admin/kt/list") > -1) { //관리자설정> KT운영자 관리
			temp.add("userId");
			temp.add("userName");
			temp.add("aprvYn");
			temp.add("authCode");
		}else if(operation.indexOf("admin/sp/list") > -1) { //관리자설정> 서비스포탈 사용자 관리
			temp.add("userId");
			temp.add("userName");
			temp.add("mobile");
			temp.add("email");
			temp.add("aprvYn");
		}else if(operation.indexOf("sms/send/history") > -1) { //SMS발송이력
			temp.add("phone");
		}
		return temp.toString();
	}

	/**
	 * 단건 개인정보리스트
	 * @param operation
	 * @param item
	 * @return
	 */
	public static String getInResDetail(String operation, Map item) {
		JSONObject map = new JSONObject();
		if(operation.indexOf("trans/trinfo/list") > -1) { //운송정보관리> 목록
			map.put("shipperName", item.get("shipperName"));
			map.put("truckerName", item.get("truckerName"));
			map.put("receiverName", item.get("receiverName"));
			map.put("ldzAddrBase", item.get("ldzAddrBase"));
			map.put("uldzAddrBase", item.get("uldzAddrBases"));
		}else if(operation.indexOf("trans/trinfo/detail/shipper") > -1) { //운송정보관리> 화주정보
			map.put("shipperUid", item.get("shipperUid"));
			map.put("shipperName", item.get("shipperName"));
			map.put("shipperMobile", item.get("shipperMobile"));
			map.put("shipperCorpUid", item.get("shipperCorpUid"));
			map.put("shipperCorpCorpno", item.get("shipperCorpCorpno"));
		}else if(operation.indexOf("trans/trinfo/detail/trucker") > -1) { //운송정보관리> 기사정보
			map.put("truckerUid", item.get("truckerUid"));
			map.put("truckerName", item.get("truckerName"));
			map.put("truckerMobile", item.get("truckerMobile"));
			map.put("truckerCorpno", item.get("truckerCorpno"));
			map.put("truckerCorpUid", item.get("truckerCorpUid"));
			map.put("truckerCorpCorpno", item.get("truckerCorpCorpno"));
			map.put("truckerCorpMgrName", item.get("truckerCorpMgrName"));
			map.put("truckerCorpMgrMobile", item.get("truckerCorpMgrMobile"));
			map.put("vehicleRegno", item.get("vehicleRegno"));
		}else if(operation.indexOf("trans/trinfo/detail/receiver") > -1) { //운송정보관리> 인수자정보
			map.put("receiverUid", item.get("receiverUid"));
			map.put("receiverName", item.get("receiverName"));
			map.put("receiverMobile", item.get("receiverMobile"));
			map.put("receiverCorpUid", item.get("receiverCorpUid"));
			map.put("receiverCorpCorpno", item.get("receiverCorpCorpno"));
		}else if(operation.indexOf("trans/trinfo/detail/ldz") > -1) { //운송정보관리> 상차정보
			map.put("ldzAddrBase", item.get("ldzAddrBase"));
			map.put("ldzAddrDetl", item.get("ldzAddrDetl"));
			String ldzAddrLat = "", ldzAddrLng = "";

			//위/경도 마스킹표시
			if(item.get("ldzAddrLat") != null) {
				ldzAddrLat  = item.get("ldzAddrLat").toString();
				ldzAddrLat = UtilFunctions.maskingName(ldzAddrLat);
			}
			if(item.get("ldzAddrLng") != null) {
				ldzAddrLng  = item.get("ldzAddrLng").toString();
				ldzAddrLng = UtilFunctions.maskingName(ldzAddrLng);
			}
			map.put("ldzAddrLat", ldzAddrLat);
			map.put("ldzAddrLng", ldzAddrLng);
		}else if(operation.indexOf("trans/trinfo/detail/uldz") > -1) { //운송정보관리> 하차정보
			map.put("uldzAddrBase", item.get("uldzAddrBase"));
			map.put("uldzAddrDetl", item.get("uldzAddrDetl"));
			String uldzAddrLat = "", uldzAddrLng = "";

			//위/경도 마스킹표시
			if(item.get("uldzAddrLat") != null) {
				uldzAddrLat  = item.get("uldzAddrLat").toString();
				uldzAddrLat = UtilFunctions.maskingName(uldzAddrLat);
			}
			if(item.get("uldzAddrLng") != null) {
				uldzAddrLng  = item.get("uldzAddrLng").toString();
				uldzAddrLng = UtilFunctions.maskingName(uldzAddrLng);
			}
			map.put("uldzAddrLat", uldzAddrLat);
			map.put("uldzAddrLng", uldzAddrLng);
		}else if(operation.indexOf("trans/trinfo/excel") > -1) { //운송정보관리> 엑셀다운로드
			map.put("shipperUid", item.get("shipperUid"));
			map.put("shipperName", item.get("shipperName"));
			map.put("shipperMobile", item.get("shipperMobile"));
			map.put("shipperCorpUid", item.get("shipperCorpUid"));
			map.put("shipperCorpCorpno", item.get("shipperCorpCorpno"));
			map.put("truckerUid", item.get("truckerUid"));
			map.put("truckerName", item.get("truckerName"));
			map.put("truckerMobile", item.get("truckerMobile"));
			map.put("truckerCorpno", item.get("truckerCorpno"));
			map.put("truckerCorpUid", item.get("truckerCorpUid"));
			map.put("truckerCorpCorpno", item.get("truckerCorpCorpno"));
			map.put("truckerCorpMgrName", item.get("truckerCorpMgrName"));
			map.put("truckerCorpMgrMobile", item.get("truckerCorpMgrMobile"));
			map.put("vehicleRegno", item.get("vehicleRegno"));
			map.put("receiverUid", item.get("receiverUid"));
			map.put("receiverName", item.get("receiverName"));
			map.put("receiverMobile", item.get("receiverMobile"));
			map.put("receiverCorpUid", item.get("receiverCorpUid"));
			map.put("receiverCorpCorpno", item.get("receiverCorpCorpno"));
			map.put("ldzAddrBase", item.get("ldzAddrBase"));
			map.put("ldzAddrDetl", item.get("ldzAddrDetl"));
			String ldzAddrLat = "", ldzAddrLng = "";

			//위/경도 마스킹표시
			if(item.get("ldzAddrLat") != null) {
				ldzAddrLat  = item.get("ldzAddrLat").toString();
				ldzAddrLat = UtilFunctions.maskingName(ldzAddrLat);
			}
			if(item.get("ldzAddrLng") != null) {
				ldzAddrLng  = item.get("ldzAddrLng").toString();
				ldzAddrLng = UtilFunctions.maskingName(ldzAddrLng);
			}
			map.put("ldzAddrLat", ldzAddrLat);
			map.put("ldzAddrLng", ldzAddrLng);
			map.put("uldzAddrBase", item.get("uldzAddrBase"));
			map.put("uldzAddrDetl", item.get("uldzAddrDetl"));
			String uldzAddrLat = "", uldzAddrLng = "";

			//위/경도 마스킹표시
			if(item.get("uldzAddrLat") != null) {
				uldzAddrLat  = item.get("uldzAddrLat").toString();
				uldzAddrLat = UtilFunctions.maskingName(uldzAddrLat);
			}
			if(item.get("uldzAddrLng") != null) {
				uldzAddrLng  = item.get("uldzAddrLng").toString();
				uldzAddrLng = UtilFunctions.maskingName(uldzAddrLng);
			}
			map.put("uldzAddrLat", uldzAddrLat);
			map.put("uldzAddrLng", uldzAddrLng);
		}else if(operation.indexOf("admin/kt/list") > -1) { //관리자설정> KT운영자 관리
			map.put("userId", item.get("userId"));
			map.put("userName", item.get("userName"));
		}else if(operation.indexOf("admin/sp/list") > -1) { //관리자설정> 서비스포탈 사용자 관리
			map.put("userId", item.get("userId"));
			map.put("userName", item.get("userName"));
			map.put("mobile", item.get("mobile"));
			map.put("email", item.get("email"));
		}else if(operation.indexOf("sms/send/history") > -1) { //SMS발송이력
			map.put("phone", item.get("phone"));
		}else if(operation.indexOf("/mng/admin/kt/aprv") > -1 ||
				operation.indexOf("/mng/admin/kt/auth") > -1) {
			map.put("userId", item.get("userId"));
			map.put("userName", item.get("userName"));
			map.put("aprvYn", item.get("aprvYn"));
			map.put("authCode", item.get("authCode"));
		}else if(operation.indexOf("/mng/admin/sp/aprv") > -1) {
			map.put("userId", item.get("userId"));
			map.put("userName", item.get("userName"));
			map.put("mobile", item.get("mobile"));
			map.put("email", item.get("email"));
			map.put("aprvYn", item.get("aprvYn"));
		}
	
		return map.toString();
	}

	/*
	public static String getResponesDesc(String resCode) {
		if(resCode.equals(LoginVO.LOGIN_RESULT_FAIL)) {
			return"로그인실패";
		}else if(resCode.equals(LoginVO.LOGIN_FAIL_CAPTCHA)) {
			return "chatcha 인증 실패";
		}else if(resCode.equals(LoginVO.LOGIN_LDAP_FAIL_SERVICE)) {
			return "ldap 서비스 오류";
		}else if(resCode.equals(LoginVO.LOGIN_LDAP_FAIL_AUTH)) {
			return "ldap 인증 오류";
		}else if(resCode.equals(LoginVO.LOGIN_RESULT_NOT_USER)) {
			return "계정 없는 사용자";
		}else if(resCode.equals(LoginVO.LOGIN_RESULT_BLOCK_USER)) {
			return "차단된 사용자";
		}else if(resCode.equals(LoginVO.LOGIN_RESULT_INVALID_ID_PWD)) {
			return "비밀번호 입력 오류";
		}else if(resCode.equals(LoginVO.LOGIN_RESULT_FAIL_MAX_COUNT)) {
			return "비밀번호 입력 5회이상 오류";
		}else if(resCode.equals(LoginVO.LOGIN_LDAP_PWD_EXPIRED)) {
			return "비밀번호 만료된 사용자";
		}else if(resCode.equals(CbServiceGlobal.RESULT_DUPLICATE)) {
			return "중복된 정보";
		}else if(resCode.equals(CbServiceGlobal.RESULT_NETWORK_ACCESS_SQN_NULL)) {
			return "삭제 대상 없음";
		}

		return "";
	}
	*/

}
