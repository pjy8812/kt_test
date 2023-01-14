<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin page -->
<div class="row">
	<div class="col-12">
		<div class="contents"></div>
	</div>
</div>
<!-- End page -->

<div id="modal"></div>

<script>

	// console.log('${profiles}');
	// console.log("== !orgPath ==");
	
	const today = new Date().setHours(0,0,0,0);
	const todayLast = new Date(new Date().addDays(1).setHours(0,0,0,0)).getTime() -1;

	const startToday = (new Date(today)).fp_incr(-30)
	
	let data = {
		pageIndex : 1
		, settlementStartDate : startToday
		, settlementEndDate : today
		/* , settlementDepositStartDate : (new Date()).fp_incr(-30)
		, settlementDepositEndDate : new Date()
		, settlementCompleteStartDate : (new Date()).fp_incr(-30)
		, settlementCompleteEndDate : new Date() */
		, detailPageIndex : 1
		, maskingYn : 'Y'
		, pageType : 'settlement'
	}
	
	let detailData = {
		carOwnerSettlementId : null
	}
	
	var searchedData = {};
	
	let flag = {
		listFormLoaded : false	
		, dtailFormLoaded : false
	}
	
	// 조회
	function searchList(){
		
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#list/settlement/', '');

		if (queryString === currentUri){
			loadList(getData());
		} else {
			routie('list/' + data.pageType + '/' + queryString);
		}
	}
	
	// 검색 폼 
	function loadListForm(_object) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/car/search'/>",
			data : {
				pageType : data.pageType
			},
			cache : false,
			async : false,
			success : function(resultData, textStatus, XMLHttpRequest) {
				$('.contents').html(resultData);
				flag.listFormLoaded = true;
				flag.dtailFormLoaded = false;
				
				if(_object != null) {
					setData(_object);
				}
				
				loadList(_object);
				// searchList();
				
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
		
		if(data.pageType === 'order') {
			// 주문건별조회 
			if(_object.pickerType === 'complete') {
				_object.settlementCompleteStartDate = new Date(_object.settlementStartDate).getTime();
				_object.settlementCompleteEndDate = new Date(_object.settlementEndDate).addDays(1).getTime() -1;
			} else if(_object.pickerType === 'deposit') {
				_object.settlementDepositStartDate = new Date(_object.settlementStartDate).getTime();
				_object.settlementDepositEndDate = new Date(_object.settlementEndDate).addDays(1).getTime() -1;
			}
		} else {
			// 정산건별조회 
			if(_object.pickerType === 'complete') {
				_object.settlementCompleteStartDate = new Date(_object.settlementStartDate).getTime();
				_object.settlementCompleteEndDate = new Date(_object.settlementEndDate).addDays(1).getTime() -1;
			} else if(_object.pickerType === 'deposit') {
				_object.settlementDepositStartDate = new Date(_object.settlementStartDate).getTime();
				_object.settlementDepositEndDate = new Date(_object.settlementEndDate).addDays(1).getTime() -1;
			}
		}
		
		delete _object.settlementStartDate;
		delete _object.settlementEndDate;
		delete _object.pickerType;
		delete _object.detailPageIndex;
		
		/* _object.settlementDepositStartDate = new Date(_object.settlementDepositStartDate).getTime();
		_object.settlementDepositEndDate = new Date(_object.settlementDepositEndDate).getTime();
		_object.settlementCompleteStartDate = new Date(_object.settlementCompleteStartDate).getTime();
		_object.settlementCompleteEndDate = new Date(_object.settlementCompleteEndDate).getTime(); */
		
		// search test 
		/* var tdata = {
			pageIndex : data.pageIndex
			, searchText : _object.searchText
			, searchType : _object.searchType
			, settlementCompleteStartDate : new Date(_object.settlementCompleteStartDate).getTime()
			, settlementCompleteEndDate : new Date(_object.settlementCompleteEndDate).getTime()
			, settlementDepositStartDate : new Date(_object.settlementDepositStartDate).getTime()
			, settlementDepositEndDate : new Date(_object.settlementDepositEndDate).getTime()
		}; */
		
		// delete _object.settlementCompleteStartDate;
		// delete _object.settlementCompleteEndDate;
		// delete _object.settlementDepositStartDate; // 확인필요
		// delete _object.settlementDepositEndDate; // 확인필요 
		// delete _object.detailPageIndex; // 불필요

		searchedData = {};
		searchedData = _object;
		
		// 목록 로드
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/car/list'/>",
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
	
	function loadDetail(_id, _detailPageIndex) {
		
		flag.listFormLoaded = false;
		
		if(_id === null || _id === '' || _detailPageIndex === null || _detailPageIndex === '') {
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/car/detail/'/>" + _id + '/' + _detailPageIndex,
			data : {
				maskingYn : data.maskingYn
			},
			cache : false,
			async : false,
			success : function(result, textStatus, XMLHttpRequest) {
				if (hasErrorMap(result, true)) {
					return;
				}
				
				$(".contents").html(result);
				flag.dtailFormLoaded = true;
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
		object.pageType = data.pageType;
		
		// 정산상태
		if($('[name="carOwnerSettlementStatus"]').val() !== 'all') {
			object.carOwnerSettlementStatus = $('[name="carOwnerSettlementStatus"]').val();
		} else {
			delete object.carOwnerSettlementStatus;
		}

		// 검색어 
		if($('[name="searchText"]').val() !== '') {
			object.searchType = $('[name="searchType"]').val();
			object.searchText = $('[name="searchText"]').val();
		} else {
			delete object.searchType;
			delete object.searchText;
		}
		
		// 정산발생일/입금완료일 
		if($('#carOwnerSettlementStatus').val() !== 'settlementStandby') {
			object.pickerType = $('[name="pickerType"]').val();
			object.settlementStartDate = data.settlementStartDate;
			object.settlementEndDate = data.settlementEndDate;
		}

		/* if($('[name="pickerType"]').val() === 'complete') {
			object.settlementCompleteStartDate = data.settlementStartDate;
			object.settlementCompleteEndDate = data.settlementEndDate;
		} else if($('[name="pickerType"]').val() === 'deposit') {
			object.settlementDepositStartDate = data.settlementStartDate;
			object.settlementDepositEndDate = data.settlementEndDate;
		} */
			
		/* object.settlementDepositStartDate = data.settlementDepositStartDate;
		object.settlementDepositEndDate = data.settlementDepositEndDate;
		object.settlementCompleteStartDate = data.settlementCompleteStartDate;
		object.settlementCompleteEndDate = data.settlementCompleteEndDate; */
		
		return object;
	}
	
	function setData(_object) {
		
		if (_object == null) {
			return;
		}
		
		if (_object.carOwnerSettlementStatus !== undefined && _object.carOwnerSettlementStatus !== '' && _object.carOwnerSettlementStatus !== null) {
			$('[name="carOwnerSettlementStatus"]').val(_object.carOwnerSettlementStatus);
		} else {
			$('[name="carOwnerSettlementStatus"]').val('all');
		}

		if (_object.searchType !== undefined && _object.searchType !== '') {
			$('[name="searchType"]').val(_object.searchType);
		} else {
			$('[name="searchType"] option:first').attr('selected', true)
		}
		
		if (_object.searchText !== undefined && _object.searchText !== '') {
			$('[name="searchText"]').val(_object.searchText);
		} else {
			$('[name="searchText"]').val('');
		}
		
		if (_object.pickerType !== undefined && _object.pickerType !== '') {
			$('[name="pickerType"]').val(_object.pickerType);
		} else {
			$('[name="pickerType"] option:first').attr('selected', true)
		}
		
		if (_object.settlementStartDate !== undefined && _object.settlementStartDate !== ''
			&& _object.settlementEndDate !== undefined && _object.settlementEndDate !== '') {
			
			data.settlementStartDate = _object.settlementStartDate;
			data.settlementEndDate = _object.settlementEndDate;
		}
		
		/* if (_object.settlementDepositStartDate !== undefined && _object.settlementDepositStartDate !== ''
				&& _object.settlementDepositEndDate !== undefined && _object.settlementDepositEndDate !== '') {
			data.settlementDepositStartDate = _object.settlementDepositStartDate;
			data.settlementDepositEndDate = _object.settlementDepositEndDate;
			
			// settlementDepositPicker.setDate([data.settlementDepositStartDate, data.settlementDepositEndDate]);
		} 
		
		if (_object.settlementCompleteStartDate !== undefined && _object.settlementCompleteStartDate !== ''
				&& _object.settlementCompleteEndDate !== undefined && _object.settlementCompleteEndDate !== '') {
			data.settlementCompleteStartDate = _object.settlementCompleteStartDate;
			data.settlementCompleteEndDate = _object.settlementCompleteEndDate;
			
			// settlementDepositPicker.setDate([data.settlementCompleteStartDate, data.settlementCompleteEndDate]);
		} */
	}

	function initEvent() {
		data.maskingYn = 'Y';
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
			'list/:_type/:_queryString' : function(_type, _queryString) {
				
				data.pageType = _type;
				
				var object = deJsonString(_queryString);
				setData(object);
				
				if(!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
				
			},
			'detail/:_id/:_pageIndex' : function(_id, _pageIndex) {

				if(isNaN(_pageIndex)) {
					data.detailPageIndex = 1;
				} else {
					data.detailPageIndex = _pageIndex;
				}
				
				/* if(flag.dtailFormLoaded) {
					loadDetailList(data.detailPageIndex);
				} else { */
					loadDetail(_id, _pageIndex);
				// }
			}
		})
	}
	
	// 마스킹해제사유 등록
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
		unmask();
	});
	
	function unmask(){
		var type = $('#popupUnmaskingReason').data('param_type');
		var reason =  $('#unmaskingReason').val();
		
		if(reason == '' || reason.trim() == '') {
			alert("마스킹 해제 사유를 입력해주세요.");
		} else {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/common/unmasking'/>",
				data : {
					"maskingHistoryType" : type
					, "maskingHistoryReason" : reason
				},
				cache : false,
				async : false,
				beforeSend: function( xhr ) {
					$('#popupUnmaskingReason').modal('hide');	
				},
				success : function(resultData, textStatus, XMLHttpRequest) {
					if (hasErrorMap(resultData, true)) {
						return;
					}
					
			    	if(resultData.error != null) {
						alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: ' + resultData.error);
					} else if(resultData.resultCode == null) {
						alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: ' + resultData.code);
					} else if(resultData.resultCode == '00000') {
		 				data.maskingYn = 'N';
		 				$('.modal-backdrop').remove();
		 				loadDetail(detailData.carOwnerSettlementId, 1);
					} else if(resultData.resultCode == '00001') {
						alert(resultData.resultMsg);
						$('#unmaskingReason').focus();
					} else {
						alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: ' + resultData.resultMsg);
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
	
	$(document).ready(function() {
		
		initEvent();
		initRoutie();
		
		if(location.hash === '') {
			routie('list/' + data.pageType + '/' + encodeURIComponent(JSON.stringify(getData())));
		}
	})

</script>
