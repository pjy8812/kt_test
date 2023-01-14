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
<div id="modal"></div>
<!-- End page -->
<script>
	let data = {
		nowPage : 1
		, joinStartDate : new Date('2022-05-01')
		, joinEndDate : new Date(new Date().setHours(0, 0, 0, 0))
		, lastUseStartDate : new Date('2022-05-01')
		, lastUseEndDate : new Date(new Date().setHours(23, 59, 59, 0))
	}
	
	let flag = {
		listFormLoaded : false	
	}
	
	var searchedData = {};
		
	$(document).ready(function() {
		initRoutie();
	
		if(location.hash === '') {
			routie('list');
		}
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
			'detail/:id' : function(id) {
				loadDetail(id);
			},
			'upload' : function () {
				carrierUpload();
			}
		})
	}
	
	// 운송대행사 등록
	function carrierUpload() {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/upload'/>",
			data : {},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$(".contents").empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').remove('.modal-backdrop');
					$('body').removeClass('modal-open');
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
	
	//load 검색 폼 
	function loadSearch(_queryString) {
		var formData;
		if(_queryString){
			formData = deJsonString(_queryString);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)) {
					return;
				}
				$('.contents').html(result);
				flag.listFormLoaded = true;
				
				loadList();
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});
	}
	
	//조회
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
		
	//load 목록조회 
	function loadList(_queryString) {
		var formData = {};
		// 검색폼이 로드되지 않았으면 검색폼을 로드
		if(!flag.listFormLoaded) {
			loadSearch();
			return;
		}
		
		if(_queryString){
			formData = deJsonString(_queryString);
		}else{
			formData = getData();
		}
		searchedData = formData;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/list'/>",
			data : formData,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('.searchList').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
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
				
				alert('운송대행사 목록조회중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		});
	}
	
	//목록조회 검색조건	
	function getData() {
		var object = {}; 
		object.nowPage = data.nowPage;
		
		//구분
		if($('.search-box #carrierOwnerType').val() !== 'all') {
			object.carrierOwnerType = $('.search-box #carrierOwnerType').val();
		}
		
		//이용상태
		if($('.search-box #carrierMemberStatus').val() !== 'all') {
			object.carrierMemberStatus = $('.search-box #carrierMemberStatus').val();
		}
		
		// 결제 조건
		if($('.search-box #carrierPaymentCondition').val() !== 'all') {
			object.carrierPaymentCondition = $('.search-box #carrierPaymentCondition').val();
		}
		
		//가입서류확인
		if($('.search-box #carrierFileAdminCheckYn').val() !== 'all') {
			object.carrierFileAdminCheckYn = $('.search-box #carrierFileAdminCheckYn').val();
		}
		
		//회원가입일 
		if (data.joinStartDate != undefined) {
			object.joinStartDate = new Date(data.joinStartDate).getTime();
		} else {
			object.joinStartDate = '';
		}
		if (data.joinEndDate != undefined) {
			object.joinEndDate = new Date(data.joinEndDate).getTime();
		} else {
			object.joinEndDate = '';
		}
		
		//최종이용일
		if (data.lastUseStartDate != undefined) {
			object.lastUseStartDate = new Date(data.lastUseStartDate).getTime();
		} else {
			object.joinStartDate = '';
		}
		if (data.lastUseEndDate != undefined) {
			object.lastUseEndDate = new Date(data.lastUseEndDate).getTime();
		} else {
			object.lastUseEndDate = '';
		}
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.searchType = $('#searchType').val();
			object.searchText =searchText;
		}
		
		//정렬기준
		if($('#sort').length == 1){
			object.sort = $('#sort').val();
		}
		
		//목록 수
		if($('#pagePerRows').length == 1){
			object.pagePerRows = Number($('#pagePerRows').val());
		}
		
		return object;
	}	
	
		//load 팝업	
	function loadPopup(_type, _id){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/popup/'/>"+_type,
			data : {type: _type, ownerId: _id},
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
				//위약수수료 내역 목록조회
				if(_type == 'placebofee'){
					loadPlaceboFeePopupList(1);
				}else if(_type == 'history'){
					loadHistoryPopupList(1);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}
	
	function loadHistoryPopupList(_page){
		var id = $('#modal #popup').data('owner_id');
		if(!_page){ 
			_page = 1;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/popup/history.list'/>",
			data : {carrierId: id, nowPage: _page},
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
				alert('변경 내역 조회중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		}); 
	}
	
	//load 차량정보 팝업 
	function loadCarDatailPopup(_id){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/popup/car.select'/>",
			data : {carrierId: _id},
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
	
	//load 계약화주 목록
	function loadCarrierFreightDatailPopup(_id){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/popup/freight.select'/>",
			data : {carOwnerId: _id},
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
	
	//load 상세화면
	function loadDetail(_id, _mask) {
		flag.listFormLoaded = false;
		
		var param ={};
		param.carrierId = _id;
		
		//마스킹여부
		if(_mask){
			param.maskingYn = _mask
		}else{
			param.maskingYn = 'Y';
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/select'/>",
			data : param,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$(".contents").empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').remove('.modal-backdrop');
					$('body').removeClass('modal-open');
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
				
					if(popupType == 'download' && type == 'carrierInfo' ){
						//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.17 mijin.kim
						//popupType이 다운로드일 경우 img_down class가 추가 되어있는 파일 다운로드 	
						var img = $('.file-name.img_down');
						var blob = base64ImageToBlob($(img).data('src'));
						var fileName = $(img).data('file_name');
						const path = window.URL.createObjectURL(blob);
						const link = document.createElement('a');
						link.href = path;
						link.download = fileName;
						link.click();
						link.remove();
						
						//다운로드 후 img_down 클래스 제거 
						$(img).removeClass('img_down');
					}else if(popupType == 'download' && type == 'carrierList'){
						//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.30 mijin.kim
						//심사중인 대상 파일 다운로드
						downloadCarownTarget();
					}else{
	 					var id =  $('.info-box').data('carrier_id'); //회원ID
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

	//저장
	function update(){
 		var id = $('.info-box').data('carrier_id'); //운송대행사ID
 		var updateReason = $('#updateReason').val();
		var formData = new FormData();

	    formData.append('carrierId', id); 
	    formData.append('carrierHistoryChangeReason', updateReason);
	    
	  	//결재조건
	    var carrierPaymentCondition = $('.info-box #carrierPaymentCondition').val();
	    formData.append('carrierPaymentCondition', carrierPaymentCondition);
	    
	  	//이용상태
	    var carrierMemberStatus = $('.info-box #carrierMemberStatus').val();
	    formData.append('carrierMemberStatus', carrierMemberStatus); 

	  	//관리자확인
	    var carrierFileAdminCheckYn = $('.info-box #carrierFileAdminCheckYn').val();
	    formData.append('carrierFileAdminCheckYn', carrierFileAdminCheckYn); 

		// 사업자등록증
		$.each($('input[type=file]')[0].files, function(i, value){
		    formData.append('carrierCorporateRegistrationFile', value); 
		});
	    
		// 기타
		$.each($('input[type=file]')[1].files, function(i, value){
		    formData.append('carrierOthersFile', value); 
		});
	    
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/update'/>",
			data : formData,
			cache : false,
			async : true,
			enctype: 'multipart/form-data',
	        contentType: false,
	        processData: false,			
			success : function(result, textStatus, XMLHttpRequest) {
				
				if(result.resultCode == '00000'){
					$('#popupUpdateReason').modal('hide');
					alert('변경이 완료되었습니다');
					location.reload();
				}else{
					alert('운송대행사정보 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
				}
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('운송대행사정보 변경 중 오류가 오류가 발생하였습니다.')
			}
		}); 
	}

	//load 변경사유 입력 팝업
	function loadUpdateReasonPopup(_type, _id){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/common/popup/reason'/>",
			data :{paramType: _type, paramId: _id},
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
				$('#popupUpdateReason').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}	
	
	//탈퇴승인
	function withdraw(){
		var id = $('.info-box').data('carrier_id'); //회원ID
		var updateReason = $('#updateReason').val();
		var formData = {};
		formData.carrierId = id;
		formData.carrierHistoryChangeReason = updateReason;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/withdraw'/>",
			data : formData,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#popupUpdateReason').modal('hide');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				if(result.resultCode == '00000'){
					alert('탈퇴(승인)이 완료되었습니다');
					searchList();
				}else if(result.resultCode == '00009'){
					alert('미정산항목이 남아있어 탈퇴(승인)을 진행할 수 없습니다');
				}else{
					alert('탈퇴(승인) 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
					$('#popupUpdateReason').modal('show');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('탈퇴(승인) 중 발생하였습니다');
				$('#popupUpdateReason').modal('show');
			}
		}); 
	}

</script>
