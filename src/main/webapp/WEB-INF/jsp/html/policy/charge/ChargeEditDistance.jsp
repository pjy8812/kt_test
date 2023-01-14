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
	<div class="row">
		<div class="col-6">
			<h5 class="card-title">거리별 가중치</h5>
		</div>
		<div class="col-6 text-right mb-1">
			<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm addRow">행추가</button>
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm deleteRow">행삭제</button>
		</div>
	</div>
	<div class="table-responsive table_distance" data-page_type="${type}">
		<table class="table mb-0 basic-table text-center">
			<colgroup>
				<col style="width: 4%;">
				<col style="width: 20%;">
				<col/>
			</colgroup>
            <thead>
                <tr class="text-center">
                	<th>
                        <input type="checkbox" class="distance_chk distance_chk_all"/>
                	</th>
                    <th>거리(㎞)</th>
                    <th>가중치(%)</th>
                </tr>
            </thead>
			<tbody>
				<tr class="add_default d-none">
                   <td class="text-center">
                        <input type="checkbox" name="distance_chk"/>
                   </td>
                   <td>
	                   	<div class="row ml-3">
	                    	<div class="col-10">
								<div class="input-group">
									<input type="text" name="startCiw" class="form-control text-right km_start" value="${result.startCiw}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);">
									<div class="col-2 text-center">
									<p class="period-ico">~</p>
									</div>
										<input type="text" name="endCiw" class="form-control text-right km_end" value="${result.endCiw}" onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);">
								</div>
							</div>
						</div>
                   </td>
					<td>
						<div class="row">
							<div class="col-2">
								<input type="number" name="weightCiw" class="form-control text-right" min="0"  max="99" value="${result.weightCiw}" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);"  oninput="maxLengthCheck(this)" maxLength="2">
							</div>
						</div>
					</td>
               </tr>
				<c:if test="${empty result or empty result.list}">
                <tr class="addTr">
                    <td class="text-center">
                         <input type="checkbox" name="distance_chk" disabled/>
                    </td>
                    <td>
                    	<div class="row ml-3">
	                    	<div class="col-10">
								<div class="input-group">
									<input type="text" name="startCiw" class="form-control text-right km_start" value="0" data-org_value="0" disabled 
										onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" oninput="maxLengthCheck(this)" maxLength="3">
									<div class="col-2 text-center">
									<p class="period-ico">~</p>
									</div>
										<input type="text" name="endCiw" class="form-control text-right km_end" data-org_value="" 
											onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);"oninput="maxLengthCheck(this)" maxLength="3">
								</div>
							</div>
						</div>
                    </td>
					<td>
						<div class="row">
							<div class="col-2">
								<input type="number" name="weightCiw" class="form-control text-right" min="0"  max="99" data-org_value="" 
									onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);"  oninput="maxLengthCheck(this)" maxLength="2">
							</div>
						</div>
					</td>
                </tr>
                </c:if>
                <c:forEach var="row" items="${result.list}" varStatus="i">
                	<c:if test="${i.first}">
						<tr class="addTr">
		                    <td class="text-center">
		                         <input type="checkbox" name="distance_chk" disabled/>
		                    </td>
		                    <td>
		                    	<div class="row ml-3">
			                    	<div class="col-10">
										<div class="input-group">
											<input type="text" name="startCiw" class="form-control text-right km_start" value="0"  data-org_value="0" disabled 
												onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" oninput="maxLengthCheck(this)" maxLength="3">
											<div class="col-2 text-center">
											<p class="period-ico">~</p>
											</div>
												<input type="text" name="endCiw" class="form-control text-right km_end" value="${row.endCiw}" data-org_value="${row.endCiw}" 
													onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" oninput="maxLengthCheck(this)" maxLength="3">
										</div>
									</div>
								</div>
		                    </td>
							<td>
								<div class="row">
									<div class="col-2">
										<input type="number" name="weightCiw" class="form-control" min="0"  max="99" value="${row.weightCiw}" data-org_value="${row.weightCiw}" 
											onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" oninput="maxLengthCheck(this)" maxLength="2">
									</div>
								</div>
							</td>
		                </tr>
                	</c:if>
                	<c:if test="${not i.first}">
						<tr>
		                    <td class="text-center">
		                         <input type="checkbox" name="distance_chk"/>
		                    </td>
		                    <td>
		                    	<div class="row ml-3">
			                    	<div class="col-10">
										<div class="input-group">
											<input type="text" name="startCiw" class="form-control text-right km_start" value="${row.startCiw}" data-org_value="${row.startCiw}" 
												onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" oninput="maxLengthCheck(this)" maxLength="3">
											<div class="col-2 text-center">
											<p class="period-ico">~</p>
										</div>
											<input type="text" name="endCiw" class="form-control text-right km_end" value="${row.endCiw}" data-org_value="${row.endCiw}" 
												onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" oninput="maxLengthCheck(this)" maxLength="3">
										</div>
									</div>
								</div>
		                    </td>
							<td>
								<div class="row">
									<div class="col-2">
										<input type="number" name="weightCiw" class="form-control" min="0"  max="99" value="${row.weightCiw}" data-org_value="${row.weightCiw}" 
											onKeyUp="removeChar(event);inputNumberFormat(this);" onKeyDown="inputNumberFormat(this);" oninput="maxLengthCheck(this)" maxLength="2">
									</div>
								</div>
							</td>
		                </tr>
                	</c:if>
                </c:forEach>
			</tbody>
		</table>
	</div>
</div>
			