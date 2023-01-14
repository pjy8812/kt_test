<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 차량유형별 -->
<c:set var="type" value=""/>
<c:choose>
	<c:when test="${empty result or empty result.carType .list}"><c:set var="type" value="C"/></c:when>
	<c:otherwise><c:set var="type" value="U"/></c:otherwise>
</c:choose>
<!-- 차량옵션별 -->
<c:set var="type2" value=""/>
<c:choose>
	<c:when test="${empty result or empty result.carOption .list}"><c:set var="type2" value="C"/></c:when>
	<c:otherwise><c:set var="type2" value="U"/></c:otherwise>
</c:choose>
<div class="card-box">
	<h5 class="card-title">차량유형별 가중치</h5>
	<div class="row">
		<div class="col-6 table-responsive table_cartype" data-page_type="${type}">
			<table class="table mb-0 basic-table">
				<thead>
					<tr class="text-center">
						<th>차량형태</th>
						<th>카테고리</th>
						<th>가중치(%)</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty result or empty result.carType.list}">
					<c:forEach var="type" items="${carType }">
		                <tr>
		                	<td class="type_cctw">${type.codeName }</td>
		                	<td>
		                		<div class="row">
									<div class="col-6">
				                		<select class="form-control car_type_category" name="categoryCctw">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
									</div>
								</div>
		                	</td>
							<td>
								<div class="row">
									<div class="col-6">
										<input type="number" name="weightCctw" class="form-control text-right" min="0"  max="99"  onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
									</div>
								</div>
							</td>
		                </tr>
	                </c:forEach>
	                </c:if> 
	                <c:forEach var="row" items="${result.carType.list}">
	                	<tr>
		                	<td class="type_cctw">${row.typeCctw}</td>
		                	<td>
		                		<div class="row">
									<div class="col-6">
				                		<select class="form-control car_type_category" name="categoryCctw">
											<option value="1" <c:if test="${row.categoryCctw eq 1}">selected</c:if>>1</option>
											<option value="2" <c:if test="${row.categoryCctw eq 2}">selected</c:if>>2</option>
											<option value="3" <c:if test="${row.categoryCctw eq 3}">selected</c:if>>3</option>
										</select>
									</div>
								</div>
		                	</td>
							<td>
								<div class="row">
									<div class="col-6">
										<input type="number" name="weightCctw" class="form-control text-right" min="0"  max="99" value="${row.weightCctw}" onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
									</div>
								</div>
							</td>
		                </tr>
	                </c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-6 table-responsive table_caroption" data-page_type="${type2}">
			<table class="table mb-0 basic-table">
				<thead>
					<tr class="text-center">
						<th>차량옵션</th>
						<th>카테고리</th>
						<th>가중치(%)</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty result or empty result.carOption.list}">
						<c:forEach var="option" items="${carOption}">
		                <tr>
		                	<td class="type_ccow">${option.codeName }</td>
		                	<td>
		                		<div class="row">
									<div class="col-6">
				                		<select class="form-control car_option_category" name="categoryCcow">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
									</div>
								</div>
		                	</td>
							<td>
								<div class="row">
									<div class="col-6">
										<input type="number" name="weightCcow" class="form-control text-right" min="0"  max="99"  onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
									</div>
								</div>
							</td>
		                </tr>
		                </c:forEach>
	                </c:if>
	                <c:forEach var="row" items="${result.carOption.list}">
	                	<tr>
		                	<td class="type_ccow">${row.typeCcow}</td>
		                	<td>
		                		<div class="row">
									<div class="col-6">
				                		<select class="form-control car_option_category" name="categoryCcow">
											<option value="1" <c:if test="${row.categoryCctw eq 1}">selected</c:if>>1</option>
											<option value="2" <c:if test="${row.categoryCcow eq 2}">selected</c:if>>2</option>
											<option value="3" <c:if test="${row.categoryCcow eq 3}">selected</c:if>>3</option>
										</select>
									</div>
								</div>
		                	</td>
							<td>
								<div class="row">
									<div class="col-6">
										<input type="number" name="weightCcow" class="form-control text-right" min="0"  max="99" value="${row.weightCcow}" onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
									</div>
								</div>
							</td>
		                </tr>
	                </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
		