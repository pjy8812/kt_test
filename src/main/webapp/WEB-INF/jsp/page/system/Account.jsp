<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<div class="col-12 edit">
		<ul class="nav nav-tabs navtab-bg">
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="true" class="nav-link active" id="account">계정/권한 설정</a>
		    </li>
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="false" class="nav-link" id="authGroup">권한 그룹 설정</a>
		    </li>
		</ul>
		<div class="contents"></div>
	</div>
</div>
<div id="modal"></div>
<script>

	let data = {
		pageIndex : 1
		, adminRegisterStartDateTime : new Date(new Date('2022-01-01').setHours(0, 0, 0, 0))
		, adminRegisterEndDateTime : new Date(new Date().setHours(23, 59, 59, 0))
	}
	
	let flag = {
		listFormLoaded : false	
	}

	// 계정/권한 설정 탭
	$('#account').on('click', function(){
		delete data.adminAuthorityGroupSeq;
		routie('list');
	});	
	
	// 권한그룹 설정 탭
	$('#authGroup').on('click', function(){
		routie('mng/1');
	});
	
	//마스킹해제사유 등록
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave', function(){
		unmask();
	});
	
	//조회
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
		$('.nav-tabs').removeClass('d-none');
		$('#account').addClass('active');
		$('#account').parent().siblings('li').find('a').removeClass('active');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/search'/>",
			data : obj,
			cache : false,
			async : false,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}
	
				$('.contents').html(res);
				flag.listFormLoaded = true;
				
				if(obj) {
					loadList(obj);								
				} else {
					searchList();
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
	function loadList(obj) {
		//console.log('=== loadList ===');
		//console.log(obj);
		
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.listFormLoaded) {
			loadListForm();
		}

		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/list'/>",
			data : obj,
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
				}
				
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
	
	// 권한그룹 설정 탭
	function loadSetting(pageIndex) {
		$('.nav-tabs').removeClass('d-none');
		$('#authGroup').addClass('active');
		$('#authGroup').parent().siblings('li').find('a').removeClass('active');
		
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/group'/>",
			data : {
				"pageIndex" : pageIndex
			},
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}
				
				$(".contents").html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}

	//load 관리자 추가/수정 화면
	function loadUserEdit(_adminId, _mask) {
		$('.nav-tabs').addClass('d-none');
		
		flag.listFormLoaded = false;
		
		var param = {};
		param.adminId = _adminId;
		if(_mask) {
			param.maskingYn = _mask
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/edit'/>",
			data : param,
			cache : false,
			async : true,
			success : function(res, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
				}
				
				if (hasErrorMap(res, true)) {
					return;
				}
				
				$(".contents").html(res);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	function unmask(){
		var type = $('#popupUnmaskingReason').data('param_type');
		var reason =  $('#unmaskingReason').val();
		
		if(reason == '' || reason.trim() == ''){
			alert('마스킹 해제 사유를 입력해주세요');
			return;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/common/unmasking'/>",
			data : {
				"maskingHistoryType" : type
				, "maskingHistoryReason" : reason
			},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#popupUnmaskingReason').modal('hide');	
			},
			success : function(res, textStatus, XMLHttpRequest) {
				if (hasErrorMap(res, true)) {
					return;
				}
				
				//console.log(res);
		    	if(res.error != null) {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+res.error);
				} else if(res.resultCode == null) {
					alert('마스킹해제 중 오류가 발생하였습니다.');
				} else if(res.resultCode == '00000') {
	 				var id = $('#userEdit').data('admin_id');
					loadUserEdit(id, 'N');
				} else {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+res.resultMsg);
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
		
		var object = data;
		
		// 권한그룹
		if(object.adminAuthorityGroupSeq == null || object.adminAuthorityGroupSeq == "") {
			object.adminAuthorityGroupSeq = $('#searchAuthGroup').val();
		}
		
		// 생성일
		object.adminRegisterStartDateTime = new Date(new Date(data.adminRegisterStartDateTime).setHours(0, 0, 0, 0)).getTime();
		object.adminRegisterEndDateTime = new Date(new Date(data.adminRegisterEndDateTime).setHours(23, 59, 59, 0)).getTime();
		
		// 검색타입
		object.searchType = $('#searchType').val();
		
		// 검색어
		object.searchText = $('#keyword').val();
		
		return object;
	}
	
	function initRoutie() {
		routie({
			'list' : function() {
				if(!flag.listFormLoaded) {
					loadListForm();
				} else {
					loadList();
				}
			}, 
			'list/:_queryString' : function(_queryString) {
				var object = deJsonString(_queryString);
				
				if(!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
			},
			'edit' : function() {
				loadUserEdit();
			},
			'edit/:adminId' : function(adminId) {
				loadUserEdit(adminId);
			},
			'mng/:pageIndex' : function(pageIndex) {
				loadSetting(pageIndex);
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