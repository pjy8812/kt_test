<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isUpdate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
</c:forEach>
<c:set var="isDelete" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'D') gt -1}"><c:set var="isDelete" value="true"/></c:if>
</c:forEach>
<c:set var="isOk" value="true"/>
<c:if test="${empty result.resultCode or result.resultCode ne '00000'}"><c:set var="isOk" value="false"/></c:if>

<!-- Begin page -->
<div class="card-box" id="detail" data-voc_seq="${result.vocSeq}" data-voc_order_num="${result.vocOrderNum}" data-voc_order_id="${result.vocOrderId}" data-voc_owner_id="${result.vocOwnerId}"
	data-voc_owner_classification="${result.vocOwnerClassification}">
	<h5 class="card-title">1:1문의 상세보기</h5>
	<div class="table-responsive mt-3">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">등록일시</th>
					<td>
						<fmt:formatDate value="${result.vocRegisterDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/> 
					</td>
				</tr>
				<tr>
					<th scope="row">주문번호</th>
					<td>
						<a class="title-link orderNumber">${result.vocOrderNum}</a>
					</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td>
						${result.vocTitle}
					</td>
				</tr>
				<tr>
					<th scope="row">회원</th>
					<td>
						<span class="<c:choose><c:when test="${result.vocOwnerClassification eq '차주'}">color-status-ing</c:when><c:when test="${result.vocOwnerClassification eq '화주'}">color-status-wait</c:when></c:choose>">${result.vocOwnerClassification}</span>
					</td>
				</tr>
				<tr>
					<th scope="row">작성자ID</th>
					<td>
						<a class="<c:if test="${result.vocAdminWriteYn ne 'Y'}">title-link userId</c:if>">${result.vocOwnerId}</a>
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>
						<div id="vocContent">
							<textarea class="form-control border-0" rows="15" name="vocContent" readonly="readonly">${result.vocContent}</textarea>
						</div>	
					</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td>
						<c:forEach var="file" items="${result.fileList}" varStatus="i">
							<a class="file-name" href="data:application/png;base64,${file.fileData}" download="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>
							<c:if test="${not i.last}"><br/></c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th scope="row">상태</th>
					<td>
						<span class="<c:if test="${result.vocStatus eq 'standby'}">color-status-cancel</c:if>">
							<c:choose>
								<c:when test="${not empty result.vocStatusName}">
									${result.vocStatusName}
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${result.vocStatus eq 'standby'}">답변대기</c:when>
										<c:when test="${result.vocStatus eq 'complete'}">답변완료</c:when>
										<c:otherwise>${result.row.vocStatus}</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</span>
					</td>
				</tr>
				<tr>
					<th scope="row" class="">문의답변</th>
					<td>
						<div class="row">
							<div class="col-12">
								<textarea class="form-control" name="answer" rows="10" <c:if test="${not empty result.vocAnswerList}">readOnly</c:if> placeholder="답변을 입력하세요"><c:if test="${not empty result.vocAnswerList}">${result.vocAnswerList[0].vocAnswer}</c:if></textarea>
							</div>
						</div>
						<c:if test="${isUpdate}">
							<c:if test="${empty result.vocAnswerList}">
								<div class="mt-1">
						 			<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark " id="btnRegAnswer" <c:if test="${not isOk}">disabled</c:if>>답변게시</button>
					 			</div>
					 		</c:if>
				 		</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">답변일시</th>
					<td>
						<c:choose>
							<c:when test="${empty  result.vocAnswerList[0].vocAnswerDateByLongType}">-</c:when>
							<c:otherwise><fmt:formatDate value="${result.vocAnswerList[0].vocAnswerDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/></c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">답변자ID</th>
					<td>
						<c:choose>
							<c:when test="${empty  result.vocAnswerList[0].vocAnswerId}">-</c:when>
							<c:otherwise>${result.vocAnswerList[0].vocAnswerId}</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="row">
	<div class="col-6">
		<div class="button-list">
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnList">목록</button>
		</div>
	</div>
	<div class="col-6 text-right">
		<div class="button-list">
			<c:if test="${isDelete}">
				<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnDelete" <c:if test="${not isOk}">disabled</c:if>>
					삭제<span class="btn-label-right"><i class="far fa-trash-alt"></i></span>
				</button>
			</c:if>
			<c:if test="${isUpdate}">
				<c:if test="${result.vocAdminWriteYn eq 'Y'}">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnEdit" <c:if test="${not isOk}">disabled</c:if>>
						수정<span class="btn-label-right"><i class=" fas fa-pencil-alt"></i></span>
					</button>
				</c:if>
			</c:if>
		</div>
	</div>
</div>

<div id="modal"></div>

<!-- End page -->
<script>
	$(document).ready(function() {
		<c:if test="${empty result.resultCode}">
			alert('1:1문의 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('1:1문의 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
		
	});
	
	
	//제목 클릭시 상세화면으로 이동
	$('.title-link.orderNumber').on('click', function() {
		var orderNum = $(this).parents('#detail').data('voc_order_num');
		var orderId = $(this).parents('#detail').data('voc_order_id');
		
		if(orderId == undefined || orderId == ''){
			alert('주문ID가 없어 상세 페이지로 이동할 수 없습니다.');
			return;
		}
		movePageOrder(orderId);
	});
	
	//UserID 클릭시 회원정보화면으로 이동
	$('.title-link.userId').on('click', function() {
		var vocOwnerClassification = $(this).parents('#detail').data('voc_owner_classification');
		var vocOwnerId = $(this).parents('#detail').data('voc_owner_id');
		
		//console.log(vocOwnerClassification, vocOwnerId);
		
		movePageUser(vocOwnerClassification, vocOwnerId)
	});

	//목록버튼 클릭
	$('#btnList').on('click', function(){
		var tempData = searchedData;
		if($.isEmptyObject(tempData)){
			routie('list');
		}else{
			routie('list/'+encodeURIComponent(JSON.stringify(tempData)));
		}
	});
	
	//답변게시
	$('#btnRegAnswer').on('click', function(){
		if(!confirm('답변 등록하시겠습니까?')){	//아니오를 클릭했을 경우 return
			return; 
		}
		
		//답변게시함수 호출 
		saveAnswer();
	});
	
	//삭제버튼 클릭
	$('#btnDelete').on('click', function(){
		var seq = $('#detail').data('voc_seq');
		//console.log('voc_seq', seq);
		if(seq == '' || seq == undefined){	//게시글ID가 없을 경우 return
			return; 
		}
		
		if(!confirm('해당 게시글을 삭제하시곘습니까?')){	//아니오를 클릭했을 경우 return
			return; 
		}
		
		//삭제함수 호출
		deleteQna(seq);
	});
	
	//수정버튼 클릭
	$('#btnEdit').on('click', function(){
		var seq = $('#detail').data('voc_seq');
		//console.log('voc_seq', seq);
		
		if(seq == '' || seq == undefined){ //게시글ID가 없을 경우
			return; 
		}
		
		routie('edit/'+seq);
	});
</script>
