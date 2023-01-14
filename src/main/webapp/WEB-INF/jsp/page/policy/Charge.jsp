<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Begin page -->
<div class="row">
	<div class="col-12 contents">
	</div>
</div>
<div id="modal"></div>
<!-- End page -->

<script>
	// default 값 설정
	let data = {
		nowPage : 1
	}
	
	var searchedData = {};
	
	let flag = {
		listFormLoaded : false	
	}

	$(document).ready(function() {
		initRoutie();
		
		if(location.hash === '') {
			routie('list');
		}
	});	
	
	
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
			'edit/:idx' : function(idx) {
				loadEdit(idx);
			}
		})
	}
	
	// 검색 폼 
	function loadSearch(_queryString) {
		
		var formData;
		if(_queryString){
			formData = deJsonString(_queryString);
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/search'/>",
			data : formData,
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('.contents').html(result);
				flag.listFormLoaded = true;
				loadList();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
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
	
	// 목록 로드 
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
			url : "<c:url value='/ui/service/policy/charge/list'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('.searchList').empty();
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
		
		//사용여부
		if($('.search-box #chargeUse').val() !== 'all') {
			object.chargeUse = $('.search-box #chargeUse').val();
		}
		
		//기본요금제여부
		if($('.search-box #chargeBasic').val() !== 'all') {
			object.chargeBasic = $('.search-box #chargeBasic').val();
		}
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.searchType = $('#searchType').val();
			object.searchText =searchText;
		}
		
		//목록 수
		if($('#pagePerRows').length == 1){
			object.pagePerRows = $('#pagePerRows').val();
		}

		return object;
	}	
	
	//load 등록/수정화면
	function loadEdit(_idx) {
		
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/edit'/>",
			data : {
				chargeIdx : _idx
			},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$(".contents").html(result);
				loadEditTabType(_idx, 'base');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){ 
					return;
				}
			}
		});
	}
	
	function loadEditTabType(_idx, _tabType) {
		
		flag.listFormLoaded = false;
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/edit/'/>"+_tabType,
			data : {
				"chargeIdx" : _idx
			},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$(".tab-content #"+_tabType).html(result);
				$(".tab-content #"+_tabType).data('load', true);
				$('.tab-pane').removeClass('active');
				$('#'+_tabType).addClass('active');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});
	}
	
	
	//load 지역검색 팝업 
	function loadAreaPopup(_code, _name){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/area/popup'/>",
			data : {areaGroupCode: _code, areaGroupName: _name},
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
				$('#areaPopup').modal('show');
				
				//지역목록조회
				loadAreaPopupList(0, _code);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}	
	
	//load 지역목록조회
	function loadAreaPopupList(_page, _code){
		
		var searchText = $('#areaPopup .keyword').val(); // 검색어
		var searchType = $('#areaPopup .searchType').val(); // 검색타입
		if(!_page){ 
			_page = 1;
		}
		
		var params = {};	
		params.areaGroupCode = _code;
		params.pageIndex = _page;	
		
		if(searchText != ''){
			params.searchType = searchType;
			params.searchText = searchText	
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/area/list'/>",
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
	
	
	function saveCharge(){
		var params = {};
		
		if(!chkValInfo(params)){
			//console.log('필수값체크', data);
			alert('요금 정보, 마진율 정보를 확인해주세요.');
			return;
		}
		
		var idx = $('.info-box').data('idx');
		if(idx != ''){
			params.chargeIdx = idx;
		}
		
		//console.log(data);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/info'/>",
			data : params,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt == 1){
					alert('요금정보, 마진율 정보를 저장하였습니다.');
					
					if(!$.isEmptyObject(result.succIdx)){
						$('.info-box').data('idx', result.succIdx);
					}

					//기준단가 저장 
					saveBase();
					
				}else{
					alert('요금정보, 마진율 정보 저장 중 오류가 발생하였습니다.');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('요금정보, 마진율 정보 저장 중 오류가 발생하였습니다.');
			}
		}); 
		
	}
	
	//요금제 필수값 체크
	function chkValInfo(_data){
		var isOk = true; //필수값 체크 
		
		//요금제명
		var chargeName = $('.info-box #chargeName').val();
		if(chargeName == '' || chargeName.trim() == ''){
			$('.info-box #chargeName').addClass('parsley-error');
			isOk = false;
		}else{
			$('.info-box #chargeName').removeClass('parsley-error');
			_data.chargeName = chargeName;
		}
		
		//기본요금제사용여부
		var chargeBasic = $('.info-box [name="chargeBasic"]:checked').val();
		if(chargeBasic == ''){
			isOk = false;
		}else{
			_data.chargeBasic = chargeBasic;
		}
		
		//사용여부
		var chargeUse = $('.info-box [name="chargeUse"]:checked').val();
		if(chargeUse == ''){
			isOk = false;
		}else{
			_data.chargeUse = chargeUse;
		}
		
		//사용기간
		var tempDate = $('#useDate').val();
		if(tempDate == '' || tempDate == ' ~ '){
			isOk = false;
		}else{
			var tempDateArr = $('#useDate').val().split(' ~ ');
			var start = tempDateArr[0];
			var end = tempDateArr[1];
			_data.chargeStartDate = new Date(start).format('yyyy-MM-dd');
			_data.chargeEndDate = new Date(end).format('yyyy-MM-dd');
		}
		
		//마진율
		var chargeMargin = $('.info-box [name="chargeMargin"]').val();
		if(chargeMargin == ''){
			$('.info-box [name="chargeMargin"]').addClass('parsley-error');
			isOk = false;
		}else{
			$('.info-box [name="chargeMargin"]').removeClass('parsley-error');
			_data.chargeMargin = chargeMargin;
		}
		
		return isOk;
	}
	
	function saveBase(){
		var isOk = true; //저장여부
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분
		var pageType = $('.table_base_unit').data('page_type')
		var chargeIdx = $('.info-box').data('idx');	//정책코드
		
		var arr = new Array();
		var list = $('.table_base_unit tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			
			//정책코드 
			temp.chargeCbp = chargeIdx;
			 
			//거리
			var distanceCbp = $(item).find('[name="distanceCbp"]').val();
			temp.distanceCbp = distanceCbp;
			
			//1톤
			var tonType1 = $(item).find('[name="tonType1"]').val();
			if(tonType1 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType1 =uncomma(tonType1);
				temp.tonType1 = tonType1*1; 
			}
			
			//1.4톤
			var tonType2 = $(item).find('[name="tonType2"]').val();
			if(tonType2 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType2 =uncomma(tonType2);
				temp.tonType2 = tonType2*1; 
			}
			
			//2.5톤
			var tonType3 = $(item).find('[name="tonType3"]').val();
			if(tonType3 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType3 =uncomma(tonType3);
				temp.tonType3 = tonType3*1; 
			}
			
			//3.5톤
			var tonType4 = $(item).find('[name="tonType4"]').val();
			if(tonType4 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType4 =uncomma(tonType4);
				temp.tonType4 = tonType4*1; 
			}
			
			//5톤
			var tonType5 = $(item).find('[name="tonType5"]').val();
			if(tonType5 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType5 =uncomma(tonType5);
				temp.tonType5 = tonType5*1; 
			}
			
			//8톤
			var tonType6 = $(item).find('[name="tonType6"]').val();
			if(tonType6 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType6 =uncomma(tonType6);
				temp.tonType6 = tonType6*1; 
			}
			
			//9.5톤
			var tonType7 = $(item).find('[name="tonType7"]').val();
			if(tonType7 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType7 =uncomma(tonType7);
				temp.tonType7 = tonType7*1; 
			}
			
			//11톤
			var tonType8 = $(item).find('[name="tonType8"]').val();
			if(tonType8 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType8 =uncomma(tonType8);
				temp.tonType8 = tonType8*1; 
			}
			
			//15톤
			var tonType9 = $(item).find('[name="tonType9"]').val();
			if(tonType9 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType9 =uncomma(tonType9);
				temp.tonType9 = tonType9*1; 
			}
			
			//18톤
			var tonType10 = $(item).find('[name="tonType10"]').val();
			if(tonType10 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType10 =uncomma(tonType10);
				temp.tonType10 = tonType10*1; 
			}
			
			//22톤
			var tonType11 = $(item).find('[name="tonType11"]').val();
			if(tonType11 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType11 =uncomma(tonType11);
				temp.tonType11 = tonType11*1; 
			}
			
			//25톤
			var tonType12 = $(item).find('[name="tonType12"]').val();
			if(tonType12 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType12 =uncomma(tonType12);
				temp.tonType12 = tonType12*1; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}'
			
			//console.log(temp);
			arr.push(temp);
		});
		
		//console.log(result);
		
		if(chargeIdx == '' || !isOk){
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		//console.log(str);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/base'/>",
			data : {chargeJsonStr: str, crudType: pageType},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('기준단가 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('기준단가 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('기준단가 저장중 오류가 발생하였습니다.')
			}
		});
	}
	
	//거리별가중치 저장
	function saveDistance(){
		var isOk = true; //저장여부
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분
		var pageType = $('.table_distance').data('page_type'); 
		var chargeIdx = $('.info-box').data('idx');	//정책코드
		
		var arr = new Array();
		var list = $('.table_distance tbody tr').not('.add_default');		
		list.each(function (idx, item) {
			var temp  = {};
			 //정책코드
			temp.chargeCiw = chargeIdx;
			
			//시작
			var startCiw = $(item).find('[name="startCiw"]').val();
			if(startCiw == ''){ //시작km 없을 경우 저장안되도록 
				isOk = false;
				return false;
			}else{
				temp.startCiw = startCiw; 
			}
			
			//종료
			var endCiw = $(item).find('[name="endCiw"]').val();
			if(endCiw == ''){ //시작km 없을 경우 저장안되도록 
				isOk = false;
				return false;
			}else{
				temp.endCiw = endCiw; 
			}
			
			//가중치
			var weightCiw = $(item).find('[name="weightCiw"]').val();
			if(weightCiw == ''){ //가중치가 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				weightCiw =uncomma(weightCiw);
				temp.weightCiw = weightCiw; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}'
			//console.log(temp);
			arr.push(temp)
		});
		
		if(chargeIdx == '' || !isOk){
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		//console.log(str);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/distance'/>",
			data : {chargeJsonStr: str, crudType: pageType},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('거리별 가중치 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('거리별 가중치 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('거리별 가중치 저장중 오류가 발생하였습니다.')
			}
		});
	}
	
	//차량유형별 가중치
	function saveCarType(){
		var isOk = true; //저장여부
		var chargeIdx = $('.info-box').data('idx'); //정책코드 
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분 
		
		//차량형태		
		var carTypePageType = $('.table_cartype').data('page_type'); //C: insert, U:update
		var arr = new Array();
		var list = $('.table_cartype tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			
		 	//정책코드
			temp.chargeCctw = chargeIdx;
			
			// 구분
			var typeCctw = $(item).find('.type_cctw').html();
			temp.typeCctw = typeCctw; 
			
			//카테고리 
			var categoryCctw = $(item).find('[name="categoryCctw"]').val();
			temp.categoryCctw = categoryCctw; 
			
			//가중치
			var weightCctw = $(item).find('[name="weightCctw"]').val();
			if(weightCctw == ''){ //가중치 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				weightCctw =uncomma(weightCctw);
				temp.weightCctw = weightCctw; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}' 
			//console.log(temp);
			arr.push(temp)
		});
		
		
		//차량옵션
		var carOptionPageType = $('.table_caroption').data('page_type'); //C: insert, U:update
		var arr2 = new Array();
		var list = $('.table_caroption tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			
		 	//정책코드
			temp.chargeCcow = chargeIdx;
			
			// 구분
			var typeCcow = $(item).find('.type_ccow').html();
			temp.typeCcow = typeCcow; 
			
			//카테고리 
			var categoryCcow = $(item).find('[name="categoryCcow"]').val();
			temp.categoryCcow = categoryCcow; 
			
			//가중치
			var weightCcow = $(item).find('[name="weightCcow"]').val();
			if(weightCcow == ''){ //가중치 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				weightCcow =uncomma(weightCcow);
				temp.weightCcow = weightCcow; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}' 
			//console.log(temp);
			arr2.push(temp)
		});
		
		if(chargeIdx == '' || !isOk){ //요금정책 기본정보가 저장되어있지 않거나 빈값이 있을 경우
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		var str2 = JSON.stringify(arr2);
		
		//console.log(str);
		//console.log(str2);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/cartype'/>",
			data : {
				carTypeJsonStr: str
				, carTypeCrudType: carTypePageType
				, carOptionJsonStr : str2
				, carOptionCrudType : carOptionPageType
			},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('차량유형별 가중치 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('차량유형별 가중치 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('차량유형별 가중치 저장중 오류가 발생하였습니다.')
			}
		});
	}
	
	//유류비
	function saveOilCost(){
	var isOk = true; //저장여부
		var chargeIdx = $('.info-box').data('idx'); //정책코드 
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분 
		
		//차량형태		
		var carTypePageType = $('.table_oil_cartype').data('page_type'); //C: insert, U:update
		var arr = new Array();
		var list = $('.table_oil_cartype tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			
		 	//정책코드
			temp.chargeCctgb = chargeIdx;
			
			// 구분
			var optionCctgb = $(item).find('.option_cctgb').html();
			temp.typeCctgb = optionCctgb; 
			
			//1톤
			var tonType1 = $(item).find('[name="tonType1"]').val();
			if(tonType1 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType1 =uncomma(tonType1);
				temp.tonType1 = tonType1*1; 
			}
			
			//1.4톤
			var tonType2 = $(item).find('[name="tonType2"]').val();
			if(tonType2 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType2 =uncomma(tonType2);
				temp.tonType2 = tonType2*1; 
			}
			
			//2.5톤
			var tonType3 = $(item).find('[name="tonType3"]').val();
			if(tonType3 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType3 =uncomma(tonType3);
				temp.tonType3 = tonType3*1; 
			}
			
			//3.5톤
			var tonType4 = $(item).find('[name="tonType4"]').val();
			if(tonType4 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType4 =uncomma(tonType4);
				temp.tonType4 = tonType4*1; 
			}
			
			//5톤
			var tonType5 = $(item).find('[name="tonType5"]').val();
			if(tonType5 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType5 =uncomma(tonType5);
				temp.tonType5 = tonType5*1; 
			}
			
			//8톤
			var tonType6 = $(item).find('[name="tonType6"]').val();
			if(tonType6 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType6 =uncomma(tonType6);
				temp.tonType6 = tonType6*1; 
			}
			
			//9.5톤
			var tonType7 = $(item).find('[name="tonType7"]').val();
			if(tonType7 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType7 =uncomma(tonType7);
				temp.tonType7 = tonType7*1; 
			}
			
			//11톤
			var tonType8 = $(item).find('[name="tonType8"]').val();
			if(tonType8 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType8 =uncomma(tonType8);
				temp.tonType8 = tonType8*1; 
			}
			
			//15톤
			var tonType9 = $(item).find('[name="tonType9"]').val();
			if(tonType9 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType9 =uncomma(tonType9);
				temp.tonType9 = tonType9*1; 
			}
			
			//18톤
			var tonType10 = $(item).find('[name="tonType10"]').val();
			if(tonType10 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType10 =uncomma(tonType10);
				temp.tonType10 = tonType10*1; 
			}
			
			//22톤
			var tonType11 = $(item).find('[name="tonType11"]').val();
			if(tonType11 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType11 =uncomma(tonType11);
				temp.tonType11 = tonType11*1; 
			}
			
			//25톤
			var tonType12 = $(item).find('[name="tonType12"]').val();
			if(tonType12 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType12 =uncomma(tonType12);
				temp.tonType12 = tonType12*1; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}' 
			//console.log(arr);
			arr.push(temp)
		});
		
		
		//차량옵션
		var carOptionPageType = $('.table_oil_caroption').data('page_type'); //C: insert, U:update
		var arr2 = new Array();
		var list = $('.table_oil_caroption tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			
		 	//정책코드
			temp.chargeCcogb = chargeIdx;
			
			// 구분
			var optionCcogb = $(item).find('.option_ccogb').html();
			temp.optionCcogb = optionCcogb; 
			
			//1톤
			var tonType1 = $(item).find('[name="tonType1"]').val();
			if(tonType1 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType1 =uncomma(tonType1);
				temp.tonType1 = tonType1*1; 
			}
			
			//1.4톤
			var tonType2 = $(item).find('[name="tonType2"]').val();
			if(tonType2 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType2 =uncomma(tonType2);
				temp.tonType2 = tonType2*1; 
			}
			
			//2.5톤
			var tonType3 = $(item).find('[name="tonType3"]').val();
			if(tonType3 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType3 =uncomma(tonType3);
				temp.tonType3 = tonType3*1; 
			}
			
			//3.5톤
			var tonType4 = $(item).find('[name="tonType4"]').val();
			if(tonType4 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType4 =uncomma(tonType4);
				temp.tonType4 = tonType4*1; 
			}
			
			//5톤
			var tonType5 = $(item).find('[name="tonType5"]').val();
			if(tonType5 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType5 =uncomma(tonType5);
				temp.tonType5 = tonType5*1; 
			}
			
			//8톤
			var tonType6 = $(item).find('[name="tonType6"]').val();
			if(tonType6 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType6 =uncomma(tonType6);
				temp.tonType6 = tonType6*1; 
			}
			
			//9.5톤
			var tonType7 = $(item).find('[name="tonType7"]').val();
			if(tonType7 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType7 =uncomma(tonType7);
				temp.tonType7 = tonType7*1; 
			}
			
			//11톤
			var tonType8 = $(item).find('[name="tonType8"]').val();
			if(tonType8 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType8 =uncomma(tonType8);
				temp.tonType8 = tonType8*1; 
			}
			
			//15톤
			var tonType9 = $(item).find('[name="tonType9"]').val();
			if(tonType9 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType9 =uncomma(tonType9);
				temp.tonType9 = tonType9*1; 
			}
			
			//18톤
			var tonType10 = $(item).find('[name="tonType10"]').val();
			if(tonType10 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType10 =uncomma(tonType10);
				temp.tonType10 = tonType10*1; 
			}
			
			//22톤
			var tonType11 = $(item).find('[name="tonType11"]').val();
			if(tonType11 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType11 =uncomma(tonType11);
				temp.tonType11 = tonType11*1; 
			}
			
			//25톤
			var tonType12 = $(item).find('[name="tonType12"]').val();
			if(tonType12 == ''){ //금액이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				tonType12 =uncomma(tonType12);
				temp.tonType12 = tonType12*1; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}' 
			//console.log(temp);
			arr2.push(temp)
		});
		
		if(chargeIdx == '' || !isOk){ //요금정책 기본정보가 저장되어있지 않거나 빈값이 있을 경우
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		var str2 = JSON.stringify(arr2);
		
		//console.log(str);
		//console.log(str2);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/oilcost'/>",
			data : {
				carTypeJsonStr: str
				, carTypeCrudType: carTypePageType
				, carOptionJsonStr : str2
				, carOptionCrudType : carOptionPageType
			},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('유류비 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('유류비 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('유류비 저장중 오류가 발생하였습니다.')
			}
		});
	}
	
	//지역별 가중치 저장
	function saveArea(){
		var isOk = true; //저장여부
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분 
		var pageType = $('.table_area').data('page_type'); //C: insert, U:update
		var chargeIdx = $('.info-box').data('idx'); //정책코드 

		var arr = new Array();
		var list = $('.table_area tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			
			if(!$.isEmptyObject($(item).data('option_clw'))){
			 	//정책코드
				temp.chargeClw = chargeIdx;
				
				// 구분
				var typeClw = $(item).data('type_clw');
				temp.typeClw = typeClw; 
				
				//지역
				var optionClw = $(item).data('option_clw');
				temp.optionClw = optionClw; 
				
				//가중치
				var weightClw = $(item).find('[name="weightClw"]').val();
				if(weightClw == ''){ //가중치 빈값일 경우 저장 안되도록 처리
					isOk = false;
					return false;
				}else{
					weightClw =uncomma(weightClw);
					temp.weightClw = weightClw; 
				}
						
				//작업자
				temp.workerId = '${User.adminId}' 
				//console.log(temp);
				arr.push(temp)
			}
		});
		
		if(chargeIdx == '' || !isOk){ //요금정책 기본정보가 저장되어있지 않거나 빈값이 있을 경우
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		//console.log(str);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/area'/>",
			data : {chargeJsonStr: str, crudType: pageType},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(data)
				if(result.succCnt > 0){
					alert('지역별 가중치 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('지역별 가중치 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('지역별 가중치 저장중 오류가 발생하였습니다.')
			}
		});
	}

	//익일하차가중치 저장
	function saveNextDayDrop(){
		var isOk = true; //저장여부
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분 
		var pageType = $('.table_nextdaydrop').data('page_type'); //C: insert, U:update
		var chargeIdx = $('.info-box').data('idx'); //정책코드 

		var arr = new Array();
		var list = $('.table_nextdaydrop tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			
		 	//정책코드
			temp.chargeCodw = chargeIdx;
			
			// 구분
			var typeCodw = $(item).find('.type_codw').html();
			temp.typeCodw = typeCodw; 
			
			//가중치
			var weightCodw = $(item).find('[name="weightCodw"]').val();
			if(weightCodw == ''){ //가중치 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				weightCodw =uncomma(weightCodw);
				temp.weightCodw = weightCodw; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}' 
			//console.log(temp);
			arr.push(temp)
		});
		
		if(chargeIdx == '' || !isOk){ //요금정책 기본정보가 저장되어있지 않거나 빈값이 있을 경우
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		//console.log(str);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/nextdaydrop'/>",
			data : {chargeJsonStr: str, crudType: pageType},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('익일하차 가중치 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('익일하차 가중치 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('익일하차 가중치 저장중 오류가 발생하였습니다.')
			}
		});
	}
	
	//상/하차수작업비용 저장
	function saveManualCost(){
		var isOk = true; //저장여부
		var tab = $('.nav-tabs .active').data('tab_type');	//탭구분
		var pageType = $('.table_manualcost').data('page_type'); //C: insert, U:update
		var chargeIdx = $('.info-box').data('idx');	//정책코드
		
		var arr = new Array();
		var list = $('.table_manualcost tbody tr');
		list.each(function (idx, item) {
			var temp  = {};
			//정책코드
			temp.chargeChmc = chargeIdx; 
			
			// 구분
			var typeChmc = $(item).find('.type_chmc').html();
			temp.typeChmc = typeChmc;
			
			//상차지
			var upCostChmc = $(item).find('[name="upCostChmc"]').val();
			if(upCostChmc == ''){ //상차지 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				upCostChmc =uncomma(upCostChmc);
				temp.upCostChmc = upCostChmc; 
			}
			
			//하차지
			var downCostChmc = $(item).find('[name="downCostChmc"]').val();
			if(downCostChmc == ''){ //하차지 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				downCostChmc =uncomma(downCostChmc);
				temp.downCostChmc = downCostChmc;
			}
			//상/하차지
			var handMadeCostChmc = $(item).find('[name="handMadeCostChmc"]').val();
			if(handMadeCostChmc == ''){ //상/하차지 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				handMadeCostChmc =uncomma(handMadeCostChmc);
				temp.handMadeCostChmc = handMadeCostChmc; 
			}
			//작업자
			temp.workerId = '${User.adminId}' 
			//console.log(temp);
			arr.push(temp)
		});
		
		if(chargeIdx == '' || !isOk){
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		//console.log(str);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/manualcost'/>",
			data : {chargeJsonStr: str, crudType: pageType},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('상/하차 수작업 비용 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('상/하차 수작업 비용 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('상/하차 수작업 비용 저장중 오류가 발생하였습니다.')
			}
		});
	}
	
	function saveEmergency(){
		var isOk = true; //저장여부
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분
		var pageType = $('.table_emergency').data('page_type'); 
		var chargeIdx = $('.info-box').data('idx');	//정책코드
		
		var arr = new Array();
		var list = $('.table_emergency tbody tr');		
		list.each(function (idx, item) {
			var temp  = {};
			 //정책코드
			temp.chargeCefw = chargeIdx;
			
			// 구분
			var typeCefw = $(item).find('.type_cefw').html();
			temp.typeCefw = typeCefw; 
			
			//가중치
			var weightCefw = $(item).find('[name="weightCefw"]').val();
			if(weightCefw == ''){ //가중치가 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				weightCefw =uncomma(weightCefw);
				temp.weightCefw = weightCefw; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}'
			//console.log(temp);
			arr.push(temp)
		});
		
		if(chargeIdx == '' || !isOk){
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		//console.log(str);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/emergency'/>",
			data : {chargeJsonStr: str, crudType: pageType},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('긴급화물 가중치 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('긴급화물 가중치 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('긴급화물 가중치 저장중 오류가 발생하였습니다.')
			}
		});
	}
	
	
	function saveWokingTime(){
		var isOk = true; //저장여부
		var tab = $('.nav-tabs .active').data('tab_type'); //탭구분
		var pageType = $('.table_workingtime').data('page_type');
		var chargeIdx = $('.info-box').data('idx'); //정책코드 
		
		var arr = new Array();
		var list = $('.table_workingtime tbody tr').not('.work_default');		
		list.each(function (idx, item) {
			var temp  = {};
			 //정책코드
			temp.chargeChw = chargeIdx;
			
			// 구분
			var typeChw = $(item).find('.type_chw').html();
			if(typeChw != '주말/공휴일' && typeChw != '심야작업'){
				typeChw = $(item).find('.type_chw .workName').val();
			}
			
			if(typeChw  == ''){ //구분값이 없을 경우 저장안되도록
				isOk = false;
				return false;
			}else{
				temp.typeChw = typeChw; 
			}
			
			//날짜
			if(typeChw == '주말/공휴일' || typeChw == '심야작업'){
				temp.startDate = '9999-12-31';
				temp.endDate = '9999-12-31';
			}else{ //행추가 했을 경우
				var workApplyDate = $(item).find('.workApplyDate').val(); 
				
				if(workApplyDate == ''){
					isOk = false;
					return false;
				}else{
					var workApplyDateArr = workApplyDate.split(' ~ ');
					//시작일
					var start = new Date(workApplyDateArr[0]).format('yyyy-MM-dd');
					temp.startDate = start;
				
					//종료일
					if(workApplyDateArr[1] == undefined){ //종료일이 없을 경우 
						temp.endDate = start;
					}else{
						var end = new Date(workApplyDateArr[1]).format('yyyy-MM-dd')
						temp.endDate = end;
					}
				}
			}
			
			//가중치
			var weightChw = $(item).find('[name="weightChw"]').val();
			if(weightChw == ''){ //가중치가 빈값일 경우 저장 안되도록 처리
				isOk = false;
				return false;
			}else{
				weightChw =uncomma(weightChw);
				temp.weightChw = weightChw; 
			}
			
			//작업자
			temp.workerId = '${User.adminId}'
			//console.log(isOk, temp);
			arr.push(temp);
		});
		
		if(chargeIdx == '' || !isOk){
			alert('입력하지 않은 요금정보가 있습니다. 요금정보를 입력해주세요.');
			return;
		};

		var str = JSON.stringify(arr);
		//console.log(str);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/charge/save/wokingtime'/>",
			data : {chargeJsonStr: str, crudType: pageType},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result)
				if(result.succCnt > 0){
					alert('작업시간별 가중치 저장하였습니다.');
					loadEditTabType(chargeIdx, tab);
				}else{
					alert('작업시간별 가중치 저장중 오류가 발생하였습니다.')
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('작업시간별 가중치 저장중 오류가 발생하였습니다.')
			}
		});
	}
</script>