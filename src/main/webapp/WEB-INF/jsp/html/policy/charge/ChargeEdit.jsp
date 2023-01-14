<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="isCreate" value="false"/>
<c:set var="isUpdate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}"><c:set var="isCreate" value="true"/></c:if>
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
</c:forEach>
<!-- 요금정보 -->
<div class="card-box info-box" data-idx="${result.chargeIdx}">
	<div class="row">
		<div class="col-6">
			<h5 class="card-title">요금 정보</h5>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 40%;">
				<col style="width: 10%;">
				<col style="width: 40%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">요금제명</th>
					<td>
						<div class="row">
							<div class="col-5">
								<input type="text" class="form-control" value="${result.chargeName}" id="chargeName">
							</div>
						</div>
					</td>
					<th>기본요금제여부</th>
					<td>
						<div class="row">
							<div class="col-12">
								<div class="col-10 col-form-label p-0 text-left">
									<div class="form-check form-check-inline">
										<input type="radio" id="chargeBasicY" name="chargeBasic" class="form-check-input" value="Y" <c:if test="${empty result or result.chargeBasic eq 'Y'}">checked</c:if>>
										<label class="form-check-label" for="chargeBasicY">Y</label>
									</div>
									<div class="form-check form-check-inline pl-2">
										<input type="radio" id="chargeBasicN" name="chargeBasic" class="form-check-input" value="N" <c:if test="${result.chargeBasic eq 'N' }">checked</c:if>>
										<label class="form-check-label" for="chargeBasicN">N</label>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">사용여부</th>
					<td>
						<div class="row">
							<div class="col-12">
								<div class="col-10 col-form-label p-0 text-left">
									<div class="form-check form-check-inline">
										<input type="radio" id="chargeUseY" name="chargeUse" class="form-check-input" value="Y" <c:if test="${empty result or result.chargeUse eq 'Y'}">checked</c:if>>
										<label class="form-check-label" for="chargeUseY">Y</label>
									</div>
									<div class="form-check form-check-inline pl-2">
										<input type="radio" id="chargeUseN" name="chargeUse" class="form-check-input" value="N"  <c:if test="${result.chargeUse eq 'N' }">checked</c:if>>
										<label class="form-check-label" for="chargeUseN">N</label>
									</div>
								</div>
							</div>
						</div>
					</td>
					<th>사용기간</th>
					<td>
						<div class="row">
							<div class="col-6">
								<div class="picker-wrap">
									<input type="text" id="useDate" class="form-control" name="useDate" value="${result.chargeStartDate} ~ ${result.chargeEndDate}">
									<label for="useDate"><i class="fas fa-calendar"></i></label>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">최종수정자</th>
					<td>
						<c:choose>
							<c:when test="${empty result}">${User.adminId}</c:when>
							<c:otherwise>${result.workerId}</c:otherwise>
						</c:choose>
					</td>
					<th>최종수정일</th>
					<td>
						<c:choose>
							<c:when test="${empty result}">
								<c:set var = "now" value = "<%=new java.util.Date()%>" />
								<fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm:ss"/> 
							</c:when>
							<c:otherwise>${result.updDate}</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- //요금정보 -->
</div>

<!-- 마진율 정보 -->
<div class="card-box info-box">
	<h5 class="card-title">마진율 정보</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col width="10%">
				<col/>
			</colgroup>
			<tbody>
                <tr>
                	<th>마진율</th>
					<td>
						<div class="row">
							<div class="col-1">
								<input type="number" name="chargeMargin" class="form-control" min="0"  max="99"  value="${result.chargeMargin}"
									onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
							</div>
						</div>
					</td>
                </tr>
			</tbody>
		</table>
	</div>
	<!-- //마진율정보 -->
</div>

<div class="col-12 edit">
	<ul class="nav nav-tabs navtab-bg charge">
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="true" class="nav-link active" data-tab_type="base">기준단가</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="distance">거리별 가중치</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="cartype">차량유형별 가중치</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="oilcost">유류비</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="area">지역별 가중치</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="nextdaydrop">익일하차 가중치</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="manualcost">상/하차 수작업 비용</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="emergency">긴급화물 가중치</a>
	    </li>
	    <li class="nav-item">
	        <a data-toggle="tab" aria-expanded="false" class="nav-link" data-tab_type="wokingtime">작업시간별 가중치</a>
	    </li>
	</ul>
	<div class="tab-content pt-0">
		<!-- 기준단가 -->
		<div class="tab-pane" id="base" data-load="false"></div>
		<!-- 거리별 가중치 -->
		<div class="tab-pane" id="distance" data-load="false"></div>
		<!-- 차량유형별 가중치 -->
		<div class="tab-pane" id="cartype" data-load="false"></div>
		<!-- 유류비 -->
		<div class="tab-pane" id="oilcost" data-load="false"></div>
		<!-- 지역별 가중치 -->
		<div class="tab-pane" id="area" data-load="false"></div>
		<!-- 익일하차 가중치  -->
		<div class="tab-pane" id="nextdaydrop" data-load="false"></div>
		<!-- 상/하차 수잡업 비용  -->
		<div class="tab-pane" id="manualcost" data-load="false"></div>
		<!-- 긴급화물 가중치 -->
		<div class="tab-pane" id="emergency" data-load="false"></div>
		<!-- 작업시간별 가중치  -->
		<div class="tab-pane" id="wokingtime" data-load="false"></div>
	</div>
</div>

<div class="button-list text-center">
	<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="listCharge">목록</button>
	<c:choose>
		<c:when test="${pageType eq 'insert'}">
			<c:if test="${isCreate}">
				<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="saveCharge">저장</button>
			</c:if>
		</c:when>
		<c:when test="${pageType eq 'update'}">
			<c:if test="${isUpdate}">
				<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="saveCharge">저장</button>
			</c:if>
		</c:when>
	</c:choose>
	
</div>

<!-- Popup -->
<div id="popup_getChargePolicy"></div> <!-- 요금불러오기 -->


<script>
//사용기간 date picker 초기화 
$('#useDate').flatpickr({
	mode : "range",
	dateFormat: "Y.m.d",
    locale: {
        rangeSeparator: ' ~ '
    }
});

//탭선택 
$('.charge.nav-tabs').on('click', 'li', function(){
	var idx = $('.info-box').data('idx');
	var tabContentId = $(this).find('.nav-link').data('tab_type');
	var flag = $('#'+tabContentId).data('load');
	//console.log(tabContentId, flag);
	if(flag){
		//tab active
		$('.tab-pane').removeClass('active');
		$('#'+tabContentId).addClass('active');
	}else{
		//조회하기
		loadEditTabType(idx, tabContentId);
	}
});

//거리별 가중치 행추가
$('#distance').on('click', '.addRow', function(){
	var addTrTag = $(this).closest('.row').siblings('div').find('.add_default').html();
	var selectRow = $(this).closest('.row').siblings('div').find('input:checkbox[name=distance_chk]:checked');
	
	var checkLength = selectRow.length;
	if(checkLength < 1) {
		//행선택X > 최하단에 추가
		$(this).closest('.row').siblings('div').find('tbody').append('<tr>'+addTrTag+'</tr>');
	} else {
		//행선택O > 선택한 행 하단에 추가
		selectRow.each(function(){
			$(this).closest('tr').after('<tr>'+addTrTag+'</tr>');
		});
	}
	
	
});

//거리별 가중치 행삭제
$('#distance').on('click', '.deleteRow', function(){
	var selectRow = $(this).closest('.row').siblings('div').find('input:checkbox[name=distance_chk]:checked');
	
	var checkLength = selectRow.length;
	if(checkLength < 1) {
		alert("삭제할 행을 선택하세요.");
	} else {
		selectRow.each(function(){
			$(this).closest('tr').remove();
		});
	}
});

//거리별 가중치 전체선택
$('#distance').on('change', '.distance_chk_all', function(){
	var checkYn = $(this).is(':checked');
	if(checkYn) {	
		$(this).closest('table').find('input:checkbox:not(:disabled)').prop('checked', true);
		$(this).closest('table').find('input:checkbox:not(:disabled)').closest('tbody tr').addClass('select');
	} else {
		$(this).closest('table').find('input:checkbox:not(:disabled)').prop('checked', false);
		$(this).closest('table').find('input:checkbox:not(:disabled)').closest('tbody tr').removeClass('select');
	}
});

//거리별 가중치 행선택
$('#distance').on('change', '[name=distance_chk]', function(){
	if($(this).is(':checked')) {
		$(this).closest('tr').addClass('select');
	} else {
		$(this).closest('tr').removeClass('select');
	}
});

//거리별가중치 거리 입력
$('#distance').on('keyup', '.km_end', function(){
	var index = $('.km_end').index(this);
	//console.log('index', index);
	
	var temp = $(this).val();
	
	if(temp > 600){ //600보다 클 경우 border 추가
		$(this).data('is_ok', false);
	}else{
		$(this).data('is_ok', true);;
	}
		
	var next = index+1;	
	if($('.km_end').eq(next).length == 1){
		//if(temp < 600){
		//새로 생선된 행에 +1해서 값 표시
		temp = temp*1
		$('.km_start').eq(next).val(temp+1);
		//}
	}
});



//지역별가중치 추가 
$('#area').on('click', '.btn_area_popup', function(){
	var code=  $(this).parents('.div_area').data('code');
	var name= $(this).parents('.div_area').data('name');
	//console.log(code, name);
	loadAreaPopup(code, name);
});

//지역별가중치 삭제
$('#area').on('click', '.btn_area_del', function(){
	var code=  $(this).parents('.div_area').data('code');
	
	var chk = $('.table_'+code+' tbody tr [name="'+code+'_chk"]:checked').length;
	if(chk == 0){
		alert('삭제할 지역을 선택해주세요.');
		return;
	}
	
	var list = $('.table_'+code+' tbody tr');
	list.each(function (idx, item) {
		var temp = $(item).find('[name="'+code+'_chk"]:checked').length;
		if(temp == 1){
			$(item).remove();
		} 
	});
});


//작업시간별 가중치 행추가
$('#wokingtime').on('click', '#addWorkRow', function(){
	var addWorkTrTag = $(this).closest('.row').siblings('div').find('.work_default').html();
	var id = new Date().getTime();
	$(this).closest('.row').siblings('div').find('tbody').append('<tr class="workRow" id="'+id+'">'+addWorkTrTag+'</tr>');
	
	//추가된 행에 flatpickr 적용
	$('#'+id+' .workApplyDate').flatpickr({
		mode : "range",
		dateFormat: "Y.m.d",
	    locale: {
	        rangeSeparator: ' ~ '
	    }
	});
	
});

//작업시간별 가중치 행삭제
$('#wokingtime').on('click', '.deleteWorkRow', function(){
	var workRowLength = $('.workRow').length;
	$(this).closest('.workRow').remove();
});

//목록 호출 
$('#listCharge').on('click', function(){
	var tempData = searchedData;
	if($.isEmptyObject(tempData)){
		routie('list');
	}else{
		routie('list/'+encodeURIComponent(JSON.stringify(tempData)));
	}
});

//정책 저장
$('#saveCharge').on('click', function(){
	var tab = $('.nav-tabs .active').data('tab_type');
	switch(tab) {
	case 'base' : //기본단가
   		saveCharge();
    	break;
    case 'distance': //거리별 가중치
   	 	saveDistance();
   		break;
   	case 'cartype': //차량유형별 가중치
   		saveCarType();
   		break;
	case 'oilcost': //유류비 
		saveOilCost();
   		break;
   	case 'area':	//지역별가중치
   		saveArea();
   		break;
    case 'nextdaydrop': //익일하차 가중치
   	 	saveNextDayDrop();
		break;
	case 'manualcost': //상/하차 수작업비용
		saveManualCost();
		break;
	case 'emergency': //긴급화물 가중치
		saveEmergency();
		break;
	case 'wokingtime': //작업시간별 가중치 
		saveWokingTime();
		break;
  	default :
    	break;
	}
});


//input box 숫자,콤마,소수점 첫번째자리
function inputNumberFormat(obj) {

	obj.value = numCommaDecimal(obj);
	
	//수정일 경우 변경되면 표시하여주기
	var tab = $('.nav-tabs .active').data('tab_type');
	var pageType = '';
	switch(tab) {
	case 'base' : //기본단가
		pageType = $('.table_base_unit').data('page_type');
    	break;
   	case 'distance': //거리별 가중치
   	 	//pageType = $('.table_distance').data('page_type');
  		break;
 	case 'oilcost': //유류비 
 		pageType = $('.table_oil_cartype').data('page_type');
  		break;
    case 'nextdaydrop': //익일하차 가중치
   	 	//pageType = $('.table_nextdaydrop').data('page_type');
		break;
	case 'manualcost': //상/하차 수작업비용
		pageType = $('.table_manualcost').data('page_type');
		break;
	case 'emergency': //긴급화물 가중치
		//pageType = $('.table_emergency').data('page_type');
		break;
	case 'cartype': //차량유형별 가중치
	case 'wokingtime': //작업시간별 가중치 
  	default :
  		//console.log(tab);
    	break;
	}
	
	//기존값 변경된 금액비교하여 addClass
	if(pageType == 'U'){
		$(obj).addClass('color-border-danger');
		var temp = $(obj).val();
		if(temp != ''){
			temp = uncomma(temp)
		}
		if(temp == $(obj).data('org_value')){
			$(obj).removeClass('color-border-danger');
		}
	}
}

//콤마,소수점 셋째자리 유효성
function numCommaDecimal(_obj) {
	var obj = _obj.value
	
	obj = obj.replace('-', ''); //음수표시안되도록
	
	var regx = new RegExp(/(-?\d+)(\d{3})/);
	var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
	var strArr = obj.split('.');
	while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
	  //정수 부분에만 콤마 달기
		strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
	}
	
	//표시제한 (data값에 length에 있는 값으로)
	var length = $(_obj).data('length');
	if(length != ''){
		var tmpObj = uncomma(strArr[0])
		if(tmpObj.length > length){
			 strArr[0] = comma(tmpObj.substring(0, length));
		}
	}

	if (bExists > -1) {
		//. 소수점 문자열이 발견되지 않을 경우 -1 반환
		obj = strArr[0] + "." + strArr[1];
	} else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환
		obj = strArr[0];
	}
	

	var charCode = (event.which) ? event.which : event.keyCode;
	var _value = event.srcElement.value;

	//소수점 (.)이 두번 이상 나오지 않게 한다.
	var _pattern0 = /^\d*[.]\d*$/;
	if (_pattern0.test(_value)) {
		if (charCode == 46) {
			return "";
		}
	}

	//현재 value 값이 소수점 셋째자리 숫자이면 더이상 입력 불가
	var _pattern2 = /^\d*[.]\d{2}$/;
	if (_pattern2.test(_value)) {
		//console.log('소수점첫째자리까지 입력가능')
		return obj.substring(0, obj.length - 1);
	}

	
	return obj;//문자열 반환
}


</script>
