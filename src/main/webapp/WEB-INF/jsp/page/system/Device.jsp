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

	let today = new Date().setHours(0,0,0,0);
	let startToday = new Date('2022-01-01').setHours(0,0,0,0);
	
	let data = {
		pageIndex : 1
		, joinStartDate : new Date(startToday)
		, joinEndDate : new Date(today) 
		, lastUseStartDate : new Date(startToday)
		, lastUseEndDate : new Date(today)
		, carOwnerTerminalOs : 'all'
	}
	
	var searchedData = {};
	
	let flag = {
		listFormLoaded : false	
	}
	
	//조회
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
			url : "<c:url value='/ui/service/system/device/search'/>",
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
				// searchList();
				loadList(_object);
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
		if(_object.lastUseStartDate !== undefined && _object.lastUseStartDate !== '' 
				&& _object.lastUseEndDate !== undefined && _object.lastUseEndDate !== '') {
			_object.lastUseStartDate = new Date(_object.lastUseStartDate).getTime();
			_object.lastUseEndDate = new Date(_object.lastUseEndDate).addDays(1).getTime() -1;
		}
		
		if(_object.joinStartDate !== undefined && _object.joinStartDate !== '' 
				&& _object.joinEndDate !== undefined && _object.joinEndDate !== '') {
			_object.joinStartDate = new Date(_object.joinStartDate).getTime();
			_object.joinEndDate = new Date(_object.joinEndDate).addDays(1).getTime() -1;
		} 
		
		searchedData = {};
		searchedData = _object;

		// 목록 로드 
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/device/list'/>",
			data : JSON.stringify(_object),
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
	
	function getData() {
		
		var object = {}; 
		object.pageIndex = data.pageIndex;
		object.lastUseStartDate = data.lastUseStartDate;
		object.lastUseEndDate = data.lastUseEndDate;
		object.joinStartDate = data.joinStartDate;
		object.joinEndDate = data.joinEndDate;
		
		// 이용자 ID
		if($('[name="carOwnerId"]').val() !== '') {
			object.carOwnerId = $('[name="carOwnerId"]').val(); 
		}
		
		// 디바이스
		if($('[name="carOwnerTerminalDevice"]').val() !== '') {
			object.carOwnerTerminalDevice = $('[name="carOwnerTerminalDevice"]').val(); 
		}
		
		// 이용자명
		if($('[name="carOwnerName"]').val() !== '') {
			object.carOwnerName = $('[name="carOwnerName"]').val(); 
		}
		
		var osCheckListSite = $('[name="carOwnerTerminalOs"]:checked').length;
		if (osCheckListSite === 0) {
			object.carOwnerTerminalOs = 'TEMP_TYPE_STRING'; // 검색결과 없음  
		} else if (osCheckListSite === 1) {
			object.carOwnerTerminalOs = $('[name="carOwnerTerminalOs"]:checked').val();
		} else if (osCheckListSite === 2) {
			object.carOwnerTerminalOs = 'all';
		}
		return object;
	}
	
	function setCheckBox(_object) {
		if (_object.carOwnerTerminalOs !== undefined) {
			// 전체선택 
			if(_object.carOwnerTerminalOs !== '') {
				
				if(_object.carOwnerTerminalOs === 'all') {
					$('[name="carOwnerTerminalOs"]').each(function(){ 
						$(this).prop('checked', true);
					})
				} else {
					$('[name="carOwnerTerminalOs"][value="' + _object.carOwnerTerminalOs + '"]').prop('checked', true);
				}
			} else {
				$('[name="carOwnerTerminalOs"]').each(function(){ 
					$(this).prop('checked', false);
				})
			}
		} else {
			// 선택안함 
			$('[name="carOwnerTerminalOs"]').each(function(){ 
				$(this).prop('checked', false);
			})
		}
	}
	
	function setData(_object) {

		if (_object == null) {
			return;
		}

		if (_object.carOwnerId !== undefined && _object.carOwnerId !== '') {
			$('[name="carOwnerId"]').val(_object.carOwnerId);
		}

		if (_object.carOwnerTerminalDevice !== undefined && _object.carOwnerTerminalDevice !== '') {
			$('[name="carOwnerTerminalDevice"]').val(_object.carOwnerTerminalDevice);
		}

		if (_object.carOwnerName !== undefined && _object.carOwnerName !== '') {
			$('[name="carOwnerName"]').val(_object.carOwnerName);
		}
		
		// 체크해제 
		$('[name="carOwnerTerminalOs"]').each(function(){ 
			$(this).prop('checked', false);
		})
		
		setCheckBox(_object);
		
		/* if (_object.carOwnerTerminalOs !== undefined) {
			// 전체선택 
			if(_object.carOwnerTerminalOs !== '') {
				
				if(_object.carOwnerTerminalOs === 'all') {
					$('[name="carOwnerTerminalOs"]').each(function(){ 
						$(this).prop('checked', true);
					})
				} else {
					$('[name="carOwnerTerminalOs"][value="' + _object.carOwnerTerminalOs + '"]').prop('checked', true);
				}
			} else {
				$('[name="carOwnerTerminalOs"]').each(function(){ 
					$(this).prop('checked', false);
				})
			}
		} else {
			// 선택안함 
			$('[name="carOwnerTerminalOs"]').each(function(){ 
				$(this).prop('checked', false);
			})
		} */

		if (_object.joinStartDate !== undefined && _object.joinStartDate !== ''
				&& _object.joinEndDate !== undefined && _object.joinEndDate !== '') {
			data.joinStartDate = _object.joinStartDate;
			data.joinEndDate = _object.joinEndDate;
			
			// joinPicker.setDate([data.joinStartDate, data.joinEndDate]);
		} 
		
		if (_object.lastUseStartDate !== undefined && _object.lastUseStartDate !== ''
				&& _object.lastUseEndDate !== undefined && _object.lastUseEndDate !== '') {
			data.lastUseStartDate = _object.lastUseStartDate;
			data.lastUseEndDate = _object.lastUseEndDate;
			
			// lastUsePicker.setDate([data.lastUseStartDate, data.lastUseEndDate]);
		}
	}
	

	function initEvent() {
		setCheckBox(data);
	}
	
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
				
				if(!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
			},
		})
	}
	
	$(document).ready(function() {
		
		initEvent();
		initRoutie();
		
		if(location.hash === '') {
			// routie('list');
			routie('list/' + encodeURIComponent(JSON.stringify(getData())));
		}
	})

</script>
