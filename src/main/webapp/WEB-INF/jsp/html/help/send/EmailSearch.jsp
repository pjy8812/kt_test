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
			<div class="row">
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="select01" class="col-4 col-form-label">발송구분</label>
						<div class="col-8">
							<select class="form-control" id="sendCategory">
								<option value="all">구분(전체)</option>
								<c:forEach var="row" items="${sendCategory}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.sendCategory}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="faqCategory" class="col-4 col-form-label">발송항목</label>
						<div class="col-8">
							<select class="form-control" id="templateName">
								<option value="all">항목(전체)</option>
								<c:forEach var="row" items="${templateName}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.templateName}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="faqCategory" class="col-4 col-form-label">발송대상</label>
						<div class="col-8">
							<select class="form-control" id="sendTarget">
								<option value="all">대상(전체)</option>
								<c:forEach var="row" items="${sendTarget}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.sendTarget}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="faqCategory" class="col-4 col-form-label">발송상태</label>
						<div class="col-8">
							<select class="form-control" id="sendStatus">
								<option value="all">상태(전체)</option>
								<c:forEach var="row" items="${sendStatus}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.sendStatus}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
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
				<label for="select05" class="col-1 col-form-label">검색어</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="searchType">
								<option value="toName" <c:if test="${'toName' eq vo.searchType}">selected</c:if>>회원명</option>
								<option value="toId" <c:if test="${'toId' eq vo.searchType}">selected</c:if>>회원ID</option>
								<option value="toCompany" <c:if test="${'toCompany' eq vo.searchType}">selected</c:if>>상호</option>
								<option value="toTel" <c:if test="${'toTel' eq vo.searchType}">selected</c:if>>전화번호</option>
								<option value="toEmail" <c:if test="${'toEmail' eq vo.searchType}">selected</c:if>>이메일주소</option>
								<option value="msg" <c:if test="${'msg' eq vo.searchType}">selected</c:if>>발송내용</option>
								<option value="fromId" <c:if test="${'fromId' eq vo.searchType}">selected</c:if>>발송자ID</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="searchText" placeholder="검색어를 입력하세요." value="${vo.searchText}">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="range-datepicker" class="col-1 col-form-label">발송일자</label>
				<div class="col-11">
					<div class="row">
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="searchDatepicker" class="form-control" placeholder="기간선택"> <label for="range-datepicker">
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
		<div class="col-2 text-right">
			<button type="button" name="btnEmailSearch" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
		</div>
	</div>
</div>
<!-- End search -->
<!-- Begin List -->
<div class="card-box searchList">
</div>

<script>
	<c:if test="${null ne vo.startDate and '' ne vo.startDate}">
		data.startDate =  new Date(new Date(${vo.startDate}).setHours(0, 0, 0, 0)) 
	</c:if>
	<c:if test="${null ne vo.endDate and '' ne vo.endDate}">
		data.endDate = new Date(new Date(${vo.endDate}).setHours(23, 59, 59, 0));
	</c:if>

	//조회버튼
	$('button[name="btnEmailSearch"]').on('click touch', function () {
		data.nowPage = 1;
		searchEmailList();
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
	});
</script>
