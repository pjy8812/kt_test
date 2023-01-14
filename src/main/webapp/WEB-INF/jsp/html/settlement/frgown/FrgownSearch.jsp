<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin search -->
<div class="card-box">
	<h5 class="card-title">조회조건</h5>
	<div class="row searchFormArea">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="freightOwnerType" class="col-2 col-form-label">구분/유형</label>
						<div class="col-4">
							<select class="form-control" id="freightOwnerType" name="freightOwnerType">
								<option value="all">계약구분(전체)</option>
								<c:forEach var="freightOwnerTypeList" items="${freightOwnerTypeList}">
									<option value="${freightOwnerTypeList.codeId}">${freightOwnerTypeList.codeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-3">
							<select class="form-control" id="freightMemberType" name="freightMemberType">
								<option value="all">사업자구분(전체)</option>
								<c:forEach var="freightMemberTypeList" items="${freightMemberTypeList}">
									<option value="${freightMemberTypeList.codeId}">${freightMemberTypeList.codeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-3">
							<select class="form-control" id="freightBusinessType" name="freightBusinessType">
								<option value="all">사업자유형(전체)</option>
								<c:forEach var="freightBusinessTypeList" items="${freightBusinessTypeList}">
									<option value="${freightBusinessTypeList.codeId}">${freightBusinessTypeList.codeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="freightOwnerSettlementStatus" class="col-4 col-form-label">청구상태</label>
						<div class="col-8">
							<select class="form-control" id="freightOwnerSettlementStatus" name="freightOwnerSettlementStatus">
								<option value="all">청구상태(전체)</option>
								<c:forEach var="freightOwnerSettlementStatusList" items="${freightOwnerSettlementStatusList}">
									<option value="${freightOwnerSettlementStatusList.codeId}">${freightOwnerSettlementStatusList.codeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="freightOwnerMonthSettlementNum" class="col-4 col-form-label">월 정산 횟수</label>
						<div class="col-8">
							<select class="form-control" id="freightOwnerMonthSettlementNum" name="freightOwnerMonthSettlementNum">
								<option value="all">전체</option>
								<option value="0">0회</option>
								<option value="1">1회(매월 1일)</option>
								<option value="2">2회(매월 1일, 15일)</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="searchType" class="col-1 col-form-label">검색어</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="searchType" name="searchType">
								<option value="freightOwnerName">회원명</option>
								<option value="freightOwnerId">회원ID</option>
								<option value="freightOwnerCompanyName">화주사</option>
								<option value="freightOwnerCorporate">사업자등록번호</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
		</div>
	</div>
	
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="range-datepicker" class="col-1 col-form-label">일자/기간</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="pickerType" name="pickerType">
								<option value="complete">청구발생일</option>
								<option value="deposit">입금완료일 </option>
							</select>
						</div>
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="settlementPicker" name="settlementPicker" class="form-control"
									placeholder="기간선택"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-6">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 1mon" data-target-input="settlementPicker">최근1개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 6mon" data-target-input="settlementPicker">최근6개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 1year" data-target-input="settlementPicker">최근1년</button>
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

<!-- Begin result -->
<div class="card-box searchList">

</div>

<script>
	
	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		data.pageIndex = 1;
		searchList();
	})
	
	// 기간검색 1개월 
	$('button.datePicker.1mon').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 1, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 3개월 
	$('button.datePicker.6mon').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 6, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 6개월 
	$('button.datePicker.1year').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 365);
		updateDateRangePicker(elName, valueList);
	})

	// 기간 범위
	function getDateRange(_elName, _month, _day) {
		
		var from = new Date();
		var to = new Date();
		
		var fromMonth = new Date(from.setMonth(from.getMonth() - _month));
		var fromDay = new Date(fromMonth.setDate(fromMonth.getDate() - _day));
		
		return [fromDay, to]; 
	}

	// 날짜정보 업데이트 
	function updateDateRangePicker(_elName, _value) {
		
		if(_elName === 'settlementPicker') {
			if(_value.length === 2) {
				data.settlementStartDate = _value[0].setHours(0,0,0,0);;
				data.settlementEndDate = _value[1].setHours(0,0,0,0);;
			} else if (_value.length === 1) {
				data.settlementStartDate = _value[0].setHours(0,0,0,0);;
				data.settlementEndDate = _value[0].setHours(0,0,0,0);;
			} else {
				data.settlementStartDate = new Date().setHours(0,0,0,0);;
				data.settlementEndDate = new Date().setHours(0,0,0,0);;
			}
			
			settlementPicker.setDate([data.settlementStartDate, data.settlementEndDate]);
		
			return;
		}
		
		// 정산완료일 
		/* if(_elName === 'settlementComplete') {
			if(_value.length === 2) {
				data.settlementCompleteStartDate = _value[0];
				data.settlementCompleteEndDate = _value[1];
			} else if (_value.length === 1) {
				data.settlementCompleteStartDate = _value[0];
				data.settlementCompleteEndDate = _value[0];
			} else {
				data.settlementCompleteStartDate = new Date();
				data.settlementCompleteEndDate = new Date();
			}
			
			settlementCompletePicker.setDate([data.settlementCompleteStartDate, data.settlementCompleteEndDate]);
		
			return;
		} */
		
		// 입금완료일 
		/* if(_elName === 'settlementDeposit') {
			if(_value.length === 2) {
				data.settlementDepositStateDate = _value[0];
				data.settlementDepositEndDate = _value[1];
			} else if (_value.length === 1) {
				data.settlementDepositStateDate = _value[0];
				data.settlementDepositEndDate = _value[0];
			} else {
				data.settlementDepositStateDate = new Date();
				data.settlementDepositEndDate = new Date();
			}
			
			settlementDepositPicker.setDate([data.settlementDepositStateDate, data.settlementDepositEndDate]);
		
			return;
		} */
	}
	
	// picker Max/Min 값 update
	function updatePickerRange() {
		
		// 불필요 
		/* settlementDepositPicker.set('maxDate', data.settlementDepositEndDate);
		settlementDepositPicker.set('minDate', data.settlementDepositStateDate);
		settlementCompletePicker.set('maxDate', data.settlementCompleteEndDate);
		settlementCompletePicker.set('minDate', data.settlementCompleteStartDate); */
		
	}
	
	var settlementPicker;
	// var settlementDepositPicker;
	// var settlementCompletePicker; 
	
	function initServiceEvent() {
	
		updateStatus();
		
		settlementPicker = flatpickr($('#settlementPicker'), {
			mode : "range",
			locale: {
				rangeSeparator: ' - '
            },
            dateFormat: "Y.m.d",
			defaultDate : [
				data.settlementStartDate
				, data.settlementEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.settlementStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementPicker').val().length === 10) {
					data.settlementEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.settlementStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementPicker').val().length === 10) {
					data.settlementEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			}
		})
		
		// 정산완료일  
		/* settlementCompletePicker = flatpickr($('#settlementComplete'), {
			mode : "range",
			defaultDate : [
				data.settlementCompleteStartDate
				, data.settlementCompleteEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.settlementCompleteStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementComplete').val().length === 10) {
					data.settlementCompleteEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementCompleteEndDate = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.settlementCompleteStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementComplete').val().length === 10) {
					data.settlementCompleteEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementCompleteEndDate = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			}
		}) */
		
		// 입금완료일  
		/* settlementDepositPicker = flatpickr($('#settlementDeposit'), {
			mode : "range",
			defaultDate : [
				data.settlementDepositStateDate
				, data.settlementDepositEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.settlementDepositStateDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementDeposit').val().length === 10) {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.settlementDepositStateDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementDeposit').val().length === 10) {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			}
		}) */
		
		updatePickerRange();
	}
	
	$('#freightOwnerSettlementStatus').on('change', function() {
		updateStatus();
	});
	
	// 정산 대기일 경우 정산발생일/입금완료일이 없으므로 picker 비활성화 
	function updateStatus() {
		if($('#freightOwnerSettlementStatus').val() === 'settlementStandby') {
			$('#settlementPicker').prop('disabled', 'diabled');
		} else {
			$('#settlementPicker').prop('disabled', null);
		}
	}
	
	$(document).ready(function() {
		initServiceEvent();
		var elName = "settlementPicker";
		var valueList = getDateRange(elName, 0, 365);
		updateDateRangePicker(elName, valueList);
		
		searchList();
	})

</script>
