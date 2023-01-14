<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Begin page -->
<div class="tab-content pt-0">
	<div class="tab-pane show active">
		<div class="card-box shadow">
            <h5 class="card-title">비상차주 정보</h5>
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 20%;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">차주명<span class="text-danger ml-1">*</span></th>
							<td><input type="text" id="carOwnerName" class="form-control form-control-sm" maxlength="20" placeholder="차주명을 입력하세요."></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">전화번호<span class="text-danger ml-1">*</span></th>
							<td><input type="text" id="carOwnerTelephone" class="form-control form-control-sm" placeholder="전화번호를 입력하세요." onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></td>
							<td class="resultPhone"></td>
						</tr>
						<tr>
							<th scope="row">차량번호<span class="text-danger ml-1">*</span></th>
							<td><input type="text" id="carNum" class="form-control form-control-sm" maxlength="10" placeholder="차량번호를 입력하세요."></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">차종<span class="text-danger ml-1">*</span></th>
							<td>
								<select class="form-control form-control-sm" id="carType">
									<option value="">(선택하세요)</option>
									<c:forEach items="${carType}" var="list">
										<option value="${list.codeId}">${list.codeName}</option>
									</c:forEach>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">중량<span class="text-danger ml-1">*</span></th>
							<td>
								<select class="form-control form-control-sm" id="carModel">
									<option value="">(선택하세요)</option>
									<c:forEach items="${carModel}" var="list">
										<option value="${list.codeId}">${list.codeName}</option>
									</c:forEach>
								</select>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="button-list text-center mt-3">
    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="saveCarOwner">저장</button>
</div>


<script>
//차종 선택시 중량 입력
$('#carType').on('change', function(){
	var value = $(this).val();
	
	if(value == 'damas' || value == 'labo') {
		//다마스, 라보	> 중량선택 불가
		$('#carModel').val('').prop('selected', true);
		$('#carModel').prop('disabled', true);
	} else if(value == 'trailer' || value == 'doubleDeckTrailer') {
		//트레일러, 더블데크 트레일러 > 25T, 중량선택 불가
		$('#carModel').val('twentyFiveT').prop('selected', true);
		$('#carModel').prop('disabled', true);
	} else {
		$('#carModel').val('').prop('selected', true);
		$('#carModel').prop('disabled', false);
	}
});

//저장
$('#saveCarOwner').on('click', function(){
	var flag = false;
	var param = {};
	
	var carOwnerName = $('#carOwnerName').val();
	var carOwnerTelephone = $('#carOwnerTelephone').val();
	var carNum = $('#carNum').val();
	var carType = $('#carType').val();
	var carModel = $('#carModel').val();
	
	param.carOwnerName = carOwnerName;
	param.carOwnerTelephone = carOwnerTelephone;
	param.carNum = carNum;
	param.carType = carType;
	if(carType != 'damas' && carType != 'labo') {
		param.carModel = carModel;
	}
	
	if(carType == 'damas' || carType == 'labo') {
		if(carOwnerName=='' || carOwnerTelephone=='' || carNum=='' || carType=='') {
			flag = false;
			alert("필수항목을 입력해주세요.");
		} else {
			flag = true;
		}
	} else {
		if(carOwnerName=='' || carOwnerTelephone=='' || carNum=='' || carType=='' || carModel=='') {
			flag = false;
			alert("필수항목을 입력해주세요.");
		} else {
			flag = true;
		}
	}
	
	if($('.resultPhone').hasClass('text-danger')) {
		flag = false;
		alert("전화번호 형식이 맞지 않습니다.");
	}
	
	if(flag && confirm("저장하시겠습니까?")) {
		//console.log(param);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/carowner/save'/>",
			data : param,
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				//console.log(data);
				
				if(data.resultCode == '00003') {
					alert("이미 존재하는 비상차주입니다.");
				} else if(data.resultCode == '00000') {
					alert("비상차주가 등록되었습니다.");
					$('input:text').val('');
					$('#carType option:eq(0)').prop('selected', true);
					$('#carModel option:eq(0)').prop('selected', true);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
});

//전화번호 형식체크
$('#carOwnerTelephone').on('change', function(){
	if(!checkTelNum($('#carOwnerTelephone').val())) {
		$('.resultPhone').html('전화번호 형식이 맞지 않습니다.').addClass('text-danger');
	} else {
		$('.resultPhone').html('').removeClass('text-danger');
	}
});
</script>
