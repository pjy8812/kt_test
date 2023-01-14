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
			url : "<c:url value='/ui/service/help/manual/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
			if (hasErrorMap(result, true)) {
					return;
				}
				
				flag.listFormLoaded = true;
				$('.contents').html(result);
				
				loadList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)){
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
			url : "<c:url value='/ui/service/help/manual/list'/>",
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
		if($('[name="manualRecipient"]:checked').length > 0) {
			var checked = '';
			$('[name="manualRecipient"]:checked').each(function(index, item) {
				 checked+=item.value+','
			});
			checked = checked.substring(0, checked.length-1);
			object.manualRecipient = checked;
		}
		
		//카테고리
		if($('#manualCategory').val() !== 'all') {
			object.manualCategory = $('#manualCategory').val();
		}
		
		//작성일 
		object.manualExposedStartDate = new Date(data.startDate).getTime();
		object.manualExposedEndDate = new Date(data.endDate).getTime();
		
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
			url : "<c:url value='/ui/service/help/manual/select'/>",
			data : {
				"manualSeq" : _seq
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
	function loadEdit(_seq) {
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/manual/edit'/>",
			data : {
				"manualSeq" : _seq
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
	
	//삭제
	function deleteManual(_seq){
		var formData = {};
		formData.manualSeq = _seq; //매뉴얼 seq
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/manual/delete'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				//console.log(data)
				if(data.resultCode == '00000'){
					alert('삭제되었습니다');
					searchList();
				}else{
					alert('게시글 삭제 중 오류가 발생하였습니다.\r\nERROR: '+result.resultCode+', '+result.resultMsg)
				}
			
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
		var manualTitle = $('[name="manualTitle"]').val();
		if(manualTitle === '' || manualTitle.trim() === ''){
			$('[name="manualTitle"]').addClass('parsley-error');
			isOk = false;
		}else{
			$('[name="manualTitle"]').removeClass('parsley-error');
			formData.append('manualTitle', manualTitle);			
		}
		
		//대상
		var manualRecipient = $('[name="manualRecipient"]:checked').val(); 
		if(manualRecipient === ''){
			isOk = false;
		}else{
			formData.append('manualRecipient', manualRecipient);
		}
		
		//카테고리
		var manualCategory = $('#manualCategory').val();
		if(manualCategory === ''){
			$('#manualCategory').addClass('parsley-error');
			isOk = false;
		}else{
			$('#manualCategory').removeClass('parsley-error');
			formData.append('manualCategory', manualCategory);
		}


		//내용		
		//var contents = editor.root.innerHTML
		//contents = contents.replace('<p><br></p>', '');
		var contents  = $('[name="manualContent"]').val();
		if(contents === '' || contents.trim() === ''){
			//$('#editor').addClass('parsley-error');
			$('[name="manualContent"]').addClass('parsley-error');
			isOk = false;
		}else{
			//$('#editor').removeClass('parsley-error');
			$('[name="manualContent"]').removeClass('parsley-error');
			formData.append('manualContent', contents);		
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
		
		//게시기간
		var manualExposedAlwaysYN = $('[name="manualExposedAlwaysYN"]').is(':checked');
		if(manualExposedAlwaysYN){
			formData.append('manualExposedAlwaysYn', 'Y');
			formData.append('manualExposedStartDateByLongType', 0);
			formData.append('manualExposedEndDateByLongType', 0);
		}else{
			var startDate = new Date(startDatePicker.selectedDates).format('yyyy-MM-dd');
			var startTime = new Date(startTimePicker.selectedDates).format('HH:mm');
			var endDate = new Date(endDatePicker.selectedDates).format('yyyy-MM-dd');
			var endTime = new Date(endTimePicker.selectedDates).format('HH:mm');
			
			if(startDate&&startTime&&endDate&&endTime){
				formData.append('manualExposedAlwaysYn', 'N');
				formData.append('manualExposedStartDateByLongType', new Date(startDate+' '+startTime).getTime());
				formData.append('manualExposedEndDateByLongType', new Date(endDate+' '+endTime).getTime());
			}
		}
		
		//매뉴얼 SEQ 추가
		var seq = $('.edit-box').data('manual_seq');
		if(seq != '' && seq != undefined){
			formData.append('manualSeq', seq);
		}
		
		if(!isOk){ //필수값이 입력되지 않을 경우 return
			alert('필수값을 확인해주세요');
			return;
		}
		//console.log(formData);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/help/manual/save'/>",
			data : formData,
			dataType : "text",
			cache : false,
			async : true,
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				var tempResult = JSON.parse(result);
				if(tempResult.resultCode == '00000'){
					alert('매뉴얼 저장하였습니다.');
					searchList();
				}else{
					alert('매뉴얼 저장 중 오류가 발생하였습니다.\r\nERROR: '+tempResult.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('매뉴얼 저장 중 오류가 발생하였습니다.')
			}
		}); 
	
	}
</script>
