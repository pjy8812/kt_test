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
		<div class="contents">
		</div>
	</div>
</div>
<!-- End page -->

<div id="modal"></div>

<script>

	const today = new Date().setHours(0,0,0,0);
	const startToday = (new Date(today)).fp_incr(-30)
	
	let data = {
		pageIndex : 1
		, settlementStartDate : startToday
		, settlementEndDate : today
		/* , settlementDepositStateDate : new Date()
		, settlementDepositEndDate : (new Date()).fp_incr(-6)
		, settlementCompleteStartDate : new Date()
		, settlementCompleteEndDate : (new Date()).fp_incr(-6) */
		, detailPageIndex : 1
		, maskingYn : 'Y'
	}
	
	let detailData = {
		freightOwnerSettlementId : null
	}
	
	var searchedData = {};
	
	let flag = {
		listFormLoaded : false	
		, dtailFormLoaded : false
	}
	
	//조회
	function searchList(){
		
		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#list/', '');
		
		if (queryString === currentUri){
			loadList(getData());
		} else {
			routie('list/' + queryString);
		}
	}
	
	// 검색 폼 
	function loadListForm(_object) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/frg/search'/>",
			data : {
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
		if(_object.pickerType === 'complete') {
			_object.settlementCompleteStartDate = new Date(_object.settlementStartDate).getTime();
			_object.settlementCompleteEndDate = new Date(_object.settlementEndDate).addDays(1).getTime() -1;
		} else if(_object.pickerType === 'deposit') {
			_object.settlementDepositStartDate = new Date(_object.settlementStartDate).getTime();
			_object.settlementDepositEndDate = new Date(_object.settlementEndDate).addDays(1).getTime() -1;
		}
		
		delete _object.settlementStartDate;
		delete _object.settlementEndDate;
		delete _object.pickerType;
		delete _object.detailPageIndex; // 불필요
		
		/* _object.settlementDepositStateDate = new Date(_object.settlementDepositStateDate).getTime();
		_object.settlementDepositEndDate = new Date(_object.settlementDepositEndDate).getTime();
		_object.settlementCompleteStartDate = new Date(_object.settlementCompleteStartDate).getTime();
		_object.settlementCompleteEndDate = new Date(_object.settlementCompleteEndDate).getTime(); */
		
		// delete _object.settlementDepositStateDate; // 확인필요
		// delete _object.settlementDepositEndDate; // 확인필요 
		
		searchedData = {};
		searchedData = _object;
		
		_object.maskingYn = data.maskingYn;
		
		/* var tdata = {
			pageIndex : 1
		}; */
		
		// 목록 로드 
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/frg/list'/>",
			data : JSON.stringify(_object),
			/* data : {
				'pageIndex' : data.pageIndex
			}, */
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
			url : "<c:url value='/ui/service/settlement/frg/detail/'/>" + _id + '/' + _detailPageIndex,
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
		
		// 구분/유형
		if($('[name="freightOwnerType"]').val() !== 'all') {
			object.freightOwnerType = $('[name="freightOwnerType"]').val();
		}

		if($('[name="freightMemberType"]').val() !== 'all') {
			object.freightMemberType = $('[name="freightMemberType"]').val();
		}
		
		if($('[name="freightBusinessType"]').val() !== 'all') {
			object.freightBusinessType = $('[name="freightBusinessType"]').val();
		}
		
		// 정산상태 
		if($('[name="freightOwnerSettlementStatus"]').val() !== 'all') {
			object.freightOwnerSettlementStatus = $('[name="freightOwnerSettlementStatus"]').val();
		}
		
		// 월정산횟수 
		if($('[name="freightOwnerMonthSettlementNum"]').val() !== 'all') {
			object.freightOwnerMonthSettlementNum = $('[name="freightOwnerMonthSettlementNum"]').val();
		}
		
		// 검색어 
		if($('[name="searchText"]').val() !== '') {
			object.searchType = $('[name="searchType"]').val();
			object.searchText = $('[name="searchText"]').val();
		} else {
			delete object.searchType;
			delete object.searchText;
		}
		
		if($('[name="freightOwnerSettlementStatus"]').val() !== 'settlementStandby') {
			// 정산발생일/입금완료일 
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
		
		/* object.settlementDepositStateDate = data.settlementDepositStateDate;
		object.settlementDepositEndDate = data.settlementDepositEndDate;
		object.settlementCompleteStartDate = data.settlementCompleteStartDate;
		object.settlementCompleteEndDate = data.settlementCompleteEndDate; */
		
		return object;
	}
	
	function setData(_object) {
		
		if (_object == null) {
			return;
		}
		
		if (_object.freightOwnerType !== undefined && _object.freightOwnerType !== '') {
			$('[name="freightOwnerType"]').val(_object.freightOwnerType);
		} else {
			$('[name="freightOwnerType"]').val('all');
		}

		if (_object.freightMemberType !== undefined && _object.freightMemberType !== '') {
			$('[name="freightMemberType"]').val(_object.freightMemberType);
		} else {
			$('[name="freightMemberType"]').val('all');
		}
		
		if (_object.freightBusinessType !== undefined && _object.freightBusinessType !== '') {
			$('[name="freightBusinessType"]').val(_object.freightBusinessType);
		} else {
			$('[name="freightBusinessType"]').val('all');
		}
		
		if (_object.freightOwnerSettlementStatus !== undefined && _object.freightOwnerSettlementStatus !== '') {
			$('[name="freightOwnerSettlementStatus"]').val(_object.freightOwnerSettlementStatus);
		} else {
			$('[name="freightOwnerSettlementStatus"]').val('all');
		}
		
		if (_object.freightOwnerMonthSettlementNum !== undefined && _object.freightOwnerMonthSettlementNum !== '') {
			$('[name="freightOwnerMonthSettlementNum"]').val(_object.freightOwnerMonthSettlementNum);
		} else {
			$('[name="freightOwnerMonthSettlementNum"]').val('all');
		}
		
		if (_object.searchType !== undefined && _object.searchType !== '') {
			$('[name="searchType"]').val(_object.searchType);
		} else {
			$('[name="searchType"] option:first').attr('selected', true);
		}
		
		if (_object.searchText !== undefined && _object.searchText !== '') {
			$('[name="searchText"]').val(_object.searchText);
		} else {
			$('[name="searchText"]').val('');
		}
		
		if(_object.pickerType !== undefined && _object.pickerType !== '') {
			$('[name="pickerType"]').val(_object.pickerType);
		}
		
		if (_object.settlementStartDate !== undefined && _object.settlementStartDate !== ''
			&& _object.settlementEndDate !== undefined && _object.settlementEndDate !== '') {
			
			data.settlementStartDate = _object.settlementStartDate;
			data.settlementEndDate = _object.settlementEndDate;
		}
		
		/* if (_object.settlementDepositStateDate !== undefined && _object.settlementDepositStateDate !== ''
				&& _object.settlementDepositEndDate !== undefined && _object.settlementDepositEndDate !== '') {
			data.settlementDepositStateDate = _object.settlementDepositStateDate;
			data.settlementDepositEndDate = _object.settlementDepositEndDate;
			
			// settlementDepositPicker.setDate([data.settlementDepositStateDate, data.settlementDepositEndDate]);
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
			'list/:_queryString' : function(_queryString) {
				var object = deJsonString(_queryString);

				setData(object);
				
				if(!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
			},
			'detail/:_id/:_pageIndex' : function(_id, _pageIndex) {
				
				data.detailPageIndex = _pageIndex;
				
				if(isNaN(_pageIndex)) {
					data.detailPageIndex = 1;
				} else {
					if (data.detailPageIndex != _pageIndex) {
						data.maskingYn = 'Y';
					}						
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
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave',
	  function(e) {
		var maskingType = $('#popupUnmaskingReason').data('param_type');
		
	    if(maskingType.indexOf('Excel') > -1){
	    	unmask('excel');
	    } else if(maskingType.indexOf('List') > -1){
	    	unmask('list');
	    } else {
	    	unmask();
	    }
	});
	
	function unmask(str) {
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
			            if(str == 'list'){
							data.maskingYn = 'N';
			                loadList(getData());
			            } else if (str == 'excel'){
			            	excelDownload();
			            } else {
			            	data.maskingYn = 'N';
							loadDetail(detailData.freightOwnerSettlementId, data.detailPageIndex);
			            }
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
			routie('list/' + encodeURIComponent(JSON.stringify(getData())));
		}
	})

</script>
