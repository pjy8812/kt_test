<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<div class="col-12 edit">
		<ul class="nav nav-tabs navtab-bg">
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="true" class="nav-link active" id="tabSms" data-tab_type="sms">SMS</a>
		    </li>
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="false" class="nav-link" id="tabEmail" data-tab_type="email">이메일</a>
		    </li>
		</ul>
		<div class="contents"></div>
	</div>
</div>
<div id="modal">
</div>
<script>
	//default 값 설정
	let data = {
		nowPage : 1
		, startDate : new Date(new Date().addMonths(-1).setHours(0, 0, 0, 0))
		, endDate : new Date(new Date().setHours(23, 59, 59, 0))
	}
	
	let flag = {
		smsListFormLoaded : false	
		, emailListFormLoaded : false
	}
	
	$(document).ready(function() {
		initRoutie();
		
		if(location.hash === '') {
			routie('sms');
		}
		
		//SMS탭 클릭 시
		$('#tabSms').on('click', function(){
			routie('sms');
		});	
		
		//이메일탭 클릭 시
		$('#tabEmail').on('click', function(){
			routie('email');
		});
		
		//회원명 클릭 시
		$('.contents').on('click', '.title-link.user', function() {
			var userId = $(this).parents('tr').data('to_id');
			var sendTargetName = $(this).parents('tr').data('send_target_name');
			var userType = '';
			//console.log(userId, sendTargetName);
			
			if(sendTargetName === '차주'){
				userType = 'carown'
			}else if(sendTargetName === '화주'){
				userType = 'frgown';
			}else{
				return;
			}
			
			ShowUserDetailPopup(userType, userId);
		});
	
		//발송내용 클릭 시 
		$('.contents').on('click', '.title-link.title', function() {
			var seq = $(this).parents('tr').data('send_seq');
			loadSendDetailPopup(seq);
		});
		
		//재발송버튼 클릭 시
		$('.contents').on('click', '.btnResend', function() {
			var seq = $(this).parents('tr').data('send_seq');
			
			if(!confirm('다시 발송하시겠습니까?')){
				return;
			}
			
			resend(seq);
		});
		
		//회원상세정보버튼 클릭 시 
		$('#modal').on('click', '#btnMoveOwnerPage', function() {
			var id = $(this).parents('#popup').data('owner_id');
			var userType = $(this).parents('#popup').data('user_type');
			//console.log(id, userType);
			var url;
			if(userType === 'carown'){
				url = '<c:url value="/ui/page/owner/carown#detail/"/>'+id	//차주관리 상세화면
			}else if(userType === 'frgown'){
				url = '<c:url value="/ui/page/owner/frgown#detail/"/>'+id	//화주관리 상세화면 
			}else{
				return;
			}
			
			location.href = url;
			
		});
		
		//닫기버튼 클릭시
		$('#modal').on('click', '.btn_modal_dismiss', function(){
			$('#popup').modal('hide');
			$('.modal-backdrop').remove();
		});
		
	});
	
	window.onpageshow = function (event){
		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)){
			//console.log('뒤로가기 버튼 클릭시');
			$('#modal').empty();
		}

	}
	
	function initRoutie() {
		routie({
			'sms' : function() {
				if(!flag.smsListFormLoaded) {
					loadSmsSearch();
				} else {
					loadSmsList();
				}
			}, 
			'sms/:_queryString' : function(_queryString) {
				if(!flag.smsListFormLoaded) {
					loadSmsSearch(_queryString);
				} else {
					loadSmsList(_queryString);
				}
			},
			'email' : function() {
				if(!flag.emailListFormLoaded) {
					loadEmailSearch();
				} else {
					loadEmailList();
				}
			}, 
			'email/:_queryString' : function(_queryString) {
				if(!flag.emailListFormLoaded) {
					loadEmailSearch(_queryString);
				} else {
					loadEmailList(_queryString);
				}
			}
		})
	}
	
	

	//SMS목록 조회
	function searchSmsList() {
		
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#sms/', '');
		
		if (queryString == currentUri){
			loadSmsList(queryString);
		} else {
			routie('sms/' + queryString);
		}
	}
	
	//이메일 조회
	function searchEmailList() {
		
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#email/', '');
		
		if (queryString == currentUri){
			loadEmailList(queryString);
		} else {
			routie('email/' + queryString);
		}
	}
	
	//SMS 검색 폼 
	function loadSmsSearch(_queryString) {
	
		var formData;
		if(_queryString){
			formData = deJsonString(_queryString);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/sms/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#modal').empty(); //모달팝업 초기화
				flag.smsListFormLoaded = true;
				flag.emailListFormLoaded = false;
				$('.contents').html(result);
				
				loadSmsList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert('SMS 발송목록 조회중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		});
	}
	
	// SMS 목록 로드 
	function loadSmsList(_queryString) {
		var formData = {};
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.smsListFormLoaded) {
			loadSmsSearch();
			return;
		}
		
		if(_queryString){
			formData = deJsonString(_queryString);
		}else{
			formData = getData();
		}
		//console.log(formData);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/sms/list'/>",
			data : formData,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('.searchList').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show')
				}
				
				if(hasErrorMap(result, true)){
					return;
				}
						
				$('.searchList').html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert('SMS 발송목록 조회중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		});
	}
	
	//이메일 검색 폼 
	function loadEmailSearch(_queryString) {
		$('.nav-tabs').removeClass('d-none');
		$('#tabEmail').addClass('active');
		$('#tabEmail').parent().siblings('li').find('a').removeClass('active');
		
		var formData;
		if(_queryString){
			formData = deJsonString(_queryString);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/email/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#modal').empty(); //모달팝업 초기화
				flag.smsListFormLoaded = false;
				flag.emailListFormLoaded = true;
				$('.contents').html(result);
				
				loadEmailList()
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert('이메일 발송목록 조회중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		});
	}
	
	// 이메일 목록 로드 
	function loadEmailList(_queryString) {
		var formData = {};
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.emailListFormLoaded) {
			loadEmailSearch();
			return;
		}
		
		if(_queryString){
			formData = deJsonString(_queryString);
		}else{
			formData = getData();
		}
		//console.log(formData);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/email/list'/>",
			data : formData,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('.searchList').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show')
				}
				
				if(hasErrorMap(result, true)){
					return;
				}
						
				$('.searchList').html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert('이메일 발송목록 조회중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		});
	}
	
	function getData() {
		var type = $('.nav-tabs .active').data('tab_type');
		var object = {}; 
		object.nowPage = data.nowPage;
			
		//발송구분
		if($('.search-box #sendCategory').val() !== 'all') {
			object.sendCategory = $('.search-box #sendCategory').val();
		}
		
		//발송항목 
		if($('.search-box #templateName').val() !== 'all') {
			object.templateName = $('.search-box #templateName').val();
		}
		
		if(type === 'sms'){//SMS일 경우 발송유형 추가
			//발송유형 
			if($('.search-box #sendType').val() !== 'all') {
				object.sendType = $('.search-box #sendType').val();
			}
		}
		
		//발송대상
		if($('.search-box #sendTarget').val() !== 'all') {
			object.sendTarget = $('.search-box #sendTarget').val();
		}
		
		//발송상태
		if($('.search-box #sendStatus').val() !== 'all') {
			object.sendStatus = $('.search-box #sendStatus').val();
		}
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.searchType = $('#searchType').val();
			object.searchText =searchText;
		}
		
		//발송일자
		object.startDate = new Date(data.startDate).getTime();
		object.endDate = new Date(data.endDate).getTime();
		
		return object;
	}	
	//회원정보
	function ShowUserDetailPopup(_userType, _id, _mask){

		if(_mask ==  undefined){
			_mask = 'Y'
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/popup/user'/>",
			data : {ownerId: _id, ownerClassification: _userType, maskingYn: _mask},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#modal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
					
				$('#modal').html(result);
				$('#popup').modal('show');
			
		
				loadUserDetailPopup(_userType, _id, _mask)
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				alert('회원정보 조회중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		}); 
	}
	function loadUserDetailPopup(_userType, _id, _mask){
		if(_mask ==  undefined){
			_mask = 'Y'
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/popup/user.select'/>",
			data : {ownerId: _id, ownerClassification: _userType, maskingYn: _mask},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#modalInfo').html('');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#modalInfo').html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				alert('회원정보 조회중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		}); 
	}
	
	
	//발송내용
	function loadSendDetailPopup(_id){
		var type = $('.nav-tabs .active').data('tab_type');
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/popup/"+type+".select'/>",
			data : {sendSeq: _id},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('.modal-backdrop').remove();
				$('#modal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#modal').html(result);
				$('#popup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				alert('발송내용 조회중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		}); 
	}	
	
	//재발송
	function resend(_seq){
		var type = $('.nav li a.active').data('tab_type')
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/"+type+"/resend'/>",
			data : {sendSeq: _seq},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(data);
				if(result.resultCode == '00000'){
					alert('재발송 되었습니다');
					location.reload();
				}else{
					alert('재발송 중 오류가 발생하였습니다\r\n ERROR: '+data.resultCode+', '+data.resultMsg);
				}
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('재발송 중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		}); 
	}	
	
	//단체발송 팝업
	function showSmsPopup(){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/popup/sms/edit'/>",
			data : {},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#modal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				$('#modal').html(result);
				$('#popup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				alert('단체발송화면 호출중 오류가 발생하였습니다\r\n status: '+xhr.status);
			}
		}); 
	}
	
	//단체 sms발송
	function sendSMS(){
		var isOk = true;
		var formData = {};
		
		//제목
		var title = $('#modal #title').val();
		if(title == '' || title.trim() == ''){
			$('#modal #title').addClass('parsley-error');
			isOk = false;
		}else{
			$('#modal #title').removeClass('parsley-error');
			formData.sendTitle = title;
		}
		
		//수신그룹
		var ownerClassification = $('#modal [name="ownerClassification"]:checked').val();
		if(ownerClassification == '' || ownerClassification == undefined){
			$('#modal [name="ownerClassification"]').addClass('parsley-error');
			isOk = false;
		}else{
			$('#modal [name="ownerClassification"]').removeClass('parsley-error');
			formData.ownerClassification = ownerClassification;
		}
		
		//내용
		var sendMsg = $('#modal #sendMsg').val();
		if(sendMsg == '' || sendMsg.trim() == ''){
			$('#modal #sendMsg').addClass('parsley-error');
			isOk = false;
		}else{
			$('#modal #sendMsg').removeClass('parsley-error');
			formData.sendMsg = sendMsg;
		}
		
		if(!isOk){
			alert('필수항목을 확인해주세요');
			return;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/send/sms/send'/>",
			data : formData,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#modal #popup').modal('hide');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(result.resultCode == '00000'){
					alert('단체문자 발송 하였습니다.')
					searchSmsList();
				}else{
					alert('단체문자 발송 중 오류가 발생하였습니다\r\n ERROR: '+data.resultCode+", "+data.resultMsg);
					$('#modal #popup').modal('show');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
				alert('단체문자 발송 중 오류가 발생하였습니다\r\n status: '+xhr.status);
				$('#modal #popup').modal('show');
			}
		}); 
	}

	function showMakingPopup(_params){
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
		    data : _params,
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)){
					return;
				}
			
				$('#modal').html(data);
				$('#popupUnmaskingReason').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)){
					return;
				}
		    }
		}); 
	}

	//마스킹해제사유 등록
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
		unmask();
	});
	
	function unmask(){
		var type = $('#popupUnmaskingReason').data('param_type');
		var userId = $('#popupUnmaskingReason').data('type');
		var reason =  $('#unmaskingReason').val();
		
		//마스킹해제사유가 빈값일 경우 저장안되도록
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
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
		    	if(result.error != null) {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.error[0].field+' '+result.error[0].reason);
				} else if(result.resultCode == null) {
					alert('마스킹해제 중 오류가 발생하였습니다.');
				} else if(result.resultCode == '00000') {
					$('body').removeClass('modal-open');

					var userType = 'carown';
					if(type == 'frgownInfo'){
						userType = 'frgown';
					}else{
						userType = 'carown';
					}
					
					$('.modal-content').modal('hide');
					$('.modal-backdrop').remove();
		
					ShowUserDetailPopup(userType, userId,'N');
					
				
				} else {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('마스킹해제 중 오류가 발생하였습니다.');
			}
		});
	}
	
</script>