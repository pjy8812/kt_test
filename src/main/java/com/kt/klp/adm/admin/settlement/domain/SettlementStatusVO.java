package com.kt.klp.adm.admin.settlement.domain;

import java.util.Map;

import com.google.common.collect.ImmutableMap;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* SettlementStatusVO : 정산상태 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.09       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.02.09
* @version 1.0.0
* @see
*
*/
public class SettlementStatusVO extends CommonTableVO {
	
//	public static final Map<String, String> SETTLEMENT_STATUS = Map.of(
//		"settlementStandby", "정산대기"
//		, "settlementRequested", "정산중"
//		, "settlementCompleted", "정산완료"
//		, "settlementFailed", "정산실패"
//		, "cancelRequested", "취소진행"
//		, "cancelCompleted", "취소완료"
//		, "deferred", "연체"
//    );
	
	public static final Map<String, String> SETTLEMENT_STATUS = ImmutableMap.<String, String>builder()
		.put("settlementStandby", "정산대기")
		.put("settlementRequested", "정산중")
		.put("settlementCompleted", "정산완료")
		.put("settlementFailed", "정산실패")
		.put("cancelRequested", "취소진행")
		.put("cancelCompleted", "취소완료")
		.put("deferred", "연체").build();
		
//	public static void setCodeName(Map map, String inputKeyValue, String outputKeyValue) {
//		
//		if(map == null) return;
//		inputKeyValue = inputKeyValue == null ? "settlementStatus" : inputKeyValue;
//		outputKeyValue = outputKeyValue == null ? "settlementStatusName" : outputKeyValue;
//		
//		String code = map.get(inputKeyValue).toString();
//		if(code == null) return;
//		
//		map.put(outputKeyValue, SETTLEMENT_STATUS.get(code) == null ? "" : SETTLEMENT_STATUS.get(code));
//	}
//	
//	public static void setCodeName(Map codeMap, Map map, String inputKeyValue, String outputKeyValue) {
//		
//		if(map == null) return;
//		// inputKeyValue = inputKeyValue == null ? "settlementStatus" : inputKeyValue;
//		// outputKeyValue = outputKeyValue == null ? "settlementStatusName" : outputKeyValue;
//		
//		String code = map.get(inputKeyValue).toString();
//		if(code == null) return;
//		
//		map.put(outputKeyValue, codeMap.get(code) == null ? "" : codeMap.get(code));
//	}
	
}
