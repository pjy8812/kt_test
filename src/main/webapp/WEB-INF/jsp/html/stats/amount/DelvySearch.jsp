<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>"></script>

<script src="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/index.js'/>"></script>
<link href="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/style.css'/>" rel="stylesheet" type="text/css" />

<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="yesterday" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>
<fmt:formatDate var="year" value="${yesterday}" pattern="yyyy"/>

<!-- Begin search -->
<div class="card-box">
    <h5 class="card-title">조회조건</h5>
    <div class="row">
        <div class="col-12">
            <div class="row">
                <div class="col-10">
                    <div class="form-group row mb-3">
                        <label for="statsType" class="col-1 col-form-label">통계 기준</label>
                        <div class="col-11">
                        	<div class="row">
                        		<div class="col-2">
									<select class="form-control" id="statsType" name="statsType">
										<option value="ton">톤급별</option>
										<option value="frg">제품별</option>
										<option value="tmp">온도별</option>
									</select>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <div class="form-group row">
                        <label for="" class="col-1 col-form-label">기간</label>
                        <div class="col-11">
                            <div class="form-group row">
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
			    	<button type="button" class="btn btn-custom04 btn-rounded waves-effect waves-dark" name="searchBtn">조회</button>
			    </div>
		    </div>
		</div>
	</div>
</div>
<!-- End search -->

<!-- Begin result -->
<div class="searchList">

</div>

<script>

	// var startDate = new Date('2022-01-01').setHours(0,0,0,0);
	
	// var yesterday = (new Date()).fp_incr(-1).setHours(0,0,0,0);
	// var startYesterday = new Date(new Date(yesterday).setMonth(new Date(yesterday).getMonth() -1)).addDays(1);
	
	var delvyData = {
		basisDate : 'day'
		// , startDate : new Date(startToday).getTime()
		// , endDate : new Date(today).getTime()
		, dateStartDate : new Date(startYesterday).getTime()
		, dateEndDate : new Date(yesterday).getTime()
		, monthStartDate : new Date(startYesterday).format('yyyyMM')
		, monthEndDate : new Date(yesterday).format('yyyyMM')
		, yearStartDate : new Date(startDate).format('yyyy')
		, yearEndDate : ''
		, dataType : 'count'
	}
	
	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		searchDelvyList(getDelvyData());
	});
	
	// 통계 기준 선택
	$('#statsType').on('change', function() {
		delvyData.statsType = $('#statsType').val(); 
	})
	// 기간 선택
	$('#basisDate').on('change', function() {
		toggleBasisType();
	})
	
	function toggleBasisType() {
		
		$('.basisType').addClass('d-none');
		
		delvyData.basisDate = $('#basisDate').val() === undefined ? 'day' : $('#basisDate').val(); 
		
		if(delvyData.basisDate === 'day') {
			
			$('.basisType.day').removeClass('d-none');
		
		} else if(delvyData.basisDate === 'month') {
			
			$('.basisType.month').removeClass('d-none');
		
		} else if(delvyData.basisDate === 'year') {
			
			$('.basisType.year').removeClass('d-none');
		}
	}
	
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
				delvyData.dateStartDate = _value[0];
				delvyData.dateEndDate = _value[1];
				
				datePicker.setDate([delvyData.dateStartDate, delvyData.dateEndDate]);
			} else if (_value.length === 1) {
				delvyData.dateStartDate = _value[0];
				delvyData.dateEndDate = _value[0];
			} else {
				delvyData.dateStartDate = new Date();
				delvyData.dateEndDate = new Date();
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
				delvyData.dateStartDate
				, delvyData.dateEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				delvyData.dateStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#datePicker').val().length === 10) {
					delvyData.dateEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					delvyData.dateEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				delvyData.dateStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#datePicker').val().length === 10) {
					delvyData.dateEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					delvyData.dateEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
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
				delvyData.monthStartDate
			],
            onReady : function(selectedDates, dateStr, instance) {
            	delvyData.monthStartDate = new Date(dateStr).format('yyyyMM');
            },
            onChange : function(selectedDates, dateStr, instance) {
            	
            	delvyData.monthStartDate = new Date(selectedDates[0]).format('yyyyMM');
            	
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
				delvyData.monthEndDate
			], 
            onReady : function(selectedDates, dateStr, instance) {
            	delvyData.monthEndDate = new Date(dateStr).format('yyyyMM');
            },
			onChange : function(selectedDates, dateStr, instance) {
	        	
				delvyData.monthEndDate = new Date(selectedDates[0]).format('yyyyMM');
				
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
	
	// 배송조건별 탭 조회
	function searchDelvyList() {
		
		if($('#basisDate').val() === 'month') {
			if($('#monthEndPicker').val() === '') {
				alert('종료월을 선택해주세요.');
				return false;
			} else if($('#monthStartPicker').val() > $('#monthEndPicker').val()) {
				alert('시작월이 종료월 보다 이후입니다.');
				return false;
			}
		}
		
		var queryString = encodeURIComponent(JSON.stringify(getDelvyData()));
		var currentUri = location.hash.replace('#delvy/', '');
		
		if (queryString == currentUri){
			loadDelvyList(deJsonString(queryString));
		} else {
			routie('delvy/' + queryString);
		}
	}
	
	/* function getDelvyData() {

		var object = {};
		
		if(delvyData.statsType !== undefined) {
			object.statsType = delvyData.statsType;
		} else if($('#statsType').val() !== undefined) {
			delvyData.statsType = $('#statsType').val();
			object.statsType = delvyData.statsType;
		} else {
			delvyData.statsType = $('.statsType option:first').val();
			object.statsType = delvyData.statsType;
		}
		
		if(delvyData.basisDate !== undefined) {
			object.basisDate = delvyData.basisDate;
		} else if($('#basisDate').val() !== undefined) {
			delvyData.basisDate = $('#basisDate').val();
			object.basisDate = delvyData.basisDate;
		} else {
			delvyData.basisDate = $('#basisDate option:first').val();
			object.basisDate = delvyData.basisDate;
		}

		if(delvyData.dataType !== undefined) {
			object.dataType = delvyData.dataType;
		} else if($('#basisDate').val() !== undefined) {
			delvyData.basisDate = $('#basisDate').val();
			object.basisDate = delvyData.basisDate;
		}
		
		object.dateStartDate = new Date(delvyData.dateStartDate).getTime();
		object.dateEndDate = new Date(delvyData.dateEndDate).getTime();
		
		object.monthStartDate = delvyData.monthStartDate;
		object.monthEndDate = delvyData.monthEndDate;
	
		object.yearStartDate = delvyData.yearStartDate;
		object.yearEndDate = '';
		
		return object;
	}
	
	function setDelvyData(_object) {
		
		if (_object == null) {
			return;
		}
		
		if (_object.statsType !== undefined && _object.statsType !== '' && _object.statsType !== null) {
			$('[name="statsType"]').val(_object.statsType);
		} else {
			$('[name="statsType"] option:first').attr('selected', true);
		}
		
		if (_object.basisDate !== undefined && _object.basisDate !== '' && _object.basisDate !== null) {
			$('[name="basisDate"]').val(_object.basisDate);
		} else {
			$('[name="basisDate"] option:first').attr('selected', true);
		}
		
		// if(_object.basisDate === 'day') {
			if (_object.dateStartDate !== undefined && _object.dateStartDate !== ''
				&& _object.dateEndDate !== undefined && _object.dateEndDate !== '') {
				
				delvyData.dateStartDate = _object.dateStartDate;
				delvyData.dateEndDate = _object.dateEndDate;
			}
		// } else if(_object.basisDate === 'month') {
			if (_object.monthStartDate !== undefined && _object.monthStartDate !== ''
				&& _object.monthEndDate !== undefined && _object.monthEndDate !== '') {
				
				delvyData.monthStartDate = _object.monthStartDate;
				delvyData.monthEndDate = _object.monthEndDate;
			}
		// } else if(_object.basisDate === 'year') {
			if (_object.yearStartDate !== undefined && _object.yearStartDate !== '') {
				
				delvyData.yearStartDate = _object.yearStartDate;
				delvyData.yearEndDate = '';
			}
		// }
	} */
	
	//조회
	$('button[name="searchBtn"]').on('click touch', function () {
		searchDelvyList();
	});
	
	$(document).ready(function() {
		initServiceEvent();
	});
</script>
