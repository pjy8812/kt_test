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
		nowPage : 1
		, startDate : new Date(new Date().addMonths(-1).setHours(0, 0, 0, 0))
		, endDate : new Date(new Date().setHours(23, 59, 59, 0))
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
			'edit' : function() {
				loadEdit();
			},
			'edit/:id' : function(id) {
				loadEdit(id);
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
			url : "<c:url value='/ui/service/help/notice/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)) {
					return;
				}
				
				flag.listFormLoaded = true;
				$('.contents').html(result);
				
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
			url : "<c:url value='/ui/service/help/notice/list'/>",
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
		
		//대상 
		if($('[name="noticeRecipient"]:checked').length > 0) {
			var checked = '';
			$('[name="noticeRecipient"]:checked').each(function(index, item) {
				 checked+=item.value+','
			});
			checked = checked.substring(0, checked.length-1);
			object.noticeRecipient = checked;
		}
		
		//작성일 
		object.noticeExposedStartDate = new Date(data.startDate).getTime();
		object.noticeExposedEndDate = new Date(data.endDate).getTime();
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.searchType = $('#searchType').val();
			object.searchText =searchText;
		}
				
		//게시상태
		object.noticeExposedYn = $('[name="noticeExposedYn"]').val();
		
		return object;
	}	
	
	//load 상세화면
	function loadDetail(_id) {
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/notice/select'/>",
			data : {
				"noticeSeq" : _id
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
	
	//load 등록/수정화면
	function loadEdit(_id) {
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/notice/edit'/>",
			data : {
				"noticeSeq" : _id
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
	
	//상단고정, 팝업설정 수정
	function updateStatus(_id, _top, _popup){
		var formData = {};
		formData.noticeSeq = _id; //공지사항ID
		formData.noticeTopExposed = _top; //상단고정
		formData.noticePopupSetting = _popup; //팝업설정
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/notice/update/status'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(data);
				if(result.resultCode == '00000'){
					alert('변경이 완료되었습니다.');
					location.reload();
				}
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('설정 변경 중 오류가 발생하였습니다.');
			}
		}); 
		
	}
	
	//삭제
	function deleteNotice(_seq){
		var formData = {};
		formData.noticeSeq = _seq; //공지사항ID
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/notice/delete'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				searchList();
			
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('게시글 삭제 중 오류가 발생하였습니다.')
			}
		}); 
	}
	
	//저장
	function save(){
		var isOk = true;
		var formData = new FormData();
		
		//제목
		var noticeTitle = $('[name="noticeTitle"]').val();
		if(noticeTitle === '' || noticeTitle.trim() === ''){
			$('[name="noticeTitle"]').addClass('parsley-error');
			isOk = false;
		}else{
			$('[name="noticeTitle"]').removeClass('parsley-error');
			formData.append('noticeTitle', noticeTitle);		
		}
		
		//대상
		var noticeRecipient = $('[name="noticeRecipient"]:checked').val(); 
		if(noticeRecipient == ''){
			isOk = false;
		}else{
			formData.append('noticeRecipient', noticeRecipient);
		}
		
		//유형 by2022.04.10 추가
		var noticePopupType = $('[name="noticePopupType"]:checked').val(); 
		if(noticePopupType == ''){
			isOk = false;
		}else{
			formData.append('noticePopupType', noticePopupType);
		}

		//내용		
		//유형이 텍스트이거나 텍스트+이미지경우만
		//var contents = editor.root.innerHTML
		//contents = contents.replace('<p><br></p>', '');
		
		var contents  = $('[name="noticeContent"]').val();
		if(contents === '' || contents.trim() === ''){
			if(noticePopupType === 'text' || noticePopupType === 'textImg'){
			 	$('[name="noticeContent"]').addClass('parsley-error');
				isOk = false;
			}
		}else{
			//$('#editor').removeClass('parsley-error');
			$('[name="noticeContent"]').removeClass('parsley-error');
			formData.append('noticeContent', contents);
		}
			
		
		//첨부파일 
		//유형이 이미지, 텍스트+이미지일 경우에만 
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
		
		
		if(noticePopupType === 'img' || noticePopupType === 'textImg'){
			var file = $('input[type=file]')[0].files.length;
			//console.log(file, temp)
			if(file == 0 && temp == 0){
				isOk = false;
			}
		}
		
		//게시기간
		var noticeExposedYN = $('[name="noticeExposedYN"]').is(':checked');
		if(noticeExposedYN){
			formData.append('noticeAlwaysPostYn', 'Y');
				formData.append('noticeExposedStartDateByLongType', 0);
				formData.append('noticeExposedEndDateByLongType', 0);
		}else{
			var startDate = new Date(startDatePicker.selectedDates).format('yyyy-MM-dd');
			var startTime = new Date(startTimePicker.selectedDates).format('HH:mm');
			var endDate = new Date(endDatePicker.selectedDates).format('yyyy-MM-dd');
			var endTime = new Date(endTimePicker.selectedDates).format('HH:mm');
			
			if(startDate&&startTime&&endDate&&endTime){
				formData.append('noticeAlwaysPostYn', 'N');
				formData.append('noticeExposedStartDateByLongType', new Date(startDate+' '+startTime).getTime());
				formData.append('noticeExposedEndDateByLongType', new Date(endDate+' '+endTime).getTime());
			}
		}
		
		//팝업설정
		var noticePopupSetting = $('.switch_popup').is(':checked') ?  'Y': 'N';
		formData.append('noticePopupSetting', noticePopupSetting);
		
		//상단고정
		var noticeTopExposed =$('.switch_fixed_top').is(':checked') ?  'Y': 'N';
		formData.append('noticeTopExposed', noticeTopExposed);
		
		//공지사항ID 추가
		var noticeSeq = $('.edit-box').data('notice_seq');
		if(noticeSeq != '' && noticeSeq != undefined){
			formData.append('noticeSeq', noticeSeq);
		}
		
		if(!isOk){ //필수값이 입력되지 않을 경우 return
			alert('필수값을 확인해주세요');
			return;
		}
		
		//console.log(formData);

		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/notice/save'/>",
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
					alert('공지사항을 저장하였습니다.');
					searchList();
				}else{
					alert('공지사항 저장 중 오류가 발생하였습니다.\r\nERROR: '+tempResult.resultMsg);
				}
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('공지사항 저장 중 오류가 발생하였습니다.')
			}
		}); 
	
	}
</script>
