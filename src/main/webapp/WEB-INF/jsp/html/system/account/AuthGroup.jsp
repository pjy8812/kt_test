<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card-box">
    <div class="row">
        <div class="col-12 text-right">
        	<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
            		<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark" id="createGroup">그룹 생성</button>
            	</c:if>
            </c:forEach>
        </div>
    </div>
   	<div class="col-6">
		<h6 class="card-title">* 계정/권한 설정에서 관리자 계정별로 권한 그룹 설정이 가능합니다.</h6>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
						<thead>
							<tr role="row">
								<th class="sorting">No.</th>
								<th class="sorting">그룹명</th>
								<th class="sorting">그룹코드</th>
								<th class="sorting">멤버</th>
								<th class="sorting">삭제</th>
							</tr>
						</thead>
						<tbody>
		                   	<c:if test="${empty result.list}">
		                  		<tr>
		                  			<th colspan="5">조회 결과가 없습니다.</th>
		                  		</tr>
		                  	</c:if>
		                  	<c:if test="${!empty result.list}">
		                  		<c:forEach items="${result.list}" var="list" varStatus="status">
									<tr role="row" class="">
										<td>
											${status.count + (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}
										</td>
										<td>
											<a class="title-link groupName">
												${list.authGroupName}
											</a>
										</td>
										<td class="groupSeq" data-group-seq="${list.adminAuthorityGroupSeq}">${list.authGroupCode}</td>
										<td><a class="title-link member">${list.memberCount}</a></td>
										<td>
												<c:forEach items="${autUriList}" var="autUriList">
													<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'D') gt -1}">
														<i class="far fa-trash-alt btnDelGroup" style="cursor:pointer;"></i>
													</c:if>
												</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			${result.pagination}
		</div>
	</div>
</div>

<div id="popup_editGroup"></div>


<script>
$(document).ready(function() {
	<c:if test="${empty result.resultCode}">
		alert('권한그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('권한그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
});

//그룹상세(생성/수정) 팝업
$('#createGroup, .groupName').on('click', function(){
	var groupSeq = $(this).parent().siblings('.groupSeq').data('group-seq');
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/account/group/edit.popup'/>",
	    data : {
	    	"groupSeq" : groupSeq
	    },
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_editGroup').html(data);
			$('#editGroupPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 
});

//멤버 > 계정/권한 설정탭 이동
$('.member').on('click', function(){
	data.adminAuthorityGroupSeq = $(this).parent().siblings('.groupSeq').data('group-seq');
	searchList();
});

//그룹 삭제
$('.btnDelGroup').on('click', function(){
	var cntMember = Number($(this).parent().prev('td').find('.member').text());
	
	if(cntMember == '' || cntMember == '0') {
		if(confirm('선택한 권한 그룹을 삭제 하시겠습니까?')) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/system/account/group/delete'/>",
				data : {
					"groupSeq" : $(this).parent().siblings('.groupSeq').data('group-seq')
				},
				cache : false,
				async : true,
				success : function(data, textStatus, XMLHttpRequest) {
					//console.log(data);
					
			    	if(data.error != null) {
						alert('권한그룹 삭제 중 오류가 발생하였습니다.\r\nERROR: '+data.error);
					} else if(data.resultCode == null) {
						alert('권한그룹 삭제 중 오류가 발생하였습니다.\r\nERROR: '+data.code);
					} else if(data.resultCode != '00000') {
						alert('권한그룹 삭제 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
					} else {
						location.reload();
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
		}
	} else {
		alert('멤버가 남아있어 그룹을 삭제할 수 없습니다.');
	}
});

//페이지네이션
$('ul.pagination li').on('click', function() {
	var pageIndex = $(this).data('page-index');
	routie('mng/'+pageIndex);
});
</script>