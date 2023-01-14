<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin search -->
<div class="card-box search-box">
	<h5 class="card-title">조회조건</h5>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="range-datepicker" class="col-1 col-form-label">등록일</label>
				<div class="col-11">
					<div class="row">
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="searchDatepicker" class="form-control" placeholder="기간선택" name="test01"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-8">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="search">오늘</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange week" data-target-input="search">최근7일</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 30days" data-target-input="search">최근1개월</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="select01" class="col-1 col-form-label">회원</label>
				<div class="col-8 col-form-label text-left">
					<div class="form-check-inline">
						<input type="checkbox" class="form-check-input" name="vocRecipient" id="vocRecipientFrgown" value="화주" <c:if test="${vo.vocOwnerClassification eq '화주'}">checked</c:if>>
						<label class="form-check-label" for="vocRecipientFrgown">화주</label>
		 			</div>
					<div class="form-check-inline">
						<input type="checkbox" class="form-check-input" name="vocRecipient" id="vocRecipientCarown" value="차주"  <c:if test="${vo.vocOwnerClassification eq '차주'}">checked</c:if>>
						<label class="form-check-label" for="vocRecipientCarown">차주</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="select05" class="col-1 col-form-label">상태</label>
				<div class="col-8 col-form-label text-left">
					<div class="form-check-inline">
						<input type="checkbox" class="form-check-input" name="vocStatus" id="vocStatusWait" value="standby"  <c:if test="${vo.vocStatus eq 'standby'}">checked</c:if>>
						<label class="form-check-label" for="vocStatusWait">답변대기</label>
		 			</div>
					<div class="form-check-inline">
						<input type="checkbox" class="form-check-input" name="vocStatus" id="vocStatusComplete" value="complete" <c:if test="${vo.vocStatus eq 'complete'}">checked</c:if>>
						<label class="form-check-label" for="vocStatusComplete">답변완료</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="select05" class="col-1 col-form-label">검색어</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="searchType">
								<option value="title" <c:if test="${'title' eq vo.searchType}">selected</c:if>>제목</option>
								<option value="content" <c:if test="${'content' eq vo.searchType}">selected</c:if>>내용</option>
								<option value="all" <c:if test="${'all' eq vo.searchType}">selected</c:if>>제목+내용</option>
								<option value="writer" <c:if test="${'writer' eq vo.searchType}">selected</c:if>>최종작성자</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="searchText" placeholder="검색어를 입력하세요." value="${vo.searchText}">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
			<button type="button" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
		</div>
	</div>
</div>
<!-- End search -->
<!-- Begin List -->
<div class="card-box searchList">
</div>

<script>
<c:if test="${null ne vo.vocExposedStartDate and '' ne vo.vocExposedStartDate}">
	data.startDate =  new Date(new Date(${vo.vocExposedStartDate}).setHours(0, 0, 0, 0)) 
</c:if>
<c:if test="${null ne vo.vocExposedEndDate and '' ne vo.vocExposedEndDate}">
	data.endDate = new Date(new Date(${vo.vocExposedEndDate}).setHours(23, 59, 59, 0));
</c:if>

	//조회버튼
	$('button[name="searchBtn"]').on('click touch', function () {
		data.nowPage =1;
		searchList();
	});
	
	var searchDatepicker;
	
	$(document).ready(function() {
		// initPicker
		searchDatepicker = flatpickr($('#searchDatepicker'), {
			mode : "range",
			defaultDate : [
				data.startDate
				, data.endDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.startDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.endDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.startDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.endDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			}
		});
	})

</script>
