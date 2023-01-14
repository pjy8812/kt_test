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

	// const startDate = new Date('2022-01-01').setHours(0,0,0,0);

	// const yesterday = (new Date()).fp_incr(-1).setHours(0,0,0,0);
	// const startYesterday = new Date(new Date(yesterday).setMonth(new Date(yesterday).getMonth() -1));

	let data = {
	}
	
	var searchedData = {};
	
	let flag = {
		listFormLoaded : false	
	}
	
	// 조회
	function searchList(){
		
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
			url : "<c:url value='/ui/service/stats/car/search'/>",
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
		
		searchedData = {};
		searchedData = _object;
		
		// 목록 로드
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/stats/car/list'/>",
			data : _object,
			cache : false,
			async : true,
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
		return object;
	}
	
	function setData(_object) {
		
		if (_object == null) {
			return;
		}
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
