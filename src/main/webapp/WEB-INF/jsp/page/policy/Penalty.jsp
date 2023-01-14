<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin page -->
<div class="row">
	<div class="col-12">
		<ul class="nav nav-tabs">
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="true" class="nav-link active" 
		        	data-page-type="freightOwnerPenalty">화주 위약수수료</a>
		    </li>
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="false" class="nav-link" 
		        	data-page-type="carOwnerPenalty">차주 패널티</a>
		    </li>
		</ul>
		<div class="contents"></div>
	</div>
</div>
<!-- End page -->

<script>

	let data = {
		pageType : $('.nav-tabs li.nav-item a:first').data('page-type') 
	}
	
	let flag = {
		// listFormLoaded : false	
		// , dtailFormLoaded : false
	}
	
	// 탭 선택 
	$('.nav-tabs li.nav-item a').css('cursor', 'pointer');
	$('.nav-tabs li.nav-item a').on('click touch', function() {
		data.pageType = $(this).data('page-type');
		// loadPage(data.pageType);
		searchPage(data.pageType);
	})
	
	// 상세내역 
	function loadPage(_pageType) {
		
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/penalty/detail'/>",
			data : {
				pageType : _pageType
			},
			cache : false,
			async : true,
			success : function(resultData, textStatus, XMLHttpRequest) {
				if (hasErrorMap(resultData, true)) {
					return;
				}
				
				$(".contents").html(resultData);
				
				flag.dtailFormLoaded = true;
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	//조회
	function searchPage(_pageType){
		var queryString = _pageType;
		var currentUri = location.hash.replace('#detail/','');
		if(queryString == currentUri){
			location.reload();
		} else {
			routie('detail/' + _pageType);
		}
	}
	
	/* function initEvent() {
	} */
	
	function initRoutie() {
		routie({
			'detail/:_type' : function(_type) {
				loadPage(_type);
			}
		})
	}
	
	$(document).ready(function() {
		
		// initEvent();
		initRoutie();
		
		if(location.hash === '') {
			routie('detail/' + data.pageType);
		}
	})

</script>
