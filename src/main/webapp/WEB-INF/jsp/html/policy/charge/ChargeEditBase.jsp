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
	<h5 class="card-title mb-0">기준 단가(상온)</h5>
	<div class="row mb-2">
		<div class="col-12 text-right button-list">
			(단위 : 원)
		</div>
	</div>
	<div class="table-responsive table_base_unit" data-page_type="${type}">
		<table class="table mb-0 basic-table text-center">
            <thead>
                <tr class="text-center">
                    <th style="width:5%;">거리(㎞)</th>
                    <th>1톤</th>
                    <th>1.4톤</th>
                    <th>2.5톤</th>
                    <th>3.5톤</th>
                    <th>5톤</th>
                    <th>8톤</th>
                    <th>9.5톤</th>
                    <th>11톤</th>
                    <th>15톤</th>
                    <th>18톤</th>
                    <th>22톤</th>
                    <th>25톤</th>
                </tr>
            </thead>
			<tbody>
				<c:if test="${empty result or empty result.list}">
					<c:forEach var="row" begin="1" end="600" step="1">
		                <tr>
		                    <td>
								<input type="text" name="distanceCbp" class="form-control text-right" value="${row}" disabled>
		                    </td>
	                    	<td>
								<input type="text" name="tonType1" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType2" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType3" class="form-control text-right" data-org_value=""
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType4" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType5" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType6" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType7" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType8" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType9" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType10" class="form-control text-right" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType11" class="form-control text-right" data-org_value=""
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
							<td>
								<input type="text" name="tonType12" class="form-control text-right" data-org_value=""  
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
							</td>
		                </tr>
	                </c:forEach>
                </c:if>
                <c:forEach var ="row" items="${result.list}">
                	<tr>
	                    <td>
							<input type="text" name="distanceCbp" class="form-control text-right" value="${row.distanceCbp}" disabled>
	                    </td>
                    	<td>
							<input type="text" name="tonType1" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType1}" pattern="#,###"/>" data-org_value="${row.tonType1}" 
								onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType2" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType2}" pattern="#,###"/>" data-org_value="${row.tonType2}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType3" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType3}" pattern="#,###"/>" data-org_value="${row.tonType3}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType4" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType4}" pattern="#,###"/>" data-org_value="${row.tonType4}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType5" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType5}" pattern="#,###"/>" data-org_value="${row.tonType5}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType6" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType6}" pattern="#,###"/>" data-org_value="${row.tonType6}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType7" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType7}" pattern="#,###"/>" data-org_value="${row.tonType7}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType8" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType8}" pattern="#,###"/>" data-org_value="${row.tonType8}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType9" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType9}" pattern="#,###"/>" data-org_value="${row.tonType9}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType10" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType10}" pattern="#,###"/>" data-org_value="${row.tonType10}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType11" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType11}" pattern="#,###"/>" data-org_value="${row.tonType11}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
						<td>
							<input type="text" name="tonType12" class="form-control text-right" value="<fmt:formatNumber value="${row.tonType12}" pattern="#,###"/>" data-org_value="${row.tonType12}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" step="0.1" data-length="6">
						</td>
	                </tr>
                </c:forEach>
			</tbody>
		</table>
	</div>
</div>
		