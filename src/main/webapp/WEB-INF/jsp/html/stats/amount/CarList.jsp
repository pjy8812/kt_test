<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 차종1이 '전체'가 아닌경우 : 그래프 -->
<c:if test="${!empty carHeaders}">
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
									<div class="car graphArea" style="min-width: 1798px;">
										<%-- graphArea --%>
									</div>
								</div>
							</div>
						</div>
					</div>
	                <div class="card-box">
	                    <div class="row mb-2">
	                        <div class="col-3">
	                            <p class="card-text mt-2">*하차 완료된 항목만 집계합니다.</p>
	                        </div>
	                        <div class="col-3 text-right">
	                            <button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark downloadExcel">엑셀다운로드</button>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-6">
	                            <table class="table dt-responsive nowrap w-100 dataTable no-footer dtr-inline text-center statistics-table" role="grid">
									<thead>
										<tr role="row">
											<c:forEach var="headers" items="${carHeaders}" varStatus="idx">
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
													<td colspan="${fn:length(carHeaders)}">
														조회 결과가 없습니다.
													</td>
												</tr>
											</tbody>
										</c:when>
										<c:otherwise>
											<tbody>
												<c:forEach items="${result.data}" var="list">
													<c:if test="${'2' eq list.totFlag}">
														<tr>
															<td class="text-center">(합계)</td>
															<c:if test="${fn:length(carHeaders)-1 eq '1'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '2'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '3'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item3}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '4'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item3}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item4}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '5'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item3}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item4}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item5}"/></td>
															</c:if>
														</tr>
													</c:if>
												</c:forEach>
												<c:forEach items="${result.data}" var="list">
													<c:if test="${'1' eq list.totFlag}">
														<tr role="row" class="listRow">
															<td class="text-center">
																${list.unloadedAtString}
															</td>
															<c:if test="${fn:length(carHeaders)-1 eq '1'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '2'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '3'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item3}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '4'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item3}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item4}"/></td>
															</c:if>
															<c:if test="${fn:length(carHeaders)-1 eq '5'}">
																<td class="text-right"><fmt:formatNumber value="${list.item1}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item2}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item3}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item4}"/></td>
																<td class="text-right"><fmt:formatNumber value="${list.item5}"/></td>
															</c:if>
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
	    </div>
	</div>
</c:if>

<!-- 차종1이 '전체'인 경우 : 표 -->
<c:if test="${empty carHeaders}">
    <div class="card-box">
        <div class="row mb-2">
            <div class="col-6">
                <p class="card-text mt-2">*하차 완료된 항목만 집계합니다.</p>
            </div>
            <div class="col-6 text-right">
                <div class="row justify-content-end">
                    <div class="col-3">
                        <ul class="nav nav-tabs tab-custom01">
				            <li class="nav-item">
				                <a href="" data-toggle="tab" aria-expanded="true" class="data-type count nav-link <c:if test="${vo.dataType eq 'count'}">active</c:if>">건수</a>
				            </li>
				            <li class="nav-item">
				                <a href="" data-toggle="tab" aria-expanded="false" class="data-type amount nav-link <c:if test="${vo.dataType eq 'amount'}">active</c:if>">금액</a>
				            </li>
                        </ul>
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark downloadExcel">엑셀다운로드</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane show active" id="table01">
                <div class="row">
                    <div class="col-12">
                        <table class="table dt-responsive nowrap w-100 dataTable no-footer dtr-inline text-center" role="grid">
                            <thead>
                                <tr role="row">
                                	<th class="text-center">차량</th>
                                	<th class="text-center">(차종)</th>
                                	<c:forEach items="${carType}" var="type">
                               			<th class="sorting_asc">${type.codeName}</th>
                                	</c:forEach>
                                </tr>
                            </thead>
                            
                            <tbody>
                            	<!-- 총 합계 데이터 -->
                                <tr role="row">
                                	<th class="text-center" style="background: #E9EDF1;">(톤수)</th>
                                	<th class="text-center">(합계)</th>
                                	<c:forEach items="${carType}" var="type">
                                		<c:forEach items="${result.data}" var="list">
		                                	<c:if test="${list.totFlag eq '2'}">
	                                			<c:if test="${type.codeId eq 'labo'}"><th class="text-right"><fmt:formatNumber value="${list.laboTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'doubleDeckTrailer'}"><th class="text-right"><fmt:formatNumber value="${list.doubledecktrailerTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'deck'}"><th class="text-right"><fmt:formatNumber value="${list.deckTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'doubleDeck'}"><th class="text-right"><fmt:formatNumber value="${list.doubledeckTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'cargo'}"><th class="text-right"><fmt:formatNumber value="${list.cargoTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'wingbody'}"><th class="text-right"><fmt:formatNumber value="${list.wingbodyTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'truck'}"><th class="text-right"><fmt:formatNumber value="${list.truckTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'holo'}"><th class="text-right"><fmt:formatNumber value="${list.holoTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'refrigerationTruck'}"><th class="text-right"><fmt:formatNumber value="${list.refrigerationtruckTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'freezerTruck'}"><th class="text-right"><fmt:formatNumber value="${list.freezertruckTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'trailer'}"><th class="text-right"><fmt:formatNumber value="${list.trailerTot}"/></th></c:if>
	                                			<c:if test="${type.codeId eq 'damas'}"><th class="text-right"><fmt:formatNumber value="${list.damasTot}"/></th></c:if>
		                                	</c:if>
                                		</c:forEach>
                                	</c:forEach>
                                </tr>
                                <!-- 톤수 '없음'에 대한 데이터 -->
                                <tr role="row">
                                	<c:forEach items="${result.data}" var="list">
                                		<c:if test="${list.totFlag eq '1'}">
	                                		<c:if test="${list.codeId eq ''}">
		                                		<th class="text-center" style="background: #E9EDF1;">${list.codeName}</th>
	                                			<th class="text-right"><fmt:formatNumber value="${list.allTot}"/></th>
	                                		</c:if>
                                		</c:if>
                                	</c:forEach>
	                               	<c:forEach items="${carType}" var="type">
	                               		<c:forEach items="${result.data}" var="list">
		                                	<c:if test="${list.totFlag eq '1'}">
		                                		<c:if test="${list.codeId eq ''}">
		                                			<c:if test="${type.codeId eq 'labo'}"><th class="text-right"><fmt:formatNumber value="${list.laboTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'doubleDeckTrailer'}"><th class="text-right"><fmt:formatNumber value="${list.doubledecktrailerTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'deck'}"><th class="text-right"><fmt:formatNumber value="${list.deckTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'doubleDeck'}"><th class="text-right"><fmt:formatNumber value="${list.doubledeckTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'cargo'}"><th class="text-right"><fmt:formatNumber value="${list.cargoTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'wingbody'}"><th class="text-right"><fmt:formatNumber value="${list.wingbodyTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'truck'}"><th class="text-right"><fmt:formatNumber value="${list.truckTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'holo'}"><th class="text-right"><fmt:formatNumber value="${list.holoTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'refrigerationTruck'}"><th class="text-right"><fmt:formatNumber value="${list.refrigerationtruckTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'freezerTruck'}"><th class="text-right"><fmt:formatNumber value="${list.freezertruckTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'trailer'}"><th class="text-right"><fmt:formatNumber value="${list.trailerTot}"/></th></c:if>
		                                			<c:if test="${type.codeId eq 'damas'}"><th class="text-right"><fmt:formatNumber value="${list.damasTot}"/></th></c:if>
		                                		</c:if>
		                                	</c:if>
	                               		</c:forEach>
                              	 	</c:forEach>
                               	</tr>
                               	<!-- 각 톤수에 따른 데이터 -->
                                <c:forEach items="${carModel}" var="model">
	                                <tr role="row">
	                                	<c:forEach items="${result.data}" var="list">
	                                		<c:if test="${list.totFlag eq '1'}">
		                                		<c:if test="${list.codeId ne '' && model.codeId eq list.codeId}">
			                                		<th class="text-center" style="background: #E9EDF1;">${list.codeName}</th>
		                                			<th class="text-right"><fmt:formatNumber value="${list.allTot}"/></th>
		                                		</c:if>
	                                		</c:if>
	                                	</c:forEach>
		                               	<c:forEach items="${carType}" var="type">
		                               		<c:forEach items="${result.data}" var="list">
			                                	<c:if test="${list.totFlag eq '1'}">
			                                		<c:if test="${list.codeId ne '' && model.codeId eq list.codeId}">
			                                			<c:if test="${type.codeId eq 'labo'}"><th class="text-right"><fmt:formatNumber value="${list.laboTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'doubleDeckTrailer'}"><th class="text-right"><fmt:formatNumber value="${list.doubledecktrailerTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'deck'}"><th class="text-right"><fmt:formatNumber value="${list.deckTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'doubleDeck'}"><th class="text-right"><fmt:formatNumber value="${list.doubledeckTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'cargo'}"><th class="text-right"><fmt:formatNumber value="${list.cargoTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'wingbody'}"><th class="text-right"><fmt:formatNumber value="${list.wingbodyTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'truck'}"><th class="text-right"><fmt:formatNumber value="${list.truckTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'holo'}"><th class="text-right"><fmt:formatNumber value="${list.holoTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'refrigerationTruck'}"><th class="text-right"><fmt:formatNumber value="${list.refrigerationtruckTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'freezerTruck'}"><th class="text-right"><fmt:formatNumber value="${list.freezertruckTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'trailer'}"><th class="text-right"><fmt:formatNumber value="${list.trailerTot}"/></th></c:if>
			                                			<c:if test="${type.codeId eq 'damas'}"><th class="text-right"><fmt:formatNumber value="${list.damasTot}"/></th></c:if>
			                                		</c:if>
			                                	</c:if>
		                               		</c:forEach>
	                              	 	</c:forEach>
	                               	</tr>
                               	</c:forEach>
							</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>



<script>
//건수/금액 선택
$('.data-type').on('click', function(){
	if($(this).hasClass('count')) {
		data.dataType = 'count';
	} else if($(this).hasClass('amount')) {
		data.dataType = 'amount';
	}
	//console.log(data.dataType);
	searchCarList();
});

//엑셀다운로드
$('.downloadExcel').on('click', function(){
	var mode = $('.nav-link.active').attr('id');
	
	var form = document.createElement('form');
	
	searchedData.carList = [];
	$('.row.car').each(function(idx){
		if($(this).is(':visible')) {
			var type = $(this).find('.form-control.car.type').val();
			var model = $(this).find('.form-control.car.model').val();
			if(type == 'damas' || type == 'labo') {
				model = 'all';
			}
			searchedData.carList.push({carType: type, carModel: model});
		}
	});
    //console.log(searchedData);
	
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
	form.setAttribute('action', "<c:url value='/ui/service/stats/amount/excel/download.json/"+mode+"'/>");
	document.body.appendChild(form);
	form.submit();
});

var object = {};
<c:if test="${null ne result.dataJson and '' ne result.dataJson}">
	object = ${result.dataJson}
</c:if>

<c:if test="${not empty carHeaders and carHeaders ne null}">
	var graphData = {
		yMin : 0
		, yMax : 10
		, item1 : []
		, item2 : []
		, item3 : []
		, item4 : []
		, item5 : []
		, categoryArr : []
	}
	
	for(var i=0; i<object.list.length; i++) {
		if(object.list[i].totFlag !== '2') {
			if(!isNaN(object.list[i].item1)) {
				graphData.item1.push(object.list[i].item1);
			} else {
				graphData.item1.push(null);
			}
			
			if(!isNaN(object.list[i].item2)) {
				graphData.item2.push(object.list[i].item2);
			} else {
				graphData.item2.push(null);
			}
			
			if(!isNaN(object.list[i].item3)) {
				graphData.item3.push(object.list[i].item3);
			} else {
				graphData.item3.push(null);
			}
			
			if(!isNaN(object.list[i].item4)) {
				graphData.item4.push(object.list[i].item4);
			} else {
				graphData.item4.push(null);
			}
			
			if(!isNaN(object.list[i].item5)) {
				graphData.item5.push(object.list[i].item5);
			} else {
				graphData.item5.push(null);
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
			<c:forEach items="${carHeaders}" var="car" varStatus="status">
				<c:if test="${car ne ''}">
					{
						name: "${car}"
						, data: graphData.item${status.index}
					},
				</c:if>
			</c:forEach>
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
	
	var graph = new ApexCharts(document.querySelector(".car.graphArea"), options);
	graph.render();
</c:if>
</script>
