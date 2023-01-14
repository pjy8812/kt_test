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
						<label for="searchAuthGroup" class="col-2 col-form-label">권한그룹</label>
						<div class="col-5">
							<select class="form-control" id="searchAuthGroup">
								<option value="0">권한그룹(전체)</option>
									<c:forEach items="${result.list}" var="list">
										<option value="${list.adminAuthorityGroupSeq}" <c:if test="${vo.adminAuthorityGroupSeq eq list.adminAuthorityGroupSeq}">selected</c:if>>${list.authGroupName}</option>
									</c:forEach>
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
				<label for="range-datepicker" class="col-1 col-form-label">생성일</label>
				<div class="col-11">
					<div class="row">
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="generateDate" class="form-control"
									placeholder="기간선택" name="generateDate"> <label for="generateDate">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-8">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="generateDate">오늘</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 7days" data-target-input="generateDate">최근7일</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 30days" data-target-input="generateDate">최근1개월</button>
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
							<select class="form-control" id="searchType">
								<option value="adminId">이용자ID</option>
								<option value="adminName">이용자명</option>
								<option value="adminEmployeeNum">사번</option>
								<option value="adminEmail">이메일</option>
								<option value="adminTelephone">전화번호</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="keyword" placeholder="검색어를 입력하세요.">
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

<div id="popup_accountListUpload"></div>


<script>

	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		data.adminAuthorityGroupSeq = $('#searchAuthGroup').val();
		searchList();
	});
	
	// 기간검색 > 오늘 
	$('button.datePicker.today').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 > 최근7일 
	$('button.datePicker.7days').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 6);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 > 최근1개월
	$('button.datePicker.30days').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 1, 0);
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
		if(_elName === 'generateDate') {
			if(_value.length === 2) {
				data.adminRegisterStartDateTime = _value[0];
				data.adminRegisterEndDateTime = _value[1];
			} else if (_value.length === 1) {
				data.adminRegisterStartDateTime = _value[0];
				data.adminRegisterEndDateTime = _value[0];
			} else {
				data.adminRegisterStartDateTime = new Date();
				data.adminRegisterEndDateTime = new Date();
			}
			
			generateDatepicker.setDate([data.adminRegisterStartDateTime, data.adminRegisterEndDateTime]);
		
			return;
		}
	}
	
	var generateDatepicker;
	
	function initServiceEvent() {
		generateDatepicker = flatpickr($('#generateDate'), {
			mode : "range",
			dateFormat: "Y.m.d",
            locale: {
                rangeSeparator: ' ~ '
            },
			defaultDate : [
				data.adminRegisterStartDateTime
				, data.adminRegisterEndDateTime
			],
			onReady : function(selectedDates, dateStr, instance) {
				data.adminRegisterStartDateTime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.adminRegisterEndDateTime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.adminRegisterStartDateTime = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.adminRegisterEndDateTime = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			}
		})
	}
	
	$(document).ready(function() {
		// initPicker
		initServiceEvent();
		
		<c:if test="${empty result.resultCode}">
			alert('권한그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('권한그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
	});

</script>