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
	<h5 class="card-title">익일하차 가중치</h5>
	<div class="table-responsive table_nextdaydrop" data-page_type="${type}">
		<table class="table mb-0">
			<colgroup>
				<col width="10%">
				<col/>
			</colgroup>
			<tbody>
				<c:if test="${empty result or empty result.list}">
	                <tr>
	                	<th class="type_codw">익일하차(%)</th>
						<td>
							<div class="row">
								<div class="col-2">
									<input type="number" name="weightCodw" class="form-control text-right" min="0"  max="99"  onKeyUp="removeChar(event);inputNumberFormat(this);" onkeydown="inputNumberFormat(this);"  oninput="maxLengthCheck(this)" maxLength="2">
								</div>
							</div>
						</td>
	                </tr>
                </c:if>
                <c:forEach var="row" items="${result.list}">
                	<tr>
	                	<th class="type_codw">${row.typeCodw}</th>
						<td>
							<div class="row">
								<div class="col-2">
									<input type="number" name="weightCodw" class="form-control text-right" min="0"  max="99"  value="${row.weightCodw}" onKeyUp="removeChar(event);inputNumberFormat(this);" onkeydown="inputNumberFormat(this);"  oninput="maxLengthCheck(this)" maxLength="2">
								</div>
							</div>
						</td>
	                </tr>
                </c:forEach>
			</tbody>
		</table>
	</div>
</div>
		