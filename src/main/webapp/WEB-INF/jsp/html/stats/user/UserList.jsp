<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card-box">
	<h5 class="card-title">그래프</h5>
	<div class="row">
		<div class="col-12">
			<div class="scroll-table-wrap">
				<div class="" id="graphArea" style="min-width: 1798px;">
					<%-- graphArea --%>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="card-box col-6">
	<div class="row mb-2">
		<div class="col-9">
			<p class="card-text mt-2">
				*기간 내 활성 이용자 수를 표시합니다.
			</p>
		</div>
		<div class="col-3 text-right">
			<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark excelDetailDownloadBtn">
				엑셀다운로드
	        </button>
		</div>
	</div>
	<!-- <h5 class="card-title">*기간 내 활성 이용자 수를 표시합니다.</h5> -->
	<div class="row">
		<div class="col-12">
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center"
						role="grid">
						<thead>
							<tr role="row">
								<c:forEach var="headers" items="${headers}" varStatus="idx">
									<c:choose>
										<c:when test="${'0' eq idx}">
											<th class="sorting_asc">${headers}</th>
										</c:when>
										<c:otherwise>
											<th class="sorting">${headers}</th>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty result.data}">
								<tbody>
									<tr role="row" class="listRow noData" data-seq="">
										<td colspan="${fn:length(headers)}">
											조회 결과가 없습니다.
										</td>
									</tr>
								</tbody>
							</c:when>
							<c:otherwise>
								<tbody>
									<c:forEach items="${result.data}" var="list">
										<c:if test="${'Total' eq list.loginDate}">
											<tr>
												<td class="text-center">(합계)</td>
												<td class="text-right"><fmt:formatNumber value="${list.totCnt}"/></td>
												<td class="text-right"><fmt:formatNumber value="${list.freightCnt}"/></td>
												<td class="text-right"><fmt:formatNumber value="${list.carCnt}"/></td>
											</tr>
										</c:if>
									</c:forEach>
									<c:forEach items="${result.data}" var="list">
										<c:if test="${'Total' ne list.loginDate}">
											<tr role="row" class="listRow">
												<td class="text-center">
													${list.loginDateString}
												</td>
												<td class="text-right"><fmt:formatNumber value="${list.totCnt}"/></td>
												<td class="text-right"><fmt:formatNumber value="${list.freightCnt}"/></td>
												<td class="text-right"><fmt:formatNumber value="${list.carCnt}"/></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

	var object = {};
	<c:if test="${null ne result.dataJson and '' ne result.dataJson}">
		object = ${result.dataJson}
	</c:if>
	
	var graphData = {
		yMin : 0
		, yMax : 5
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
				/* if(graphData.yMax < object.list[i].totCnt) {
					graphData.yMax = object.list[i].totCnt;
				} */
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
 	}

	for(i=0; i < graphData.totCntArr.length; i++) {
		if(graphData.yMax < graphData.totCntArr[i]) {
			graphData.yMax = graphData.totCntArr[i];
		}
	}
	
	var guideCnt = Math.pow(10, String(graphData.yMax).length);
	if((guideCnt / 4) > graphData.yMax) {
		graphData.yMax = Math.floor(guideCnt / 4);
	} else {
		graphData.yMax = (guideCnt / 2) > graphData.yMax ? Math.floor(guideCnt / 2) : guideCnt; // Y축 조정 
	}
	
	var options = {
		series: [
			{
				name: "전체"
				, data: graphData.totCntArr
			},
	        {
				name: "화주"
				, data: graphData.freightCntArr
	        },
			{
	        	name: "차주"
	        	, data: graphData.carCntArr
	        }
        ],
		chart: {
			height: 500
			, type: 'line'
			, dropShadow: {
				enabled: true
				, color: '#000'
				, top: 18
				, left: 7
				, blur: 10
				, opacity: 0.2
			},
			toolbar: {
				show: false
			}
		},
		colors: ["#005e35","#63512b","#4aa375","#918772","#ff664a","#f3b462","#2a3f85","#9CB4D4","#78b1f0","#D3455D","#6BBCBD","#2B2B26","#cfd2d8","#7d4185","#786cd9"],
		dataLabels: {
			enabled: true,
		},
		stroke: {
			curve: 'smooth'
		},
		title: {
			// text: '그래프',
			align: 'left'
		},
		grid: {
			borderColor: '#e7e7e7',
			row: {
				colors: ['#f3f3f3', 'transparent']
				, opacity: 0.5
			},
		},
		markers: {
			size: 1
		},
		xaxis: {
			categories: graphData.categoryArr // setValue
			, title: {
				// text: '이용자'
			}
		},
		yaxis: {
			title: {
         		// text: '이용자수'
			}
			, min: graphData.yMin
			, max: graphData.yMax
		},
		legend: {
			position: 'top'
			, horizontalAlign: 'center'
			, floating: true
			, offsetY: 10
			, offsetX: -20
		}
	};
		
	// 목록 엑셀 다운로드 
	$('.excelDetailDownloadBtn').on('click touch', function () {
		if(confirm('조회된 내용을 다운로드하시겠습니까?')) {
			// location.href = "<c:url value='/ui/service/stats/user/excel/download'/>"
			
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
			form.setAttribute('action', "<c:url value='/ui/service/stats/user/excel/download'/>");
			document.body.appendChild(form);
			form.submit();
		};
	})
	
	// 그래프
	var graph = new ApexCharts(document.querySelector("#graphArea"), options);
	graph.render();
	
	$(document).ready(function(){
		
		<c:if test="${empty result.resultCode}">
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
			
	})
</script>