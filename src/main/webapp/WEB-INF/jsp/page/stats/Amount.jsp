<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>"></script>

<script src="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/index.js'/>"></script>
<link href="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/style.css'/>" rel="stylesheet" type="text/css" />

<div class="row">
    <div class="col-12">
        <ul class="nav nav-tabs navtab-bg">
            <li class="nav-item">
                <a href="" data-toggle="tab" aria-expanded="true" class="nav-link active" id="frgown">화주별</a>
            </li>
            <li class="nav-item">
                <a href="" data-toggle="tab" aria-expanded="false" class="nav-link" id="loc">구간별</a>
            </li>
            <li class="nav-item">
                <a href="" data-toggle="tab" aria-expanded="false" class="nav-link" id="car">차량별</a>
            </li>
            <li class="nav-item">
                <a href="" data-toggle="tab" aria-expanded="false" class="nav-link" id="delvy">배송조건별</a>
            </li>
        </ul>
        
   		<div class="contents"></div>
    </div>
</div>


<script>

	const startDate = new Date('2022-01-01').setHours(0,0,0,0);
	
	const yesterday = (new Date()).fp_incr(-1).setHours(0,0,0,0);
	const startYesterday = new Date(new Date(yesterday).setMonth(new Date(yesterday).getMonth()-1));
	
	let data = {
		basisDate : 'day'
		, dateStartDate : new Date(startYesterday).getTime()
		, dateEndDate : new Date(yesterday).getTime()
		, monthStartDate : new Date(startYesterday).format('yyyyMM')
		, monthEndDate : new Date(yesterday).format('yyyyMM')
		, yearStartDate : new Date(startDate).format('yyyy')
		, yearEndDate : ''
		, dataType : 'count'
	}
	
	var searchedData = {};
	
	var searchedDelvyData = {};
	var delvyData = {};
	
	let flag = {
		frgownFormLoaded : false	
		, locFormLoaded : false	
		, carFormLoaded : false	
		, delvyFormLoaded : false	
	}
	
	$(document).ready(function() {
		initRoutie();
		
		if(location.hash === '') {
			routie('frgown/' + encodeURIComponent(JSON.stringify(getData())));
		}
	});
	
	function initDefaultData() {
		data.dataType = 'count';
		data.basisDate = 'day';
		data.dateStartDate = new Date(startYesterday).getTime();
		data.dateEndDate = new Date(yesterday).getTime();
	}
	
	// 화주별
	$('#frgown').on('click', function(){
		initDefaultData();
		routie('frgown');
	});
	
	// 구간별
	$('#loc').on('click', function(){
		initDefaultData();
		routie('loc');
	});
	
	// 차량별
	$('#car').on('click', function(){
		initDefaultData();
		routie('car');
	});
	
	// 배송조건별
	$('#delvy').on('click', function(){
		data.dataType = 'count';
		routie('delvy');
	});
	
	function validateMonthPicker() {
		if($('.basisDate').val() === 'month') {
			if($('.month-datepicker.start').val() === '' || $('.month-datepicker.end').val() === '') {
				alert('종료월을 선택해주세요.');
				return false;
			} else if($('.month-datepicker.start').val() > $('.month-datepicker.end').val()) {
				alert('시작월이 종료월 보다 이후입니다.');
				return false;
			}
		}	
	}
	
	// 화주별 탭 조회
	function searchFrgownList() {
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#frgown/', '');
		
		if (queryString == currentUri){
			loadFrgownList(deJsonString(queryString));
		} else {
			routie('frgown/' + queryString);
		}
	}
	
	// 구간별 탭 조회
	function searchLocList() {
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#loc/', '');
		
		if (queryString == currentUri){
			loadLocList(deJsonString(queryString));
		} else {
			routie('loc/' + queryString);
		}
	}
	
	// 차량별 탭 조회
	function searchCarList() {
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#car/', '');
		
		if (queryString == currentUri){
			loadCarList(deJsonString(queryString));
		} else {
			routie('car/' + queryString);
		}
	}
	
	// 배송조건별 탭 조회
	function searchDelvyList() {
		var queryString = encodeURIComponent(JSON.stringify(getDelvyData()));
		var currentUri = location.hash.replace('#delvy/', '');
		
		if (queryString == currentUri){
			loadDelvyList(deJsonString(queryString));
		} else {
			routie('delvy/' + queryString);
		}
	}
	
	// 화주별 검색 폼 
	function loadFrgownSearch(obj) {
		$('#frgown').addClass('active');
		$('#frgown').parent().siblings('li').find('a').removeClass('active');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/frgown/search'/>",
			data : obj,
			cache : false,
			async : false,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.contents').html(res);
				flag.frgownFormLoaded = true;
				flag.locFormLoaded = false;	
				flag.carFormLoaded = false;	
				flag.delvyFormLoaded = false;	
				searchFrgownList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	function getDelvyData() {

		var object = {};
		
		if(delvyData.statsType !== undefined) {
			object.statsType = delvyData.statsType;
		} else if($('#statsType').val() !== undefined) {
			delvyData.statsType = $('#statsType').val();
			object.statsType = delvyData.statsType;
		} else {
			delvyData.statsType = $('#statsType option:first').val();
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
	}
	
	function getLoadListDate(_object) {
		if(_object.basisDate === 'day') {
			
			if (_object.dateStartDate !== undefined && _object.dateStartDate !== ''
				&& _object.dateEndDate !== undefined && _object.dateEndDate !== '') {
				
				_object.startDate = new Date(_object.dateStartDate).format('yyyy-MM-dd');
				_object.endDate = new Date(_object.dateEndDate).format('yyyy-MM-dd');
			}
			
		} else if(_object.basisDate === 'month') {
		
			if (_object.monthStartDate !== undefined && _object.monthStartDate !== ''
				&& _object.monthEndDate !== undefined && _object.monthEndDate !== '') {
				
				_object.startDate = new Date(_object.monthStartDate).format('yyyyMM')
				_object.endDate = new Date(_object.monthEndDate).format('yyyyMM')
			}
			
		} else if(_object.basisDate === 'year') {
		
			if (_object.yearStartDate !== undefined && _object.yearStartDate !== '') {
				
				_object.startDate = _object.yearStartDate;
				_object.endDate = '';
			}
		}
		
		delete _object.dateStartDate;
		delete _object.dateEndDate;
		delete _object.monthStartDate;
		delete _object.monthEndDate;
		delete _object.yearStartDate;
		delete _object.yearEndDate;
		
		searchedData = {};
		searchedData = _object;
	}
	
	// 화주별 목록
	function loadFrgownList(obj) {
		//console.log('=== loadFrgownList ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.frgownFormLoaded) {
			loadFrgownSearch(obj);
		}
		
		getLoadListDate(obj);
		//console.log(obj);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/frgown/list'/>",
			data : obj,
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.searchList').empty();
				$('.searchList').html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}

	// 구간별 검색 폼 
	function loadLocSearch(obj) {
		$('#loc').addClass('active');
		$('#loc').parent().siblings('li').find('a').removeClass('active');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/loc/search'/>",
			data : obj,
			cache : false,
			async : false,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.contents').html(res);
				flag.frgownFormLoaded = false;
				flag.locFormLoaded = true;	
				flag.carFormLoaded = false;	
				flag.delvyFormLoaded = false;	
				searchLocList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 구간별 목록
	function loadLocList(obj) {
		//console.log('=== loadLocList ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.locFormLoaded) {
			loadLocSearch(obj);
		}
		
		getLoadListDate(obj);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/loc/list'/>",
			data : obj,
			cache : false,
			async : true,
			traditional: true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.searchList').empty();
				$('.searchList').html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 차량별 검색 폼 
	function loadCarSearch(obj) {
		$('#car').addClass('active');
		$('#car').parent().siblings('li').find('a').removeClass('active');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/car/search'/>",
			data : obj,
			cache : false,
			async : false,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.contents').html(res);
				flag.frgownFormLoaded = false;
				flag.locFormLoaded = false;	
				flag.carFormLoaded = true;	
				flag.delvyFormLoaded = false;	
				searchCarList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 차량별 목록
	function loadCarList(obj) {
		//console.log('=== loadCarList ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.carFormLoaded) {
			loadCarSearch(obj);
		}
		
		getLoadListDate(obj);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/car/list'/>",
			data : obj,
			cache : false,
			async : true,
			traditional: true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.searchList').empty();
				$('.searchList').html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 배송조건별 검색 폼 
	function loadDelvySearch(obj) {
		$('#delvy').addClass('active');
		$('#delvy').parent().siblings('li').find('a').removeClass('active');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/delvy/search'/>",
			data : obj,
			cache : false,
			async : false,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.contents').html(res);
				flag.frgownFormLoaded = false;
				flag.locFormLoaded = false;	
				flag.carFormLoaded = false;	
				flag.delvyFormLoaded = true;	
				searchDelvyList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 배송조건별 목록
	function loadDelvyList(_object) {
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.delvyFormLoaded) {
			loadDelvySearch();
		}
		
		if(_object.basisDate === 'day') {
			
			if (_object.dateStartDate !== undefined && _object.dateStartDate !== ''
				&& _object.dateEndDate !== undefined && _object.dateEndDate !== '') {
				
				_object.startDate = new Date(_object.dateStartDate).format('yyyyMMdd');
				_object.endDate = new Date(_object.dateEndDate).format('yyyyMMdd');
			}
			
		} else if(_object.basisDate === 'month') {
		
			if (_object.monthStartDate !== undefined && _object.monthStartDate !== ''
				&& _object.monthEndDate !== undefined && _object.monthEndDate !== '') {
				
				_object.startDate = _object.monthStartDate;
				_object.endDate = _object.monthEndDate;
				
				// _object.startDate = new Date(_object.monthStartDate).format('yyyyMM')
				// _object.endDate = new Date(_object.monthEndDate).format('yyyyMM')
			}
			
		} else if(_object.basisDate === 'year') {
		
			if (_object.yearStartDate !== undefined && _object.yearStartDate !== '') {
				
				_object.startDate = _object.yearStartDate;
				_object.endDate = '';
			}
		}
		
		delete _object.dateStartDate;
		delete _object.dateEndDate;
		delete _object.monthStartDate;
		delete _object.monthEndDate;
		delete _object.yearStartDate;
		delete _object.yearEndDate;
		
		searchedDelvyData = {};
		searchedDelvyData = _object;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/delvy/list'/>",
			data : _object,
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.searchList').empty();
				$('.searchList').html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
		
		/* //console.log('=== loadDelvyList ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.delvyFormLoaded) {
			loadDelvySearch();
		}
		
		searchedDelvyData = {};
		searchedDelvyData = obj;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/amount/delvy/list'/>",
			data : obj,
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.searchList').empty();
				$('.searchList').html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		}); */
	}

	function getData() {
		
		var object = data;
		
		var tab = $('.nav-link.active').attr('id');
		//console.log(tab);
		
		if(tab == 'frgown') {
			//화주별
			object.freightOwnerType = $('#freightOwnerType').val(); //유형(사업자유형)
			object.businessType = $('#businessType').val(); // 구분(사업자구분)
			
		} else if(tab == 'loc') {
			//구간별
			var location = [];
			
			$('.row.location').each(function(idx){
				if($(this).is(':visible')) {
					var load = $(this).find('.form-control.location.loading').val();
					var unload = $(this).find('.form-control.location.unloading').val();
					location.push({loadedAt: load, unloadedAt: unload});
				}
			});
			//console.log(location);
			object.JSONdata = JSON.stringify(location);
			
		} else if(tab == 'car') {
			//차량별
			var carList = [];
			
			$('.row.car').each(function(idx){
				if($(this).is(':visible')) {
					var type = $(this).find('.form-control.car.type').val();
					var model = $(this).find('.form-control.car.model').val();
					if(type == 'damas' || type == 'labo') {
						model = 'all';
					}
					carList.push({carType: type, carModel: model});
				}
			});
			//console.log(carList);
			object.JSONdata = JSON.stringify(carList);
			
		} else if(tab == 'delvy') {
			//배송조건별
			object.statsType = $('#statsType').val();
		}

		/*
		// 기간기준(년/월/일)
		var basisDate = $('.basisDate').val();
		object.basisDate = basisDate;
		
		// 기간
		if(basisDate == 'day') {
			object.startDate = new Date(data.startDate).format('yyyy-MM-dd');
			object.endDate = new Date(data.endDate).format('yyyy-MM-dd');
		} else if(basisDate == 'month') {
			object.startDate = $('.month-datepicker.start').val().replace('.','');
			object.endDate = $('.month-datepicker.end').val().replace('.','');
		} else if(basisDate == 'year') {
			object.startDate = $('.yearData').val();
			object.endDate = $('.yearData').val();
		}
		*/
		
		if(data.basisDate !== undefined) {
			object.basisDate = data.basisDate;
		} else if($('.basisDate').val() !== undefined) {
			data.basisDate = $('.basisDate').val();
			object.basisDate = data.basisDate;
		} else {
			data.basisDate = '2022';
			object.basisDate = data.basisDate;
		}
		
		object.dateStartDate = new Date(data.dateStartDate).getTime();
		object.dateEndDate = new Date(data.dateEndDate).getTime();
		
		object.monthStartDate = data.monthStartDate;
		object.monthEndDate = data.monthEndDate;
	
		object.yearStartDate = data.yearStartDate;
		object.yearEndDate = '';
		
		return object;
	}
	
	function setData(_object) {
		
		if (_object == null) {
			return;
		}
		
		if (_object.basisDate !== undefined && _object.basisDate !== '' && _object.basisDate !== null) {
			$('[name="basisDate"]').val(_object.basisDate);
		} else {
			$('[name="basisDate"] option:first').attr('selected', true);
		}
		
		// if(_object.basisDate === 'day') {
			if (_object.dateStartDate !== undefined && _object.dateStartDate !== ''
				&& _object.dateEndDate !== undefined && _object.dateEndDate !== '') {
				
				data.dateStartDate = _object.dateStartDate;
				data.dateEndDate = _object.dateEndDate;
			}
		// } else if(_object.basisDate === 'month') {
			if (_object.monthStartDate !== undefined && _object.monthStartDate !== ''
				&& _object.monthEndDate !== undefined && _object.monthEndDate !== '') {
				
				data.monthStartDate = _object.monthStartDate;
				data.monthEndDate = _object.monthEndDate;
			}
		// } else if(_object.basisDate === 'year') {
			if (_object.yearStartDate !== undefined && _object.yearStartDate !== '') {
				
				data.yearStartDate = _object.yearStartDate;
				data.yearEndDate = '';
			}
		// }
	}
	
	function toggleBasisType() {
		$('.basisType').addClass('d-none');
		
		data.basisDate = $('.basisDate').val() === undefined ? 'day' : $('.basisDate').val(); 
		
		if(data.basisDate === 'day') {
			$('.basisType.day').removeClass('d-none');
		} else if(data.basisDate === 'month') {
			$('.basisType.month').removeClass('d-none');
		} else if(data.basisDate === 'year') {
			$('.basisType.year').removeClass('d-none');
		}
	}
	
	var datePicker;
	var monthStartPicker;
	var monthEndPicker;
	
	function addDaysDate(_date, _days) {
		return new Date(_date).addDays(_days)
	}
	
	function initPicker() {
		//일 기준
		datePicker = flatpickr($('.range-datepicker'), {
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
				if($('.range-datepicker').val().length === 10) {
					data.dateEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					data.dateEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.dateStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('.range-datepicker').val().length === 10) {
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
		});
		
		var starMonth = new Date(startDate).getTime(0,0,0,0);
        var endMonth = new Date(new Date(new Date(yesterday)).setDate(1)).setHours(0,0,0,0);
		
		monthStartPicker = flatpickr($('.month-datepicker.start'), {
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
		
		monthEndPicker = flatpickr($('.month-datepicker.end'), {
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
		
		/*
		//월 기준
		var startMonth = (data.startDate).format('yyyy.MM');
		var endMonth = (data.endDate).format('yyyy.MM');
		
		$('.month-datepicker').datepicker({
		    startDate: '2022.01', //minDate
		    endDate: '-1d' //maxDate
		}).on('hide', function(e) {
			//월 선택없이 닫을 경우 어제월 입력
			if($(this).val() == '') {
				$(this).val(endMonth);
			}
		});

        $(".month-datepicker.start").datepicker('setDate', startMonth);
        $(".month-datepicker.end").datepicker('setDate', endMonth);
        
        //로딩시 빈값일 경우 어제월 입력
        if($('.month-datepicker.end').val() == '') {
        	$('.month-datepicker.end').val(endMonth);
        }
        */
	}
	
	function initRoutie() {
		routie({
			'frgown' : function() {
				if(!flag.frgownFormLoaded) {
					loadFrgownSearch();
				} else {
					loadFrgownList();
				}
			}, 
			'frgown/:_queryString' : function(_queryString) {
				var object = deJsonString(_queryString);
				
				setData(object);
				
				if(!flag.frgownFormLoaded) {
					loadFrgownSearch(object);
				} else {
					loadFrgownList(object);
				}
			},
			'loc' : function() {
				if(!flag.locFormLoaded) {
					loadLocSearch();
				} else {
					loadLocList();
				}
			}, 
			'loc/:_queryString' : function(_queryString) {
				var object = deJsonString(_queryString);
				
				setData(object);
				
				if(!flag.locFormLoaded) {
					loadLocSearch(object);
				} else {
					loadLocList(object);
				}
			},
			'car' : function() {
				if(!flag.carFormLoaded) {
					loadCarSearch();
				} else {
					loadCarList();
				}
			}, 
			'car/:_queryString' : function(_queryString) {
				var object = deJsonString(_queryString);
				
				setData(object);
				
				if(!flag.carFormLoaded) {
					loadCarSearch(object);
				} else {
					loadCarList(object);
				}
			},
			'delvy' : function() {
				if(!flag.delvyFormLoaded) {
					loadDelvySearch();
				} else {
					loadDelvyList();
				}
			}, 
			'delvy/:_queryString' : function(_queryString) {
				var object = deJsonString(_queryString);
				
				setDelvyData(object);
				
				if(!flag.delvyFormLoaded) {
					loadDelvySearch(object);
				} else {
					loadDelvyList(object);
				}
			}
		});
	}
	
</script>
