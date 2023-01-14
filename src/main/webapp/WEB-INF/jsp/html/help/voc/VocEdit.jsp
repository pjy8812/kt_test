<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isCreate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}"><c:set var="isCreate" value="true"/></c:if>
</c:forEach>
<c:set var="isUpdate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
</c:forEach>
<!-- Begin page -->
<div class="card-box edit-box" data-voc_seq="${result.vocSeq}" data-voc_order_num="${result.vocOrderNum}" data-voc_order_id="${result.vocOrderId}">
	<h5 class="card-title">
		<c:choose>
			<c:when test="${empty result.vocSeq}">1:1문의 작성</c:when>
			<c:otherwise>1:1문의 수정</c:otherwise>
		</c:choose>
	</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">주문번호</th>
					<td >
						<label id="orderNumber">	
						<c:choose>
							<c:when test="${empty result.vocOrderNum}">
								<span class="color-status-disable" id="orderNumber">(매칭 주문 없음)</span>
							</c:when>
							<c:otherwise>${result.vocOrderNum}</c:otherwise>
						</c:choose>
						</label>
						<button type="button" class="btn btn-white btn-rounded waves-effect waves-dark ml-2" id="btnSearchOrder">주문번호찾기</button>
					</td>
				</tr>
				<tr>
					<th scope="row">제목<span class="text-danger ml-1">*</span></th>
					<td>
						<input type="text" class="form-control" name="vocTitle" value="${result.vocTitle}"/>
					</td>
				</tr>
				<tr>
					<th scope="row">대상<span class="text-danger ml-1">*</span></th>
					<td>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="vocRecipient" id="vocRecipientFrgown" value="화주" <c:if test="${result.vocOwnerClassification eq '화주'}">checked</c:if>>
							<label class="form-check-label" for="vocRecipientFrgown">화주</label>
			 			</div>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="vocRecipient" id="vocRecipientCarown" value="차주" <c:if test="${result.vocOwnerClassification eq '차주'}">checked</c:if>>
							<label class="form-check-label" for="vocRecipientCarown">차주</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">최종작성자</th>
					<td>
						${User.adminId}
					</td>
				</tr>
				<tr>
					<th scope="row">내용<span class="text-danger ml-1">*</span></th>
					<td>
						<div id="editor d-none"></div>
						<textarea class="form-control" rows="15" name="vocContent" onkeyup="fnCheckByte(2000, this)">${result.vocContent}</textarea>
						<div class="text-right">
							<label class="pl-2 pt-1"><span id="nowByte">0</span>/2000 byte</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td>
						<div class="row">
							<button type="button" id="btnAddfile" class="btn btn-white btn-rounded waves-effect waves-dark" >파일첨부</button>
							<input type="file" class="d-none" name="file01" multiple>
                         </div>
                         <div class="divFileList2 row">
                         	<c:forEach var="file" items="${result.fileList}" varStatus="i">
                         		<div class="alert alert-light file-dismissible bg-light text-dark border-0 fade show ml-1 mb-0 mt-2" role="alert" id="alertFile">
       								<button type="button" class="close" data-index="${i.count}">
       									<span aria-hidden="true">&times;</span>
     								</button>
       						 		<span id="fileName">${file.fileName}</span>
       						 		<div class="d-none base_file" data-file_name="${file.fileName}">data:application/png;base64,${file.fileData}</div>
    							</div>
                         	</c:forEach>
                         </div>
                         <div class="divFileList row"></div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="col-6">
		<div class="button-list">
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark d-none" id="btnPreview">미리보기</button>
		</div>
	</div>
	<div class="col-6 text-right">
		<div class="button-list">
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnCancel">취소</button>
			<c:choose>
				<c:when test="${empty result.vocSeq}">
					<c:if test="${isCreate}">
						<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave">저장</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${isUpdate}">
						<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave">저장</button>
					</c:if>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</div>

<div id="modal"></div>

<!-- End page -->
<script>
	var editor;
	
	$(document).ready(function() {
		/*
		var vocContent = '${result.vocContent}'.htmlChars()
		$('#editor').html($("<div/>").html(vocContent).text());
		
		//init editor
		editor = new Quill("#editor",{
			theme:"snow",
			modules: {
				toolbar:[[{font:[]},{size:[]}],["bold","italic","underline","strike"],[{color:[]},{background:[]}],[{script:"super"},{script:"sub"}],[{header:[!1,1,2,3,4,5,6]},"blockquote","code-block"],[{list:"ordered"},{list:"bullet"},{indent:"-1"},{indent:"+1"}],["direction",{align:[]}],["link","image","video"],["clean"]]
			}
		});
		*/
	});
	
	//주문번호찾기
	$('#btnSearchOrder').on('click', function(){
		loadOrderSearchPopup();
	});
	
	//파일첨부버튼 클릭 
	$('#btnAddfile').on('click touch', function() {
		$('[name="file01"]').trigger('click');
	})
	
	//파일선택
	$('[name="file01"]').on('change', function() {
		previewFileName(this, $('.divFileList')); //첨부파일명 표시
	})
	
	//파일삭제
	$('.divFileList2').on('click', '.file-dismissible .close', function(){
		if(!confirm('첨부파일을 삭제하시겠습니까')){
			return;
		}
		
		var index = $('.divFileList2 .file-dismissible .close').index(this);
		//console.log(index)
		clearFileName($('[name="file01"]'), index, $('.divFileList2')); //첨부파일명 초기화
	});
	
	$('.divFileList').on('click', '.file-dismissible .close', function(){
		if(!confirm('첨부파일을 삭제하시겠습니까')){
			return;
		}
		
		var index = $('.divFileList .file-dismissible .close').index(this);
		//console.log(index)
		clearFileName($('[name="file01"]'), index, $('.divFileList')); //첨부파일명 초기화
	});
	
	//미리보기 버튼클릭
	$('#btnPreview').on('click', function(){
		//console.log('미리보기');
	});
	
	//취소버튼 클릭
	$('#btnCancel').on('click', function(){
		if(!confirm('1:1문의 작성을 취소하시겠습니까?')){	 //아니오 클릭시 return
			return;
		}
		
		history.back();
	});
	
	//저장버튼 클릭
	$('#btnSave').on('click', function(){
		if(!confirm('1:1문의 저장하시겠습니까?')){	 //아니오 클릭시 return
			return;
		}
		
		save();
	});
</script>
