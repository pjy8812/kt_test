<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin search -->
<%-- Start TOOD 카테고리 탭 --%>
<ul class="nav nav-tabs">
    <li class="nav-item">
    	<c:choose>
    		<c:when test="${'settlement' eq pageType}">
    			<a href="" data-toggle="tab" aria-expanded="true" class="nav-link active"
        			id="listBySettlemenet" data-page-type="settlement">차주 일별 조회</a>
    		</c:when>
    		<c:otherwise>
    			<a href="" data-toggle="tab" aria-expanded="true" class="nav-link"
        			id="listBySettlemenet" data-page-type="settlement">차주 일별 조회</a>
    		</c:otherwise>
    	</c:choose>
    </li>
    <li class="nav-item">
    	<c:choose>
    		<c:when test="${'order' eq pageType}">
    			<a href="" data-toggle="tab" aria-expanded="false" class="nav-link active" 
        			id="listByOrder" data-page-type="order">주문 건별 조회</a>
    		</c:when>
    		<c:otherwise>
    			<a href="" data-toggle="tab" aria-expanded="false" class="nav-link" 
        			id="listByOrder" data-page-type="order">주문 건별 조회</a>
    		</c:otherwise>
    	</c:choose>
    </li>
</ul>
<%-- End TOOD 카테고리 탭 --%>
<div class="card-box">
	<h5 class="card-title">조회조건</h5>
	<c:if test="${'settlement' eq pageType}">
		<div class="row searchFormArea settlementSearch">
			<div class="col-10">
				<div class="row">
					<div class="col-6">
						<div class="form-group row mb-3">
							<label for="carOwnerSettlementStatus" class="col-2 col-form-label">정산상태</label>
							<div class="col-5">
								<select class="form-control" id="carOwnerSettlementStatus" name="carOwnerSettlementStatus">
									<option value="all">정산상태(전체)</option>
									<c:forEach var="carOwnerSettlementStatusList" items="${settlementStatusList}">
										<c:if test="${'settlementStandby' eq carOwnerSettlementStatusList.codeId
											 or 'settlementRequested' eq carOwnerSettlementStatusList.codeId
											 or 'settlementCompleted' eq carOwnerSettlementStatusList.codeId
											 or 'settlementFailed' eq carOwnerSettlementStatusList.codeId}">
											<option value="${carOwnerSettlementStatusList.codeId}">${carOwnerSettlementStatusList.codeName}</option>
										</c:if>
									</c:forEach>
								</select>
								<%-- <select class="form-control" id="carOwnerSettlementStatus" name="carOwnerSettlementStatus">
									<option value="all">정산상태(전체)</option>
									<c:forEach var="carOwnerSettlementStatusList" items="${carOwnerSettlementStatusList}">
										<option value="${carOwnerSettlementStatusList.key}">${carOwnerSettlementStatusList.value}</option>
									</c:forEach>
								</select> --%>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="form-group row mb-3">
							<label for="searchType" class="col-2 col-form-label">검색어</label>
							<div class="col-4">
								<select class="form-control" id="searchType" name="searchType">
									<%-- <c:forEach var="searchTypeTypeList" items="${searchTypeTypeList}">
										<option value="${searchTypeTypeList.key}">${searchTypeTypeList.value}</option>
									</c:forEach> --%>
									<option value="carOwnerName">회원명</option>
									<option value="carOwnerId">회원ID</option>
									<option value="carOwnerSettlementOrderNum">주문번호</option>
									<option value="carOwnerCompany">회사명</option>
									<option value="carOwnerCorporateRegistrationNumber">사업자등록번호</option>
									<!-- <option value="carOwnerTelephone">전화번호</option>
									<option value="carOwnerEmail">이메일주소</option>
									<option value="carOwnerSettlementId">정산ID</option>
									<option value="carOwnerBank">거래은행</option>
									<option value="carOwnerAccount">계좌번호</option>
									<option value="carOwnerTotalCharge">총 정산금액</option> -->
								</select>
							</div>
							<div class="col-6">
								<input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-10">
				<div class="form-group row mb-3">
					<label for="range-datepicker" class="col-1 col-form-label">일자/기간</label>
					<div class="col-11">
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="pickerType" name="pickerType">
									<option value="complete">정산발생일</option>
									<option value="deposit">입금완료일</option>
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
								<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="settlementPicker">오늘</button>
								<button type="button" class="btn btn-white waves-effect datePicker dateRange 7day" data-target-input="settlementPicker">최근7일</button>
								<button type="button" class="btn btn-white waves-effect datePicker dateRange 1mon" data-target-input="settlementPicker">최근1개월</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-2 text-right">
				<button type="button" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
			</div>
		</div>
	</c:if>
	<c:if test="${'order' eq pageType}">
		<div class="row searchFormArea orderSearch">
			<div class="col-10">
				<div class="row">
					<div class="col-6">
						<div class="form-group row mb-3">
							<%-- TOOD 승인상태 --%>
							<label for="carOwnerSettlementStatus" class="col-2 col-form-label">승인상태</label>
							<div class="col-5">
								<select class="form-control" id="carOwnerSettlementStatus" name="carOwnerSettlementStatus">
									<option value="all">승인상태(전체)</option>
									<c:forEach var="settlementApprovalStatus" items="${settlementApprovalStatus}">
										<c:if test="${'settlementStandby' eq settlementApprovalStatus.codeId
											 or 'settlementCompleted' eq settlementApprovalStatus.codeId
											 or 'cancelCompleted' eq settlementApprovalStatus.codeId}">
											<option value="${settlementApprovalStatus.codeId}">${settlementApprovalStatus.codeName}</option>
										</c:if>
										<%-- <option value="${settlementApprovalStatus.codeId}">${settlementApprovalStatus.codeName}</option> --%>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="col-6"></div>
				</div>
			</div>
			<div class="col-10">
				<div class="row">
					<div class="col-6">
						<div class="form-group row mb-3">
							<label for="searchType" class="col-2 col-form-label">검색어</label>
							<div class="col-5">
								<select class="form-control" id="searchType" name="searchType">
									<%-- <c:forEach var="searchTypeTypeList" items="${searchTypeTypeList}">
										<option value="${searchTypeTypeList.key}">${searchTypeTypeList.value}</option>
									</c:forEach> --%>
									<option value="carOwnerName">회원명</option>
									<option value="carOwnerId">회원ID</option>
									<option value="carOwnerSettlementOrderNum">주문번호</option>
									<option value="carOwnerCompany">회사명</option>
									<option value="carOwnerCorporateRegistrationNumber">사업자등록번호</option>
									<!-- <option value="carOwnerTelephone">전화번호</option>
									<option value="carOwnerEmail">이메일주소</option>
									<option value="carOwnerSettlementId">정산ID</option>
									<option value="carOwnerBank">거래은행</option>
									<option value="carOwnerAccount">계좌번호</option>
									<option value="carOwnerTotalCharge">총 정산금액</option> -->
								</select>
							</div>
							<div class="col-5">
								<input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
							</div>
						</div>
					</div>
					<div class="col-6"></div>
				</div>
			</div>
			<div class="col-10">
				<div class="form-group row mb-3">
					<label for="range-datepicker" class="col-1 col-form-label">일자/기간</label>
					<div class="col-11">
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="pickerType" name="pickerType">
									<option value="complete">정산발생일</option>
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
								<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="settlementPicker">오늘</button>
								<button type="button" class="btn btn-white waves-effect datePicker dateRange 7day" data-target-input="settlementPicker">최근7일</button>
								<button type="button" class="btn btn-white waves-effect datePicker dateRange 1mon" data-target-input="settlementPicker">최근1개월</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-2 text-right">
				<button type="button" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
			</div>
		</div>
	</c:if>
</div>
<!-- End search -->

<!-- Begin result -->
<div class="card-box searchList">

</div>

<script>
	
	// console.log("== !orgPath ==");

	// 카테고리 탭 선택 
	$('.nav-tabs li.nav-item a').css('cursor', 'pointer');
	$('.nav-tabs li.nav-item a').on('click touch', function() {
		data.pageType = $(this).data('page-type');
		data.pageIndex = 1;
		loadListForm(getData());
	})
	
	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		data.pageIndex = 1;
		searchList();
	})
	
	// 기간검색 당일 
	$('button.datePicker.today').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 0);
		updateDateRangePicker(elName, valueList);
	})
	
	// 기간검색 7일 
	$('button.datePicker.7day').on('click touch', function() {
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
				data.settlementStartDate = _value[0];
				data.settlementEndDate = _value[1];
			} else if (_value.length === 1) {
				data.settlementStartDate = _value[0];
				data.settlementEndDate = _value[0];
			} else {
				data.settlementStartDate = new Date();
				data.settlementEndDate = new Date();
			}
			
			settlementPicker.setDate([data.settlementStartDate, data.settlementEndDate]);
		
			return;
		}
		
		// 화물등록일 
		/* if(_elName === 'settlementDeposit') {
			if(_value.length === 2) {
				data.settlementDepositStartDate = _value[0];
				data.settlementDepositEndDate = _value[1];
			} else if (_value.length === 1) {
				data.settlementDepositStartDate = _value[0];
				data.settlementDepositEndDate = _value[0];
			} else {
				data.settlementDepositStartDate = new Date();
				data.settlementDepositEndDate = new Date();
			}
			
			settlementDepositPicker.setDate([data.settlementDepositStartDate, data.settlementDepositEndDate]);
		
			return;
		} */
		
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
	}
	
	// picker Max/Min 값 update
	function updatePickerRange() {
		
		// 불필요 
		/* settlementDepositPicker.set('maxDate', data.settlementDepositEndDate);
		settlementDepositPicker.set('minDate', data.settlementDepositStartDate);
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
		
		// 정산발생일  
		/* settlementDepositPicker = flatpickr($('#settlementDeposit'), {
			mode : "range",
			defaultDate : [
				data.settlementDepositStartDate
				, data.settlementDepositEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.settlementDepositStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementDeposit').val().length === 10) {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.settlementDepositStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#settlementDeposit').val().length === 10) {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.settlementDepositEndDate = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			}
		}) */
		
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
		
		updatePickerRange();
	}

	
	$('#carOwnerSettlementStatus').on('change', function() {
		updateStatus();
	});
	
	function updateStatus() {
		if($('#carOwnerSettlementStatus').val() === 'settlementStandby') {
			$('#settlementPicker').prop('disabled', 'diabled');
		} else {
			$('#settlementPicker').prop('disabled', null);
		}
	}

	$(document).ready(function() {
		initServiceEvent();
		searchList();
	})

</script>
