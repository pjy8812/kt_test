<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>"></script>

<script src="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/index.js'/>"></script>
<link href="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/style.css'/>" rel="stylesheet" type="text/css" />
    
<!-- Begin page -->
<div class="row">
	<div class="col-12">
		<div class="contents"></div>
	</div>
</div>
<!-- End page -->

<script>

	const startDate = new Date('2022-01-01').setHours(0,0,0,0);

	const yesterday = (new Date()).fp_incr(-1).setHours(0,0,0,0);
	const startYesterday = new Date(new Date(yesterday).setMonth(new Date(yesterday).getMonth() -1)).addDays(1);
	
	let data = {
		basisDate : 'day'
		// , startDate : new Date(startToday).getTime()
		// , endDate : new Date(today).getTime()
		, dateStartDate : new Date(startYesterday).getTime()
		, dateEndDate : new Date(yesterday).getTime()
		, monthStartDate : new Date(startYesterday).format('yyyyMM')
		, monthEndDate : new Date(yesterday).format('yyyyMM')
		, yearStartDate : new Date(startDate).format('yyyy')
		, yearEndDate : ''
	}
	
	var searchedData = {};
	
	let flag = {
		listFormLoaded : false	
	}
	
	// 조회
	function searchList(){
		
		if($('#basisDate').val() === 'month') {
			if($('#monthEndPicker').val() === '') {
				alert('종료월을 선택해주세요.');
				return false;
			} else if($('#monthStartPicker').val() > $('#monthEndPicker').val()) {
				alert('시작월이 종료월 보다 이후입니다.');
				return false;
			}
		}
		
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#list/', '');

		if (queryString === currentUri){
			loadList(getData());
		} else {
			routie('list/' + queryString);
		}
	}
	
	// 검색 폼 
	function loadListForm(_object) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/user/search'/>",
			data : {
			},
			cache : false,
			async : false,
			success : function(resultData, textStatus, XMLHttpRequest) {
				$('.contents').html(resultData);
				flag.listFormLoaded = true;
				
				if(_object != null) {
					setData(_object);
				}
				
				loadList(_object);
				// searchList();
				
				if (hasErrorMap(resultData, true)) {
					return;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 목록 로드 
	function loadList(_object) {
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.listFormLoaded) {
			loadListForm(_object);
		}
		
		// log
		// console.log(_object);
		
		if(_object.basisDate === 'day') {
			
			if (_object.dateStartDate !== undefined && _object.dateStartDate !== ''
				&& _object.dateEndDate !== undefined && _object.dateEndDate !== '') {
				
				_object.startDate = new Date(_object.dateStartDate).format('yyyyMMdd');
				_object.endDate = new Date(_object.dateEndDate).format('yyyyMMdd');
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
		
		// 목록 로드
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/user/list'/>",
			// data : JSON.stringify(_object),
			data : _object,
			cache : false,
			async : true,
			// contentType : "application/json; charset=UTF-8",
			success : function(resultData, textStatus, XMLHttpRequest) {
				$('.searchList').empty();
				$('.searchList').html(resultData);
				
				if (hasErrorMap(resultData, true)) {
					return;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	function getData() {
		
		var object = {};
		
		if(data.basisDate !== undefined) {
			object.basisDate = data.basisDate;
		} else if($('#basisDate').val() !== undefined) {
			data.basisDate = $('#basisDate').val();
			object.basisDate = data.basisDate;
		} else {
			data.basisDate = $('#basisDate option:first').val();
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

	/* function initEvent() {
	} */

	function initRoutie() {
		routie({
			'list/:_queryString' : function(_queryString) {
				
				var object = deJsonString(_queryString);

				setData(object);
				
				if(!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
				
			}
		})
	}
	
	$(document).ready(function() {
		
		// initEvent();
		initRoutie();
		
		if(location.hash === '') {
			routie('list/' + encodeURIComponent(JSON.stringify(getData())));
		}
	})

</script>
