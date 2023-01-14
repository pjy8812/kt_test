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
						<label for="carOwnerId" class="col-2 col-form-label">이용자 ID</label>
						<div class="col-9">
							<input type="text" class="form-control" id="carOwnerId" name="carOwnerId" placeholder="이용자 ID를 입력하세요.">
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="carOwnerTerminalDevice" class="col-2 col-form-label">디바이스</label>
						<div class="col-9">
							<input type="text" class="form-control" id="carOwnerTerminalDevice" name="carOwnerTerminalDevice" placeholder="디바이스명을 입력하세요.">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row searchFormArea">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="carOwnerName" class="col-2 col-form-label">이용자명</label>
						<div class="col-9">
							<input type="text" class="form-control" id="carOwnerName" name="carOwnerName" placeholder="이용자명을 입력하세요.">
						</div>
					</div>
				</div>
				<div class="col-1">
					<label for="carOwnerTerminalOs" class="col col-form-label">OS</label>
				</div>
				<div class="col-4 form-check">
					<div class="form-check mt-1 form-check-primary row">
						<input class="form-check-input" type="checkbox" id="carOwnerTerminalOs" name="carOwnerTerminalOs" value="Android" checked>
						<label class="form-check-label" for="carOwnerTerminalOs">Android</label>
						<input class="form-check-input ml-3" type="checkbox" id="carOwnerTerminalOs" name="carOwnerTerminalOs" value="iOS" checked>
						<label class="form-check-label ml-5" for="carOwnerTerminalOs">iOS</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="range-datepicker" class="col-1 col-form-label">첫 로그인</label>
				<div class="col-11">
					<div class="row">
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="joinPicker" name="joinPicker" class="form-control"
									placeholder="기간선택"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-8">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="joinPicker">오늘</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange week" data-target-input="joinPicker">최근7일</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 1mon" data-target-input="joinPicker">최근1개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 3mon" data-target-input="joinPicker">최근3개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 6mon" data-target-input="joinPicker">최근6개월</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="range-datepicker" class="col-1 col-form-label">마지막 접속일</label>
				<div class="col-11">
					<div class="row">
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="lastUsePicker" name="lastUsePicker" class="form-control"
									placeholder="기간선택"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-8">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="lastUsePicker">오늘</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange week" data-target-input="lastUsePicker">최근7일</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 1mon" data-target-input="lastUsePicker">최근1개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 3mon" data-target-input="lastUsePicker">최근3개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 6mon" data-target-input="lastUsePicker">최근6개월</button>
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
	
	function setCheckBox(_object) {
		if (_object.carOwnerTerminalOs !== undefined) {
			// 전체선택 
			if(_object.carOwnerTerminalOs !== '') {
				
				if(_object.carOwnerTerminalOs === 'all') {
					$('[name="carOwnerTerminalOs"]').each(function(){ 
						$(this).prop('checked', true);
					})
				} else {
					$('[name="carOwnerTerminalOs"][value="' + _object.carOwnerTerminalOs + '"]').prop('checked', true);
				}
			} else {
				$('[name="carOwnerTerminalOs"]').each(function(){ 
					$(this).prop('checked', false);
				})
			}
		} else {
			// 선택안함 
			$('[name="carOwnerTerminalOs"]').each(function(){ 
				$(this).prop('checked', false);
			})
		}
	}
	
	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		data.pageIndex = 1;
		searchList();
	})
	
	// 기간검 오늘    
	$('button.datePicker.today').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검 일주일  
	$('button.datePicker.week').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 6);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 1개월 
	$('button.datePicker.1mon').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 1, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 3개월 
	$('button.datePicker.3mon').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 3, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 6개월 
	$('button.datePicker.6mon').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 6, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 1년 
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
		
		// 화물등록일 
		if(_elName === 'joinPicker') {
			if(_value.length === 2) {
				data.joinStartDate = _value[0].setHours(0,0,0,0);
				data.joinEndDate = _value[1].setHours(0,0,0,0);
			} else if (_value.length === 1) {
				data.joinStartDate = _value[0].setHours(0,0,0,0);
				data.joinEndDate = _value[0].setHours(0,0,0,0);
			} else {
				data.joinStartDate = new Date().setHours(0,0,0,0);
				data.joinEndDate = new Date().setHours(0,0,0,0);
			}
			
			joinPicker.setDate([data.joinStartDate, data.joinEndDate]);
		
			return;
		}
		
		// 정산완료일 
		if(_elName === 'lastUsePicker') {
			if(_value.length === 2) {
				data.lastUseStartDate = _value[0].setHours(0,0,0,0);
				data.lastUseEndDate = _value[1].setHours(0,0,0,0);
			} else if (_value.length === 1) {
				data.lastUseStartDate = _value[0].setHours(0,0,0,0);
				data.lastUseEndDate = _value[0].setHours(0,0,0,0);
			} else {
				data.lastUseStartDate = new Date().setHours(0,0,0,0);
				data.lastUseEndDate = new Date().setHours(0,0,0,0);
			}
			
			lastUsePicker.setDate([data.lastUseStartDate, data.lastUseEndDate]);
		
			return;
		}
	}
	
	// picker Max/Min 값 update
	/* function updatePickerRange() {
		
	} */
	
	var joinPicker;
	var lastUsePicker; 
	
	function initServiceEvent() {
		
		// 체크박스 data 동기화 
		setCheckBox(data);
		
		// 정산발생일  
		joinPicker = flatpickr($('#joinPicker'), {
			mode : "range",
			locale: {
                rangeSeparator: ' - '
            },
            dateFormat: "Y.m.d",
			defaultDate : [
				data.joinStartDate
				, data.joinEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.joinStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#joinPicker').val().length === 10) {
					data.joinEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.joinEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.joinStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#joinPicker').val().length === 10) {
					data.joinEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.joinEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			}
		})
		
		// 정산완료일  
		lastUsePicker = flatpickr($('#lastUsePicker'), {
			mode : "range",
			locale: {
                rangeSeparator: ' - '
            },
            dateFormat: "Y.m.d",
			defaultDate : [
				data.lastUseStartDate
				, data.lastUseEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.lastUseStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#lastUsePicker').val().length === 10) {
					data.lastUseEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.lastUseEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.lastUseStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#lastUsePicker').val().length === 10) {
					data.lastUseEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.lastUseEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			}
		})
		
		// updatePickerRange();
	}
	
	$(document).ready(function() {
		initServiceEvent();
		searchList();
	})

</script>
