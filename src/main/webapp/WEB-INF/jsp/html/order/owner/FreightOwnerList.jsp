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
					<colgroup>
						<col style="width: 5%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 15%;">
						<col style="width: 15%;">
						<col style="width: 15%;">
						<col style="width: 15%;">
					</colgroup>
                    <thead>
                        <tr role="row">
                            <th class=""></th>
                            <th class="sorting">계약구분</th>
                            <th class="sorting">사업자구분</th>
                            <th class="sorting">사업자유형</th>
                            <th class="sorting">화주명</th>
                            <th class="sorting">ID</th>
                            <th class="sorting">전화번호</th>
                            <th class="sorting">이메일주소</th>
                            <th class="sorting">회원가입일</th>
                        </tr>
                    </thead>
                    <tbody>
			        	<c:if test="${empty result.list}">
			        		<tr>
			        			<th colspan="9">조회 결과가 없습니다.</th>
			        		</tr>
			        	</c:if>
			        	<c:if test="${!empty result.list}">
			        		<c:forEach items="${result.list}" var="list">
								<tr role="row">
								    <td>
								        <div class="form-check">
								            <input class="form-check-input" type="radio" name="selectFrgown" data-user-name="${list.freightOwnerName}"
								            	data-frgown-id="${list.freightOwnerIdOrg}" data-frgown-type="${list.freightOwnerType}">
								        </div>
								    </td>
								    <td>
										<c:choose>
											<c:when test="${list.freightOwnerType eq 'normal'}">일반</c:when>
											<c:when test="${list.freightOwnerType eq 'contract'}">계약</c:when>
											<c:when test="${list.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
											<c:otherwise>${list.freightOwnerType}</c:otherwise>
										</c:choose>
									</td>
								    <td>
										<c:choose>
											<c:when test="${list.freightOwnerMemberType eq 'nonBusiness'}">비사업자</c:when>
											<c:when test="${list.freightOwnerMemberType eq 'business'}">사업자</c:when>
											<c:otherwise>${list.freightOwnerMemberType}</c:otherwise>
										</c:choose>
								    </td>
								    <td>
										<c:choose>
											<c:when test="${list.freightOwnerBusinessType eq 'normal'}">일반</c:when>
											<c:when test="${list.freightOwnerBusinessType eq 'carrier'}">운송사</c:when>
											<c:when test="${list.freightOwnerBusinessType eq 'forwarder'}">주선사</c:when>
											<c:otherwise>${list.freightOwnerBusinessType}</c:otherwise>
										</c:choose>
								    </td>
								    <td>${list.freightOwnerName}</td>
								    <td>${list.freightOwnerId}</td>
								    <td>${list.freightOwnerTelephone}</td>
								    <td>${list.freightOwnerEmail}</td>
								    <td><fmt:formatDate value="${list.freightOwnerJoinDateTime}" pattern="yyyy.MM.dd"/></td>
								</tr>
			        		</c:forEach>
						</c:if>
                    </tbody>
                </table>
            </div>
            ${result.pagination}
        </div>
    </div>
    <input type="hidden" class="order frgownId">
    <input type="hidden" class="order frgownType">
    
    <div class="button-list text-center mt-3">
        <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="selectFrgown">확인</button>
    </div>
</div>

<script>
//화주 선택
$('#selectFrgown').on('click', function(){
	var selectYn = $('input:radio[name=selectFrgown]').is(':checked');
	if(selectYn) {
		var userName = $('input:radio[name=selectFrgown]:checked').data('user-name');
		var frgownId = $('input:radio[name=selectFrgown]:checked').data('frgown-id');
		var frgownType = $('input:radio[name=selectFrgown]:checked').data('frgown-type');
		
		$('#freightOwnerName').val(userName);
		$('.order.frgownId').val(frgownId);
		$('.order.frgownType').val(frgownType);
		
		$('#freightOwnerPopup').modal('hide');
	} else {
		alert("화주 정보를 선택하세요.");
	}
});

//페이지네이션
$('ul.pagination li').on('click', function() {
	param.nowPage = $(this).data('page-index');
	loadOwnerList();
});
</script>
