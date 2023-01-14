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
            <%-- 건수/금액 추가 --%>
            
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
<div class="card-box">
    <div class="row mb-2">
        <div class="col-6">
            <p class="card-text mt-2">*하차 완료된 항목만 집계합니다.</p>
        </div>
        <div class="col-6 text-right">
            <div class="row justify-content-end">
                <%-- <div class="col-3">
                    <ul class="nav nav-tabs tab-custom01">
                        <li class="nav-item">
                            <a href="#table01" data-toggle="tab" aria-expanded="true" class="data-type count nav-link <c:if test="${vo.dataType eq 'count'}">active</c:if>">건수</a>
                        </li>
                        <li class="nav-item">
                            <a href="#table02" data-toggle="tab" aria-expanded="false" class="data-type amount nav-link <c:if test="${vo.dataType eq 'amount'}">active</c:if>">금액</a>
                        </li>
                    </ul>
                </div> --%>
                <div class="col-2">
                    <button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark ml-1 excelDetailDownloadBtn">엑셀다운로드</button>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-pane show active" id="table01">
            <div class="row">
                <div class="col-12">
                    <table class="table dt-responsive nowrap w-100 dataTable no-footer dtr-inline text-center" role="grid">
                        <%-- <colgroup>
                            <col style="width:auto;">
                            <col style="width:250px;">
                            <col style="width:250px;">
                            <col style="width:250px;">
                            <col style="width:auto;">
                            <col style="width:auto;">
                            <col style="width:100px;">
                        </colgroup> --%>
                        <thead>
                       		<tr role="row">
	                        	<c:forEach var="headerCodeList" items="${result.headerCodeList}">
	                        		<c:if test="${'noData' ne headerCodeList}">
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
                                	</c:if>
                        		</c:forEach>
							</tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="data" items="${result.data}">
	                        	<tr role="row">
	                        		<c:if test="${'2' eq data.totFlag}">
                        				<c:forEach var="headerCodeList" items="${result.headerCodeList}">
	                        				<c:forEach var="dataItem" items="${data}">
	                        					<c:if test="${headerCodeList eq dataItem.key}">
	                       							<c:choose>	
	                       								<c:when test="${'unloadedAt' eq dataItem.key}">
	                       									<td class="sorting_asc text-center">
																(합계)
			                        						</td>
	                       								</c:when>
	                       								<c:when test="${'noData' eq dataItem.key}">
														</c:when>
	                       								<c:otherwise>
	                       									<td class="sorting_asc text-right">
	                       										<fmt:formatNumber value="${dataItem.value}"/>
	                       									</td>
	                       								</c:otherwise>
	                       							</c:choose>
	                        					</c:if>
                        					</c:forEach>
										</c:forEach>
	                        		</c:if>
								</tr>
                       		</c:forEach>
                        	<c:forEach var="data" items="${result.data}">
	                        	<tr role="row">
	                        		<c:if test="${'1' eq data.totFlag}">
                        				<c:forEach var="headerCodeList" items="${result.headerCodeList}">
	                        				<c:forEach var="dataItem" items="${data}">
	                        					<c:if test="${headerCodeList eq dataItem.key}">
	                       							<c:choose>	
	                       								<c:when test="${'unloadedAt' eq dataItem.key}">
	                       									<td class="sorting_asc text-center">
																${data.unloadedAtString}
			                        						</td>
	                       								</c:when>
	                       								<c:when test="${'noData' eq dataItem.key}">
	                       								</c:when>
	                       								<c:otherwise>
	                       									<td class="sorting_asc text-right">
	                       										<fmt:formatNumber value="${dataItem.value}"/>
	                       									</td>
	                       								</c:otherwise>
	                       							</c:choose>
	                        					</c:if>
                        					</c:forEach>
										</c:forEach>
	                        		</c:if>
								</tr>
                       		</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
			<%-- 건수/금액 추가 --%>
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
		, yMax : 10
		, elArr : []
		, xArr : []
		// , totArr : [] // 전체  
		// , yArr : []
	}
	
	<c:forEach var="headerCodeList" items="${result.headerCodeList}">
		<c:if test="${'unloadedAt' ne headerCodeList and 'noData' ne headerCodeList}">
			graphData.${headerCodeList}Arr = [];
			
			for(var i=0; i<object.list.length; i++) {
				if(object.list[i].totFlag !== "2") {
					graphData.${headerCodeList}Arr.push(object.list[i].${headerCodeList});
					graphData.xArr.push(object.list[i].unloadedAtString);
					
					if(graphData.yMax < object.list[i].${headerCodeList}) {
						graphData.yMax = object.list[i].${headerCodeList};
					}
				} 
				
				/* else {
					graphData.totArr.push(object.list[i].${headerCodeList});
				} */
				
				/* if(graphData.yMax < object.list[i].${headerCodeList}) {
					graphData.yMax = object.list[i].${headerCodeList};
				} */
				
			}
		</c:if>
	</c:forEach>
	
	var guideCnt = Math.pow(10, String(graphData.yMax).length);
	if((guideCnt / 4) > graphData.yMax) {
		graphData.yMax = Math.floor(guideCnt / 4);
	} else {
		graphData.yMax = (guideCnt / 2) > graphData.yMax ? Math.floor(guideCnt / 2) : guideCnt; // Y축 조정 
	}
	
	var options = {
		series: [
		
			<c:forEach var="headerCodeList" items="${result.headerCodeList}">
				<c:if test="${'unloadedAt' ne headerCodeList}">
					<c:forEach items="${result.headerCodeMap}" var="headerCodeMap">
						<c:if test="${headerCodeMap.key eq headerCodeList}">
							// graphData.elArr.push('${headerCodeMap.value}');
							{
								name: "${headerCodeMap.value}"
								, data: graphData.${headerCodeList}Arr
							},
						</c:if>
					</c:forEach>	
				</c:if>
			</c:forEach>
			
			/* {
				name: "전체"
				, data: graphData.totCntArr
			},
	        {
				name: "차주"
				, data: graphData.freightCntArr
	        },
			{
	        	name: "차주"
	        	, data: graphData.carCntArr
	        }, */
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
			categories: graphData.xArr // setValue
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
	
	// 그래프
	var graph = new ApexCharts(document.querySelector("#graphArea"), options);
	graph.render();
	
	
	// 건수/금액 선택
	$('.data-type').on('click', function(){
		if($(this).hasClass('count')) {
			delvyData.dataType = 'count';
		} else if($(this).hasClass('amount')) {
			delvyData.dataType = 'amount';
		}
		
		searchDelvyList();
	});

	// 목록 엑셀 다운로드 
	$('.excelDetailDownloadBtn').off().on('click touch', function () {
		if(confirm('조회된 내용을 다운로드하시겠습니까?')) {
			
			var form = document.createElement('form');
			
			var JSONdata = JSON.stringify(searchedDelvyData);
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
			form.setAttribute('action', "<c:url value='/ui/service/stats/amount/delvy/excel/download'/>");
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
