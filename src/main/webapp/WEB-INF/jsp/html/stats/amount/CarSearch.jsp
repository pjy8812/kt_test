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
        	<div class="div-car">
	            <div class="row car org">
	                <div class="col-3 type">
	                    <div class="form-group row">
	                        <label for="" class="col-4 col-form-label car type label">차종1</label>
	                        <div class="col-6">
								<select class="form-control car type">
									<option value="all">전체</option>
									<c:forEach items="${carType}" var="list">
										<option value="${list.codeId}" <c:if test="${list.codeId eq 'cargo'}">selected</c:if>>${list.codeName}</option>
									</c:forEach>
								</select>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-3 model">
	                    <div class="form-group row mb-3">
	                        <label for="" class="col-4 col-form-label car model label">톤수1</label>
	                        <div class="col-6">
								<select class="form-control car model">
									<option value="all">전체</option>
									<c:forEach items="${carModel}" var="list">
										<option value="${list.codeId}">${list.codeName}</option>
									</c:forEach>
								</select>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-1 div-btn">
	                    <button type="button" class="btn btn-white waves-effect btn-custom03" id="btnAddCar">+ 차량 추가</button>
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
	searchCarList();
});

// 차종 선택
$('.contents').on('change', '.form-control.car.type', function(){
	var value = $(this).val();
	
	if(value == 'all') {
		//차종 > '전체' 선택
		$('.form-control.car.model').val('all').prop('selected', true);
		$('.form-control.car.model').prop('disabled', true);
		
		$('#btnAddCar').addClass('d-none');
		$('.row.car.add').remove();
		addCnt = 1;
	} else {
		$('#btnAddCar').removeClass('d-none');
		
		if(value == 'damas' || value == 'labo') {
			//다마스, 라보 > 톤수 '없음'
			$(this).closest('.col-3.type').siblings('.col-3.model').find('.form-control.car.model').prepend('<option value="none">없음</option>');
			$(this).closest('.col-3.type').siblings('.col-3.model').find('.form-control.car.model').val('none').prop('selected', true);
			$(this).closest('.col-3.type').siblings('.col-3.model').find('.form-control.car.model').prop('disabled', true);
		} else if(value == 'deck' || value == 'doubleDeck' || value == 'trailer' || value == 'doubleDeckTrailer') {
			//데크, 더블데크, 트레일러, 더블데크트레일러 > 톤수 '25t'
			$(this).closest('.col-3.type').siblings('.col-3.model').find(".form-control.car.model option[value='none']").remove();
			$(this).closest('.col-3.type').siblings('.col-3.model').find('.form-control.car.model').val('twentyFiveT').prop('selected', true);
			$(this).closest('.col-3.type').siblings('.col-3.model').find('.form-control.car.model').prop('disabled', true);
		} else {
			$(this).closest('.col-3.type').siblings('.col-3.model').find(".form-control.car.model option[value='none']").remove();
			$(this).closest('.col-3.type').siblings('.col-3.model').find('.form-control.car.model').val('all').prop('selected', true);
			$(this).closest('.col-3.type').siblings('.col-3.model').find('.form-control.car.model').prop('disabled', false);
		}
	}
});

// 차량추가
var addCnt = 1;
$('#btnAddCar').on('click', function(){
	if(addCnt < 5) {
		addCnt++;
		
		var rowCar = $('.row.car.org').html(); //차량 row 추가
		$('.div-car').append('<div class="row car add">' + rowCar + '</div>');
		
		$('.row.car.add').find('.div-btn').empty(); //차량 추가버튼 제거
		
		var btnDel = '<button type="button" class="btn btn-dark waves-effect btn-del-radius delcar"><i class="mdi mdi-close"></i></button>';
		$('.row.car.add').find('.div-btn').html(btnDel); //차량 삭제버튼 추가
		
		$('.row.car').each(function(idx){
			idx = idx+1;
			
			//차종/톤수 라벨 변경
			$(this).find('.car.type.label').text('차종'+idx);
			$(this).find('.car.model.label').text('톤수'+idx);
		});

		//추가된 row의 select option 기본설정
		$('.row.car.add').eq(addCnt-2).find(".form-control.car.type option[value='all']").remove(); //차종 '전체' 제외
		$('.row.car.add').eq(addCnt-2).find(".form-control.car.model option[value='none']").remove(); //톤수 '없음' 제외
		$('.row.car.add').eq(addCnt-2).find(".form-control.car.model").prop('disabled', false);
	} else {
		alert("최대 5개까지 조회할 수 있습니다.");
	}
});

// 차량 삭제
$('.contents').on('click', '.delcar', function(){
	addCnt--;
	$(this).closest('.row.car.add').remove(); //차량 row 삭제
	
	$('.row.car').each(function(idx){
		idx = idx+1;
		
		//차종/톤수 라벨 변경
		$(this).find('.car.type.label').text('차종'+idx);
		$(this).find('.car.model.label').text('톤수'+idx);
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