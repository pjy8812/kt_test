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
	<h5 class="card-title">상/하차 수작업 비용</h5>
	<div class="table-responsive table_manualcost" data-page_type="${type}">
		<table class="table mb-0 basic-table text-center">
			<colgroup>
				<col style="width: 25%;">
				<col style="width: 25%;">
				<col style="width: 25%;">
				<col style="width: 25%;">
			</colgroup>
			<thead>
				<tr role="row">
					<th class="sorting">구분</th>
					<th class="sorting">상차지</th>
					<th class="sorting">하차지</th>
					<th class="sorting">상/하차지</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty result or empty result.list}">
					<tr role="row">
						<td class="type_chmc">1톤</td>
		                    	<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="upCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="downCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="handMadeCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
					</tr>
					<tr role="row">
						<td class="type_chmc">1.4톤</td>
		                    	<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="upCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="downCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="handMadeCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
					</tr>
					<tr role="row">
						<td class="type_chmc">2톤</td>
		                    	<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="upCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="downCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="handMadeCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
					</tr>
					<tr role="row">
						<td class="type_chmc">3.5톤</td>
		                    	<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="upCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="downCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="handMadeCostChmc" data-org_value="" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
					</tr>
				</c:if>
				<c:forEach var="row" items="${result.list}">
					<tr role="row">
						<td class="type_chmc">${row.typeChmc}</td>
                    	<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="upCostChmc" value="<fmt:formatNumber value="${row.upCostChmc}" pattern="#,###"/>" data-org_value="${row.upCostChmc}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="downCostChmc" value="<fmt:formatNumber value="${row.downCostChmc}" pattern="#,###"/>" data-org_value="${row.downCostChmc}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
						<td>
							<div class="row">
								<div class="col ml-5">
									<input type="text" class="form-control text-right" name="handMadeCostChmc" value="<fmt:formatNumber value="${row.handMadeCostChmc}" pattern="#,###"/>" data-org_value="${row.handMadeCostChmc}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" data-length="12">
								</div>
								<div class="col-2 mt-1 mr-4 text-left">원</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
		