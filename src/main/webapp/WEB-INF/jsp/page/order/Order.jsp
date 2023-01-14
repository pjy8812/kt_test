<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Begin page -->
<div class="row">
	<div class="col-12">
		<ul class="nav nav-tabs navtab-bg">
		    <li class="nav-item">
		        <a href="#div-tab01" data-toggle="tab" aria-expanded="true" class="nav-link active" id="tab01">기본 정보</a>
		    </li>
		    <li class="nav-item">
		        <a href="#div-tab02" data-toggle="tab" aria-expanded="false" class="nav-link" id="tab02">배차지연 요금조정</a>
		    </li>
		    <li class="nav-item">
		        <a href="#div-tab03" data-toggle="tab" aria-expanded="false" class="nav-link" id="tab03">배송 정보</a>
		    </li>
		    <li class="nav-item">
		        <a href="#div-tab04" data-toggle="tab" aria-expanded="false" class="nav-link" id="tab04">이력 정보</a>
		    </li>
		</ul>
		<div class="contents"></div>
	</div>
</div>
<!-- End page -->


<script>
	
	let addTwoDays = new Date().addDays(2);
	
	let data = {
		pageStart : 0
		, freightRegistStartDatetime : new Date(new Date().setHours(0, 0, 0, 0))
		, freightRegistEndDatetime : new Date(new Date().setHours(23, 59, 59, 0))
		, loadingStartDateTime : new Date(new Date().setHours(0, 0, 0, 0))
		, loadingEndDateTime : new Date(addTwoDays.setHours(23, 59, 59, 0))
		, unloadingStartDateTime : new Date(new Date().setHours(0, 0, 0, 0))
		, unloadingEndDateTime : new Date(addTwoDays.setHours(23, 59, 59, 0))
		, maskingYn : 'Y'
	}
	
	var dashboardFlag = false;
	
	let flag = {
		listFormLoaded : false	
	}
	
	// 주문배송
	let mode = "/order";
	
	// 조회
	function searchList() {
		
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#list/', '');
		
		if (queryString == currentUri){
			loadList(deJsonString(queryString));
		} else {
			routie('list/' + queryString);
		}
	}
	
	// 검색 폼 
	function loadListForm(obj) {
		$('.nav-tabs').addClass('d-none');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/search'/>" + mode,
			data : obj,
			cache : false,
			async : false,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.contents').html(res);
				flag.listFormLoaded = true;
				searchList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)){
					return;
				}
			}
		});
	}
	
	// 목록
	function loadList(obj) {
		//console.log('=== loadList ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.listFormLoaded) {
			loadListForm();
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/list'/>" + mode,
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
	
	// 상세
	function loadDetail(orderId) {
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/detail'/>" + mode,
			data : {
				"orderId" : orderId,
				"maskingYn" : data.maskingYn,
				"tab" : data.tab
			},
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}
				
				$('.nav-tabs').removeClass('d-none');
				$('#tab01').addClass('active');
				$('#tab01').parent().siblings('li').find('a').removeClass('active');
				
				$(".contents").html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}

	function getData() {
		
		var object = data;
		
		// 주문상태1 
		object.orderType1 = $('[name="orderType1"]').val();
		
		// 주문상태2 
		object.orderType2 = $('[name="orderType2"]').val();
		
		// 배차지연
		object.dispatchDelay = $('[name="dispatchDelay"]').val();
		
		// 계약구분 
		object.freightOwnerType = $('[name="freightOwnerType"]').val();
		
		// 화물구분 
		object.freightType = $('[name="freightType"]').val();
		
		// 비상배차여부
		object.emergencyYn = $('[name="emergencyYn"]').val();
		
		// 화물등록일
		<c:choose>
			<c:when test="${'local' eq profiles or 'dev' eq profiles}">
				if(dashboardFlag) {
					// 기준시작일 - 시간 
					object.freightRegistStartDatetime = new Date(new Date(data.freightRegistStartDatetime).setHours(0, 0, 0, 0)).getTime();
				} else {
					object.freightRegistStartDatetime = new Date(new Date(data.freightRegistStartDatetime).setHours(0, 0, 0, 0)).getTime();
				}
			</c:when>
			<c:otherwise>
				object.freightRegistStartDatetime = new Date(new Date(data.freightRegistStartDatetime).setHours(0, 0, 0, 0)).getTime();
			</c:otherwise>
		</c:choose>

		// object.freightRegistStartDatetime = new Date(new Date(data.freightRegistStartDatetime).setHours(0, 0, 0, 0)).getTime();
		object.freightRegistEndDatetime = new Date(new Date(data.freightRegistEndDatetime).setHours(23, 59, 59, 0)).getTime();

		// 상차일시
		if(!$('.loading').hasClass('d-none')) {
			var loadingApm = $('.loading').find('input:checkbox[name="loadingApm"]:checked').val();
			
			if($('input:checkbox[name=loadingApm]:checked').length == $('input:checkbox[name=loadingApm]').length) {
				// 오눌 00:00:00~23:59:59
				object.loadingStartDateTime = new Date(new Date(data.loadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
				object.loadingEndDateTime = new Date(new Date(data.loadingStartDateTime).setHours(23, 59, 59, 0)).getTime();
			} else if(loadingApm == 'AM') {
				// 오눌 00:00:00~11:59:59
				object.loadingStartDateTime = new Date(new Date(data.loadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
				object.loadingEndDateTime = new Date(new Date(data.loadingStartDateTime).setHours(11, 59, 59, 0)).getTime();
			} else if(loadingApm == 'PM') {
				// 오늘 12:00:00~23:59:59
				object.loadingStartDateTime = new Date(new Date(data.loadingStartDateTime).setHours(12, 0, 0, 0)).getTime();
				object.loadingEndDateTime = new Date(new Date(data.loadingStartDateTime).setHours(23, 59, 59, 0)).getTime();
			}
		} else {
			// 선택일자 00:00:00~23:59:59
			<c:choose>
				<c:when test="${'local' eq profiles or 'dev' eq profiles}">
					if(dashboardFlag) {
						// 기준시작일 - 시간 
						object.loadingStartDateTime = new Date(new Date(data.loadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
					} else {
						object.loadingStartDateTime = new Date(new Date(data.loadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
					}
				</c:when>
				<c:otherwise>
					object.loadingStartDateTime = new Date(new Date(data.loadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
				</c:otherwise>
			</c:choose>
			// object.loadingStartDateTime = new Date(new Date(data.loadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
			object.loadingEndDateTime = new Date(new Date(data.loadingEndDateTime).setHours(23, 59, 59, 0)).getTime();
		}
		
		// 하차일시
		if(!$('.unloading').hasClass('d-none')) {
			var unloadingApm = $('.unloading').find('input:checkbox[name="unloadingApm"]:checked').val();
			
			if($('input:checkbox[name=unloadingApm]:checked').length == $('input:checkbox[name=unloadingApm]').length) {
				// 오늘 00:00:00~23:59:59
				object.unloadingStartDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
				object.unloadingEndDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(23, 59, 59, 0)).getTime();
			} else if(unloadingApm == 'AM') {
				// 오늘 00:00:00~11:59:59
				object.unloadingStartDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
				object.unloadingEndDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(11, 59, 59, 0)).getTime();
			} else if(unloadingApm == 'PM') {
				// 오늘 12:00:00~23:59:59
				object.unloadingStartDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(12, 0, 0, 0)).getTime();
				object.unloadingEndDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(23, 59, 59, 0)).getTime();
			}
		} else {
			// 선택일자 00:00:00~23:59:59
			<c:choose>
				<c:when test="${'local' eq profiles or 'dev' eq profiles}">
					if(dashboardFlag) {
						// 기준시작일 - 시간 
						object.unloadingStartDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
					} else {
						object.unloadingStartDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
					}
				</c:when>
				<c:otherwise>
					object.unloadingStartDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
				</c:otherwise>
			</c:choose>
			// object.unloadingStartDateTime = new Date(new Date(data.unloadingStartDateTime).setHours(0, 0, 0, 0)).getTime();
			object.unloadingEndDateTime = new Date(new Date(data.unloadingEndDateTime).setHours(23, 59, 59, 0)).getTime();
		}
		
		// 검색타입
		object.searchType = $('#orderSearchType').val();
		
		// 검색어
		object.searchText = $('#orderSearchKeyword').val();
		
		// 조회개수
		object.pageCnt = $('#countList').val();
		
		// 정렬
		//object.sortBy = $('#sortBy').val();
		
		return object;
	}

	function initRoutie() {
		// 수동배차
		if("${mode}" == 'manual') {
			mode = "/manual";
		}else{
			mode = "/order"
		}
		
		routie({
			'list' : function() {
// 				loadListForm();
				if(!flag.listFormLoaded) {
					loadListForm();
				} else {
					loadList();
				}
			}, 
			'list/:_queryString' : function(_queryString) {
// 				var object = deJsonString(_queryString);
// 				loadListForm(object);
				var object = deJsonString(_queryString);
				
				if(object.dashboardFlag !== undefined) {
					dashboardFlag = true;
				}
				
				//console.log(dashboardFlag)
				
				if(!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
			},
			'detail/:orderId' : function(orderId) {
				loadDetail(orderId);
			}
		})
	}
	
	$(document).ready(function() {
		initRoutie();
		
		if(location.hash === '') {
			routie('list');
		}
	});

</script>
