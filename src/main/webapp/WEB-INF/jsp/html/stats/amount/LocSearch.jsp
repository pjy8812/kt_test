<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="now" class="java.util.Date"/>

<div class="card-box">
    <h5 class="card-title">조회조건</h5>
    <div class="row">
        <div class="col-10">
        	<div class="div-location">
	            <div class="row location org">
	                <div class="col-3">
	                    <div class="form-group row">
	                        <label for="" class="col-4 col-form-label location loading label">상차지1</label>
	                        <div class="col-5">
								<select class="form-control location loading">
									<option value="all">전체</option>
									<option value="00" selected>서울</option>
									<option value="01">대구</option>
									<option value="02">경기</option>
									<option value="03">울산</option>
									<option value="04">인천</option>
									<option value="05">부산</option>
									<option value="06">강원</option>
									<option value="07">경남</option>
									<option value="08">충북</option>
									<option value="09">전북</option>
									<option value="10">세종</option>
									<option value="11">전남</option>
									<option value="12">충남</option>
									<option value="13">광주</option>
									<option value="14">대전</option>
									<option value="15">제주</option>
									<option value="16">경북</option>
								</select>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-3">
	                    <div class="form-group row mb-3">
	                        <label for="" class="col-4 col-form-label location unloading label">하차지1</label>
	                        <div class="col-5">
								<select class="form-control location unloading">
									<option value="00">서울</option>
									<option value="01">대구</option>
									<option value="02">경기</option>
									<option value="03">울산</option>
									<option value="04">인천</option>
									<option value="05" selected>부산</option>
									<option value="06">강원</option>
									<option value="07">경남</option>
									<option value="08">충북</option>
									<option value="09">전북</option>
									<option value="10">세종</option>
									<option value="11">전남</option>
									<option value="12">충남</option>
									<option value="13">광주</option>
									<option value="14">대전</option>
									<option value="15">제주</option>
									<option value="16">경북</option>
								</select>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-4 div-btn">
	                    <button type="button" class="btn btn-white waves-effect btn-custom03" id="btnAddLocation">+ 상하차지 추가</button>
	                </div>
	            </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-10">
            <div class="form-group row mb-3">
                <label for="select02" class="col-1 col-form-label">기간</label>
                <div class="col-11">
                    <div class="row">
                        <div class="col-2">
                            <select class="form-control basisDate" name="basisDate">
                                <option value="day">일 기준</option>
                                <option value="month">월 기준</option>
                                <option value="year">연 기준</option>
                            </select>
                        </div>

                        <!-- 일 기준 -->
                        <div class="col-2 basisType day">
                            <div class="picker-wrap">
                                <input type="text" class="form-control range-datepicker">
                                <label for="range-datepicker"><i class="fas fa-calendar"></i></label>
                            </div>
                        </div>
                        <div class="col-7 basisType day">
                            <button type="button" class="btn btn-white waves-effect datePicker dateRange 7days" data-target-input="range">최근7일</button>
                            <button type="button" class="btn btn-white waves-effect datePicker dateRange 30days" data-target-input="range">최근1개월</button>
                        </div>
                        
                        <!-- 월 기준 -->
						<div class="col-1 basisType month d-none">
						    <div class="picker-wrap">
						        <input type="text" class="form-control month-datepicker start" placeholder="시작월">
						        <label for="range-datepicker"><i class="fas fa-calendar"></i></label>
						    </div>
						</div>
						<div class="col-auto text-center basisType month d-none">
						    <p class="period-ico">~</p>
						</div>
						<div class="col-1 basisType month d-none">
						    <div class="picker-wrap">
						        <input type="text" class="form-control month-datepicker end" placeholder="종료월">
						        <label for="range-datepicker"><i class="fas fa-calendar"></i></label>
						    </div>
						</div>
                        
                        <!-- 연 기준 -->
						<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/> <!-- 현재년도 -->
						
						<c:set var="yesterday" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>
						      <fmt:formatDate value="${yesterday}" pattern="yyyy" var="lastYear"/> <!-- 어제일자의 년도 -->
						
						<!-- 테스트년도 -->
						<%-- 								<fmt:parseNumber var="lastYear" value="2020"/>                 --%>
                        
                        <div class="col-1 basisType year d-none">
                            <select class="form-control yearData">
								<c:forEach var="i" begin="${lastYear}" end="${thisYear}" step="1">
									<option value="${thisYear-i+lastYear}">${thisYear-i+lastYear}</option>
								</c:forEach>
                             </select>
                         </div>
                     </div>
                 </div>
			</div>
		</div>
		<div class="col-2 text-right">
			<button type="button" class="btn btn-custom04 btn-rounded waves-effect waves-dark" name="searchBtn">조회</button>
		</div>
     </div>
</div>
<div class="searchList"></div>
        
        
<script>
$(document).ready(function() {
	initPicker();
});

// 조회
$('button[name="searchBtn"]').on('click touch', function () {
	searchLocList();
});

// 상차지 선택
$('.form-control.location.loading').on('change', function(){
	var value = $(this).val();
	
	if(value == 'all') {
		//상차지 > '전체' 선택
		$('.form-control.location.unloading').prepend('<option value="all">전체</option>');
		$('.form-control.location.unloading').val('all').prop('selected', true);
		$('.form-control.location.unloading').prop('disabled', true);
		
		$('#btnAddLocation').addClass('d-none');
		$('.row.location.add').remove();
		addCnt = 1;
	} else {
		$(".form-control.location.unloading option[value='all']").remove();
		$('.form-control.location.unloading').prop('disabled', false);
		
		$('#btnAddLocation').removeClass('d-none');
	}
});

// 상하차지 추가
var addCnt = 1;
$('#btnAddLocation').on('click', function(){
	if(addCnt < 5) {		
		addCnt++;
		
		var rowLoc = $('.row.location.org').html(); //상하차지 row 추가
		$('.div-location').append('<div class="row location add">' + rowLoc + '</div>');
		
		$('.row.location.add').find('.div-btn').empty(); //상하차지 추가버튼 제거
		
		var btnDel = '<button type="button" class="btn btn-dark waves-effect btn-del-radius delLocation"><i class="mdi mdi-close"></i></button>';
		$('.row.location.add').find('.div-btn').html(btnDel); //상하차지 삭제버튼 추가
		
		$('.row.location').each(function(idx){
			idx = idx+1;
			
			//상하차지 라벨 변경
			$(this).find('.location.loading.label').text('상차지'+idx);
			$(this).find('.location.unloading.label').text('하차지'+idx);
		});
		
		//추가된 row의 select option 기본설정
		$('.row.location.add').eq(addCnt-2).find(".form-control.location option[value='all']").remove(); //상차지 '전체' 제외
		$('.row.location.add').eq(addCnt-2).find(".form-control.location.unloading option[value='00']").prop('selected', true); //하차지 기본값 '서울'
	} else {
		alert("최대 5개까지 조회할 수 있습니다.");
	}
});

// 상하차지 삭제
$('.contents').on('click', '.delLocation', function(){
	addCnt--;
	$(this).closest('.row.location.add').remove(); //상하차지 row 삭제
	
	$('.row.location').each(function(idx){
		idx = idx+1;
		
		//상하차지 라벨 변경
		$(this).find('.location.loading.label').text('상차지'+idx);
		$(this).find('.location.unloading.label').text('하차지'+idx);
	});
});

// 기간구분 선택
$('.basisDate').on('change', function(){
	toggleBasisType();
});

// 기간검색 > 최근7일 
$('button.datePicker.7days').on('click touch', function() {
	var elName = $(this).data('target-input');
	var valueList = getDateRange(elName, 0, 7);
	updateDateRangePicker(elName, valueList);
});

// 기간검색 > 최근1개월
$('button.datePicker.30days').on('click touch', function() {
	var elName = $(this).data('target-input');
	var valueList = getDateRange(elName, 1, 0);
	updateDateRangePicker(elName, valueList);
});

// 기간 범위
function getDateRange(_elName, _month, _day) {
	var from = new Date(yesterday);
	var to = new Date(yesterday);
	
	var fromMonth = new Date(from.setMonth(from.getMonth() - _month));
	var fromDay = new Date(fromMonth.setDate(fromMonth.getDate() - _day));
	
	return [fromDay, to];
}

// 날짜정보 업데이트 
function updateDateRangePicker(_elName, _value) {
	if(_elName === 'range') {
		if(_value.length === 2) {
			if(_value[1].format('yyyyMMdd') != new Date().format('yyyyMMdd')) {
				data.dateStartDate = _value[0];
				data.dateEndDate = _value[1];

				datePicker.setDate([data.dateStartDate, data.dateEndDate]);
			}
		} else if (_value.length === 1) {
			data.dateStartDate = _value[0];
			data.dateEndDate = _value[0];
		} else {
			data.dateStartDate = new Date();
			data.dateEndDate = new Date();
		}
		return;
	}
}

function toggleBasisType() {
	$('.basisType').addClass('d-none');
	
	data.basisDate = $('.basisDate').val() === undefined ? 'day' : $('.basisDate').val(); 
	
	if(data.basisDate === 'day') {
		$('.basisType.day').removeClass('d-none');
	} else if(data.basisDate === 'month') {
		$('.basisType.month').removeClass('d-none');
	} else if(data.basisDate === 'year') {
		$('.basisType.year').removeClass('d-none');
	}
}
</script>