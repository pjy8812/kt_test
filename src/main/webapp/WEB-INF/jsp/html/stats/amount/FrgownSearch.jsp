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
            <div class="row">
                <div class="col-3">
                    <div class="form-group row">
                        <label for="freightOwnerType" class="col-4 col-form-label">유형</label> <!-- 사업자유형 -->
                        <div class="col-7">
							<select class="form-control" id="freightOwnerType">
								<option value="all">전체</option>
								<c:forEach items="${businessType}" var="list">
									<option value="${list.codeId}" <c:if test="${list.codeId eq vo.freightOwnerType}">selected</c:if>>${list.codeName}</option>
								</c:forEach>
							</select>
                        </div>
                    </div>
                </div>
                <div class="col-7">
                    <div class="form-group row mb-3">
                        <label for="businessType" class="col-2 col-form-label">구분</label> <!-- 계약구분-사업자구분 -->
                        <div class="col-3">
							<select class="form-control" id="businessType" disabled>
								<option value="all">전체</option>
								<option value="01" <c:if test="${vo.businessType eq '01'}">selected</c:if>>계약-사업자</option>
								<option value="02" <c:if test="${vo.businessType eq '02'}">selected</c:if>>계약-비사업자</option>
								<option value="03" <c:if test="${vo.businessType eq '03'}">selected</c:if>>일반-사업자</option>
								<option value="04" <c:if test="${vo.businessType eq '04'}">selected</c:if>>일반-비사업자</option>
								<option value="manualDelivery" <c:if test="${vo.businessType eq 'manualDelivery'}">selected</c:if>>수동배차-계약화주</option>
							</select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
                <label for="" class="col-1 col-form-label">기간</label>
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
	searchFrgownList();
});

// 유형 선택
$('#freightOwnerType').on('change', function(){
	var value = $(this).val();
	if(value == 'all') {
		$('#businessType').val('all').prop('selected', true);
		$('#businessType').prop('disabled', true);
	} else {
		$('#businessType').prop('disabled', false);
	}
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
