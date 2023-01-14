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
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="select05" class="col-1 col-form-label">요청자ID</label>
				<div class="col-4">
					<input type="text" class="form-control" id="searchText" placeholder="요청자 ID를 입력하세요." value="${vo.carOwnerId}">
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
			<button type="button" name="searchLocationBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
		</div>
	</div>
</div>
<!-- End search -->
<!-- Begin List -->
<div class="card-box searchList">
</div>

<script>
<c:if test="${null ne vo.createStratDate and '' ne vo.createStratDate}">
	locationData.startDate =  new Date(new Date(${vo.createStratDate}).setHours(0, 0, 0, 0)) 
</c:if>
<c:if test="${null ne vo.createEndDate and '' ne vo.createEndDate}">
	locationData.endDate = new Date(new Date(${vo.createEndDate}).setHours(23, 59, 59, 0));
</c:if>

	//조회버튼
	$('button[name="searchLocationBtn"]').on('click touch', function () {
		locationData.nowPage = 1;
		searchLocationList();
	});
	
	var searchDatepicker;
	
	$(document).ready(function() {
		// initPicker
		searchDatepicker = flatpickr($('#searchDatepicker'), {
			mode : "range",
			defaultDate : [
			locationData.startDate
				, locationData.endDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				locationData.startDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				locationData.endDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				locationData.startDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				locationData.endDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			}
		});
	})

</script>
