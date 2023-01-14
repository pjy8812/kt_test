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
	<h5 class="card-title">지역별 가중치</h5>
	<div class="row">
		<div class="col-6 div_area" data-code="sudo" data-name="수도권">
			<!-- 수도권 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>수도권</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup">추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm btn_area_del">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_sudo table_area" data-page_type="${type}">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="sudo_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
						 <c:set var="areaCnt" value="0"/>
						 <c:forEach var="row" items="${result.list}">
							 <c:if test="${row.typeClw eq '수도권'}">
							 	<c:set var="areaCnt" value="${areaCnt+1}"/>
								 <tr data-type_clw="수도권" data-option_clw="${row.optionClw}">
				                	<td class="text-center">
				                		<input type="checkbox" name="sudo_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}" 
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
				                </tr>
			                </c:if>
		                </c:forEach>
		                <c:if test="${empty result or areaCnt eq 0}">
						 <tr>
		                	<td colspan="3">조회된 데이터가 없습니다.</td>
		                </tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //수도권 -->
		</div>
		<div class="col-6 div_area" data-code="gangwon" data-name="강원도">
			<!-- 강원도 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>강원도</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup">추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm btn_area_del">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_gangwon table_area">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="gangwon_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="gangwonCnt" value="0"/>
						<c:forEach var="row" items="${result.list}">
							<c:if test="${row.typeClw eq '강원도'}">
								<c:set var="gangwonCnt" value="${gangwonCnt+1}"/>
								 <tr data-type_clw="강원도" data-option_clw="${row.optionClw}">
				                	<td class="text-center">
				                		<input type="checkbox" name="gangwon_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}" 
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
				                </tr>
			                </c:if>
		                </c:forEach>
		                 <c:if test="${empty result or gangwonCnt eq 0}">
		                 <tr>
		                	<td colspan="3">조회된 데이터가 없습니다.</td>
		                </tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //강원도 -->
		</div>
	</div>
	<div class="row">
		<div class="col-6 div_area" data-code="chuncheongbuk" data-name="충북">
			<!-- 충북 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>충북</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup" >추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm btn_area_del">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_chuncheongbuk table_area">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="chuncheongbuk_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="chungbukCnt" value="0"/>
						<c:forEach var="row" items="${result.list}">
							<c:if test="${row.typeClw eq '충북'}">
								<c:set var="chungbukCnt" value="${chungbukCnt+1}"/>
						 		<tr data-type_clw="충북" data-option_clw="${row.optionClw}">
				                	<td class="text-center">
				                		<input type="checkbox" name="chuncheongbuk_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}"
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
		                		</tr>
		                	</c:if>
		                </c:forEach>
		                <c:if test="${empty result or chungbukCnt eq 0}">
		                 	<tr>
			                	<td colspan="3">조회된 데이터가 없습니다.</td>
			                </tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //충북 -->
		</div>
		<div class="col-6 div_area" data-code="chuncheongnam" data-name="충남">
			<!-- 충남 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>충남</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup" >추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm btn_area_del">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_chuncheongnam table_area">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="chuncheongnam_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
						 <c:set var="chungnamCnt" value="0"/>
					 	<c:forEach var="row" items="${result.list}">
						 	<c:if test="${row.typeClw eq '충남'}">
					 		<c:set var="chungnamCnt" value="${chungnamCnt+1}"/>
								 <tr data-type_clw="충남" data-option_clw="${row.optionClw}">
				                	<td class="text-center">
				                		<input type="checkbox" name="chuncheongnam_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}" 
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
				                </tr>
	                		</c:if>
	               	 	</c:forEach>
	               	 	<c:if test="${empty result or chungnamCnt eq 0}">
						 	<tr>
			                	<td colspan="3">조회된 데이터가 없습니다.</td>
			                </tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //충남 -->
		</div>
	</div>
	<div class="row">
		<div class="col-6 div_area" data-code="jeonlabuk" data-name="전북">
			<!-- 전북 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>전북</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup" >추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm btn_area_del">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_jeonlabuk table_area">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="jeonlabuk_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
					 	<c:set var="jeonbukCnt" value="0"/>
				 		<c:forEach var="row" items="${result.list}">
							 <c:if test="${row.typeClw eq '전북'}">
							 	<c:set var="jeonbukCnt" value="${jeonbukCnt+1}"/>
								 <tr data-type_clw="전북" data-option_clw="${row.optionClw}">
				                	<td class="text-center">
				                		<input type="checkbox" name="jeonlabuk_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}" 
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
				                </tr>
			                </c:if>
		                </c:forEach>
		                <c:if test="${empty result or jeonbukCnt eq 0}">
							 <tr>
			                	<td colspan="3">조회된 데이터가 없습니다.</td>
			                </tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //전북 -->
		</div>
		<div class="col-6 div_area" data-code="jeonlanam" data-name="전남">
			<!-- 전남 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>전남</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup">추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_jeonlanam table_area">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="jeonlanam_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
			 			<c:set var="jeonnamCnt" value="0"/>
					 	<c:forEach var="row" items="${result.list}">
					 		<c:if test="${row.typeClw eq '전남'}">
						 		<c:set var="jeonnamCnt" value="${jeonnamCnt+1}"/>
							 	<tr data-type_clw="전남" data-option_clw="${row.optionClw}">
			                		<td class="text-center">
				                		<input type="checkbox" name="jeonlanam_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}" 
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
				                </tr>
			                </c:if>
		                </c:forEach>
		                <c:if test="${empty result or jeonnamCnt eq 0}">
							 <tr>
			                	<td colspan="3">조회된 데이터가 없습니다.</td>
			                </tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //전남 -->
		</div>
	</div>
	<div class="row div_area" data-code="gyeongsangbuk" data-name="경북">
		<div class="col-6">
			<!-- 경북 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>경북</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup">추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm btn_area_del">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_gyeongsangbuk table_area">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="gyeongsangbuk_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
				  		<c:set var="gyeongbukCnt" value="0"/>
				 		<c:forEach var="row" items="${result.list}">
				 			<c:if test="${row.typeClw eq '경북'}">
						 		<c:set var="gyeongbukCnt" value="${gyeongbukCnt+1}"/>
								 <tr data-type_clw="경북" data-option_clw="${row.optionClw}">
				                	<td class="text-center">
				                		<input type="checkbox" name="gyeongsangbuk_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}"  
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
				                </tr>
			                </c:if>
		                </c:forEach>
		                <c:if test="${empty result or gyeongbukCnt eq 0}">
							 <tr>
			                	<td colspan="3">조회된 데이터가 없습니다.</td>
			                </tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //경북 -->
		</div>
		<div class="col-6 div_area" data-code="gyeongsangnam" data-name="경남">
			<!-- 경남 -->
			<div class="row">
				<div class="col-6">
					<label><i class="fas fa-angle-right mr-1"></i>경남</label>
				</div>
				<div class="col-6 text-right mb-1">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark btn-sm btn_area_popup" >추가</button>
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark btn-sm btn_area_del">삭제</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table table_gyeongsangnam table_area">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 20%;">
						<col/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th><input type="checkbox" name="gyeongsangnam_chk_all"/></th>
							<th>지역</th>
							<th>가중치(%)</th>
						</tr>
					</thead>
					<tbody>
				 		<c:set var="gyeongnamCnt" value="0"/>
					 	<c:forEach var="row" items="${result.list}">
					 		<c:if test="${row.typeClw eq '경남'}">
						 		<c:set var="gyeongnamCnt" value="${gyeongnamCnt+1}"/>
								 <tr data-type_clw="경남" data-option_clw="${row.optionClw}">
				                	<td class="text-center">
				                		<input type="checkbox" name="gyeongsangnam_chk"/>
				                	</td>
				                	<td class="optionClw text-center">${row.optionClw}</td>
				                	<td>
				                		<div class="row">
											<div class="col-2">
												<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="${row.weightClw}" 
													onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">
											</div>
										</div>
				                	</td>
				                </tr>
		               	 	</c:if>
		                </c:forEach>
		                <c:if test="${empty result or gyeongnamCnt eq 0}">
					 		<tr>
		                		<td colspan="3">조회된 데이터가 없습니다.</td>
		               	 	</tr>
		                </c:if>
					</tbody>
				</table>
			</div>
			<!-- //경남 -->
		</div>
	</div>
</div>
<script>
	//수도권 전체선택
	$('[name="sudo_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="sudo_chk"]').prop('checked', isChecked)
	});
	
	//수도권 checkbox
	$('.table_sudo').on('change', '[name="sudo_chk"]', function(){
		var tr = $('.table_sudo tbody tr').length;
		var chk = $('[name="sudo_chk"]:checked').length;
		if(tr == chk){
			$('[name="sudo_chk_all"]').prop('checked', true);
		}else{
			$('[name="sudo_chk_all"]').prop('checked', false);
		}
	});
	
	//강원도 전체선택
	$('[name="gangwon_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="gangwon_chk"]').prop('checked', isChecked)
	});
	
	//강원도 checkbox
	$('.table_gangwon').on('change', '[name="gangwon_chk"]', function(){
		var tr = $('.table_gangwon tbody tr').length;
		var chk = $('[name="gangwon_chk"]:checked').length;
		if(tr == chk){
			$('[name="gangwon_chk_all"]').prop('checked', true);
		}else{
			$('[name="gangwon_chk_all"]').prop('checked', false);
		}
	});
	
	//충북 전체선택
	$('[name="chuncheongbuk_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="chuncheongbuk_chk"]').prop('checked', isChecked)
	});
	
	//충북 checkbox
	$('.table_chuncheongbuk').on('change', '[name="chuncheongbuk_chk"]', function(){
		var tr = $('.table_chuncheongbuk tbody tr').length;
		var chk = $('[name="chuncheongbuk_chk"]:checked').length;
		if(tr == chk){
			$('[name="chuncheongbuk_chk_all"]').prop('checked', true);
		}else{
			$('[name="chuncheongbuk_chk_all"]').prop('checked', false);
		}
	});
	
	
	//충남 전체선택
	$('[name="chuncheongnam_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="chuncheongnam_chk"]').prop('checked', isChecked)
	});
	
	//충남 checkbox
	$('.table_chuncheongnam').on('change', '[name="chuncheongnam_chk"]', function(){
		var tr = $('.table_chuncheongnam tbody tr').length;
		var chk = $('[name="chuncheongnam_chk"]:checked').length;
		if(tr == chk){
			$('[name="chuncheongnam_chk_all"]').prop('checked', true);
		}else{
			$('[name="chuncheongnam_chk_all"]').prop('checked', false);
		}
	});
	
	//전북 전체선택
	$('[name="jeonlabuk_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="jeonlabuk_chk"]').prop('checked', isChecked)
	});
	
	//전북 checkbox
	$('.table_jeonlabuk').on('change', '[name="jeonlabuk_chk"]', function(){
		var tr = $('.table_jeonlabuk tbody tr').length;
		var chk = $('[name="jeonlabuk_chk"]:checked').length;
		if(tr == chk){
			$('[name="jeonlabuk_chk_all"]').prop('checked', true);
		}else{
			$('[name="jeonlabuk_chk_all"]').prop('checked', false);
		}
	});
	
	//전남 전체선택
	$('[name="jeonlanam_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="jeonlanam_chk"]').prop('checked', isChecked)
	});
	
	//전남 checkbox
	$('.table_jeonlanam').on('change', '[name="jeonlanam_chk"]', function(){
		var tr = $('.table_jeonlanam tbody tr').length;
		var chk = $('[name="jeonlanam_chk"]:checked').length;
		if(tr == chk){
			$('[name="jeonlanam_chk_all"]').prop('checked', true);
		}else{
			$('[name="jeonlanam_chk_all"]').prop('checked', false);
		}
	});
	
	//경북 전체선택
	$('[name="gyeongsangbuk_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="gyeongsangbuk_chk"]').prop('checked', isChecked)
	});
	
	//경북 checkbox
	$('.table_gyeongsangbuk').on('change', '[name="gyeongsangbuk_chk"]', function(){
		var tr = $('.table_gyeongsangbuk tbody tr').length;
		var chk = $('[name="gyeongsangbuk_chk"]:checked').length;
		if(tr == chk){
			$('[name="gyeongsangbuk_chk_all"]').prop('checked', true);
		}else{
			$('[name="gyeongsangbuk_chk_all"]').prop('checked', false);
		}
	});
	
	//경남 전체선택
	$('[name="gyeongsangnam_chk_all"]').on('change', function(){
		var isChecked = $(this).is(':checked');
		$('[name="gyeongsangnam_chk"]').prop('checked', isChecked)
	});
	
	//경남 checkbox
	$('.table_gyeongsangnam').on('change', '[name="gyeongsangnam_chk"]', function(){
		var tr = $('.table_gyeongsangnam tbody tr').length;
		var chk = $('[name="gyeongsangnam_chk"]:checked').length;
		if(tr == chk){
			$('[name="gyeongsangnam_chk_all"]').prop('checked', true);
		}else{
			$('[name="gyeongsangnam_chk_all"]').prop('checked', false);
		}
	});
</script>
		