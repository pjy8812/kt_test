<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <div class="card-box col-12"> -->
	<div class="scroll-table-wrap">
		<div class="scroll-table-box">
			<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center"
				role="grid">
				<thead>
					<tr role="row">
						<th class="sorting_asc border-right-bold" colspan="3">기본 정보</th>
						<th class="sorting_asc border-left-bold" colspan="${fn:length(result.headerCodeList)}">옵션(중복가능)</th>
						<%-- <th class="sorting_asc border-left-bold" colspan="8">옵션(중복가능)</th> --%>
					</tr>
					<tr role="row">
						<th class="sorting_asc border-right-bold" style="width:12%;">차종</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">톤수</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">차량수</th>
						<!-- <th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">리프트</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">무진동</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">장축</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">플러스</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">차종플러스 장축</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">하이탑</th>
						<th class="sorting_asc border-right-bold border-left-bold" style="width:8%;">로우탑</th>
						<th class="sorting_asc border-left-bold" style="width:8%;">더블데크</th> -->
                       	<c:forEach var="headerCodeList" items="${result.headerCodeList}">
                        	<th class="sorting_asc">
								<c:forEach items="${result.headerCodeMap}" var="headerCodeMap">
									<c:choose>
										<c:when test="${'unloadedAt' eq headerCodeList}">
										</c:when>
										<c:when test="${headerCodeMap.key eq headerCodeList}">
											${headerCodeMap.value}
										</c:when>
									</c:choose>
								</c:forEach>
							</th>
					</c:forEach>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty result.data}">
						<tbody>
							<tr role="row" class="listRow noData" data-seq="">
								<td colspan="11">
									조회 결과가 없습니다.
								</td>
							</tr>
						</tbody>
					</c:when>
					<c:otherwise>
						<tbody>
							<c:forEach items="${result.data}" var="list">
								<tr>
								<%-- 합계 --%>
									<%-- <c:if test="${'Total' eq list.carType}"> --%>
									<c:if test="${'2' eq list.totFlag}">
										<td class="text-center">합계</td>
										<td class="text-center">
											<%-- 톤수 --%>
											<c:choose>
												<c:when test="${null ne list.carModel and '' ne list.carModel}">
													${list.carModel}
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<%-- 차량수 --%>
											<c:choose>
												<c:when test="${null ne list.totCnt and '' ne list.totCnt}">
													<fmt:formatNumber value="${list.totCnt}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<c:forEach var="data" items="${list}">
										<c:if test="${'totFlag' ne data.key and 'unloadedAt' ne data.key and 'carType' ne data.key and 'carModel' ne data.key and 'totCnt' ne data.key}">
											<c:forEach var="headerCodeList" items="${result.headerCodeList}">
	                        					<c:if test="${headerCodeList eq data.key}">
	                        						<td class="text-right">
		                        						<c:choose>
															<c:when test="${null ne data.value and '' ne data.value}">
																<fmt:formatNumber value="${data.value}"/>
															</c:when>
															<c:otherwise>
																0
															</c:otherwise>
														</c:choose>
													</td>
	                        					</c:if>
                        					</c:forEach>
										</c:if>
										</c:forEach>
	                        		</c:if>
	                       		</tr>
                     		</c:forEach>
                       		<%-- !합계 --%>
							<c:forEach items="${result.data}" var="list">
								<tr>
								<%-- 합계 --%>
									<%-- <c:if test="${'Total' eq list.carType}"> --%>
									<c:if test="${'2' ne list.totFlag}">
										<td class="text-center">${list.carType}</td>
										<td class="text-center">
											<%-- 톤수 --%>
											<c:choose>
												<c:when test="${null ne list.carModel and '' ne list.carModel}">
													${list.carModel}
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<%-- 차량수 --%>
											<c:choose>
												<c:when test="${null ne list.totCnt and '' ne list.totCnt}">
													<fmt:formatNumber value="${list.totCnt}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<c:forEach var="data" items="${list}">
										<c:if test="${'totFlag' ne data.key and 'unloadedAt' ne data.key and 'carType' ne data.key and 'carModel' ne data.key and 'totCnt' ne data.key}">
											<c:forEach var="headerCodeList" items="${result.headerCodeList}">
	                        					<c:if test="${headerCodeList eq data.key}">
	                        						<td class="text-right">
		                        						<c:choose>
															<c:when test="${null ne data.value and '' ne data.value}">
																<fmt:formatNumber value="${data.value}"/>
															</c:when>
															<c:otherwise>
																0
															</c:otherwise>
														</c:choose>
													</td>
	                        					</c:if>
                        					</c:forEach>
										</c:if>
										</c:forEach>
	                        		</c:if>
	                       		</tr>
                     		</c:forEach>
                       		
							<%-- <c:forEach items="${result.data}" var="list">
								<c:if test="${'Total' eq list.carType}">
									<tr>
										<td class="text-center">합계</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.carModel and '' ne list.carModel}">
													${list.carModel}
												</c:when>
												<c:otherwise>
													-
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.totCnt and '' ne list.totCnt}">
													<fmt:formatNumber value="${list.totCnt}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.lift and '' ne list.lift}">
													<fmt:formatNumber value="${list.lift}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.antiSwing and '' ne list.antiSwing}">
													<fmt:formatNumber value="${list.antiSwing}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.longAxis and '' ne list.longAxis}">
													<fmt:formatNumber value="${list.longAxis}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.plus and '' ne list.plus}">
													<fmt:formatNumber value="${list.plus}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.plusLongAxis and '' ne list.plusLongAxis}">
													<fmt:formatNumber value="${list.plusLongAxis}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.highTop and '' ne list.highTop}">
													<fmt:formatNumber value="${list.highTop}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.lowTop and '' ne list.lowTop}">
													<fmt:formatNumber value="${list.lowTop}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.doubleDeck and '' ne list.doubleDeck}">
													<fmt:formatNumber value="${list.doubleDeck}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:if>
							</c:forEach> --%>
							<%-- <c:forEach items="${result.data}" var="list">
								<c:if test="${'Total' ne list.carType}">
									<tr>
										<td class="text-center">
											${list.carType}
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.carModel and '' ne list.carModel}">
													${list.carModel}
												</c:when>
												<c:otherwise>
													-
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.totCnt and '' ne list.totCnt}">
													<fmt:formatNumber value="${list.totCnt}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.lift and '' ne list.lift}">
													<fmt:formatNumber value="${list.lift}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.antiSwing and '' ne list.antiSwing}">
													<fmt:formatNumber value="${list.antiSwing}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.longAxis and '' ne list.longAxis}">
													<fmt:formatNumber value="${list.longAxis}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.plus and '' ne list.plus}">
													<fmt:formatNumber value="${list.plus}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.plusLongAxis and '' ne list.plusLongAxis}">
													<fmt:formatNumber value="${list.plusLongAxis}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.highTop and '' ne list.highTop}">
													<fmt:formatNumber value="${list.highTop}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.lowTop and '' ne list.lowTop}">
													<fmt:formatNumber value="${list.lowTop}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
										<td class="text-right">
											<c:choose>
												<c:when test="${null ne list.doubleDeck and '' ne list.doubleDeck}">
													<fmt:formatNumber value="${list.doubleDeck}"/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:if>
							</c:forEach> --%>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
<!-- </div> -->

<script>

	var object = {};
	<c:if test="${null ne result.dataJson and '' ne result.dataJson}">
		object = ${result.dataJson}
	</c:if>
	
	/* var graphData = {
		yMin : 0
		, yMax : 10
		, totCntArr : []
		, freightCntArr : []
		, carCntArr : []
		, categoryArr : []
	}
	
	for(i=0; i < object.list.length; i++) {
		
		if(object.list[i].loginDate !== 'Total') {
			
			if(!isNaN(object.list[i].totCnt)) {
				// isNaN(null) == false;
				graphData.totCntArr.push(object.list[i].totCnt);
				if(graphData.yMax < object.list[i].totCnt) {
					graphData.yMax = object.list[i].totCnt;
				}
			} else {
				graphData.totCntArr.push(null);
			}
			
			if(!isNaN(object.list[i].freightCnt)) {
				// isNaN(null) == false;
				graphData.freightCntArr.push(object.list[i].freightCnt);
			} else {
				graphData.freightCntArr.push(null);
			}
			
			if(!isNaN(object.list[i].carCnt)) {
				// isNaN(null) == false;
				graphData.carCntArr.push(object.list[i].carCnt);
			} else {
				graphData.carCntArr.push(null);
			}
			
			graphData.categoryArr.push(object.list[i].loginDate);
		}
		
 	} */
	
	// 목록 엑셀 다운로드 
	$('.excelDetailDownloadBtn').off().on('click touch', function () {
		if(confirm('조회된 내용을 다운로드하시겠습니까?')) {
			// location.href = "<c:url value='/ui/service/stats/car/excel/download'/>"
			
			var form = document.createElement('form');
			
			var JSONdata = JSON.stringify(searchedData);
			jQuery.ajaxSettings.traditional = true;
			
			var formTag;
			formTag = document.createElement('input');
			formTag.setAttribute('type', 'hidden'); 
			formTag.setAttribute('name', 'JSONdata');
			formTag.setAttribute('value', encodeURI(JSONdata)); 
			form.appendChild(formTag);
			
			var formTagCsrf;
			formTagCsrf = document.createElement('input');
			formTagCsrf.setAttribute('type', 'hidden'); 
			formTagCsrf.setAttribute('name', '_csrf');
			formTagCsrf.setAttribute('value', '${_csrf.token}'); 
			form.appendChild(formTagCsrf);
			
			form.setAttribute('method', 'post'); 
			form.setAttribute('action', "<c:url value='/ui/service/stats/car/excel/download'/>");
			document.body.appendChild(form);
			form.submit();
		};
	})
	
	$(document).ready(function(){
		
		<c:if test="${empty result.resultCode}">
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
			
	})
</script>