<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="form"
	uri="http://www.springframework.org/tags/form"%><%@ taglib
	prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ page
	import="java.sql.*"%>

<!-- Begin page -->
<div class="row">
	<div class="col-12">
		<div class="contents"></div>
	</div>
</div>
<!-- End page -->

<div id="modal"></div>

<script>
	var freightOwnerSettlementId;
	var carOwnerSettlementId;
	var freightOwnerSettlementYyyyMm;
	var carOwnerSettlementYyyymmdd;
	
	const today = new Date().setHours(0, 0, 0, 0);
	const startToday = (new Date(today)).fp_incr(-30);
	const startDate = new Date('2022-01-01').setHours(0,0,0,0);
	const yesterday = (new Date()).fp_incr(-1).setHours(0,0,0,0);
	const startYesterday = new Date(new Date(yesterday).setMonth(new Date(yesterday).getMonth()-1));

	
	let data = {
		pageIndex : 1,
		settlementStartDate : startToday,
		settlementEndDate : today,
		settlementDoenStartDate : startToday,
		settlementDoenEndDate : today,
		monthStartDate : new Date(startYesterday).format('yyyyMM'),
		monthEndDate : new Date().format('yyyyMM'),
		
		object: {},
		maskingYn : 'Y'
	}

	let detailData = {
		freightOwnerSettlementId : null
	}

	var searchedData = {};

	let flag = {
		listFormLoaded : false,
		dtailFormLoaded : false
	}

	//조회
	function searchList() {
		
		if 	(data.maskingYn === "N") {
			data.maskingYn = "Y";
		}

		var queryString = encodeURIComponent(JSON.stringify(getData()));
		var currentUri = location.hash.replace('#list/', '');

		if (queryString === currentUri) {
			loadList(getData());
		} else {
			routie('list/' + queryString);
		}
	}

	// 검색 폼 
	function loadListForm(_object) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/integration/search'/>",
			data : {},
			cache : false,
			async : false,
			success : function(resultData, textStatus, XMLHttpRequest) {
				$('.contents').html(resultData);
				flag.listFormLoaded = true;
				flag.dtailFormLoaded = false;

				if (_object != null) {
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
		if (!flag.listFormLoaded) {
			loadListForm(_object);
		}
		
		if (_object.basisDate === 'settlementDay') {
			_object.settlementCompleteStartDate = new Date(_object.settlementStartDate).getTime();
			_object.settlementCompleteEndDate   = new Date(_object.settlementEndDate).addDays(1).getTime() -1;
		} else if (_object.basisDate === 'settlementDoenDay') {
			_object.settlementCompleteDoenStartDate = new Date(_object.settlementDoenStartDate).getTime();
			_object.settlementCompleteDoenEndDate   = new Date(_object.settlementDoenEndDate).addDays(1).getTime() -1;
		} else if (_object.basisDate === 'billingDeadMonth') {
			_object.billMonthStartDate = new Date(_object.billMonthStartDate).format('yyyyMM');
			_object.billMonthEndDate   = new Date(_object.billMonthEndDate).format('yyyyMM');
		} else if (_object.basisDate === 'payDeadMonth') {
			_object.payMonthStartDate = new Date(_object.payMonthStartDate).format('yyyyMM');
			_object.payMonthEndDate   = new Date(_object.payMonthEndDate).format('yyyyMM');
		}


		delete _object.settlementStartDate;
		delete _object.settlementEndDate;
		delete _object.settlementDoenStartDate;
		delete _object.settlementDoenEndDate;
		delete _object.pickerType;
		searchedData = {};
		searchedData = _object;
		
		_object.maskingYn = data.maskingYn;
		
		if (_object.basisDate == 'billingDeadMonth') {
			if (_object.billMonthStartDate == ' ') {
				_object.billMonthStartDate = '';
			}
			if (_object.billMonthEndDate == ' ') {
				_object.billMonthEndDate = '';
			}
		}
		
		if (_object.basisDate == 'payDeadMonth') {
			if (_object.payMonthStartDate == ' ') {
				_object.payMonthStartDate = '';
			}
			if (_object.payMonthEndDate == ' ') {
				_object.payMonthEndDate = '';
			}
		}

		// 목록 로드 
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/integration/list'/>",
			data : JSON.stringify(_object),
			cache : false,
			async : true,
			contentType : "application/json; charset=UTF-8",
			success : function(resultData, textStatus, XMLHttpRequest) {
				$('.searchList').empty();
				$('.searchList').html(resultData);
				delete _object.basisDate;
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

	function loadDetail(_id, _object) {
		flag.listFormLoaded = false;

		if (_id === null || _id === '' || _object === null
				|| _object === '') {
			return false;
		}

		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/integration/detail/'/>"
								+ _id + '/' + _object,
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

		// 청구상태
		if ($('[name="freightOwnerSettlementState"]').val() !== 'all') {
			object.freightOwnerSettlementState = $('[name="freightOwnerSettlementState"]').val();
		}

		// 지급상태
		if ($('[name="carOwnerSettlementState"]').val() !== 'all') {
			object.carOwnerSettlementState = $('[name="carOwnerSettlementState"]').val();
		}

		// 검색어 
		if ($('[name="searchText"]').val() !== '') {
			object.searchType = $('[name="searchType"]').val();
			object.searchText = $('[name="searchText"]').val();
		} else {
			delete object.searchType;
			delete object.searchText;
		}

		// 검색어 
		if ($('[name="searchText"]').val() !== '') {
			object.searchType = $('[name="searchType"]').val();
			object.searchText = $('[name="searchText"]').val();
		} else {
			delete object.searchType;
			delete object.searchText;
		}

		if (data.maskingYn == 'Y') {
			// 마스킹 
			object.maskingYn = data.maskingYn;
		}

		if($('.basisDate').val() !== undefined) {
			data.basisDate = $('.basisDate').val();
			object.basisDate = data.basisDate;
		} else {
			data.basisDate = 'settlementDay';
			object.basisDate = data.basisDate;
		}
		
		if(data.basisDate == 'billingDeadMonth'){
			object.billMonthStartDate = data.monthStartDate;
			object.billMonthEndDate   = data.monthEndDate;
			delete object.payMonthStartDate;
			delete object.payMonthEndDate;
		} else if(data.basisDate == 'payDeadMonth'){
			object.payMonthStartDate = data.monthStartDate;
			object.payMonthEndDate   = data.monthEndDate;
			delete object.billMonthStartDate;
			delete object.billMonthEndDate;
		}
		
		object.pickerType = $('[name="pickerType"]').val();
		object.settlementStartDate     = data.settlementStartDate;
		object.settlementEndDate       = data.settlementEndDate;
		object.settlementDoenStartDate = data.settlementDoenStartDate;
		object.settlementDoenEndDate   = data.settlementDoenEndDate;
		
		
		return object;
	}

	function setData(_object) {

		if (_object == null) {
			return;
		}
		
		if (_object.basisDate !== undefined && _object.basisDate !== '' && _object.basisDate !== null) {
			$('[name="basisDate"]').val(_object.basisDate);
		} else {
			$('[name="basisDate"] option:first').attr('selected', true);
		}

		if (_object.freightOwnerSettlementState !== undefined
				&& _object.freightOwnerSettlementState !== '') {
			$('[name="freightOwnerSettlementState"]').val(
					_object.freightOwnerSettlementState);
		} else {
			$('[name="freightOwnerSettlementState"]').val('all');
		}

		if (_object.carOwnerSettlementState !== undefined
				&& _object.carOwnerSettlementState !== '') {
			$('[name="carOwnerSettlementState"]').val(
					_object.carOwnerSettlementState);
		} else {
			$('[name="carOwnerSettlementState"]').val('all');
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

		if (_object.pickerType !== undefined && _object.pickerType !== '') {
			$('[name="pickerType"]').val(_object.pickerType);
		}

		if (_object.settlementStartDate !== undefined
				&& _object.settlementStartDate !== ''
				&& _object.settlementEndDate !== undefined
				&& _object.settlementEndDate !== '') {

			data.settlementStartDate = _object.settlementStartDate;
			data.settlementEndDate   = _object.settlementEndDate;
		}
		
		if (_object.settlementDoenStartDate !== undefined
				&& _object.settlementDoenStartDate !== ''
				&& _object.settlementDoenEndDate !== undefined
				&& _object.settlementDoenEndDate !== '') {

			data.settlementDoenStartDate = _object.settlementDoenStartDate;
			data.settlementDoenEndDate   = _object.settlementDoenEndDate;
		}
		
		if (_object.billMonthStartDate !== undefined && _object.billMonthStartDate !== ''
			&& _object.billMonthEndDate !== undefined && _object.billMonthEndDate !== '') {
			
			data.billMonthStartDate = _object.billMonthStartDate;
			data.billMonthEndDate   = _object.billMonthEndDate;
		}

		if (_object.payMonthStartDate !== undefined && _object.payMonthStartDate !== ''
			&& _object.payMonthEndDate !== undefined && _object.payMonthEndDate !== '') {
			
			data.payMonthStartDate = _object.payMonthStartDate;
			data.payMonthEndDate   = _object.payMonthEndDate;
		}

		if (_object.settlementCompleteStartDate !== undefined && _object.settlementCompleteStartDate !== ''
			&& _object.settlementCompleteEndDate !== undefined && _object.settlementCompleteEndDate !== '') {
		data.settlementCompleteStartDate = _object.settlementCompleteStartDate;
		data.settlementCompleteEndDate   = _object.settlementCompleteEndDate;
		
		}
		
		if (_object.settlementCompleteDoenStartDate !== undefined && _object.settlementCompleteDoenStartDate !== ''
			&& _object.settlementCompleteDoenEndDate !== undefined && _object.settlementCompleteDoenEndDate !== '') {
		data.settlementCompleteDoenStartDate = _object.settlementCompleteDoenStartDate;
		data.settlementCompleteDoenEndDate   = _object.settlementCompleteDoenEndDate;
		
		}
		
		
	}

	function initEvent() {
		data.maskingYn = 'Y';
	}

	function initRoutie() {
		routie({
			'list/:_queryString' : function(_queryString) {
				var object = deJsonString(_queryString);

				setData(object);

				if (!flag.listFormLoaded) {
					loadListForm(object);
				} else {
					loadList(object);
				}
			},
			'detail/:_id/:_object' : function(_id, _object) {
				data.object = _object;

				loadDetail(_id, _object);
			}
		})
	}

	// 마스킹해제사유 등록
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave',
		function(e) {
			var maskingType = $('#popupUnmaskingReason').data('param_type');
			if(maskingType.indexOf('Excel') > -1){
				unmask('excel');
			} else if (maskingType.indexOf("integList") > -1){
				unmask('list');
			} else if (maskingType.indexOf("integFrgListInfo") > -1){
				unmask('frgInfo');
			} else if (maskingType.indexOf("integCarListInfo") > -1){
				unmask('carInfo');
			}
	});

	function unmask(str) {
		var type = $('#popupUnmaskingReason').data('param_type');
		var reason = $('#unmaskingReason').val();
		
		if (reason == '' || reason.trim() == '') {
			alert("마스킹 해제 사유를 입력해주세요.");
		} else {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/common/unmasking'/>",
				data : {
					"maskingHistoryType" : type,
					"maskingHistoryReason" : reason
				},
				cache : false,
				async : false,
				beforeSend : function(xhr) {
					$('#popupUnmaskingReason').modal('hide');
				},
				success : function(resultData, textStatus, XMLHttpRequest) {
					if (hasErrorMap(resultData, true)) {
						return;
					}

					if (resultData.error != null) {
						alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '
								+ resultData.error);
					} else if (resultData.resultCode == null) {
						alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '
								+ resultData.code);
					} else if (resultData.resultCode == '00000') {
						if(str == 'list'){
							data.maskingYn = 'N';
							loadList(getData());							
						} else if(str == 'excel') {
							excelDownload();
						} else if(str == 'frgInfo'){
							// TODO 화주 마스킹 해제
							var frgownSettlementId = $('#frgownSettlementId').data('frgown-settlement-id');
							data.maskingYn = 'Y';
							
							if (typeof data.object == 'object') {
								data.object = JSON.stringify(data.object);
							}
							
							var obj = JSON.parse(data.object);
							
							obj.frgownMaskingYn = "N";
							data.object = encodeURIComponent(JSON.stringify(obj));
							loadDetail(frgownSettlementId, data.object);
							data.object = JSON.parse(decodeURIComponent(data.object));
						} else if (str == 'carInfo') {
							// TODO 차주 마스킹 해제
							var frgownSettlementId = $('#frgownSettlementId').data('frgown-settlement-id');
							data.maskingYn = 'Y';
							
							if (typeof data.object == 'object') {
								data.object = JSON.stringify(data.object);
							}
							
							var obj = JSON.parse(data.object);
							
							obj.carownMaskingYn = "N";
							data.object = encodeURIComponent(JSON.stringify(obj));
							loadDetail(frgownSettlementId, data.object);
							data.object = JSON.parse(decodeURIComponent(data.object));
						} else if (str == 'orderInfo') {
							data.maskingYn = 'N';
							popupOrderDetail(data.orderId, data.maskingYn);
						}
					} else if (resultData.resultCode == '00001') {
						alert(resultData.resultMsg);
						$('#unmaskingReason').focus();
					} else {
						alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '
								+ resultData.resultMsg);
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

		if (location.hash === '') {
			routie('list/' + encodeURIComponent(JSON.stringify(getData())));
		}
	})
</script>
