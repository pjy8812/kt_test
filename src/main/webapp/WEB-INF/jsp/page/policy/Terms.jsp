<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin page -->
<div class="row">
	<div class="col-12 contents">
	</div>
</div>
<!-- End page -->

<script>

	let data = {
		pageIndex : 1
		, pagePerRows : 10
	}
	
	var searchedData = {};
	
	let flag = {
		listFormLoaded : false	
		, dtailFormLoaded : false
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
		
		setPageMode();
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/terms/search'/>",
			data : {
			},
			cache : false,
			async : false,
			success : function(resultData, textStatus, XMLHttpRequest) {
				$('.contents').html(resultData);
				flag.listFormLoaded = true;
				flag.dtailFormLoaded = false;
				
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
		searchedData = {};
		searchedData = _object;
		
		// console.log(_object);
		
		// 목록 로드 
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/terms/list'/>",
			data : JSON.stringify(_object),
			/* data : {
				// data
				'pageIndex' : data.pageIndex
				, 'pagePerRows' : data.pagePerRows
			}, */
			cache : false,
			async : true,
			contentType : "application/json; charset=UTF-8",
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
	
	// 상세 페이지 
	function loadDetail(_seq, _mode) {
		
		if(_mode !== 'insert' && _mode !== 'update') {
			return false;
		} else {
			if(_mode === 'update' && _seq === null) {
				return false;
			} 
			setPageMode(_mode);
		}
		
		flag.listFormLoaded = false;
		
		if(_mode === 'insert') {
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/policy/terms/detail'/>", 
				data : {
					"mode" : _mode
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
		} else if(_mode === 'update') {
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/policy/terms/detail'/>", 
				data : {
					"termsSeq" : _seq
					, "mode" : _mode
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
	}
	
	function getData() {
		
		var object = {}; 
		object.pageIndex = data.pageIndex;
		object.pagePerRows = data.pagePerRows;
		
		if(data.pagePerRows === undefined) {
			object.pagePerRows = 10;
		} else {
			object.pagePerRows = data.pagePerRows;
		}
		
		// 정산상태
		if($('.searchCard [name="termsRequiredYn"]').val() !== 'all') {
			object.termsRequiredYn = $('[name="termsRequiredYn"]').val();
		} else {
			delete object.termsRequiredYn;
		}
		
		if($('.searchCard [name="termsServiceClassify"]').val() !== 'all') {
			object.termsServiceClassify = $('[name="termsServiceClassify"]').val();
		}

		// 검색어 
		if($('.searchCard [name="searchText"]').val() !== '') {
			object.searchType = $('.searchCard [name="searchType"]').val();
			object.searchText = $('.searchCard [name="searchText"]').val();
		} else {
			delete object.searchType;
			delete object.searchText;
		}
		
		return object;
	}
	
	function setData(_object) {

		if (_object == null) {
			return;
		}
		
		if (_object.termsRequiredYn !== undefined && _object.termsRequiredYn !== '') {
			$('.searchCard [name="termsRequiredYn"]').val(_object.termsRequiredYn);
		} else {
			$('.searchCard [name="termsRequiredYn"]').val('all');
		}
		
		if (_object.termsServiceClassify !== undefined && _object.termsServiceClassify !== '') {
			$('.searchCard [name="termsServiceClassify"]').val(_object.termsServiceClassify);
		} else {
			$('.searchCard [name="termsServiceClassify"]').val('all');
		}

		if (_object.searchType !== undefined && _object.searchType !== '') {
			$('.searchCard [name="searchType"]').val(_object.searchType);
		} else {
			$('.searchCard [name="searchType"] option:first').attr('selected', true);
		}
		
		if (_object.searchText !== undefined && _object.searchText !== '') {
			$('.searchCard [name="searchText"]').val(_object.searchText);
		} else {
			$('.searchCard [name="searchText"]').val('');
		}
		
		if (_object.pagePerRows !== undefined && _object.pagePerRows !== '') {
			$('.searchCard [name="pagePerRows"]').val(_object.pagePerRows);
		} else {
			$('.searchCard [name="pagePerRows"]').val(10);
		}
	}

	/* function initEvent() {
	
	} */
	
	function initRoutie() {
		routie({
			/* 'list' : function() {
				if(!flag.listFormLoaded) {
					loadListForm();
				} else {
					loadList();
				}
			}, */
			'list/:_queryString' : function(_queryString) {
				
				var object = deJsonString(_queryString);
				setData(object);
				
				if(!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
				
			},
			'detail/update/:_seq' : function(_seq) {

				/* if(isNaN(_pageIndex)) {
					data.detailPageIndex = 1;
				} else {
					data.detailPageIndex = _pageIndex;
				} */
				
				loadDetail(_seq, 'update');
			},
			'detail/insert' : function() {

				/* if(isNaN(_pageIndex)) {
					data.detailPageIndex = 1;
				} else {
					data.detailPageIndex = _pageIndex;
				} */
				
				loadDetail(null, 'insert');
			}
		})
	}
	
	// 페이지에 따라 페이지 헤더 표시 변경 
	function setPageMode(_mode) {
		if(_mode === 'insert') {
			$('h4.page-title').html('${pageTitleInsert}');
		} else if(_mode === 'update') {
			$('h4.page-title').html('${pageTitleUpdate}');
		} else {
			$('h4.page-title').html('${pageTitle}');
		}
	}
	
	$(document).ready(function() {
		
		// initEvent();
		initRoutie();
		
		if(location.hash === '') {
			routie('list/' + encodeURIComponent(JSON.stringify(getData())));
		}
	})

</script>
