<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="card-box">
    <h5 class="card-title">조회결과</h5>
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
                	<!-- 일반차주 -->
                	<c:if test="${mode eq 'normal'}">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 10%;">
							<col style="width: 15%;">
							<col style="width: 10%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
						</colgroup>
	                    <thead>
	                        <tr role="row">
	                            <th class=""></th>
	                            <th class="sorting">차주명</th>
	                            <th class="sorting">ID</th>
	                            <th class="sorting">차량번호</th>
	                            <th class="sorting">차량정보</th>
	                            <th class="sorting">전화번호</th>
	                            <th class="sorting">이메일주소</th>
	                            <th class="sorting">회원가입일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:if test="${empty result.list}">
	                    		<tr>
	                    			<th colspan="8">조회 결과가 없습니다.</th>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty result.list}">
	                    		<c:forEach items="${result.list}" var="list">
			                        <tr role="row">
			                            <td>
			                                <div class="form-check">
			                                    <input class="form-check-input" type="radio" name="selectCarown" data-name="${list.carOwnerName}"
			                                    	data-phone="${list.carOwnerTelephoneNum}" data-email="${list.carOwnerEmail}" data-car-num="${list.carInfo.carNum}"
			                                    	data-carown-id="${list.carOwnerIdOrg}" data-carown-type="${list.carOwnerType}">
			                                </div>
			                            </td>
			                            <td>${list.carOwnerName}</td>
			                            <td>${list.carOwnerId}</td>
			                            <td>${list.carNum}</td>
			                            <td class="carInfo">
			                            	<c:forEach items="${list.carInfo.carOptionList}" var="option">
												${option.carOptionName}
			                            	</c:forEach>
			                            </td>
			                            <td>${list.carOwnerTelephoneNum}</td>
			                            <td>${list.carOwnerEmail}</td>
			                            <td><fmt:formatDate value="${list.carOwnerJoinDate}" pattern="yyyy.MM.dd"/></td>
			                        </tr>
	                    		</c:forEach>
	                        </c:if>
	                    </tbody>
                    </c:if>
                    
                    <!-- 비상차주 -->
                	<c:if test="${mode eq 'emergency'}">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 20%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
						</colgroup>
	                    <thead>
	                        <tr role="row">
	                            <th class="sorting_asc"></th>
	                            <th class="sorting">차주명</th>
	                            <th class="sorting">전화번호</th>
	                            <th class="sorting">차량번호</th>
	                            <th class="sorting">차종</th>
	                            <th class="sorting">중량</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:if test="${empty result.list}">
	                    		<tr>
	                    			<th colspan="6">조회 결과가 없습니다.</th>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty result.list}">
	                    		<c:forEach items="${result.list}" var="list">
			                        <tr role="row">
			                            <td>
			                                <div class="form-check">
			                                    <input class="form-check-input" type="radio" name="selectCarown" data-name="${list.carOwnerName}"
			                                    	data-phone="${list.carOwnerTelephone}" data-car-num="${list.carNum}"
			                                    	data-carown-id="${list.carOwnerIdOrg}" data-carown-type="${list.carOwnerType}">
			                                </div>
			                            </td>
			                            <td>${list.carOwnerName}</td>
			                            <td>${list.carOwnerTelephone}</td>
			                            <td>${list.carNum}</td>
			                            <td>
			                            	<c:forEach items="${carType}" var="type">
			                            		<c:if test="${list.carType eq type.codeId}">${type.codeName}</c:if>
			                            	</c:forEach>
		                            	</td>
			                            <td>
			                            	<c:forEach items="${carModel}" var="model">
			                            		<c:if test="${list.carModel eq model.codeId}">${model.codeName}</c:if>
			                            	</c:forEach>
			                            	<c:if test="${empty list.carModel}">-</c:if>
			                            </td>
			                        </tr>
	                    		</c:forEach>
	                        </c:if>
	                    </tbody>
                    </c:if>
                </table>
            </div>
            ${result.pagination}
        </div>
    </div>
    <input type="hidden" class="emer carOwnerId" readonly>
    <input type="hidden" class="emer carOwnerType" readonly>	
    
    <div class="button-list text-center mt-3">
        <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal" id="btnCancel">취소</button>
        <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnOk">확인</button>
    </div>
</div>
   

<script>
//차주 선택
$('#btnOk').on('click', function(){
	var selectYn = $('input:radio[name=selectCarown]').is(':checked');
	if(selectYn) {
		var name = $('input:radio[name=selectCarown]:checked').data('name');
		var phone = $('input:radio[name=selectCarown]:checked').data('phone');
		var email = $('input:radio[name=selectCarown]:checked').data('email');
		var carNum = $('input:radio[name=selectCarown]:checked').data('car-num');
		var carInfo = $('input:radio[name=selectCarown]:checked').closest('td').siblings('td.carInfo').text();
		
		$('#emerUserName').val(name);
		$('#emerUserPhone').html(phone);
		$('#emerUserCarNumber').html(carNum);

		if(email != null && email != '') {
			$('#emerUserEmail').html(email);
		} else {
			$('#emerUserEmail').html('-');
		}
		
		if(carInfo != null && carInfo != '') {
			$('#emerUserCarInfo').html(carInfo);
		} else {
			$('#emerUserCarInfo').html('-');
		}
		
		var carownId = $('input:radio[name=selectCarown]:checked').data('carown-id');
		var carownType = $('input:radio[name=selectCarown]:checked').data('carown-type');
		$('.emer.carOwnerId').val(carownId);
		$('.emer.carOwnerType').val(carownType);
		
		$('#divEmergency').data('select-emer-yn', 'Y'); //비상배차 선택여부
		
		$('#carOwnerPopup').modal('hide');
	} else {
		alert("비상배차로 등록할 차주 정보를 선택하세요.");
	}
});

//페이지네이션
$('ul.pagination li').on('click', function() {
	var mode = $('.nav-link.car-owner.active').attr('id');
	param.nowPage = $(this).data('page-index');
	loadCarownList(mode);
});
</script>
