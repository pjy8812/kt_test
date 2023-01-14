package com.kt.klp.adm.admin.order.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* OrderVO : 주문배송 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.21       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.02.21
* @version 1.0.0
* @see
*
*/

public class OrderVO extends CommonTableVO {
	
	public static final String ORDER_TYPE_ORDER = "order";	 //주문배송
	public static final String ORDER_TYPE_MANUAL = "manual"; //수동배차
	
	public static final String CHARGE_PREMIUM_UPDATE = "1";	//수정요금정보
	public static final String CHARGE_PREMIUM_LAST = "2";	//최종요금정보
	
	String orderId;				//주문ID
	String orderNumber;			//주문번호
	String orderType1;			//주문상태1
	String orderType2;			//주문상태2
	String dispatchDelay;		//배차지연
	String freightOwnerType;	//계약구분
	String freightType;			//화물구분
	String emergencyYn;			//비상배차여부
	String manualDispatch;		//수동배차여부
	String searchType;			//검색어타입
	String searchText;			//검색어
	
	long freightRegistStartDatetime; //화물등록일
	long freightRegistEndDatetime;
	long loadingStartDateTime;		 //상차일시
	long loadingEndDateTime;
	long unloadingStartDateTime;	 //하차일시
	long unloadingEndDateTime;
	
	long pageStart;	//페이징처리시 시작페이지
	long pageCnt;	//페이징처리시 데이터 개수
	
	String maskingYn;	//마스킹여부
	String terms;		//주소검색 키워드
	
	//엑셀업로드
	String consumerId;		//화주아이디
	String consumerType;	//화주타입
	
	//표준요금재계산
	double loadingLat;
	double loadingLon;
	double unloadingLat;
	double unloadingLon;
	String carModel;
	String carType;
	String[] carOptions;
	long loadingDateTime;
	long unloadingDateTime;
	String loadingPnu;
	String unloadingPnu;
	boolean urgentFreight;
	String handworkType;
	
	//주문수정
	String loadingAddress;
	String loadingDetailAddress;
	String loadingZipCode;
	String loadingRbu;
	String unloadingAddress;
	String unloadingDetailAddress;
	String unloadingZipCode;
	String unloadingRbu;
	String additionalChargeType;	//요금추가타입 upper, medium, lower, custom, none
	int additionalCharge;			//요금추가
	int standardCharge;				//화주최초등록요금
	
	//할증률 수정
	int premiumRate;	//할증률
	int round;			//요금조정단계(1=수정요금, 2=최종요금)
	
	//위약수수료(이동비/대기비) 수정
	int ownerSettlementPrice;		//정산금액
	String ownerSettlementType;		//정산구분
	String carOwnerId;				//차주아이디
	String freightOwnerId;			//화주아이디
	
	//비상배차등록
	String carOwnerType;
	String preCarOwnerId;
	String preCarOwnerType;
	String preDispatchId;
	
	long completed;			//상차완료/하차완료 시간
	String deliveryId;
	String dispatchId;
	String actorMemo;		//취소/변경사유
	String cancelReason;	//배차취소사유
	String cancelMemo;		//배차취소사유 메시지
	
	String mode;			//주문배송 order, 수동배차 manual
	String authGroupCode;	//권한그룹코드
	String tab;				//상세 탭 구분
	
	String sessionKey;		//엑셀업로드 분석파일 다운
	
	//좌표조회
	double lat;
	double lon;
	

	public OrderVO() {
		// TODO Auto-generated constructor stub
	}	
	
	public OrderVO(Map map) {
		super(map);
	}
	
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderType1() {
		return orderType1;
	}

	public void setOrderType1(String orderType1) {
		this.orderType1 = orderType1;
	}

	public String getOrderType2() {
		return orderType2;
	}

	public void setOrderType2(String orderType2) {
		this.orderType2 = orderType2;
	}

	public String getFreightOwnerType() {
		return freightOwnerType;
	}

	public void setFreightOwnerType(String freightOwnerType) {
		this.freightOwnerType = freightOwnerType;
	}

	public String getFreightType() {
		return freightType;
	}

	public void setFreightType(String freightType) {
		this.freightType = freightType;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public long getFreightRegistStartDatetime() {
		return freightRegistStartDatetime;
	}

	public void setFreightRegistStartDatetime(long freightRegistStartDatetime) {
		this.freightRegistStartDatetime = freightRegistStartDatetime;
	}

	public long getFreightRegistEndDatetime() {
		return freightRegistEndDatetime;
	}

	public void setFreightRegistEndDatetime(long freightRegistEndDatetime) {
		this.freightRegistEndDatetime = freightRegistEndDatetime;
	}

	public long getLoadingStartDateTime() {
		return loadingStartDateTime;
	}

	public void setLoadingStartDateTime(long loadingStartDateTime) {
		this.loadingStartDateTime = loadingStartDateTime;
	}

	public long getLoadingEndDateTime() {
		return loadingEndDateTime;
	}

	public void setLoadingEndDateTime(long loadingEndDateTime) {
		this.loadingEndDateTime = loadingEndDateTime;
	}

	public long getUnloadingStartDateTime() {
		return unloadingStartDateTime;
	}

	public void setUnloadingStartDateTime(long unloadingStartDateTime) {
		this.unloadingStartDateTime = unloadingStartDateTime;
	}

	public long getUnloadingEndDateTime() {
		return unloadingEndDateTime;
	}

	public void setUnloadingEndDateTime(long unloadingEndDateTime) {
		this.unloadingEndDateTime = unloadingEndDateTime;
	}

	public long getPageStart() {
		return pageStart;
	}

	public void setPageStart(long pageStart) {
		this.pageStart = pageStart;
	}

	public long getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(long pageCnt) {
		this.pageCnt = pageCnt;
	}

	public String getMaskingYn() {
		return maskingYn;
	}

	public void setMaskingYn(String maskingYn) {
		this.maskingYn = maskingYn;
	}

	public String getTerms() {
		return terms;
	}

	public void setTerms(String terms) {
		this.terms = terms;
	}

	public String getDispatchDelay() {
		return dispatchDelay;
	}

	public void setDispatchDelay(String dispatchDelay) {
		this.dispatchDelay = dispatchDelay;
	}

	public String getEmergencyYn() {
		return emergencyYn;
	}

	public void setEmergencyYn(String emergencyYn) {
		this.emergencyYn = emergencyYn;
	}

	public String getManualDispatch() {
		return manualDispatch;
	}

	public void setManualDispatch(String manualDispatch) {
		this.manualDispatch = manualDispatch;
	}

	public int getPremiumRate() {
		return premiumRate;
	}

	public void setPremiumRate(int premiumRate) {
		this.premiumRate = premiumRate;
	}

	public int getRound() {
		return round;
	}

	public void setRound(int round) {
		this.round = round;
	}

	public int getOwnerSettlementPrice() {
		return ownerSettlementPrice;
	}

	public void setOwnerSettlementPrice(int ownerSettlementPrice) {
		this.ownerSettlementPrice = ownerSettlementPrice;
	}

	public String getOwnerSettlementType() {
		return ownerSettlementType;
	}

	public void setOwnerSettlementType(String ownerSettlementType) {
		this.ownerSettlementType = ownerSettlementType;
	}

	public String getCarOwnerId() {
		return carOwnerId;
	}

	public void setCarOwnerId(String carOwnerId) {
		this.carOwnerId = carOwnerId;
	}

	public String getFreightOwnerId() {
		return freightOwnerId;
	}

	public void setFreightOwnerId(String freightOwnerId) {
		this.freightOwnerId = freightOwnerId;
	}

	public int getAdditionalCharge() {
		return additionalCharge;
	}

	public void setAdditionalCharge(int additionalCharge) {
		this.additionalCharge = additionalCharge;
	}

	public String getAdditionalChargeType() {
		return additionalChargeType;
	}

	public void setAdditionalChargeType(String additionalChargeType) {
		this.additionalChargeType = additionalChargeType;
	}

	public int getStandardCharge() {
		return standardCharge;
	}

	public void setStandardCharge(int standardCharge) {
		this.standardCharge = standardCharge;
	}

	public String getCarOwnerType() {
		return carOwnerType;
	}

	public void setCarOwnerType(String carOwnerType) {
		this.carOwnerType = carOwnerType;
	}

	public String getPreCarOwnerId() {
		return preCarOwnerId;
	}

	public void setPreCarOwnerId(String preCarOwnerId) {
		this.preCarOwnerId = preCarOwnerId;
	}

	public String getPreCarOwnerType() {
		return preCarOwnerType;
	}

	public void setPreCarOwnerType(String preCarOwnerType) {
		this.preCarOwnerType = preCarOwnerType;
	}

	public String getPreDispatchId() {
		return preDispatchId;
	}

	public void setPreDispatchId(String preDispatchId) {
		this.preDispatchId = preDispatchId;
	}

	public String getDeliveryId() {
		return deliveryId;
	}

	public void setDeliveryId(String deliveryId) {
		this.deliveryId = deliveryId;
	}

	public long getCompleted() {
		return completed;
	}

	public void setCompleted(long completed) {
		this.completed = completed;
	}

	public double getLoadingLat() {
		return loadingLat;
	}

	public void setLoadingLat(double loadingLat) {
		this.loadingLat = loadingLat;
	}

	public double getLoadingLon() {
		return loadingLon;
	}

	public void setLoadingLon(double loadingLon) {
		this.loadingLon = loadingLon;
	}

	public double getUnloadingLat() {
		return unloadingLat;
	}

	public void setUnloadingLat(double unloadingLat) {
		this.unloadingLat = unloadingLat;
	}

	public double getUnloadingLon() {
		return unloadingLon;
	}

	public void setUnloadingLon(double unloadingLon) {
		this.unloadingLon = unloadingLon;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String[] getCarOptions() {
		return carOptions;
	}

	public void setCarOptions(String[] carOptions) {
		this.carOptions = carOptions;
	}

	public long getLoadingDateTime() {
		return loadingDateTime;
	}

	public void setLoadingDateTime(long loadingDateTime) {
		this.loadingDateTime = loadingDateTime;
	}

	public long getUnloadingDateTime() {
		return unloadingDateTime;
	}

	public void setUnloadingDateTime(long unloadingDateTime) {
		this.unloadingDateTime = unloadingDateTime;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getLoadingPnu() {
		return loadingPnu;
	}

	public void setLoadingPnu(String loadingPnu) {
		this.loadingPnu = loadingPnu;
	}

	public String getUnloadingPnu() {
		return unloadingPnu;
	}

	public void setUnloadingPnu(String unloadingPnu) {
		this.unloadingPnu = unloadingPnu;
	}

	public String getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(String consumerId) {
		this.consumerId = consumerId;
	}

	public String getConsumerType() {
		return consumerType;
	}

	public void setConsumerType(String consumerType) {
		this.consumerType = consumerType;
	}

	public String getLoadingAddress() {
		return loadingAddress;
	}

	public void setLoadingAddress(String loadingAddress) {
		this.loadingAddress = loadingAddress;
	}

	public String getLoadingDetailAddress() {
		return loadingDetailAddress;
	}

	public void setLoadingDetailAddress(String loadingDetailAddress) {
		this.loadingDetailAddress = loadingDetailAddress;
	}

	public String getLoadingZipCode() {
		return loadingZipCode;
	}

	public void setLoadingZipCode(String loadingZipCode) {
		this.loadingZipCode = loadingZipCode;
	}

	public String getLoadingRbu() {
		return loadingRbu;
	}

	public void setLoadingRbu(String loadingRbu) {
		this.loadingRbu = loadingRbu;
	}

	public String getUnloadingAddress() {
		return unloadingAddress;
	}

	public void setUnloadingAddress(String unloadingAddress) {
		this.unloadingAddress = unloadingAddress;
	}

	public String getUnloadingDetailAddress() {
		return unloadingDetailAddress;
	}

	public void setUnloadingDetailAddress(String unloadingDetailAddress) {
		this.unloadingDetailAddress = unloadingDetailAddress;
	}

	public String getUnloadingZipCode() {
		return unloadingZipCode;
	}

	public void setUnloadingZipCode(String unloadingZipCode) {
		this.unloadingZipCode = unloadingZipCode;
	}

	public String getUnloadingRbu() {
		return unloadingRbu;
	}

	public void setUnloadingRbu(String unloadingRbu) {
		this.unloadingRbu = unloadingRbu;
	}

	public String getDispatchId() {
		return dispatchId;
	}

	public void setDispatchId(String dispatchId) {
		this.dispatchId = dispatchId;
	}

	public String getActorMemo() {
		return actorMemo;
	}

	public void setActorMemo(String actorMemo) {
		this.actorMemo = actorMemo;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getAuthGroupCode() {
		return authGroupCode;
	}

	public void setAuthGroupCode(String authGroupCode) {
		this.authGroupCode = authGroupCode;
	}

	public String getCancelReason() {
		return cancelReason;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	public String getCancelMemo() {
		return cancelMemo;
	}

	public void setCancelMemo(String cancelMemo) {
		this.cancelMemo = cancelMemo;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public boolean isUrgentFreight() {
		return urgentFreight;
	}

	public void setUrgentFreight(boolean urgentFreight) {
		this.urgentFreight = urgentFreight;
	}

	public String getHandworkType() {
		return handworkType;
	}

	public void setHandworkType(String handworkType) {
		this.handworkType = handworkType;
	}

	public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}
	
}