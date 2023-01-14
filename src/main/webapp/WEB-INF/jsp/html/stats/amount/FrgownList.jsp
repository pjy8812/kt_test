<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="custom-tab-wrap">
    <div class="custom-tab-box">
        <ul class="nav nav-tabs nav-justified tab-custom02">
            <li class="nav-item">
                <a href="" data-toggle="tab" aria-expanded="true" class="data-type count nav-link <c:if test="${vo.dataType eq 'count'}">active</c:if>">건수</a>
            </li>
            <li class="nav-item">
                <a href="" data-toggle="tab" aria-expanded="false" class="data-type amount nav-link <c:if test="${vo.dataType eq 'amount'}">active</c:if>">금액</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane show active">
				<div class="card-box">
					<h5 class="card-title">그래프</h5>
					<div class="row">
						<div class="col-12">
							<div class="scroll-table-wrap">
								<div class="frgown graphArea" style="min-width: 1798px;">
									<%-- graphArea --%>
								</div>
							</div>
						</div>
					</div>
				</div>
                <div class="card-box">
                    <div class="row mb-2">
                        <div class="col-3">
<!--                             <p class="card-text mt-2">*이용 화주 수 <span>123,456</span></p> -->
                        </div>
                        <div class="col-3 text-right">
                            <button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark downloadExcel">엑셀다운로드</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <table class="table dt-responsive nowrap w-100 dataTable no-footer dtr-inline text-center statistics-table" role="grid">
                            	<!-- 유형이 '전체'인 경우 -->
                            	<c:if test="${vo.freightOwnerType eq 'all'}">
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
													<c:if test="${'Total' eq list.unloadedAt}">
														<tr>
															<td class="text-center">(합계)</td>
															<td class="text-right"><fmt:formatNumber value="${list.ownerFlag06}"/></td> <!-- 일반 -->
															<td class="text-right"><fmt:formatNumber value="${list.ownerFlag07}"/></td> <!-- 운송사 -->
															<td class="text-right"><fmt:formatNumber value="${list.ownerFlag08}"/></td> <!-- 주선사 -->
														</tr>
													</c:if>
												</c:forEach>
												<c:forEach items="${result.data}" var="list">
													<c:if test="${'Total' ne list.unloadedAt}">
														<tr role="row" class="listRow">
															<td class="text-center">
																${list.unloadedAtString}
															</td>
															<td class="text-right"><fmt:formatNumber value="${list.ownerFlag06}"/></td> <!-- 일반 -->
															<td class="text-right"><fmt:formatNumber value="${list.ownerFlag07}"/></td> <!-- 운송사 -->
															<td class="text-right"><fmt:formatNumber value="${list.ownerFlag08}"/></td> <!-- 주선사 -->
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</c:otherwise>
									</c:choose>
								</c:if>
								
								<!-- 유형이 '전체'가 아닌 경우 -->
                            	<c:if test="${vo.freightOwnerType ne 'all'}">
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
													<c:if test="${'Total' eq list.unloadedAt}">
														<tr>
															<td class="text-center">(합계)</td>
															<c:if test="${vo.businessType eq 'all'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag01}"/></td> <!-- 계약-사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag02}"/></td> <!-- 계약-비사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag03}"/></td> <!-- 일반-사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag04}"/></td> <!-- 일반-비사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag05}"/></td> <!-- 수동배차-계약화주 -->
															</c:if>
															<c:if test="${vo.businessType eq '01'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag01}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq '02'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag02}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq '03'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag03}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq '04'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag04}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq 'manualDelivery'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag05}"/></td>
															</c:if>
														</tr>
													</c:if>
												</c:forEach>
												<c:forEach items="${result.data}" var="list">
													<c:if test="${'Total' ne list.unloadedAt}">
														<tr role="row" class="listRow">
															<td class="text-center">
																${list.unloadedAtString}
															</td>
															<c:if test="${vo.businessType eq 'all'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag01}"/></td> <!-- 계약-사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag02}"/></td> <!-- 계약-비사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag03}"/></td> <!-- 일반-사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag04}"/></td> <!-- 일반-비사업자 -->
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag05}"/></td> <!-- 수동배차-계약화주 -->
															</c:if>
															<c:if test="${vo.businessType eq '01'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag01}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq '02'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag02}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq '03'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag03}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq '04'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag04}"/></td>
															</c:if>
															<c:if test="${vo.businessType eq 'manualDelivery'}">
																<td class="text-right"><fmt:formatNumber value="${list.ownerFlag05}"/></td>
															</c:if>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</c:otherwise>
									</c:choose>
								</c:if>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
//건수/금액 선택
$('.data-type').on('click', function(){
	if($(this).hasClass('count')) {
		data.dataType = 'count';
	} else if($(this).hasClass('amount')) {
		data.dataType = 'amount';
	}
	//console.log(data.dataType);
	searchFrgownList();
});

//엑셀다운로드
$('.downloadExcel').on('click', function(){
	
	var param = searchedData;
	
	var freightOwnerType = param.freightOwnerType;
	var businessType = param.businessType;
	var basisDate = param.basisDate;
	var startDate = param.startDate;
	var endDate = param.endDate;
	var dataType = param.dataType;
	var mode = $('.nav-link.active').attr('id');
	
	var paramUrl = 'freightOwnerType={0}&businessType={1}&basisDate={2}&startDate={3}&endDate={4}&dataType={5}';
	paramUrl = paramUrl.format(freightOwnerType, businessType, basisDate, startDate, endDate, dataType);
	
	//console.log(mode);
	//console.log('excel download param: '+paramUrl);
	
	window.open("<c:url value='/ui/service/stats/amount/excel/download/"+mode+"'/>?"+paramUrl, '_blank');
});

var object = {};
<c:if test="${null ne result.dataJson and '' ne result.dataJson}">
	object = ${result.dataJson}
</c:if>

var graphData = {
	yMin : 0
	, ownerFlag01 : []
	, ownerFlag02 : []
	, ownerFlag03 : []
	, ownerFlag04 : []
	, ownerFlag05 : []
	, ownerFlag06 : []
	, ownerFlag07 : []
	, ownerFlag08 : []
	, categoryArr : []
}

for(var i=0; i<object.list.length; i++) {
	if(object.list[i].unloadedAt !== 'Total') {
		// 계약-사업자
		if(!isNaN(object.list[i].ownerFlag01)) {
			graphData.ownerFlag01.push(object.list[i].ownerFlag01);
		} else {
			graphData.ownerFlag01.push(null);
		}
		
		// 계약-비사업자
		if(!isNaN(object.list[i].ownerFlag02)) {
			graphData.ownerFlag02.push(object.list[i].ownerFlag02);
		} else {
			graphData.ownerFlag02.push(null);
		}
		
		// 일반-사업자
		if(!isNaN(object.list[i].ownerFlag03)) {
			graphData.ownerFlag03.push(object.list[i].ownerFlag03);
		} else {
			graphData.ownerFlag03.push(null);
		}
		
		// 일반-비사업자
		if(!isNaN(object.list[i].ownerFlag04)) {
			graphData.ownerFlag04.push(object.list[i].ownerFlag04);
		} else {
			graphData.ownerFlag04.push(null);
		}
		
		// 수동배차-계약화주
		if(!isNaN(object.list[i].ownerFlag05)) {
			graphData.ownerFlag05.push(object.list[i].ownerFlag05);
		} else {
			graphData.ownerFlag05.push(null);
		}
		
		// 일반
		if(!isNaN(object.list[i].ownerFlag06)) {
			graphData.ownerFlag06.push(object.list[i].ownerFlag06);
		} else {
			graphData.ownerFlag06.push(null);
		}
		
		// 운송사
		if(!isNaN(object.list[i].ownerFlag07)) {
			graphData.ownerFlag07.push(object.list[i].ownerFlag07);
		} else {
			graphData.ownerFlag07.push(null);
		}
		
		// 주선사
		if(!isNaN(object.list[i].ownerFlag08)) {
			graphData.ownerFlag08.push(object.list[i].ownerFlag08);
		} else {
			graphData.ownerFlag08.push(null);
		}
		
		graphData.categoryArr.push(object.list[i].unloadedAt);
	}
}

//그래프 Y축(최대값) 조정
var maxList = [];
<c:forEach items="${result.maxList}" var="item">
	maxList.push(${item});
</c:forEach>

maxList.sort(function(a, b)  { //내림차순
	return b - a;
});
graphData.yMax = maxList[0];
//console.log(maxList);
//console.log(graphData.yMax);

var guideCnt = Math.pow(10, String(graphData.yMax).length);
graphData.yMax = (guideCnt / 2) > graphData.yMax ? Math.floor(guideCnt / 2) : guideCnt; // Y축 조정 
//console.log(guideCnt)
//console.log(graphData.yMax)

var options = {
	series: [
		<c:if test="${vo.freightOwnerType ne 'all'}">
			<c:if test="${vo.businessType eq 'all'}">
				{
					name: "계약-사업자"
					, data: graphData.ownerFlag01
				},
		        {
					name: "계약-비사업자"
					, data: graphData.ownerFlag02
		        },
				{
		        	name: "일반-사업자"
		        	, data: graphData.ownerFlag03
		        },
				{
		        	name: "일반-비사업자"
		        	, data: graphData.ownerFlag04
		        },
		        {
		        	name: "수동배차-계약화주"
	        		, data: graphData.ownerFlag05
		        }
	        </c:if>
			<c:if test="${vo.businessType eq '01'}">
				{
					name: "계약-사업자"
					, data: graphData.ownerFlag01
				}
	        </c:if>
			<c:if test="${vo.businessType eq '02'}">
				{
					name: "계약-비사업자"
					, data: graphData.ownerFlag02
				}
	        </c:if>
			<c:if test="${vo.businessType eq '03'}">
				{
					name: "일반-사업자"
					, data: graphData.ownerFlag03
				}
		    </c:if>
			<c:if test="${vo.businessType eq '04'}">
				{
					name: "일반-비사업자"
					, data: graphData.ownerFlag04
				}
			</c:if>
			<c:if test="${vo.businessType eq 'manualDelivery'}">
			{
				name: "수동배차-계약화주"
				, data: graphData.ownerFlag05
			}
		</c:if>
	    </c:if>
	    <c:if test="${vo.freightOwnerType eq 'all'}">	
			{
	        	name: "일반"
	        	, data: graphData.ownerFlag06
	        },
			{
	        	name: "운송사"
	        	, data: graphData.ownerFlag07
	        },
			{
	        	name: "주선사"
	        	, data: graphData.ownerFlag08
	        }
        </c:if>
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

var graph = new ApexCharts(document.querySelector(".frgown.graphArea"), options);
graph.render();
</script>
