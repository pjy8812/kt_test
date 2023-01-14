<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>

<div class="table-responsive">
	<table class="table mb-0 basic-table">
		<tbody>
			<tr>
				<th scope="row">회원명</th>
				<td>
					<div class="row">
						<div class="col">
							<label class="col-form-label"><c:choose>
								<c:when test="${result.ownerClassification eq 'frgown'}">
									${result.freightOwnerName}
								</c:when>
								<c:when test="${result.ownerClassification eq 'carown'}">
									${result.carOwnerName}
								</c:when>
							</c:choose>
							</label>
						</div>			
						<button type="button" class="btn btn-white waves-effect btn-rounded waves-dark" id="btnMoveOwnerPage">
						회원 상세정보<span class="btn-label-right"><i class="far fa-share-square"></i></span></button>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">회원ID</th>
				<td>
					<c:choose>
						<c:when test="${result.ownerClassification eq 'frgown'}">
							${result.freightOwnerId}
						</c:when>
						<c:when test="${result.ownerClassification eq 'carown'}">
							${result.carOwnerId}
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">상호</th>
				<td>
					<c:choose>
						<c:when test="${result.ownerClassification eq 'frgown'}">
							${result.freightOwnerCorporateRegistrationName}
						</c:when>
						<c:when test="${result.ownerClassification eq 'carown'}">
							${result.carOwnerCorporateRegistrationName}
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td>
					<c:choose>
						<c:when test="${result.ownerClassification eq 'frgown'}">
							${result.freightOwnerTelephone}
						</c:when>
						<c:when test="${result.ownerClassification eq 'carown'}">
							${result.carOwnerTelephoneNum}
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일주소</th>
				<td>
					<c:choose>
						<c:when test="${result.ownerClassification eq 'frgown'}">
							${result.freightOwnerEmail}
						</c:when>
						<c:when test="${result.ownerClassification eq 'carown'}">
							${result.carOwnerEmail}
						</c:when>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="button-list text-center mt-2">
	<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnMasking" value="${result.ownerClassification}Info" data-dismiss="modal">
	마스킹 해제<span class="btn-label-right"><i class="fas fa-eye"></i></span>
	</button>
	<button type="button" class="btn btn-custom01 width-sm btn-rounded waves-effect waves-dark btn_modal_dismiss" data-dismiss="modal">확인</button>
</div>

<script>
	//마스킹해제 팝업
	//마스킹해제
	$('#btnMasking').on('click', function(){

		//maskingHistoryType: 메뉴형식 (차주상세/화주상세)

		$('.modal-content').modal('hide');
		$('.modal-backdrop').remove();
		
		var maskingHistoryType = this.value;
		var id = $(this).parents('#popup').data('owner_id');
		var params = {
		    	"maskingHistoryType" : maskingHistoryType,
		    	"type" : id
    	};
    	
		showMakingPopup(params);
	});	
	
</script>
