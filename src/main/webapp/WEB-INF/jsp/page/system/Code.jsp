<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<div class="col-12 contents"></div>

	<div class="col-lg-6 left-side"></div>
	<div class="col-lg-6 right-side"></div>
</div>


<script>
	
	// default 값 설정
	let data = {
		codeUseYn : 'Y'
	}
	
	let flag = {
		searchFormLoaded : false
	}

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
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/code/search'/>",
			data : obj,
			cache : false,
			async : false,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				flag.searchFormLoaded = true;
				
				$('.contents').html(res);
				searchList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 코드그룹 
	function loadList(obj) {
		//console.log('=== loadList ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.searchFormLoaded) {
			loadListForm(obj);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/code/list'/>",
			data : obj,
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}

				$('.left-side').html(res);
				$('.right-side').empty();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// 코드상세
	function loadDetail(obj) {
		//console.log('=== loadDetail ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.searchFormLoaded) {
			loadListForm();
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/code/detail'/>",
			data : obj,
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}
				
				$('.right-side').html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}

	function initRoutie() {
		routie({
			'list' : function() {
// 				loadListForm();

				if(!flag.searchFormLoaded) {
					loadListForm();
				} else {
					loadList();
				}
			}, 
			'list/:_queryString' : function(_queryString) {
				var obj = deJsonString(_queryString);
// 				loadListForm(obj);

				if(!flag.searchFormLoaded) {
					loadListForm(obj);
				} else {
					loadList(obj);
				}
			},
			/*
			'detail/:codeGroupId' : function(codeGroupId) {
				loadDetail(codeGroupId);
			},
			*/
			'detail/:_queryString' : function(_queryString) {
				var obj = deJsonString(_queryString);
				
				loadDetail(obj);
			}
		})
	}
	
	$(document).ready(function() {
		initRoutie();
		
		if(location.hash === '') {
			routie('list');
		}
	})

</script>
