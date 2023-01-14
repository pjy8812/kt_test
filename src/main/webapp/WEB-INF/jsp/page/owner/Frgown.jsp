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
<div id="frgownCarrierModal"></div>
<div id="frgownFareModal"></div>
<div id="frgownFareModal2"></div>
<div id="frgownFareAdjustModal"></div>
<div id="frgownContractModal"></div>
<!-- End page -->
<script>
	let data = {
		nowPage : 1
		, joinStartDate : new Date('2022-05-01')
		, joinEndDate : new Date(new Date().setHours(0, 0, 0, 0))
		, lastUseStartDate : new Date('2022-05-01')
		, lastUseEndDate : new Date(new Date().setHours(23, 59, 59, 0))
	    , object: {}
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
			}
		})
	}
	
	//load 검색 폼 
	function loadSearch(_queryString) {
	
		var formData;
		if(_queryString){
			formData = deJsonString(_queryString);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/search'/>",
			data :formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(data, true)){
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
				
				alert('화주관리 목로조회중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
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
			url : "<c:url value='/ui/service/owner/frgown/list'/>",
			data : formData,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('.searchList').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
				}
				
				$('.searchList').html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert('화주관리 목록조회중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		});
	}
	
	//목록조회 검색조건	
	function getData() {
		var object = {};
		object.nowPage = data.nowPage; 
		
		//계약구분
		if($('.search-box #freightOwnerType').val() !== 'all') {
			object.freightOwnerType = $('.search-box #freightOwnerType').val();
		}
		
		
		//사업자구분
		if($('.search-box #freightOwnerMemberType').val() !== 'all') {
			object.freightOwnerMemberType = $('.search-box #freightOwnerMemberType').val();
		}
		
		//사업자유형 
		if($('.search-box #freightOwnerBusinessType').val() !== 'all') {
			object.freightOwnerBusinessType = $('.search-box #freightOwnerBusinessType').val();
		}
		
		//이용상태 
		if($('.search-box #freightOwnerMemberStatus').val() !== 'all') {
			object.freightOwnerMemberStatus = $('.search-box #freightOwnerMemberStatus').val();
		}
		
		//월 정산 횟수 
		object.freightOwnerMonthSettlementNum = $('.search-box #freightOwnerMonthSettlementNum').val();
		
		//가입서류확인
		if($('.search-box #freightOwnerFileAdminCheckYN').val() !== 'all') {
			object.freightOwnerFileAdminCheckYN = $('.search-box #freightOwnerFileAdminCheckYN').val();
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
			object.pagePerRows = $('#pagePerRows').val();
		}
		
		return object;
	}	
	
	//load 상세화면
	function loadDetail(_id, _mask) {
		flag.listFormLoaded = false;
		
		var param ={};
		param.freightOwnerId = _id;
		
		//마스킹여부
		if(_mask){
			param.maskingYn = _mask;
		}else{
			param.maskingYn = 'Y'
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/select'/>",
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
				}
				
				$(".contents").html(result);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert('화주 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		});
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
	
	//운송대행사 팝업	
	function carrierPopup(_object){
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/carrier.select/'/>" + _object,
			data : {},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownCarrierModal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#frgownCarrierModal').html(result);
				$('#frgownCarrierPopup').modal('show');

			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}
	
	//요금제 팝업	
	function farePopup(_object){
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/fare.select/'/>" + _object,
			data : {},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownFarePopup').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#frgownFareModal').html(result);
				$('#frgownFarePopup').modal('show');

			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}
	
	//요금제 팝업	
	function farePopup2(_id){
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/fare.select2'/>",
			data : {freightOwnerId:_id},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownFarePopup2').empty();
				$('#frgownContractPopup').modal('hide');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#frgownFareModal2').html(result);
				$('#frgownFarePopup2').modal('show');

			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}	
	
	//요금제 팝업	
	function fareAdjustPopup(_id, _fareAdjustFrom, _fareAdjustTo, _number){
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/fareAdjustPopup'/>",
			data : {frgownId: _id, fareAdjustFrom: _fareAdjustFrom, fareAdjustTo:_fareAdjustTo, number:_number},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownFareAdjustPopup').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#frgownFareAdjustModal').html(result);
				$('#frgownFareAdjustPopup').modal('show');

			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}
	
	//계약정보 조회
	function contractPopup(_id, _freightOwnerCorporateNumber, _freightOwnerFareAdjustFrom, _freightOwnerFareAdjustTo){
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/contract.select/'/>",
			data : {freightOwnerId: _id, freightOwnerCorporateRegistrationNumber:_freightOwnerCorporateNumber, freightOwnerFareAdjustFrom:_freightOwnerFareAdjustFrom, freightOwnerFareAdjustTo:_freightOwnerFareAdjustTo},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownContractModal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#frgownContractModal').html(result);
				$('#frgownContractPopup').modal('show');

			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}	
	
	//load 위약수수료 팝업 목록
	function loadPlaceboFeePopupList(_page){
		var id = $('#modal #popup').data('owner_id');
		if(!_page){
			_page = 1;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/placebofee.list'/>",
			data : {freightOwnerId: id, nowPage: _page},
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
				alert('위약수수료 내역 조회중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		}); 
	}	
	
	//load 변경내역 팝업 목록
	function loadHistoryPopupList(_page){
		var id = $('#modal #popup').data('owner_id');
		if(!_page){ 
			_page = 1;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/history.list'/>",
			data : {freightOwnerId: id, nowPage: _page},
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
	
	//파일수정요청 SMS발송
	function sendSMS(){
		var id = $('.info-box').data('freight-owner-id'); //회원ID
		
		var checked = '';
		$('[name="chk"]:checked').each(function(index, item) {
			 checked+=item.value+'/'
		});
		checked = checked.substring(0, checked.length-1);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/send/sms'/>",
			data : {ownerId: id, fileType: checked},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.resultCode == '00000'){
					alert('파일수정 SMS발송 요청 하였습니다');
				}else{
					alert('파일수정 SMS발송 요청중 오류가 발생하였습니다.\r\nERROR: '+result.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('파일수정 SMS발송 요청중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		}); 
	}	
	
	//저장
	function update(){
		var id = $('.info-box').data('freight-owner-id'); //회원ID
		var updateReason = $('#updateReason').val(); 
		
		var formData = {};
		formData.freightOwnerId = id;
		formData.freightOwnerHistoryChangeReason = updateReason; //변경사유
		
		//계약구분
		formData.freightOwnerType = $('.info-box #freightOwnerType').val(); 
		
		//사업자구분
		formData.freightOwnerMemberType = $('.info-box #freightOwnerMemberType').val(); 
		
		//사업자유형
		formData.freightOwnerBusinessType = $('.info-box #freightOwnerBusinessType').val(); 
		
		//이용상태
		formData.freightOwnerMemberStatus = $('.info-box #freightOwnerMemberStatus').val();
		
		//관리자확인
		var freightOwnerFileAdminCheckYN = $('.info-box #freightOwnerFileAdminCheckYN').val();
		formData.freightOwnerFileAdminCheckYN = freightOwnerFileAdminCheckYN; 
		
		//월정산횟수 
		formData.freightOwnerMonthSettlementNum = $('.info-box #freightOwnerMonthSettlementNum').val();
		
		//우선노출 대상
		if ($('.info-box #freightOwnerType').val() == 'contract') {
			//대상
			if($('[name="freightOwnerPriorityExposure"]:checked').length > 0) {
				var checked = '';
				$('[name="freightOwnerPriorityExposure"]:checked').each(function(index, item) {
					 checked+=item.value+','
				});
				checked = checked.substring(0, checked.length-1);
				formData.freightOwnerPriorityExposure = checked;
			}			
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/update'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				if(result.resultCode == '00000'){
					$('#popupUpdateReason').modal('hide');
					alert('변경이 완료되었습니다');
					location.reload();
				}else{
					alert('화주정보 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('화주정보 변경 중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		}); 
	}
	
	function withdraw(){
		var id = $('.info-box').data('freight-owner-id'); //회원ID
		var updateReason = $('#updateReason').val();
		var formData = {};
		formData.freightOwnerId = id;
		formData.freightOwnerHistoryChangeReason = updateReason;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/withdraw'/>",
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
				alert('탈퇴(승인) 중 오류가 발생하였습니다');
				$('#popupUpdateReason').modal('show');
			}
		}); 
	}
	
	function unmask(){
		var type = $('#popupUnmaskingReason').data('param_type');
		var popupType = $('#popupUnmaskingReason').data('type');
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
				, "type" : popupType
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
					//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.17 mijin.kim
					//popupType이 다운로드일 경우 img_down class가 추가 되어있는 파일 다운로드 	
					if(popupType == 'download'){
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
					}else{
	 					var id = $('.info-box').data('freight-owner-id'); //회원ID
						loadDetail(id, 'N');
					}
				} else {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('마스킹해제 중 오류가 발생하였습니다.');
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
				$('#carModal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#carModal').html(result);
				$('#popup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}
	
	//운송 대행사 정보 수정
	function frgownCarrierUdate(_id, _object){
		var _id = $('.info-box').data('freight-owner-id'); // 화주ID
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/carrier/update/'/>" + _object,
			data : {freightOwnerId: _id},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownCarrierModal').modal('hide');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				if(result.resultCode == '00000'){
					alert('운송대행사 변경이 완료되었습니다');
					location.reload();
				} else{
					alert('운송대행사 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
					$('#frgownCarrierModal').modal('show');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('운송대행사 변경 중 오류가 발생하였습니다');
				$('#frgownCarrierModal').modal('show');
			}
		}); 
	}
	
	//요금제 정보 수정
	function frgownFareUpdate(_id, _object){
		var _id = $('.info-box').data('freight-owner-id'); // 화주ID
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/fare/update/'/>" + _object,
			data : {freightOwnerId: _id},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownFareModal').modal('hide');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				if(result.resultCode == '00000'){
					alert('요금제 변경이 완료되었습니다');
					location.reload();
				} else{
					alert('요금제 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
					$('#frgownFareModal').modal('show');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('요금제 변경 중 오류가 발생하였습니다');
				$('#frgownFareModal').modal('show');
			}
		}); 
	}	
	
	//요금제조정구간 정보 수정
	function frgownFareAdjustUpdate(_id, _fareAdjustFrom, _fareAdjustTo){
		var _id = $('.info-box').data('freight-owner-id'); // 화주ID
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/fareAdjust/update'/>",
			data : {freightOwnerId: _id, freightOwnerFareAdjustFrom:_fareAdjustFrom, freightOwnerFareAdjustTo:_fareAdjustTo},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownFareAdjustModal').modal('hide');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				if(result.resultCode == '00000'){
					alert('요금 조정구간 변경이 완료되었습니다');
					location.reload();
				} else{
					alert('요금 조정구간 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
					$('#frgownFareAdjustModal').modal('show');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('요금 조정구간 변경 중 오류가 발생하였습니다');
				$('#frgownFareAdjustModal').modal('show');
			}
		}); 
	}		
	
	
	//요금제 및 요금 조정구간 정보 수정
	function frgownFareAdjustUpdate2(_id, _fareAdjustFrom, _fareAdjustTo, _object){
		var _id = $('.info-box').data('freight-owner-id'); // 화주ID
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/fare.adjust/update/'/>" + _object,
			data : {freightOwnerId: _id, freightOwnerFareAdjustFrom:_fareAdjustFrom, freightOwnerFareAdjustTo:_fareAdjustTo},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownFareAdjustModal').modal('hide');
			},
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				if(result.resultCode == '00000'){
					alert('요금제 및 조정구간 변경이 완료되었습니다');
					location.reload();
				} else{
					alert('요금제 및 조정구간 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
					$('#frgownFareAdjustModal').modal('show');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('요금제 및 조정구간 변경 중 오류가 발생하였습니다');
				$('#frgownFareAdjustModal').modal('show');
			}
		}); 
	}	
	
	
</script>
