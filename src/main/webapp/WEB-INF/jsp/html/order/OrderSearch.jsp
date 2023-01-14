<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Begin search -->
<div class="card-box">
	<h5 class="card-title">조회조건</h5>
	<div class="row searchFormArea">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="orderType1" class="col-2 col-form-label">주문상태</label>
						<div class="col-5">
							<select class="form-control" id="orderType1" name="orderType1">
								<option value="ALL"<c:if test="${'ALL' eq vo.orderType1}"> selected="selected"</c:if>>전체</option>								
								<option value="CHARGE_CHECKING"<c:if test="${'CHARGE_CHECKING' eq vo.orderType1}"> selected="selected"</c:if>>요금확인중</option>
								<option value="DELIVERY_REQUESTED"<c:if test="${'DELIVERY_REQUESTED' eq vo.orderType1}"> selected="selected"</c:if>>배송요청</option>
								<option value="DISPATCH_COMPLETED"<c:if test="${'DISPATCH_COMPLETED' eq vo.orderType1}"> selected="selected"</c:if>>배차완료</option>
								<option value="LOADING_COMPLETED"<c:if test="${'LOADING_COMPLETED' eq vo.orderType1}"> selected="selected"</c:if>>상차완료</option>
								<option value="UNLOADING_COMPLETED"<c:if test="${'UNLOADING_COMPLETED' eq vo.orderType1}"> selected="selected"</c:if>>하차완료</option>
								<option value="ORDER_CANCELED"<c:if test="${'ORDER_CANCELED' eq vo.orderType1}"> selected="selected"</c:if>>주문취소</option>
							</select>
						</div>
						<!-- Begin 수동배차 제외항목 -->
						<c:if test="${mode ne 'manual'}">
							<div class="col-5">
								<select class="form-control" id="orderType2" name="orderType2">
									<option value="ALL">전체</option>
									<option value="GENERALDELIVERY"<c:if test="${'GENERALDELIVERY' eq vo.orderType2}"> selected="selected"</c:if>>일반</option>
									<option value="URGENTDELIVERY"<c:if test="${'URGENTDELIVERY' eq vo.orderType2}"> selected="selected"</c:if>>긴급</option>
								</select>
							</div>
						</c:if>
						<!-- End 수동배차 제외항목 -->
					</div>
				</div>
				<!-- Begin 수동배차 제외항목 -->
				<c:if test="${mode ne 'manual'}">
					<div class="col-6">
						<div class="form-group row mb-3">
							<label for="dispatchDelay" class="col-4 col-form-label">배차지연</label>
							<div class="col-5">
								<select class="form-control" id="dispatchDelay" name="dispatchDelay">
									<option value="ALL"<c:if test="${'ALL' eq vo.dispatchDelay}"> selected="selected"</c:if>>전체</option>
									<option value="NOMAL"<c:if test="${'NOMAL' eq vo.dispatchDelay}"> selected="selected"</c:if>>정상</option>
									<option value="DELAY"<c:if test="${'DELAY' eq vo.dispatchDelay}"> selected="selected"</c:if>>지연</option>
								</select>
							</div>
						</div>
					</div>
				</c:if>
				<!-- End 수동배차 제외항목 -->
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="freightOwnerType" class="col-2 col-form-label">계약구분</label>
						<div class="col-5">
							<!-- 수동배차일 경우 계약화주만 보이도록 수정 by.2022.4.9 KT확인 (2022.04.10 계약화주-수동배차로 변경)-->
							<select class="form-control" id="freightOwnerType" name="freightOwnerType">
								<option value="ALL"<c:if test="${'ALL' eq vo.freightOwnerType}"> selected="selected"</c:if>>전체</option>
								<option value="FO_C"<c:if test="${'FO_C' eq vo.freightOwnerType}"> selected="selected"</c:if>>계약화주</option>
								<option value="manualDelivery"<c:if test="${'manualDelivery' eq vo.freightOwnerType}"> selected="selected"</c:if>>계약화주-수동배차</option>
								<option value="FO_G"<c:if test="${'FO_G' eq vo.freightOwnerType}"> selected="selected"</c:if>>일반화주</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="freightType" class="col-4 col-form-label">화물구분</label>
						<div class="col-5">
							<select class="form-control" id="freightType" name="freightType">
								<option value="ALL">전체</option>
								<option value="All">일반</option>
								<!-- 일반(ALL)만 검색되도록 정재국대리에게 전달받음 (2022.04.01) -->
								<!--
								<option value="">합짐</option>
								<option value="">혼짐</option>
								<option value="">복화</option>
								-->
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="range-datepicker" class="col-2 col-form-label">화물등록일</label>
						<div class="col-10">
							<div class="row">
								<div class="col-6">
									<div class="picker-wrap">
										<input type="text" id="registerDate" class="form-control" name="registerDate">
										<label for="registerDate"><i class="fas fa-calendar"></i></label>
									</div>
								</div>
								<div class="col-6 text-center">
									<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="register">오늘</button>
									<button type="button" class="btn btn-white waves-effect datePicker dateRange 7days" data-target-input="register">최근7일</button>
									<button type="button" class="btn btn-white waves-effect datePicker dateRange 30days" data-target-input="register">최근1개월</button>
								</div>
							</div>
						</div>
					</div>
				</div>
                <div class="col-6">
                    <div class="form-group row mb-3">
                        <label for="emergencyYn" class="col-4 col-form-label">비상배차 여부</label>
                        <div class="col-5">
                            <select class="form-control" id="emergencyYn" name="emergencyYn">
                                <option value="ALL"<c:if test="${'ALL' eq vo.emergencyYn}"> selected="selected"</c:if>>전체</option>
                                <option value="Y"<c:if test="${'Y' eq vo.emergencyYn}"> selected="selected"</c:if>>Y</option>
                                <option value="N"<c:if test="${'N' eq vo.emergencyYn}"> selected="selected"</c:if>>N</option>
                            </select>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="basic-datepicker" class="col-2 col-form-label">상차일시</label>
						<div class="col-10">
							<div class="row">
								<div class="col-6">
									<div class="picker-wrap">
										<input type="text" id="loadingDate" class="form-control" name="loadingDate">
										<label for="loadingDate"><i class="fas fa-calendar"></i></label>
									</div>
								</div>
								<div class="col-6 text-center">
									<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="loading">오늘</button>
									<button type="button" class="btn btn-white waves-effect datePicker dateRange 7days" data-target-input="loading">최근7일</button>
									<button type="button" class="btn btn-white waves-effect datePicker dateRange 30days" data-target-input="loading">최근1개월</button>
								</div>
		
							</div>
						</div>
					</div>
				</div>
				<div class="col-6">
					<fmt:formatDate value="${loadStart}" pattern="yyyyMMdd" var="loadStart"/>
					<fmt:formatDate value="${loadEnd}" pattern="yyyyMMdd" var="loadEnd"/>
					<div class="col-4 text-left col-form-label loading <c:if test='${(empty loadStart && empty loadEnd) || loadStart ne loadEnd}'>d-none</c:if>">
						<div class="form-check form-check-inline">
							<input type="checkbox" name="loadingApm" class="form-check-input" value="AM" checked>
							<label class="form-check-label">AM</label>
						</div>
						<div class="form-check form-check-inline pl-2">
							<input type="checkbox" name="loadingApm" class="form-check-input" value="PM" checked>
							<label class="form-check-label">PM</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="sbasic-datepicker03" class="col-2 col-form-label">하차일시</label>
						<div class="col-10">
							<div class="row">
								<div class="col-6">
									<div class="picker-wrap">
										<input type="text" id="unloadingDate" class="form-control" name="unloadingDate">
										<label for="unloadingDate"><i class="fas fa-calendar"></i></label>
									</div>
								</div>
								<div class="col-6 text-center">
									<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="unloading">오늘</button>
									<button type="button" class="btn btn-white waves-effect datePicker dateRange 7days" data-target-input="unloading">최근7일</button>
									<button type="button" class="btn btn-white waves-effect datePicker dateRange 30days" data-target-input="unloading">최근1개월</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6">
					<fmt:formatDate value="${unloadStart}" pattern="yyyyMMdd" var="unloadStart"/>
					<fmt:formatDate value="${unloadEnd}" pattern="yyyyMMdd" var="unloadEnd"/>
					<div class="col-4 text-left col-form-label unloading <c:if test='${(empty unloadStart && empty unloadEnd) || unloadStart ne unloadEnd}'>d-none</c:if>">
						<div class="form-check form-check-inline">
							<input type="checkbox" name="unloadingApm" class="form-check-input" value="AM" checked>
							<label class="form-check-label">AM</label>
						</div>
						<div class="form-check form-check-inline pl-2">
							<input type="checkbox" name="unloadingApm" class="form-check-input" value="PM" checked>
							<label class="form-check-label">PM</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="orderSearchType" class="col-1 col-form-label">검색어</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="orderSearchType">
								<option value="ORDERNUM"<c:if test="${'ORDERNUM' eq vo.searchType}"> selected="selected"</c:if>>주문번호</option>
								<option value="FREIGHTID"<c:if test="${'FREIGHTID' eq vo.searchType}"> selected="selected"</c:if>>화주ID</option>
								<option value="CAROWNERID"<c:if test="${'CAROWNERID' eq vo.searchType}"> selected="selected"</c:if>>차주ID</option>
								<option value="FREIGHTNAME"<c:if test="${'FREIGHTNAME' eq vo.searchType}"> selected="selected"</c:if>>화주명</option>
								<option value="CAROWNERNAME"<c:if test="${'CAROWNERNAME' eq vo.searchType}"> selected="selected"</c:if>>차주명</option>
								<option value="CARNUMBER"<c:if test="${'CARNUMBER' eq vo.searchType}"> selected="selected"</c:if>>차량번호</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="orderSearchKeyword" value="${vo.searchText}" placeholder="검색어를 입력하세요.">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
			<button type="button" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
		</div>
	</div>
</div>
<!-- End search -->

<!-- result -->
<div class="searchList"></div>

<div id="popup_orderListUpload"></div>


<script>
<c:if test="${null ne vo.freightRegistStartDatetime and '' ne vo.freightRegistStartDatetime}">
	data.freightRegistStartDatetime = new Date(new Date(${vo.freightRegistStartDatetime}).setHours(0, 0, 0, 0)).getTime();
</c:if>
<c:if test="${null ne vo.freightRegistEndDatetime and '' ne vo.freightRegistEndDatetime}">
	data.freightRegistEndDatetime = new Date(new Date(${vo.freightRegistEndDatetime}).setHours(23, 59, 59, 0)).getTime();
</c:if>

<c:if test="${null ne vo.loadingStartDateTime and '' ne vo.loadingStartDateTime}">
	data.loadingStartDateTime =new Date(new Date(${vo.loadingStartDateTime}).setHours(0, 0, 0, 0)).getTime();
</c:if>
<c:if test="${null ne vo.loadingEndDateTime and '' ne vo.loadingEndDateTime}">
	data.loadingEndDateTime = new Date(new Date(${vo.loadingEndDateTime}).setHours(23, 59, 59, 0)).getTime();
</c:if>

<c:if test="${null ne vo.unloadingStartDateTime and '' ne vo.unloadingStartDateTime}">
	data.unloadingStartDateTime = new Date(new Date(${vo.unloadingStartDateTime}).setHours(0, 0, 0, 0)).getTime();
</c:if>
<c:if test="${null ne vo.unloadingEndDateTime and '' ne vo.unloadingEndDateTime}">
	data.unloadingEndDateTime = new Date(new Date(${vo.unloadingEndDateTime}).setHours(23, 59, 59, 0)).getTime();
</c:if>
	
	var dashboardFlag;

	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		data.pageIndex = 1;
		data.pageStart = (data.pageIndex-1) * $('#countList').val();
		searchList();
	});
	
	// 기간검색 > 오늘
	$('button.datePicker.today').on('click touch', function() {
		var valueList;
		var elName = $(this).data('target-input');
		
		if(elName == 'register') {
			valueList = getDateRange(elName, 0, 0);
			updateDateRangePicker(elName, valueList);
			
			//화물등록일 '오늘' 선택시, 상/하차일시 오늘 ~ D+2일로 설정 (2022.04.15)
			valueList = getDateRange("loading", 0, -2);
			updateDateRangePicker("loading", valueList, "today");
			
			valueList = getDateRange("unloading", 0, -2);
			updateDateRangePicker("unloading", valueList, "today");
			
			//AM/PM 선택영역 숨김처리
			$('.col-form-label.loading').addClass('d-none');
			$('.col-form-label.unloading').addClass('d-none');
		} else {
			valueList = getDateRange(elName, 0, 0);
			updateDateRangePicker(elName, valueList);
		}
		
		dashboardFlag = false;
	})
	
	// 기간검색 > 최근7일 
	$('button.datePicker.7days').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 6);
		updateDateRangePicker(elName, valueList);
		dashboardFlag = false;
		
		// 화물등록일 설정 시, 하단의 상차/하차일시도 동일한 일자 적용
		if(elName == 'register') {
			$('button.datePicker.7days[data-target-input="loading"]').click();
			$('button.datePicker.7days[data-target-input="unloading"]').click();
		}
	})
	
	// 기간검색 > 최근1개월
	$('button.datePicker.30days').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 1, 0);
		updateDateRangePicker(elName, valueList);
		dashboardFlag = false;
		
		// 화물등록일 설정 시, 하단의 상차/하차일시도 동일한 일자 적용
		if(elName == 'register') {
			$('button.datePicker.30days[data-target-input="loading"]').click();
			$('button.datePicker.30days[data-target-input="unloading"]').click();
		}
	})
	
	// 기간검색 > '오늘'인 경우에만 AM/PM 선택 노출
	$('.btn.btn-white').on('click', function(){
		var mode = $(this).data('target-input');
		
		if($(this).hasClass('today')) {
			$('.col-form-label.'+mode).removeClass('d-none');
			
			// AM/PM 모두 선택된 상태로 노출 (2022.04.15)
			$('.col-form-label.'+mode).find('input:checkbox').prop('checked', true);
		} else {
			$('.col-form-label.'+mode).addClass('d-none');
		}
	});
	
	// 기간 범위
	function getDateRange(_elName, _month, _day) {
		
		var from = new Date();
		var to = new Date();
		
		var fromMonth = new Date(from.setMonth(from.getMonth() - _month));
		var fromDay = new Date(fromMonth.setDate(fromMonth.getDate() - _day));
		
		return [fromDay, to]; 
	}
	
	// 날짜정보 업데이트 
	function updateDateRangePicker(_elName, _value, _mode) {
		
		// 화물등록일 
		if(_elName === 'register') {
			if(_value.length === 2) {
				data.freightRegistStartDatetime = _value[0];
				data.freightRegistEndDatetime = _value[1];
			} else if (_value.length === 1) {
				data.freightRegistStartDatetime = _value[0];
				data.freightRegistEndDatetime = _value[0];
			} else {
				data.freightRegistStartDatetime = new Date();
				data.freightRegistEndDatetime = new Date();
			}
			
			registerDatepicker.setDate([data.freightRegistStartDatetime, data.freightRegistEndDatetime]);
		
			return;
		}
		
		// 상차일시 
		if(_elName === 'loading') {
			if(_value.length === 2) {
				if(_mode != null && _mode != undefined && _mode === 'today') {
					// 화물등록일 '오늘' 설정하여 상차일시 선택된 경우 startDate/endDate 순서 변경 (2022.04.15)
					data.loadingStartDateTime = _value[1];
					data.loadingEndDateTime = _value[0];
				} else {
					data.loadingStartDateTime = _value[0];
					data.loadingEndDateTime = _value[1];
				}
			} else if (_value.length === 1) {
				data.loadingStartDateTime = _value[0];
				data.loadingEndDateTime = _value[0];
			} else {
				data.loadingStartDateTime = new Date();
				data.loadingEndDateTime = new Date();
			}
			
			loadingDatepicker.setDate([data.loadingStartDateTime, data.loadingEndDateTime]);
			return;
		}
		
		// 하차일시 
		if(_elName === 'unloading') {
			if(_value.length === 2) {
				if(_mode != null && _mode != undefined && _mode === 'today') {
					// 화물등록일 '오늘' 설정하여 하차일시 선택된 경우 startDate/endDate 순서 변경 (2022.04.15)
					data.unloadingStartDateTime = _value[1];
					data.unloadingEndDateTime = _value[0];
				} else {
					data.unloadingStartDateTime = _value[0];
					data.unloadingEndDateTime = _value[1];
				}
			} else if (_value.length === 1) {
				data.unloadingStartDateTime = _value[0];
				data.unloadingEndDateTime = _value[0];
			} else {
				data.unloadingStartDateTime = new Date();
				data.unloadingEndDateTime = new Date();
			}
			
			unloadingDatepicker.setDate([data.unloadingStartDateTime, data.unloadingEndDateTime]);
			return;
		}
	}
	
	var registerDatepicker;
	var loadingDatepicker;
	var unloadingDatepicker;
	
	function initServiceEvent() {
		// 화물등록일  
		registerDatepicker = flatpickr($('#registerDate'), {
			mode : "range",
			dateFormat: "Y.m.d",
            locale: {
                rangeSeparator: ' ~ '
            },
			defaultDate : [
				data.freightRegistStartDatetime
				, data.freightRegistEndDatetime
			],
			onReady : function(selectedDates, dateStr, instance) {
				data.freightRegistStartDatetime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.freightRegistEndDatetime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.freightRegistStartDatetime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.freightRegistEndDatetime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
				dashboardFlag = false;
			}
		})
		
		// 상차일시
		loadingDatepicker = flatpickr($('#loadingDate'), {
			mode : "range",
			dateFormat: "Y.m.d",
            locale: {
                rangeSeparator: ' ~ '
            },
			defaultDate : [
				data.loadingStartDateTime
				, data.loadingEndDateTime
			],
			onReady : function(selectedDates, dateStr, instance) {
				data.loadingStartDateTime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.loadingEndDateTime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.loadingStartDateTime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.loadingEndDateTime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
				dashboardFlag = false;
				
				var start = new Date(selectedDates[0]).format('yyyyMMdd');
				var end = new Date(selectedDates[1]).format('yyyyMMdd');
				if(start != ' ' && end != ' ') {
					if(start != end) {
						$('.col-form-label.loading').addClass('d-none');
					} else {
						$('.col-form-label.loading').removeClass('d-none');		
					}
				}
			}
		})
		
		// 하차일시
		unloadingDatepicker = flatpickr($('#unloadingDate'), {
			mode : "range",
			dateFormat: "Y.m.d",
            locale: {
                rangeSeparator: ' ~ '
            },
			defaultDate : [
				data.unloadingStartDateTime
				, data.unloadingEndDateTime
			],
			onReady : function(selectedDates, dateStr, instance) {
				data.unloadingStartDateTime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.unloadingEndDateTime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.unloadingStartDateTime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.unloadingEndDateTime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
				dashboardFlag = false;
				
				var start = new Date(selectedDates[0]).format('yyyyMMdd');
				var end = new Date(selectedDates[1]).format('yyyyMMdd');
				if(start != ' ' && end != ' ') {
					if(start != end) {
						$('.col-form-label.unloading').addClass('d-none');
					} else {
						$('.col-form-label.unloading').removeClass('d-none');		
					}
				}
			}
		})
	}
	
	$(document).ready(function() {
	
		// initPicker
		initServiceEvent();
	});

</script>
