<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>


<!-- Begin page -->
<div class="row">
	<div class="col-12 edit">
		<ul class="nav nav-tabs navtab-bg">
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="true" class="nav-link active" id="tabVoc" data-tab_type="voc">1:1문의</a>
		    </li>
		    <li class="nav-item">
		        <a href="" data-toggle="tab" aria-expanded="false" class="nav-link" id="tabLocation" data-tab_type="location">위치정보관리대장</a>
		    </li>
		</ul>
		<div class="contents"></div>
	</div>
</div>
<div id="modal"></div>
<!-- End page -->
<script>
	let data = {
		nowPage : 1
		, startDate : new Date(new Date().addMonths(-1).setHours(0, 0, 0, 0))
		, endDate : new Date(new Date().setHours(23, 59, 59, 0))
	}
	
	let locationData = {
		nowPage : 1
		, startDate : new Date(new Date('2022-01-01').setHours(0, 0, 0, 0))
		, endDate : new Date(new Date().setHours(23, 59, 59, 0))
	}
	
	let flag = {
		listFormLoaded : false
		, locationListFormLoaded : false
	}
	
	var searchedData = {};
		
	$(document).ready(function() {
		initRoutie();
	
		if(location.hash === '') {
			routie('list');
		}
		
		//1:1문의탭 클릭 시
		$('#tabVoc').on('click', function(){
			routie('list');
		});	
		
		//위치정보관리대장 클릭 시
		$('#tabLocation').on('click', function(){
			routie('location/list');
		});
		
		//요청자ID 입력
		$('#modal').on('keyup', '#popup #carOwnerId', function(event){ 
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    	var inputVal = $(this).val();
		    	$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		   	}
	  	});
	  	
	  	//취소
	  	$('#modal').on('click touch', '#btnCancel', function(){
			if(!confirm('요청자 추가를 취소하시겠습니까?')){
				return;
			}
			
			$('#popup').modal('hide');
		});
		
		$('#modal').on('click touch', '#btnSaveRequester', function(){
			saveRequester();
		});
	});
	
	//routie setting
	function initRoutie() {
		routie({
			'list' : function() {
				if(!flag.listFormLoaded) {
					loadSearch();
				} else {
					loadList();
				}
			}, 
			'list/:_queryString' : function(_queryString) {
				
				if(!flag.listFormLoaded) {
					loadSearch(_queryString);
				} else {
					loadList(_queryString);
				}
			},
			'edit' : function() {
				loadEdit();
			},
			'edit/:id' : function(id) {
				loadEdit(id);
			},
			'detail/:id' : function(id) {
				loadDetail(id);
			},
			'location/list' : function() {
				if(!flag.locationListFormLoaded) {
					loadLocationSearch();
				} else {
					loadLocationList();
				}
			}, 
			'location/list/:_queryString' : function(_queryString) {
				
				if(!flag.locationListFormLoaded) {
					loadLocationSearch(_queryString);
				} else {
					loadLocationList(_queryString);
				}
			},
		})
	}
	
	//load 1:1문의 검색 폼 
	function loadSearch(_queryString) {
		var formData;
		if(_queryString){
			formData = deJsonString(_queryString);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('.contents').html(result);
				flag.listFormLoaded = true;
				flag.locationListFormLoaded = false;
				
				loadList();
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});
	}
	
	//1:1문의 조회
	function searchList(){
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#list/','');
		if(queryString == currentUri){
			//console.log('load')
			loadList(queryString)
		}else{
			//console.log('routie')
			routie('list/' + queryString);
		}
	}
	
	function loadList(_queryString) {
		var formData = {};
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.listFormLoaded) {
			loadLocationSearch();
		}
		
		if(_queryString){
			formData = deJsonString(_queryString);
		}else{
			formData = getData();
		}
		//console.log(formData);
		searchedData = formData;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/list'/>",
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
			}
		});
	}
	
	//목록조회 검색조건	
	function getData() {
		var object = {};
		object.nowPage = data.nowPage;
		
		//등록일 
		object.vocExposedStartDate = new Date(data.startDate).getTime();
		object.vocExposedEndDate = new Date(data.endDate).getTime();
		
		//회원
		var vocRecipientLength = $('.search-box [name="vocRecipient"]:checked').length;
		if($('.search-box [name="vocRecipient"]:checked').length > 0) {
			if(vocRecipientLength == 2){
				object.vocOwnerClassification = 'all';
			}else{
				object.vocOwnerClassification = $('.search-box [name="vocRecipient"]:checked').val();
			}
		}
		
		//상태
		var vocStatusLength = $('.search-box [name="vocStatus"]:checked').length;
		if(vocStatusLength > 0) {
			if(vocStatusLength == 2){
				object.vocStatus = 'all';
			}else{
				object.vocStatus = $('.search-box [name="vocStatus"]:checked').val();
			}
		}
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.searchType = $('#searchType').val();
			object.searchText =searchText;
		}

		return object;
	}	
	
	//load 상세화면
	function loadDetail(_seq) {
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/select'/>",
			data : {
				"vocSeq" : _seq
			},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$(".contents").empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show')
				}				
				
				if(hasErrorMap(result, true)){
					return;
				}
				
				$(".contents").html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert("1:1문의 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: "+xhr.responseJSON.message);
			}
		});
	}
	
	//load 등록/수정화면
	function loadEdit(_seq) {
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/edit'/>",
			data : {
				"vocSeq" : _seq
			},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$(".contents").empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show')
				}				
				
				if(hasErrorMap(result, true)){ 
					return;
				}
				
				$(".contents").html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});
	}
	
	//load 주문번호찾기 팝업 
	function loadOrderSearchPopup(){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/order/popup'/>",
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
				
				//주문번호찾기 목록 조회
				loadOrderSearchPopupList(0, 1);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}	
	
	//load 주문번호찾기 팝업 목록
	function loadOrderSearchPopupList(_start, _page){
		
		var searchText = $('#orderSearchKeyword').val(); // 검색어
		var searchType = $('#orderSearchType').val(); // 검색타입
		if(!_start){
			_start = 0;
		}
		
		if(!_page){
			_page = 1;
		}
		
		var params = {};	
		params.pageCnt = 10;
		params.pageStart = _start;	
		params.pageIndex = _page;	
		params.searchType = searchType;
		params.searchText = searchText	
		params.manualDispatch = 'N'	
		params.freightRegistStartDatetime = new Date(new Date('2022-01-01').setHours(0, 0, 0, 0)).getTime()
		params.freightRegistEndDatetime = new Date(new Date().setHours(23, 59, 59, 0)).getTime()
		params.loadingStartDateTime = new Date(new Date('2022-01-01').setHours(0, 0, 0, 0)).getTime()
		params.loadingEndDateTime = new Date(new Date().setHours(23, 59, 59, 0)).getTime()
		params.unloadingStartDateTime = new Date(new Date('2022-01-01').setHours(0, 0, 0, 0)).getTime()
		params.unloadingEndDateTime = new Date(new Date().setHours(23, 59, 59, 0)).getTime()
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/order/list'/>",
			data : params,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#popupList').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				$('#popupList').html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}	
	
	//삭제
	function deleteQna(_seq){
		var formData = {};
		formData.vocSeq = _seq; //1:1문의ID
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/delete'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(data);
				searchList();
			
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("게시글 삭제 중 오류가 발생하였습니다.\r\nERROR: "+xhr.responseJSON.message);
			}
		}); 
	}
	
	//답변게시 
	function saveAnswer(){
		var seq = $('#detail').data('voc_seq');
		var answer = $('[name="answer"]').val();
		
		//답변내용이 없을 경우 return
		if(answer == '' || answer.trim() == ''){
			alert('답변을 입력해주세요');
			return;
		}
		
		var formData = {};
		formData.vocSeq = seq; //1:1문의 ID
		formData.vocAnswer = $('[name="answer"]').val();
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/insert/answer'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(data);
				if(result.resultCode == '00000'){
					alert('답변게시가 완료되었습니다.');
					location.reload();
				}else{
					alert('답변게시 중 오류가 발생하였습니다.\r\nERROR: '+data.resultCode+", "+data.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('답변게시 중 오류가 발생하였습니다.')
			}
		}); 
	}

	//저장
	function save(){
		var isOk = true;
		var formData = new FormData();
		
		//주문번호
		var orderNumber =  $('.edit-box').data('voc_order_num');
		if(orderNumber !== '(매칭 주문 없음)'){
			formData.append('vocOrderNum', orderNumber);
			var id = $('.edit-box').data('voc_order_id');
			formData.append('vocOrderId', id); //KTDS 주문배송 상세 변경으로 인한 추가 by.2022.03.29
		}
		
		//제목
		var title = $('[name="vocTitle"]').val();
		if(title === '' || title.trim() === ''){
			$('[name="title"]').addClass('parsley-error');
			isOk = false;
		}else{
			$('[name="title"]').removeClass('parsley-error');
			formData.append('vocTitle', title);			
		}
		
		//대상
		var vocRecipient = $('[name="vocRecipient"]:checked').val(); 
		if(vocRecipient === '' || vocRecipient === undefined){
			isOk = false;
		}else{
			formData.append('vocOwnerClassification', vocRecipient);
		}
		
		//내용		
		//var contents = editor.root.innerHTML
		//contents = contents.replace('<p><br></p>', '');
		var contents  = $('[name="vocContent"]').val();
		if(contents === '' || contents.trim() === ''){
			//$('#editor').addClass('parsley-error');
			$('[name="vocContent"]').addClass('parsley-error');
			isOk = false;
		}else{
			//$('#editor').removeClass('parsley-error');
			$('[name="vocContent"]').removeClass('parsley-error');
			formData.append('vocContent', contents);		
		}
		
		//첨부파일 
		$.each($('input[type=file]')[0].files, function(i, value){
		    formData.append('attachedFiles', value); 
		});
		
		var temp = $('.base_file').length;
		if(temp> 0){
			for(var i=0; i< temp; i++){
				var blob = base64ImageToBlob($('.base_file').eq(i).html());
				var fileName = $('.base_file').eq(i).data('file_name');
				//console.log(blob)
				formData.append('attachedFiles', blob, fileName); 
			}
		}
		
		//1:1문의 SEQ
		var seq = $('.edit-box').data('voc_seq');
		if(seq != ''){
			formData.append('vocSeq', seq);	
		}
		
		if(!isOk){ //필수값이 입력되지 않을 경우 return
			alert('필수값을 입력하세요');
			return;
		}
		//console.log(formData);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/save'/>",
			data : formData,
			dataType : "text",
			cache : false,
			async : true,
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(data);
				var tempResult = JSON.parse(result);
				if(tempResult.resultCode == '00000'){
					alert('1:1문의가 저장되었습니다.');
					searchList();
				}else{
					alert('1:1문의 저장 중 오류가 발생하였습니다.')
				}
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('1:1문의 저장 중 오류가 발생하였습니다.')
			}
		}); 
	
	}
	
	
	function movePageOrder(_orderNum){
		location.href = '<c:url value="/ui/page/order/mng#detail/"/>'+_orderNum;
	}
	
	function movePageUser(_ownerType, _ownerId){
		_ownerType = _ownerType.trim();
		if(_ownerType === '화주'){ //화주회원일 경우
			location.href = '<c:url value="/ui/page/owner/frgown#detail/"/>'+_ownerId;
		}else if(_ownerType === '차주'){	//차주회원일 경우
			location.href = '<c:url value="/ui/page/owner/carown#detail/"/>'+_ownerId;
		}else{
			return;
		}
	}
	
	//load 위치정보관리대장 검색 폼 
	function loadLocationSearch(_queryString) {
		$('.nav-tabs').removeClass('d-none');
		$('#tabLocation').addClass('active');
		$('#tabLocation').parent().siblings('li').find('a').removeClass('active');
		
		var formData;
		if(_queryString){
			formData = deJsonString(_queryString);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/location/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('.contents').html(result);
				flag.listFormLoaded = false;
				flag.locationListFormLoaded = true;
				loadLocationList();
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});
	}
	
	
	//위치정보관리대장 조회
	function searchLocationList(){
		var queryString = encodeURIComponent(JSON.stringify(getLocationData()));
		var currentUri = location.hash.replace('#location/list/','');
		if(queryString == currentUri){
			//console.log('load')
			loadLocationList(queryString)
		}else{
			//console.log('routie')
			routie('location/list/' + queryString);
		}
	}
		
	//load 위치정보관리대장 목록조회 
	function loadLocationList(_queryString) {
		var formData = {};
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.locationListFormLoaded) {
			loadSearch();
		}
		
		if(_queryString){
			formData = deJsonString(_queryString);
		}else{
			formData = getLocationData();
		}
		//console.log(formData);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/location/list'/>",
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
			}
		});
	}
	
	function getLocationData() {
		var object = {};
		object.nowPage = locationData.nowPage;
		
		//등록일 
		object.createStratDate = new Date(locationData.startDate).getTime();
		object.createEndDate = new Date(locationData.endDate).getTime();
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.carOwnerId =searchText;
		}

		return object;
	}	
	
	function showRequesterPopup(){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/location/edit'/>",
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
			}
		}); 
	}
	
	function saveRequester(){
		var formData = new FormData();
		
		var id = $('#popup #carOwnerId').val();
		if(id == '' || id.trim() == ''){
			alert('모든 필수값을 입력해주세요.');
			return;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/voc/location/save'/>",
			data : {carOwnerId : id},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(data);
				if(result.resultCode == '00000'){
					alert('저장되었습니다');
					$('#popup').modal('hide');
					searchLocationList();
				}else if(result.resultCode == '00009'){
					alert('입력하신 ID로 차주를 찾을 수 없습니다');
				}else{
					var error= '';
					if(!$.isEmptyObject(result.resultMsg)){
						error = '\r\nERROR: '+result.resultMsg
					}
					alert('요청자 추가 중 저장 중 오류가 발생하였습니다{0}'.format(error));
				}
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('요청자 추가 중 저장 중 오류가 발생하였습니다.')
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
	
	function unmask(){
		var type = $('#popupUnmaskingReason').data('param_type');
		var popupType = $('#popupUnmaskingReason').data('type');
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
				, "type" : popupType
			},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#popupUnmaskingReason').modal('hide');	
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				//console.log(result);
		    	if(result.error != null) {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.error);
				} else if(result.resultCode == null) {
					alert('마스킹해제 중 오류가 발생하였습니다.');
				} else if(result.resultCode == '00000') {
				
					if(popupType == 'download' && type == 'carownInfo' ){
						//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.17 mijin.kim
						//popupType이 다운로드일 경우 img_down class가 추가 되어있는 파일 다운로드 	
						var img = $('.file-name.img_down');
						var blob = base64ImageToBlob($(img).data('src'));
						var fileName = $(img).data('file_name');
						//console.log(fileName, blob)
						const path = window.URL.createObjectURL(blob);
						const link = document.createElement('a');
						link.href = path;
						link.download = fileName;
						link.click();
						link.remove();
						
						//다운로드 후 img_down 클래스 제거 
						$(img).removeClass('img_down');
					}else if(popupType == 'download' && type == 'carownList'){
						//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.30 mijin.kim
						//심사중인 대상 파일 다운로드
						downloadCarownTarget();
					}else{
	 					var id =  $('.info-box').data('car_owner_id'); //회원ID
						loadDetail(id, 'N');
					}
				} else {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});
	}
</script>
