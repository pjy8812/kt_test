<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="type" value=""/>
<c:choose>
	<c:when test="${empty result or empty result.list}"><c:set var="type" value="C"/></c:when>
	<c:otherwise><c:set var="type" value="U"/></c:otherwise>
</c:choose>

<div class="card-box">
	<h5 class="card-title mb-0">작업시간별 가중치</h5>
	<div class="row mb-2">
		<div class="col-12 text-right">
			<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm" id="addWorkRow">행추가</button>
		</div>
	</div>
	<div class="table-responsive table_workingtime" data-page_type="${type}">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 15%;">
				<col style="width: auto;">
			</colgroup>
			<tbody>
				<c:if test="${empty result or empty result.list}">
					<tr>
						<th scope="row" class="type_chw">주말/공휴일</th>
						<td>
							<div class="row">
								<div class="col-1">
									<input type="number" name="weightChw" class="form-control p-1 text-right" min="0"  max="99" onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="type_chw">심야작업</th>
						<td>
							<div class="row">
								<div class="col-1">
									<input type="number" name="weightChw" class="form-control p-1 text-right" min="0"  max="99" onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
								</div>
							</div>
						</td>
					</tr>
				</c:if>
				<c:forEach var="row" items="${result.list}">
					<c:choose>
						<c:when test="${row.typeChw eq '주말/공휴일' or row.typeChw eq '심야작업'}">
							<tr>
								<th scope="row" class="type_chw">${row.typeChw}</th>
								<td>
									<div class="row">
										<div class="col-1">
											<input type="number" name="weightChw" class="form-control p-1 text-right" min="0" max="99" value="${row.weightChw}" onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
										</div>
									</div>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr class="workRow">
								<th scope="row" class="type_chw"> <!-- 작업입력영역 -->
									<input type="text" class="form-control workName" maxLength="10" value="${row.typeChw}">
								</th>
								<td>
									<div class="row col-11 pl-0">
										<div class="col-3">
											<div class="picker-wrap">
												
												<input type="text" class="form-control workApplyDate" value="${row.startDate} ~ ${row.endDate}">
												<label for=""><i class="fas fa-calendar"></i></label>
											</div>
										</div>
										<div class="col-1">
											<input type="number" name="weightChw" class="form-control p-1 text-right giveWorkPer" min="0" max="99" value="${row.weightChw}" onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);" oninput="maxLengthCheck(this)" maxLength="2">
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-dark waves-effect waves-light deleteWorkRow">삭제</button>
										</div>
									</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<tr class="work_default d-none">
					<th scope="row" class="type_chw"> <!-- 작업입력영역 -->
						<input type="text" class="form-control workName" maxLength="10">
					</th>
					<td>
						<div class="row col-11 pl-0">
							<div class="col-3">
								<div class="picker-wrap">
									<input type="text" class="form-control workApplyDate">
									<label for=""><i class="fas fa-calendar"></i></label>
								</div>
							</div>
							<div class="col-1">
								<input type="number" name="weightChw" class="form-control p-1 text-right giveWorkPer" min="0"  max="99"  onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
							</div>
							<div class="col-2">
								<button type="button" class="btn btn-dark waves-effect waves-light deleteWorkRow">삭제</button>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
//기간선택
$('.workApplyDate').flatpickr({
	mode : "range",
	dateFormat: "Y.m.d",
    locale: {
        rangeSeparator: ' ~ '
    }
});
</script>
