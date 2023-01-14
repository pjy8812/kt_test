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
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="select01" class="col-2 col-form-label">구분/유형</label>
						<div class="col-3">
							<select class="form-control" id="freightOwnerType">
								<option value="all">계약구분(전체)</option>
								<c:forEach var="row" items="${freightOwnerType}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.freightOwnerType}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-3">
							<select class="form-control" id="freightOwnerMemberType">
								<option value="all">사업자구분(전체)</option>
								<c:forEach var="row" items="${memberType}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.freightOwnerMemberType}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
							</select> 
						</div>
						<div class="col-3">
							<select class="form-control" id="freightOwnerBusinessType">
								<option value="all">사업자유형(전체)</option>
								<c:forEach var="row" items="${businessType}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.freightOwnerBusinessType}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="select03" class="col-4 col-form-label">이용상태</label>
						<div class="col-8">
							<select class="form-control" id="freightOwnerMemberStatus">
								<option value="all">전체</option>
								<c:forEach var="row" items="${memberStatus}">
									<option value="${row.codeId}" <c:if test="${row.codeId eq vo.freightOwnerMemberStatus}">selected</c:if>>${row.codeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="select04" class="col-4 col-form-label">월 정산 횟수</label>
						<div class="col-8">
							<select class="form-control" id="freightOwnerMonthSettlementNum">
								<option value="0"  <c:if test="${'0' eq vo.freightOwnerMonthSettlementNum}">selected</c:if>>전체</option>
								<option value="0" <c:if test="${result.freightOwnerMonthSettlementNum eq '0'}">selected</c:if>>0회</option>
								<option value="1"  <c:if test="${'1' eq vo.freightOwnerMonthSettlementNum}">selected</c:if>>1회 (매월 1일)</option>
								<option value="2"  <c:if test="${'2' eq vo.freightOwnerMonthSettlementNum}">selected</c:if>> 2회 (매월 1일, 15일)</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="select05" class="col-2 col-form-label">검색어</label>
						<div class="col-9">
							<div class="row">
								<div class="col-4">
									<select class="form-control" id="searchType">
										<option value="freightOwnerName" <c:if test="${'freightOwnerName' eq vo.searchType}">selected</c:if>>화주명</option>
										<option value="freightOwnerId" <c:if test="${'freightOwnerId' eq vo.searchType}">selected</c:if>>화주ID</option>
										<option value="freightOwnerCorperateRegistrationName" <c:if test="${'freightOwnerCorperateRegistrationName' eq vo.searchType}">selected</c:if>>화주사</option>
										<option value="freightOwnercorporateRegistrationNumber" <c:if test="${'freightOwnercorporateRegistrationNumber' eq vo.searchType}">selected</c:if>>사업자등록번호</option>
										<option value="freightOwnerTelephone" <c:if test="${'freightOwnerTelephone' eq vo.searchType}">selected</c:if>>전화번호</option>
										<option value="freightOwnerEmail" <c:if test="${'freightOwnerEmail' eq vo.searchType}">selected</c:if>>이메일주소</option>
									</select>
								</div>
								<div class="col-8">
									<input type="text" class="form-control" id="searchText" placeholder="검색어를 입력하세요." value="${vo.searchText }">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-3"></div>
				<div class="col-3">
					<div class="form-group row mb-3">
						<label for="select04" class="col-4 col-form-label">가입서류 확인</label>
						<div class="col-8">
							<select class="form-control" id="freightOwnerFileAdminCheckYN">
								<option value="all">전체</option>
								<option value="N" <c:if test="${vo.freightOwnerFileAdminCheckYN eq 'N'}">selected</c:if>>미확인</option>
								<option value="Y" <c:if test="${vo.freightOwnerFileAdminCheckYN eq 'Y'}">selected</c:if>>확인완료</option>
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
				<label for="range-datepicker" class="col-1 col-form-label">회원가입일</label>
				<div class="col-11">
					<div class="row">
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="joinDate" class="form-control" placeholder="기간선택"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-8">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="joinDate">오늘</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange week" data-target-input="joinDate">최근7일</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 30days" data-target-input="joinDate">최근1개월</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="range-datepicker" class="col-1 col-form-label">최종이용일</label>
				<div class="col-11">
					<div class="row">
						<div class="col-4">
							<div class="picker-wrap">
								<input type="text" id="lastUseDate" class="form-control" placeholder="기간선택"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							</div>
						</div>
						<div class="col-8">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange today" data-target-input="lastUseDate">오늘</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 3to6mon" data-target-input="lastUseDate">3개월~6개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange before6mon" data-target-input="lastUseDate">6개월 이전</button>
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
	//조회버튼
	$('button[name="searchBtn"]').on('click touch', function () {
		data.nowPage = 1;
		searchList();
	});

	var joinDatepicker;
	var lastUseDatepicker; 
	
	function initServiceEvent() {
		//회원가입일  
		joinDatepicker = flatpickr($('#joinDate'), {
			mode : "range",
			defaultDate : [
				data.joinStartDate
				, data.joinEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.joinStartDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.joinEndDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.joinStartDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.joinEndDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			}
		})
		
		//최종이용일                     
		lastUseDatepicker = flatpickr($('#lastUseDate'), {
			mode : "range",
			defaultDate : [
				data.lastUseStartDate
				, data.lastUseEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.lastUseStartDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.lastUseEndDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.lastUseStartDate = new Date(new Date(selectedDates[0]).setHours(0, 0, 0, 0));
				data.lastUseEndDate = new Date(new Date(selectedDates[1]).setHours(23, 59, 59, 0));
			}
		})
		
	}

	$(document).ready(function() {
		// initPicker
		initServiceEvent();
	})

</script>
