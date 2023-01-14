<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin view -->
<div class="card-box">
	<%-- ${result} --%>
	<h5 class="card-title">차주 패널티 정보 - 배차 취소</h5>
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
					</colgroup>
					<thead class="text-center">
						<tr>
							<th>구분</th>
							<th>월 1회</th>
							<th>월 2회</th>
							<th>월 3회</th>
							<th>월 4회 이상</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr class="dataRow" data-type="cancel" data-seq="0" data-method="insert" data-name="상차지 입차기준 3시간 이내 취소">
							<td class="align-middle">
								<div class="row">
									<div class="col mt-1">
										상차지 입차기준<br>3시간 이내 취소
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelIn per1 option"
											data-type="month1Type"
											tabIndex="1">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelIn per1 days"
											data-type="month1Value"
											tabIndex="2">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelIn per2 option"
											data-type="month2Type"
											tabIndex="3">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelIn per2 days"
											data-type="month2Value"
											tabIndex="4">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelIn per3 option"
											data-type="month3Type"
											tabIndex="5">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelIn per3 days"
											data-type="month3Value"
											tabIndex="6">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelIn per4 option"
											data-type="month4Type"
											tabIndex="7">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelIn per4 days"
											data-type="month4Value"
											tabIndex="8">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr class="dataRow" data-type="cancel" data-seq="1" data-method="insert" data-name="상차지 입차기준 3시간 이상 취소">
							<td class="align-middle">
								<div class="row">
									<div class="col mt-1">
										상차지 입차기준<br>3시간 이상 취소
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelOut per1 option"
											data-type="month1Type"
											tabIndex="9">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelOut per1 days" 
											data-type="month1Value"
											tabIndex="10">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelOut per2 option" 
											data-type="month2Type"
											tabIndex="11">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelOut per2 days" 
											data-type="month2Value"
											tabIndex="12">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelOut per3 option"
											data-type="month3Type"
											tabIndex="13">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelOut per3 days"
											data-type="month3Value"
											tabIndex="14">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control cancelOut per4 option"
											data-type="month4Type"
											tabIndex="15">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control cancelOut per4 days" 
											data-type="month4Value"
											tabIndex="16">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
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
	<h5 class="card-title">차주 패널티 정보 - 배송사고</h5>
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
					</colgroup>
					<thead class="text-center">
						<tr>
							<th>구분</th>
							<th>월 1회</th>
							<th>월 2회</th>
							<th>월 3회</th>
							<th>월 4회 이상</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr class="dataRow" data-type="accident" data-seq="0" data-method="insert" data-name="차주잠적">
							<td class="align-middle">
								<div class="row">
									<div class="col mt-1">
										차주잠적
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control accident per1 option"
											data-type="month1Type"
											tabIndex="17">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control accident per1 days"
											data-type="month1Value"
											tabIndex="18">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control accident per2 option" 
											data-type="month2Type"
											tabIndex="19">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control accident per2 days" 
											data-type="month2Value"
											tabIndex="20">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control accident per3 option"
											data-type="month3Type"
											tabIndex="21">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control accident per3 days"
											data-type="month3Value"
											tabIndex="22">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="row">
									<div class="col-6">
										<select class="form-control accident per4 option"
											data-type="month4Type"
											tabIndex="23">
											<c:forEach var="statusList" items="${statusList}">
												<option value="${statusList.key}">${statusList.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select class="form-control accident per4 days"
											data-type="month4Value"
											tabIndex="24">
											<option value="0">없음</option>
											<c:forEach var="i" begin="1" end="30" step="1">
												<option value="${i}">${i}일</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
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
	var accidentList = [];
	
	<c:forEach var="cancelList" items="${cancelResult.list}">
		cancelList.push({
			penaltyNic : '${cancelList.penaltyNic}' // 패널티코드
			, nameFic : '${cancelList.nameFic}' // 구분
			, month1Type : '${cancelList.month1Type}' // 월 1회
			, month1Value : '${cancelList.month1Value}' // 월 1회
			, month2Type : '${cancelList.month2Type}' // 월 2회
			, month2Value : '${cancelList.month2Value}' // 월 2회
			, month3Type : '${cancelList.month3Type}' // 월 3회
			, month3Value : '${cancelList.month3Value}' // 월 3회
			, month4Type : '${cancelList.month4Type}' // 월 4회 이상 
			, month4Value : '${cancelList.month4Value}' // 월 4회 이상 
		});
	</c:forEach>
	
	<c:forEach var="accidentList" items="${accidentResult.list}">
		accidentList.push({
			penaltyNda : '${accidentList.penaltyNda}' // 패널티코드
			, nameNda : '${accidentList.nameNda}' // 구분
			, month1Type : '${accidentList.month1Type}' // 월 1회
			, month1Value : '${accidentList.month1Value}' // 월 1회
			, month2Type : '${accidentList.month2Type}' // 월 2회
			, month2Value : '${accidentList.month2Value}' // 월 2회
			, month3Type : '${accidentList.month3Type}' // 월 3회
			, month3Value : '${accidentList.month3Value}' // 월 3회
			, month4Type : '${accidentList.month4Type}' // 월 4회 이상 
			, month4Value : '${accidentList.month4Value}' // 월 4회 이상 
		});
	</c:forEach>
	
	// 목록값으로 세팅 
	function setValue(_object) {
	
		var _cancelList = _object.cancelList;
		var _accidentList = _object.accidentList;
	
		if(_cancelList === null || _cancelList.length === 0) {
			return false;
		}
		
		if(_accidentList === null || _accidentList.length === 0) {
			return false;
		}
		
		for(i=0; i < _cancelList.length; i++) {
			var penaltyNic = _cancelList[i].penaltyNic;
			var dataRowEl = $('tr[data-type="cancel"][data-seq="' + penaltyNic + '"]');
			
			$(dataRowEl).data('method', 'update');
			
			var month1Type = _cancelList[i].month1Type;
			var month2Type = _cancelList[i].month2Type;
			var month3Type = _cancelList[i].month3Type;
			var month4Type = _cancelList[i].month4Type;
			
			$(dataRowEl).find('select[data-type="month1Type"]').val(month1Type);
			$(dataRowEl).find('select[data-type="month2Type"]').val(month2Type);
			$(dataRowEl).find('select[data-type="month3Type"]').val(month3Type);
			$(dataRowEl).find('select[data-type="month4Type"]').val(month4Type);
			
			$(dataRowEl).find('select[data-type="month1Type"]').data('org', month1Type);
			$(dataRowEl).find('select[data-type="month2Type"]').data('org', month2Type);
			$(dataRowEl).find('select[data-type="month3Type"]').data('org', month3Type);
			$(dataRowEl).find('select[data-type="month4Type"]').data('org', month4Type);
			
			var month1Value = _cancelList[i].month1Value;
			var month2Value = _cancelList[i].month2Value;
			var month3Value = _cancelList[i].month3Value;
			var month4Value = _cancelList[i].month4Value;
			
			$(dataRowEl).find('select[data-type="month1Value"]').val(month1Value);
			$(dataRowEl).find('select[data-type="month2Value"]').val(month2Value);
			$(dataRowEl).find('select[data-type="month3Value"]').val(month3Value);
			$(dataRowEl).find('select[data-type="month4Value"]').val(month4Value);
			
			$(dataRowEl).find('select[data-type="month1Value"]').data('org', month1Value);
			$(dataRowEl).find('select[data-type="month2Value"]').data('org', month2Value);
			$(dataRowEl).find('select[data-type="month3Value"]').data('org', month3Value);
			$(dataRowEl).find('select[data-type="month4Value"]').data('org', month4Value);
			
		}
		
		for(i=0; i < _accidentList.length; i++) {
			var penaltyNda = _accidentList[i].penaltyNda;
			var dataRowEl = $('tr[data-type="accident"][data-seq="' + penaltyNda + '"]');
			
			$(dataRowEl).data('method', 'update');
			
			var month1Type = _accidentList[i].month1Type;
			var month2Type = _accidentList[i].month2Type;
			var month3Type = _accidentList[i].month3Type;
			var month4Type = _accidentList[i].month4Type;
			
			$(dataRowEl).find('select[data-type="month1Type"]').val(month1Type);
			$(dataRowEl).find('select[data-type="month2Type"]').val(month2Type);
			$(dataRowEl).find('select[data-type="month3Type"]').val(month3Type);
			$(dataRowEl).find('select[data-type="month4Type"]').val(month4Type);
			
			$(dataRowEl).find('select[data-type="month1Type"]').data('org', month1Type);
			$(dataRowEl).find('select[data-type="month2Type"]').data('org', month2Type);
			$(dataRowEl).find('select[data-type="month3Type"]').data('org', month3Type);
			$(dataRowEl).find('select[data-type="month4Type"]').data('org', month4Type);
			
			var month1Value = _accidentList[i].month1Value;
			var month2Value = _accidentList[i].month2Value;
			var month3Value = _accidentList[i].month3Value;
			var month4Value = _accidentList[i].month4Value;
			
			$(dataRowEl).find('select[data-type="month1Value"]').val(month1Value);
			$(dataRowEl).find('select[data-type="month2Value"]').val(month2Value);
			$(dataRowEl).find('select[data-type="month3Value"]').val(month3Value);
			$(dataRowEl).find('select[data-type="month4Value"]').val(month4Value);
			
			$(dataRowEl).find('select[data-type="month1Value"]').data('org', month1Value);
			$(dataRowEl).find('select[data-type="month2Value"]').data('org', month2Value);
			$(dataRowEl).find('select[data-type="month3Value"]').data('org', month3Value);
			$(dataRowEl).find('select[data-type="month4Value"]').data('org', month4Value);
		}
	}
	
	function getValue() {
		
		var _object = {};
		var _cancelList = [];
		var _accidentList = [];
		
		$('tr.dataRow').each(function(index, item) {
			
			if($(this).data('type') === 'cancel') {
				
				var elSeq = $(this).data('seq');
				if(elSeq === 0) {
					_cancelList.push({
						penaltyNic : $(this).data('seq')
						, nameNic : "상차지 입차기준 3시간 이내 취소"
						, month1Type : $(this).find('select[data-type="month1Type"]').val()
						, month2Type : $(this).find('select[data-type="month2Type"]').val()
						, month3Type : $(this).find('select[data-type="month3Type"]').val() 
						, month4Type : $(this).find('select[data-type="month4Type"]').val() 
						, month1Value : Number($(this).find('select[data-type="month1Value"]').val())
						, month2Value : Number($(this).find('select[data-type="month2Value"]').val())
						, month3Value : Number($(this).find('select[data-type="month3Value"]').val())
						, month4Value : Number($(this).find('select[data-type="month4Value"]').val())
						, method : $(this).data('method')
					});
				} else {
					_cancelList.push({
						penaltyNic : $(this).data('seq')
						, nameNic : "상차지 입차기준 3시간 이상 취소"
						, month1Type : $(this).find('select[data-type="month1Type"]').val()
						, month2Type : $(this).find('select[data-type="month2Type"]').val()
						, month3Type : $(this).find('select[data-type="month3Type"]').val() 
						, month4Type : $(this).find('select[data-type="month4Type"]').val() 
						, month1Value : Number($(this).find('select[data-type="month1Value"]').val())
						, month2Value : Number($(this).find('select[data-type="month2Value"]').val())
						, month3Value : Number($(this).find('select[data-type="month3Value"]').val())
						, month4Value : Number($(this).find('select[data-type="month4Value"]').val())
						, method : $(this).data('method')
					});
				}
			} else if($(this).data('type') === 'accident') {
				_accidentList.push({
					penaltyNda : $(this).data('seq')
					, nameNda : "차주잠적"
					, month1Type : $(this).find('select[data-type="month1Type"]').val()
					, month2Type : $(this).find('select[data-type="month2Type"]').val()
					, month3Type : $(this).find('select[data-type="month3Type"]').val() 
					, month4Type : $(this).find('select[data-type="month4Type"]').val() 
					, month1Value : Number($(this).find('select[data-type="month1Value"]').val())
					, month2Value : Number($(this).find('select[data-type="month2Value"]').val())
					, month3Value : Number($(this).find('select[data-type="month3Value"]').val())
					, month4Value : Number($(this).find('select[data-type="month4Value"]').val()) 
					, method : $(this).data('method')
				});
			}
		})
				
		_object = {
			cancelList : _cancelList
			, accidentList : _accidentList
		};
		
		return _object;
	}

	// 저장 
	$('button.btnSave').on('click touch', function() {
		
		var flag = true;
		$('select').each(function(index, item) {
			if($(item).val() === null) {
				alert('패널티 정보를 입력해주세요.');
				return false;
			}
		})
		
		if(confirm('변경하신 사항을 저장하시겠습니까?')) {

			var object = getValue();
			var JSONdata = JSON.stringify(object);
			jQuery.ajaxSettings.traditional = true;
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/policy/penalty/save'/>",
				data : {
					JSONdata : JSONdata
					, pageType : "carOwnerPenalty"
				},
				cache : false,
				async : true,
				success : function(data, textStatus, XMLHttpRequest) {
					if (hasErrorMap(data, true)) {
						return;
					}
					
					if(data.resultCode === '00000') {
						alert('저장되었습니다.');	
						loadPage("carOwnerPenalty");
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
		
		/* $('select, input.numberInput').each(function() {
			if($(this).data('org-value') === undefined || $(this).data('org-value') !== $(this).val()) {
				$(this).addClass('color-border-danger');
			} 
		}) */
		
		// 항목별 처리 
		$('select.option').each(function(index, item) {
			if($(item).val() === 'stop') {
				$(item).closest('td').find('select.days').attr('disabled', false);
			} else {
				$(item).closest('td').find('select.days').val(0).attr('disabled', true);
			}
		})
	}
	
	function initServiceEvent() {
		
		var initObj = {};
		initObj.cancelList = cancelList;
		initObj.accidentList = accidentList;
		
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
		$('.nav-link[data-page-type="carOwnerPenalty"]').addClass('active');
		
		/* <c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if> */
	})

</script>
