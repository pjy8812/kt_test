<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Begin view -->
<div class="card-box">
	<%-- ${result} --%>
	<h5 class="card-title">화주 위약수수료 정보 - 배차 취소</h5>
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 25%;">
						<col style="width: 25%;">
						<col style="width: 25%;">
						<col style="width: 25%;">
					</colgroup>
					<thead class="text-center">
						<tr>
							<th>구분</th>
							<th>1톤~3.5톤</th>
							<th>5톤~11톤</th>
							<th>15톤~25톤</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr class="dataRow" data-type="cancel" data-seq="0" data-method="insert">
							<td class="align-middle">
								<div class="row">
									<div class="col-3">
										<select class="form-control inTime" id="inTime" name="inTime">
											<c:forEach var="i" begin="1" end="6" step="1">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col mt-1 text-left">
										시간 이내 취소 (상차지 입차기준)
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month1Type"
											tabIndex="1">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month2Type"
											tabIndex="2">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month3Type"
											tabIndex="3">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
						</tr>
						<tr class="dataRow" data-type="cancel" data-seq="1" data-method="insert">
							<td class="align-middle">
								<div class="row">
									<div class="col mt-1">
										배차취소 (화주책임)
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month1Type"
											tabIndex="4">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month2Type"
											tabIndex="5">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month3Type"
											tabIndex="6">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="card-box">
	<h5 class="card-title">화주 위약수수료 정보 - 대기지연</h5>
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table mb-3 basic-table">
					<colgroup>
						<col style="width: 25%;">
						<col style="width: 25%;">
						<col style="width: 25%;">
						<col style="width: 25%;">
					</colgroup>
					<thead class="text-center">
						<tr>
							<th>구분</th>
							<th>5톤 미만</th>
							<th>15톤 미만</th>
							<th>15톤 이상</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr class="dataRow" data-type="delay" data-seq="0" data-method="insert">
							<td class="align-middle">
								<div class="row">
									<div class="col mt-1">
										상/하차지 대기지연 (2시간 ~ 4시간)
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month1Type"
											tabIndex="7">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month2Type"
											tabIndex="8">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col">
										<input type="text" class="form-control form-control-sm text-right numberInput" 
											data-month-type="month3Type"
											tabIndex="9">
									</div>
									<div class="col-2 mt-1">원</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<span class="">
					※ 상/하차지 대기지연이 4시간 이상 발생할 경우 입력한 위약수수료의 2배가 청구됩니다.
				</span>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="button-lis text-center">
			<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btnSave">
				저장
			</button>
		</div>
	</div>
</div>
<!-- End view -->

<script>
	
	var cancelList = [];
	var delayList = [];
	
	<c:forEach var="cancelList" items="${cancelResult.list}">
		<c:choose>	
			<c:when test="${'0' eq cancelList.penaltyFic}">
				<%-- <fmt:parseNumber var="nameFicNum" type="number" value="${cancelList.nameFic}"/> --%>
				var regex = /[^0-9]/g;
				var filterNameFic = '${cancelList.nameFic}'.replace(regex, '');
				var nameFicNumVal = filterNameFic === '' ? 1 : filterNameFic;
			</c:when>
			<c:otherwise>
				<c:set var="nameFicNum" value="null"/>
			</c:otherwise>
		</c:choose>
		cancelList.push({
			penaltyFic : '${cancelList.penaltyFic}' // 패널티코드
			, nameFic : '${cancelList.nameFic}' // 구분
			<%-- , nameFicNum : '${nameFicNum}' // 구분Num --%>
			, nameFicNum : nameFicNumVal // 구분Num
			, month1Type : '${cancelList.month1Type}' // 1~3.5톤
			, month2Type : '${cancelList.month2Type}' // 5~11톤
			, month3Type : '${cancelList.month3Type}' // 15~25톤
		});
	</c:forEach>
	
	<c:forEach var="delayList" items="${delayResult.list}">
		delayList.push({
			penaltyFld : '${delayList.penaltyFld}' // 패널티코드
			, nameFld : '${delayList.nameFld}' // 구분
			, month1Type : '${delayList.month1Type}' // 1~3.5톤
			, month2Type : '${delayList.month2Type}' // 5~11톤
			, month3Type : '${delayList.month3Type}' // 15~25톤
		});
	</c:forEach>
	
	// 목록값으로 세팅 
	function setValue(_object) {
		
		var _cancelList = _object.cancelList;
		var _delayList = _object.delayList;

		if(_cancelList === null || _cancelList.length === 0) {
			return false;
		}
		
		if(_delayList === null || _delayList.length === 0) {
			return false;
		}
		
		for(i=0; i < _cancelList.length; i++) {
			var penaltyFic = _cancelList[i].penaltyFic;
			var dataRowEl = $('tr[data-type="cancel"][data-seq="' + penaltyFic + '"]');
			
			if(penaltyFic === '0') {
				$(dataRowEl).find('select.inTime').val(_cancelList[i].nameFicNum);
				$(dataRowEl).find('select.inTime').data('org', _cancelList[i].nameFicNum);
			}
			
			$(dataRowEl).data('method', 'update');
			
			var month1Type = Number(_cancelList[i].month1Type).comma();
			var month2Type = Number(_cancelList[i].month2Type).comma();
			var month3Type = Number(_cancelList[i].month3Type).comma();
			
			$(dataRowEl).find('input[data-month-type="month1Type"]').val(month1Type);
			$(dataRowEl).find('input[data-month-type="month2Type"]').val(month2Type);
			$(dataRowEl).find('input[data-month-type="month3Type"]').val(month3Type);
			
			$(dataRowEl).find('input[data-month-type="month1Type"]').data('org', month1Type);
			$(dataRowEl).find('input[data-month-type="month2Type"]').data('org', month2Type);
			$(dataRowEl).find('input[data-month-type="month3Type"]').data('org', month3Type);
		}
		
		for(i=0; i < _delayList.length; i++) {
			var penaltyFld = _delayList[i].penaltyFld;
			var dataRowEl = $('tr[data-type="delay"][data-seq="' + penaltyFld + '"]');
			
			$(dataRowEl).data('method', 'update');
			
			var month1Type = Number(_delayList[i].month1Type).comma();
			var month2Type = Number(_delayList[i].month2Type).comma();
			var month3Type = Number(_delayList[i].month3Type).comma();
			
			$(dataRowEl).find('input[data-month-type="month1Type"]').val(month1Type);
			$(dataRowEl).find('input[data-month-type="month2Type"]').val(month2Type);
			$(dataRowEl).find('input[data-month-type="month3Type"]').val(month3Type);
			
			$(dataRowEl).find('input[data-month-type="month1Type"]').data('org', month1Type);
			$(dataRowEl).find('input[data-month-type="month2Type"]').data('org', month2Type);
			$(dataRowEl).find('input[data-month-type="month3Type"]').data('org', month3Type);
		}
	}
	
	function getValue() {
		
		var _object = {};
		var _cancelList = [];
		var _delayList = [];
		
		$('tr.dataRow').each(function(index, item) {
			
			if($(this).data('type') === 'cancel') {
				
				var elSeq = $(this).data('seq');
				if(elSeq === 0) {
					_cancelList.push({
						penaltyFic : $(this).data('seq')
						, nameFic : $(this).find('select.inTime').val() + "시간 이내 취소 (상차지 입차기준)"
						, nameFicNum : $(this).find('select.inTime').val()
						, month1Type : $(this).find('input[data-month-type="month1Type"]').val().replaceAll(',', '') // 1~3.5톤
						, month2Type : $(this).find('input[data-month-type="month2Type"]').val().replaceAll(',', '') // 5톤~11톤
						, month3Type : $(this).find('input[data-month-type="month3Type"]').val().replaceAll(',', '') // 15톤~25톤
						, method : $(this).data('method')
					});
				} else {
					_cancelList.push({
						penaltyFic : $(this).data('seq')
						, nameFic : "배차취소 (화주책임)"
						, nameFicNum : null
						, month1Type : $(this).find('input[data-month-type="month1Type"]').val().replaceAll(',', '') // 1~3.5톤
						, month2Type : $(this).find('input[data-month-type="month2Type"]').val().replaceAll(',', '') // 5톤~11톤
						, month3Type : $(this).find('input[data-month-type="month3Type"]').val().replaceAll(',', '') // 15톤~25톤
						, method : $(this).data('method')
					});
				}
			} else if($(this).data('type') === 'delay') {
				_delayList.push({
					penaltyFld : $(this).data('seq')
					, nameFld : "대기지연"
					, month1Type : $(this).find('input[data-month-type="month1Type"]').val().replaceAll(',', '') // 1~3.5톤
					, month2Type : $(this).find('input[data-month-type="month2Type"]').val().replaceAll(',', '') // 5톤~11톤
					, month3Type : $(this).find('input[data-month-type="month3Type"]').val().replaceAll(',', '') // 15톤~25톤
					, method : $(this).data('method')
				});
			}
		})
				
		_object = {
			cancelList : _cancelList
			, delayList : _delayList
		};
		
		return _object;
	}
	
	// 저장 
	$('button.btnSave').on('click touch', function() {
		
		if($('tr.dataRow select').val() === null) {
			alert('배차 취소시 상차지 입차기준 시간을 입력해주세요.');
			return false;
		}
		
		var flag = true;
		$('tr.dataRow').each(function(index, item) {
			$(item).find('input').each(function(innerIndex, innerItem) {
				if(flag && $(innerItem).val() === '') {
					$(innerItem).focus();
					// alert('위약수수료 정보를 입력해주세요.');
					flag = false;
					return false;
				}
			})
			
			if(!flag) {
				alert('위약수수료 정보를 입력해주세요.');
				return false;
			}
		})
		
		if(!flag) {
			return false;
		}
		
		if(confirm('변경하신 사항을 저장하시겠습니까?')) {
			
			var object = getValue();
			var JSONdata = JSON.stringify(object);
			jQuery.ajaxSettings.traditional = true;
			// encodeURI(JSONdata)
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/policy/penalty/save'/>",
				data : {
					JSONdata : JSONdata
					, pageType : "freightOwnerPenalty"
				},
				cache : false,
				async : true,
				success : function(data, textStatus, XMLHttpRequest) {
					if (hasErrorMap(data, true)) {
						return;
					}
					
					if(data.resultCode === '00000') {
						alert('저장되었습니다.');	
						loadPage("freightOwnerPenalty");
					} else {
						alert('변경사항을 저장하는 도중 오류가 발생하였습니다.');	
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
		}
	})
	
 	// 기존값과 변경점이 있을 경우 표시 
 	function checkChangeAndMark() {
		
		$('select').each(function() {
			if($(this).data('org') === undefined || ($(this).data('org') + '') !== ($(this).val() + '')) {
				$(this).addClass('color-border-danger');
			} else {
				$(this).removeClass('color-border-danger');
			}
		})
		
		$('input.numberInput').each(function() {
			if($(this).data('org') === undefined || $(this).data('org') !== $(this).val()) {
				$(this).addClass('color-border-danger');
			} else {
				$(this).removeClass('color-border-danger');
			}
		})
 	}
	
	function initServiceEvent() {
		
		var initObj = {};
		initObj.cancelList = cancelList;
		initObj.delayList = delayList;
		
		setValue(initObj);
		
		filterNumberEl($('input.numberInput'), 12);
		checkChangeAndMark();
		
		$('select, input.numberInput').on('change', function() {
			checkChangeAndMark();
		})
	}

	$(document).ready(function() {
		initServiceEvent();
		
		$('.nav-link').removeClass('active');
		$('.nav-link[data-page-type="freightOwnerPenalty"]').addClass('active');
		
		/* <c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if> */
	})

</script>
