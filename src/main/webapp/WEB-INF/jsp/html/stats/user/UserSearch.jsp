<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>

<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="yesterday" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>
<fmt:formatDate var="year" value="${yesterday}" pattern="yyyy"/>
    
<!-- Begin search -->
<div class="card-box">
	<h5 class="card-title">조회조건</h5>
	<div class="row searchFormArea">
		<div class="col-10">
			<div class="row">
				<div class="col">
					<label for="freightOwnerType" class="col-form-label">기준</label>
				</div>
				<div class="col-11">
					<div class="form-group row mb-3">
						<!-- <label for="freightOwnerType" class="col-2 col-form-label">기준</label> -->
						<div class="col-2">
							<select class="form-control" id="basisDate" name="basisDate">
								<option value="day">일 기준</option>
								<option value="month">월 기준</option>
								<option value="year">연 기준</option>
							</select>
						</div>
						<div class="col-2 basisType day d-none">
							<div class="picker-wrap">
								<input type="text" id="datePicker" name="datePicker" class="form-control"
									placeholder="기간선택"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-4 basisType day d-none">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 7day" data-target-input="datePicker">최근7일</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 1mon" data-target-input="datePicker">최근1개월</button>
						</div>
						<div class="col-2 basisType month d-none">
							<div class="picker-wrap">
								<input type="text" id="monthStartPicker" name="monthStartPicker" class="form-control"
									placeholder="시작월"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-auto text-center basisType month">
						    <p class="period-ico">~</p>
						</div>
						<div class="col-2 basisType month d-none">
							<div class="picker-wrap">
								<input type="text" id="monthEndPicker" name="monthEndPicker" class="form-control"
									placeholder="종료월"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-2 basisType year d-none">
							<select class="form-control" id="yearPicker" name="yearPicker">
								<c:forEach var="i" begin="2022" end="${year}" step="1">
									<option value="${year-i+2022}">${year-i+2022}년</option>
								</c:forEach>
							</select>
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
<div class="searchList">

</div>

<script>
	
	// 기간 선택
	$('#basisDate').on('change', function() {
		toggleBasisType();
	})
	
	function toggleBasisType() {
		$('.basisType').addClass('d-none');
		
		data.basisDate = $('#basisDate').val() === undefined ? 'day' : $('#basisDate').val(); 
		
		if(data.basisDate === 'day') {
			
			$('.basisType.day').removeClass('d-none');
		
		} else if(data.basisDate === 'month') {
			
			$('.basisType.month').removeClass('d-none');
		
		} else if(data.basisDate === 'year') {
			
			$('.basisType.year').removeClass('d-none');
		}
	}
	
	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		searchList();
	})
	
	// 기간검색 7일 
	$('button.datePicker.7day').on('click touch', function() {
		var elName = $(this).data('target-input');
		var valueList = getDateRange(elName, 0, 7);
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
		
		var from = new Date(yesterday);
		var to = new Date(yesterday);
		
		var fromMonth = new Date(from.setMonth(from.getMonth() - _month));
		var fromDay = new Date(fromMonth.setDate(fromMonth.getDate() - _day));
		
		return [fromDay, to]; 
	}

	// 날짜정보 업데이트 
	function updateDateRangePicker(_elName, _value) {
		
		if(_elName === 'datePicker') {
			
			if(_value.length === 2) {
				data.dateStartDate = _value[0];
				data.dateEndDate = _value[1];
				
				datePicker.setDate([data.dateStartDate, data.dateEndDate]);
			} else if (_value.length === 1) {
				data.dateStartDate = _value[0];
				data.dateEndDate = _value[0];
			} else {
				data.dateStartDate = new Date();
				data.dateEndDate = new Date();
			}
			
			return;
		}
		
	}
	
	var datePicker;
	var monthStartPicker;
	var monthEndPicker;
	
	function addDaysDate(_date, _days) {
		return new Date(_date).addDays(_days)
	}
	
	function initServiceEvent() {
		
		datePicker = flatpickr($('#datePicker'), {
			mode : "range",
			locale: {
				rangeSeparator: ' - '
            },
            dateFormat: "Y.m.d",
			defaultDate : [
				data.dateStartDate
				, data.dateEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.dateStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#datePicker').val().length === 10) {
					data.dateEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.dateEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.dateStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#datePicker').val().length === 10) {
					data.dateEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.dateEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
				
				if (selectedDates.length === 1) {
					var rangeStartDate = addDaysDate(selectedDates[0], -90);
					var rangeEndDate = addDaysDate(selectedDates[0], 90);
					
					if(rangeStartDate < startDate) {
						datePicker.set('minDate', startDate);
					} else {
						datePicker.set('minDate', rangeStartDate);
					}
					
					if(rangeEndDate > yesterday) {
						datePicker.set('maxDate', yesterday);
					} else {
						datePicker.set('maxDate', rangeEndDate);
					}
				}
			}
			, onOpen: function(selectedDates, dateStr, instance){
				datePicker.set('minDate', startDate);
				datePicker.set('maxDate', yesterday);
			}
		})
		
		var starMonth = new Date(startDate).getTime(0,0,0,0);
        var endMonth = new Date(new Date(new Date(yesterday)).setDate(1)).setHours(0,0,0,0);
		
		monthStartPicker = flatpickr($('#monthStartPicker'), {
            plugins: [
           		new monthSelectPlugin({
           			shorthand: true,
           			dateFormat: "Y.m",
           			altFormat: "Y.m", 
           			theme: "light"
           		})
            ],
            defaultDate : [
				data.monthStartDate
			],
            onReady : function(selectedDates, dateStr, instance) {
            	data.monthStartDate = dateStr;
            },
            onChange : function(selectedDates, dateStr, instance) {
            	
            	data.monthStartDate = selectedDates[0];
            	
            	var rangeStartDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(0);
            	var rangeEndDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(2);
            	
            	if(rangeStartDate < starMonth) {
            		monthEndPicker.set('minDate', starMonth);
            	} else {
            		monthEndPicker.set('minDate', rangeStartDate);
            	}
            	
            	if(rangeEndDate > endMonth) {
            		monthEndPicker.set('maxDate', endMonth);
            	} else {
            		monthEndPicker.set('maxDate', rangeEndDate);
            	}
			}
            , onOpen: function(selectedDates, dateStr, instance){
            	monthStartPicker.set('minDate', startDate);
        		monthStartPicker.set('maxDate', yesterday);
            }
		})
		
		monthEndPicker = flatpickr($('#monthEndPicker'), {
            plugins: [
           		new monthSelectPlugin({
           			shorthand: true,
           			dateFormat: "Y.m",
           			altFormat: "Y.m", 
           			theme: "light"
           		})
            ],
            defaultDate : [
				data.monthEndDate
			], 
            onReady : function(selectedDates, dateStr, instance) {
            	data.monthEndDate = dateStr;
            },
			onChange : function(selectedDates, dateStr, instance) {
	        	
				data.monthEndDate = selectedDates[0];
				
	        	var rangeStartDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(-2);
            	var rangeEndDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(0);
            	
            	if(rangeStartDate < starMonth) {
            		monthStartPicker.set('minDate', starMonth);
            	} else {
            		monthStartPicker.set('minDate', rangeStartDate);
            	}
            	
            	if(rangeEndDate > endMonth) {
            		monthStartPicker.set('maxDate', endMonth);
            	} else {
            		monthStartPicker.set('maxDate', rangeEndDate);
            	}
			}
            , onOpen: function(selectedDates, dateStr, instance){
            	// 시작월 먼저 선택하도록 
            	// monthEndPicker.set('minDate', startDate);
            	// monthEndPicker.set('maxDate', yesterday);
            }
		})
		
		monthStartPicker.set('minDate', startDate);
		monthStartPicker.set('maxDate', yesterday);
		
		monthEndPicker.set('minDate', startDate);
		monthEndPicker.set('maxDate', yesterday);
		
		toggleBasisType();
	}
	
	$(document).ready(function() {
		initServiceEvent();
		searchList();
	})

</script>
