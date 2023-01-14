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
<div id="historyModal"></div>
<!-- End page -->
<script>
	let data = {
		nowPage : 1
		, joinStartDate : new Date('2022-05-01')
		, joinEndDate : new Date(new Date().setHours(23, 59, 59, 0))
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
			url : "<c:url value='/ui/service/owner/carown/search'/>",
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
		//console.log(formData);
		searchedData = formData;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/list'/>",
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
			}
		});
	}
	
	//목록조회 검색조건	
	function getData() {
		var object = {}; 
		object.nowPage = data.nowPage;
		
		//구분
		if($('.search-box #carOwnerType').val() !== 'all') {
			object.carOwnerType = $('.search-box #carOwnerType').val();
		}
		
		//이용상태
		if($('.search-box #carOwnerMemberStatus').val() !== 'all') {
			object.carOwnerMemberStatus = $('.search-box #carOwnerMemberStatus').val();
		}
		
		//가입승인상태 
		if($('.search-box #carOwnerJoinApprovalStatus').val() !== 'all') {
			object.carOwnerJoinApprovalStatus = $('.search-box #carOwnerJoinApprovalStatus').val();
		}
		
		//패널티 
		if($('.search-box #penalty').val() !== 'all') {
			object.penalty = $('.search-box #penalty').val();
		}
		
		//가입서류확인
		if($('.search-box #carOwnerFileAdminCheckYn').val() !== 'all') {
			object.carOwnerFileAdminCheckYn = $('.search-box #carOwnerFileAdminCheckYn').val();
		}
		
		//회원가입일 
		object.joinStartDate = new Date(data.joinStartDate).getTime();
		object.joinEndDate = new Date(data.joinEndDate).getTime();
		
		//최종이용일
		object.lastUseStartDate = new Date(data.lastUseStartDate).getTime();
		object.lastUseEndDate = new Date(data.lastUseEndDate).getTime();
		
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
	
	//load 차량정보 팝업 
	function loadCarDatailPopup(_id){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/popup/car.select'/>",
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
	
	//삭제 이력 팝업
	function deleteHistory(){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/popup/deleteHistory.select'/>",
			data : {},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#historyModal').empty();
				$('#deleteHistoryPopup').modal('hide');	
			},
			success : function(result, textStatus, XMLHttpRequest) {
				
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
				}
				
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#historyModal').html(result);
				$('#deleteHistoryPopup').modal('show');
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
		param.carOwnerId = _id;
		
		//마스킹여부
		if(_mask){
			param.maskingYn = _mask
		}else{
			param.maskingYn = 'Y';
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/select'/>",
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
	
	//load 위약수수료 팝업	
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
				
				if(_type == 'penalty'){ //패널티내역 조회
					loadPenaltyPopupList(1);
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
	
	//load 위약수수료 팝업 목록
	function loadPenaltyPopupList(_page){
		var id = $('#modal #popup').data('owner_id');
		if(!_page){
			_page = 1;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/popup/penalty.list'/>",
			data : {carOwnerId: id, pageIndex: _page},
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
	
	//load 변경내역 팝업 목록
	function loadHistoryPopupList(_page){
		var id = $('#modal #popup').data('owner_id');
		if(!_page){ 
			_page = 1;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/popup/history.list'/>",
			data : {carOwnerId: id, pageIndex: _page},
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
		var id = $('.info-box').data('car_owner_id'); //회원ID
		
		var checked = '';
		$('[name="chk"]:checked').each(function(index, item) {
			 checked+=item.value+'/'
		});
		checked = checked.substring(0, checked.length-1);
		
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/send/sms'/>",
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
		var id = $('.info-box').data('car_owner_id'); //회원ID
		var updateReason = $('#updateReason').val();
		var formData = {};
		formData.carOwnerId = id;
		formData.carOwnerHistoryChangeReason = updateReason;
		
		//이용상태
		var carOwnerMemberStatus = $('.info-box #carOwnerMemberStatus').val();
		formData.carOwnerMemberStatus = carOwnerMemberStatus; 
		
		//관리자확인
		var carOwnerFileAdminCheckYn = $('.info-box #carOwnerFileAdminCheckYn').val();
		formData.carOwnerFileAdminCheckYn = carOwnerFileAdminCheckYn;
		
		//지급방법
		var carOwnerPaymentMethod = $("input[name='carOwnerPaymentMethod']:checked").val();
		formData.carOwnerPaymentMethod = carOwnerPaymentMethod;		
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/update'/>",
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
					alert('차주정보 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
				}
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('차주정보 변경 중 오류가 오류가 발생하였습니다.')
			}
		}); 
	}
	
	//삭제
	function del(_id){	
		
		if(confirm('해당 건을 삭제하여 목록에서 제거하시겠습니까?')) {
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/owner/carown/delete'/>",
				data : {
					  carOwnerId : _id
				},
				cache : false,
				async : true,
				success : function(resultData, textStatus, XMLHttpRequest) {
					if(resultData.resultCode === '00000') {
						alert('삭제 처리되었습니다.');
						location.reload();
					} else if(resultData.resultCode === '00009') {
						alert('삭제 처리 실패하였습니다.');
					} else {
						alert('삭제 처리 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(resultData));
					}
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
	}
	
	//복구
	function recovery(_id){	
		
		if(confirm('해당 건을 복구하시겠습니까?')) {
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/owner/carown/recovery'/>",
				data : {
					  carOwnerId : _id
				},
				cache : false,
				async : true,
				success : function(resultData, textStatus, XMLHttpRequest) {
					if(resultData.resultCode === '00000') {
						alert('복구 처리되었습니다.');
						//location.reload();
						searchHistoryList();
					} else if(resultData.resultCode === '00009') {
						alert('복구 처리 실패하였습니다.');
					} else {
						alert('복구 처리 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(resultData));
					}
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
	}	

	
	function withdraw(){
		var id = $('.info-box').data('car_owner_id'); //회원ID
		var updateReason = $('#updateReason').val();
		var formData = {};
		formData.carOwnerId = id;
		formData.carOwnerHistoryChangeReason = updateReason;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/withdraw'/>",
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
	
	//load 지입차주 업로드 팝업 
	function loadCarownUploadPopup(){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/popup/upload'/>",
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
				
				$('#modalDetail').html(data);
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
	
	function downloadCarownTarget(){
		$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/owner/carown/download/target'/>",
				data : {},
				cache : false,
				async : true,
				success : function(data, textStatus, xhr) {
					//console.log(data)
					
					if(data.resultCode != '00000'){
						//파일 다운로드가 아닐 경우 결과 메시지 노출
						alert(data.resultMsg);
					}else{
						//심사대상 파일 다운로드
						var str = 'data:application/zip;base64,'+data.fileData
						var link = document.createElement('a');
						link.href = str;
						link.download = data.fileName;
						link.click();
						
						//목록조회
						searchList();
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert('심사파일 다운로드중 요청중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
				}
			});
	}
	
</script>
