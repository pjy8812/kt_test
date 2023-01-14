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

<!-- modal-full-width -->
<div id="detailModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">선지급 정산 상세</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				
			</div>
		</div>
	</div>
</div>

<div id="modal"></div>

<script>
	
	// console.log('${profiles}');
	// console.log("== orgPath ==");
	
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
		var currentUri = location.hash.replace('#list/'+ data.pageType + '/', '');

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
		
		if (_object.pickerType === undefined) {
			_object.pickerType = 'complete';
		}
		
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
		

		searchedData = {};
		searchedData = _object;

		_object.maskingYn = data.maskingYn;
		
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
	
	// 상세 페이지 
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
		}	else {
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
	
	// 정산 발생일 기준 익일 10시 50분 이전인지 체크 
	function checkTime(_dataDateEl) {
		
		if($(_dataDateEl).data('date') === undefined || $(_dataDateEl).data('date') === '') {
			// console.log('정산발생일 is undefined.');
			return false;
		} 
		
		var now = new Date().getTime();
		
		var targetDateTime = new Date(new Date($(_dataDateEl).data('date'))).getTime();
		var targetDate = new Date(new Date($(_dataDateEl).data('date')).setHours(0,0,0,0)).getTime();
		
		var diffHour = 24 + 10; // 익일 10시  
		var diffMin = 50; // 50분   
		var diffMillsc = (diffHour) * 60 * 60 * 1000 + ((diffMin) * 60 * 1000) ;
		
		var toggleTime = new Date(targetDate + diffMillsc).getTime();
		
		// 하차시간 이상이고 토클시간 미만 
		return (targetDateTime <= now) && (now < toggleTime);
	}
	
	// 정산 발생일 기준 익일 10시 50분 이후 인지 체크  
	function checkTimeOut(_dataDateEl) {
		
		if($(_dataDateEl).data('date') === undefined || $(_dataDateEl).data('date') === '') {
			// console.log('정산발생일 is undefined.');
			return false;
		} 
		
		var now = new Date().getTime();
		
		var targetDateTime = new Date(new Date($(_dataDateEl).data('date'))).getTime();
		var targetDate = new Date(new Date($(_dataDateEl).data('date')).setHours(0,0,0,0)).getTime();
		
		var diffHour = 24 + 10; // 익일 10시  
		var diffMin = 50; // 50분   
		var diffMillsc = (diffHour) * 60 * 60 * 1000 + ((diffMin) * 60 * 1000) ;
		
		var toggleTime = new Date(targetDate + diffMillsc).getTime();
		
		// 토글시간 이후  
		return (now > toggleTime); // 당일 11시 전(10시 50분)이후 
	}
	
	// 승인취소일 기준 30일 이전인지 체크 
	function checkCancelTime(_dataDateEl) {
		
		if($(_dataDateEl).data('cancel-date') === undefined || $(_dataDateEl).data('cancel-date') === '') {
			// console.log('승인취소일 is undefined.');
			return false;
		} 
		
		var now = new Date().getTime();
		
		var targetDateTime = new Date(new Date($(_dataDateEl).data('cancel-date'))).getTime();
		var targetDate = new Date(new Date($(_dataDateEl).data('cancel-date')).setHours(0,0,0,0)).getTime();
		
		var diffHour = 24 * 30; // 30일 
		var diffMin = 0; // 0분   
		var diffMillsc = (diffHour) * 60 * 60 * 1000 + ((diffMin) * 60 * 1000) ;
		
		var toggleTime = new Date(targetDate + diffMillsc).getTime();
		
		return (now < toggleTime); // 기준시간 미만 
	}
	
	// 승인취소 
	function cancelSettlement(_el) {
		
		// carOwnerId
		var ownerId = $(_el).data('owner-id') === undefined ? null : $(_el).data('owner-id');
		if(ownerId === undefined || ownerId === null || ownerId === '') {
			alert('차주정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementId
		var settlementId = $(_el).data('settlement-id') === undefined ? null : $(_el).data('settlement-id');
		if(settlementId === undefined || settlementId === null || settlementId === '') {
			alert('정산정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementOrderId 
		var orderId = $(_el).data('order-id') === undefined ? null : $(_el).data('order-id');
		if(orderId === undefined || orderId === null || orderId === '') {
			alert('주문정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementState 
		var state = $(_el).data('settlement-state') === undefined ? null : $(_el).data('settlement-state');
		if(state === undefined || state === null || state === '') {
			alert('주문상태가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementRootId 
		var rootId = $(_el).data('root-settlement-id') === undefined ? null : $(_el).data('root-settlement-id');
		if(rootId === undefined || rootId === null || rootId === '') {
			alert('차주 정산정보가 유효하지 않습니다.');
			return false;
		}
		
		if($(_el).hasClass('needsTimeCheck')) {
			// 취소 가능한 시간 (익일 10시 50분 미만) 체크 
			if(!checkTime(_el)) {
				alert('취소 가능한 시간이 아닙니다.');
				toggleStatusBtn();
				return false;
			}
		}
		
		if(confirm('해당 건을 승인취소하여 정산에서 제외하시겠습니까?')) {
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/settlement/car/cancel/settlement'/>",
				data : {
					carOwnerId : ownerId
					, carOwnerSettlementId : settlementId
					, carOwnerSettlementOrderId : orderId
					, carOwnerSettlementState : state
					, carOwnerSettlementRootId : rootId
				},
				cache : false,
				async : true,
				success : function(resultData, textStatus, XMLHttpRequest) {
					if(resultData.resultCode === '00000') {
						alert('취소되었습니다.');
						location.reload();
					} else if(resultData.resultCode === '00009') {
						alert('취소에 실패하였습니다.');
					} else {
						alert('승인취소 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(resultData));
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
		} else {
			// 버튼 새로고침 
			toggleStatusBtn();
		}
	}
	
	// 승인취소 재승인 
	function reapproveSettlement(_el, _reapproveType) {
		
		// _reapproveType === 1 : 승인 취소건 재승인 처리  
		// _reapproveType === 2 : 승인 취소건 새로운 정산 ID 생산하여 재승인 처리 

		// carOwnerId
		var ownerId = $(_el).data('owner-id') === undefined ? null : $(_el).data('owner-id');
		if(ownerId === undefined || ownerId === null || ownerId === '') {
			alert('차주정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementId
		var settlementId = $(_el).data('settlement-id') === undefined ? null : $(_el).data('settlement-id');
		if(settlementId === undefined || settlementId === null || settlementId === '') {
			alert('정산정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementOrderId 
		var orderId = $(_el).data('order-id') === undefined ? null : $(_el).data('order-id');
		if(orderId === undefined || orderId === null || orderId === '') {
			alert('주문정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementOrderNumber 
		var ordeNum = $(_el).data('order-num') === undefined ? null : $(_el).data('order-num');
		if(_reapproveType === 2 && (ordeNum === undefined || ordeNum === null || ordeNum === '')) {
			alert('주문번호가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementState 
		var state = $(_el).data('settlement-state') === undefined ? null : $(_el).data('settlement-state');
		if(_reapproveType === 1 && (state === undefined || state === null || state === '')) {
			alert('주문상태가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementRootId 
		var rootId = $(_el).data('root-settlement-id') === undefined ? null : $(_el).data('root-settlement-id');
		if(rootId === undefined || rootId === null || rootId === '') {
			alert('차주 정산정보가 유효하지 않습니다.');
			return false;
		}
		
		// _reapproveType === 1 : 승인 취소건 재승인 처리  
		// _reapproveType === 2 : 승인 취소건 새로운 정산 ID 생산하여 재승인 처리 
		
		if(_reapproveType === 1) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/settlement/car/cancel/settlement'/>",
				data : {
					carOwnerId : ownerId
					, carOwnerSettlementId : settlementId
					, carOwnerSettlementOrderId : orderId
					, carOwnerSettlementState : state
					// , carOwnerSettlementOrderNumber : ordeNum
					, carOwnerSettlementRootId : rootId
				},
				cache : false,
				async : true,
				success : function(resultData, textStatus, XMLHttpRequest) {
					if(resultData.resultCode === '00000') {
						alert('재승인 처리되었습니다.');
						location.reload();
					} else if(resultData.resultCode === '00009') {
						alert(resultData.resultMsg);
					} else {
						alert('재승인 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(resultData));
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
		
		// _reapproveType === 1 : 승인 취소건 재승인 처리  
		// _reapproveType === 2 : 승인 취소건 새로운 정산 ID 생산하여 재승인 처리 
		
		if(_reapproveType === 2) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/settlement/car/reupload/settlement'/>",
				data : {
					carOwnerId : ownerId
					, carOwnerSettlementId : settlementId
					, carOwnerSettlementOrderId : orderId
					// , carOwnerSettlementState : state
					, carOwnerSettlementOrderNumber : ordeNum
					, carOwnerSettlementRootId : rootId
				},
				cache : false,
				async : true,
				success : function(resultData, textStatus, XMLHttpRequest) {
					if(resultData.resultCode === '00000') {
						// 새로운 정산 이동 
						// location.reload();

						// 새로운 정산 아이디 & 새 페이지 이동 
						if(resultData.carOwnerSettlementId !== undefined 
								&& resultData.carOwnerSettlementId !== null 
								&& confirm('새롭게 생성된 정산 건을 확인하시겠습니까?')) {
							
							// 새로운 정산 아이디로 페이지 이동 
							$('#detailModal').modal('hide');
							routie("detail/" + resultData.carOwnerSettlementId + "/1");
						} else {
							if(resultData.oldSettlementId === 'Y') {
								// 기존 정산 있음 > 새로고침 
								location.reload();
							} else {
								// 기전 정산 없음 > 목록으로 
								$('#detailModal').modal('hide');
								routie('list/settlement/' + encodeURIComponent(JSON.stringify(getData())));
							}
						}
					} else if(resultData.resultCode === '00009') {
						alert(resultData.resultMsg);
					} else {
						alert('재승인 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(resultData));
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
	
	// 선지금 상세 팝업 
	function toggleDetailPopoup(_el) {
		
		// carOwnerId
		var ownerId = $(_el).data('owner-id') === undefined ? null : $(_el).data('owner-id');
		if(ownerId === undefined || ownerId === null || ownerId === '') {
			alert('차주정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementId
		var settlementId = $(_el).data('settlement-id') === undefined ? null : $(_el).data('settlement-id');
		if(settlementId === undefined || settlementId === null || settlementId === '') {
			alert('정산정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementOrderId 
		var orderId = $(_el).data('order-id') === undefined ? null : $(_el).data('order-id');
		if(orderId === undefined || orderId === null || orderId === '') {
			alert('주문정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementOrderNum 
		var orderNum = $(_el).data('order-num') === undefined ? null : $(_el).data('order-num');
		if(orderNum === undefined || orderNum === null || orderNum === '') {
			alert('주문번호가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementState 
		var state = $(_el).data('settlement-state') === undefined ? null : $(_el).data('settlement-state');
		if(state === undefined || state === null || state === '') {
			alert('주문상태가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementDate 
		var settDate = $(_el).data('date') === undefined ? null : $(_el).data('date');
		if(settDate === undefined || settDate === null || settDate === '') {
			settDate = "";
		}
		
		// carOwnerSettlementRootId 
		var rootId = $(_el).data('root-settlement-id') === undefined ? null : $(_el).data('root-settlement-id');
		if(rootId === undefined || rootId === null || rootId === '') {
			alert('차주 정산정보가 유효하지 않습니다.');
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/car/detail/popup'/>",
			data : {
				carOwnerSettlementId : settlementId
				, carOwnerId : ownerId
				, carOwnerSettlementOrderId : orderId
				, carOwnerSettlementOrderNumber : orderNum
				, carOwnerSettlementState : state
				, carOwnerSettlementDate : settDate
				, carOwnerSettlementRootId : rootId
			},
			cache : false,
			async : true,
			success : function(resultData, textStatus, XMLHttpRequest) {
				
				$('#detailModal .modal-body').html(resultData);
				$('#detailModal').modal('show');
				
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
	
	// 마스킹해제사유 등록
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
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
						} else if(str == 'excel') {
							excelDownload();
						} else {
			 				data.maskingYn = 'N';
							loadDetail(detailData.carOwnerSettlementId, data.detailPageIndex);	
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
			routie('list/' + data.pageType + '/' + encodeURIComponent(JSON.stringify(getData())));
		}
	})

</script>
