<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isUpdate" value="false"/>
<c:set var="isDelete" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'D') gt -1}"><c:set var="isDelete" value="true"/></c:if>
</c:forEach>

<!-- Begin page -->
<div class="card-box info-box" id="detail" data-notice_seq="${result.noticeSeq}">
	<h5 class="card-title">공지사항 상세보기</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td>${result.noticeTitle}</td>
				</tr>
				<tr>
					<th scope="row">대상</th>
					<td>
						<c:choose>
							<c:when test="${result.noticeRecipient eq '공통'}">
								<span class="color-status-complete">공통</span>
							</c:when>
							<c:when test="${result.noticeRecipient eq '화주'}">
								<span class="color-status-wait">화주</span>
							</c:when>
							<c:when test="${result.noticeRecipient eq '차주'}">
								<span class="color-status-ing">차주</span>
							</c:when>
							<c:otherwise>${result.noticeRecipient}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">최종작성자</th>
					<td>${result.noticeWriter}</td>
				</tr>
				<tr>
					<th scope="row">최종작성일</th>
					<td>
						<fmt:formatDate value="${result.noticeRegisterDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/>
					</td>
				</tr>
				<tr><!-- 2022.04.10 팝업타입추가 -->
					<th scope="row">유형</th>
					<td>
						<c:choose>
							<c:when test="${result.noticePopupType eq 'text'}">텍스트</c:when>
							<c:when test="${result.noticePopupType eq 'img'}">이미지</c:when>
							<c:when test="${result.noticePopupType eq 'textImg'}">텍스트+이미지</c:when>
							<c:otherwise>${result.noticePopupType}</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				<tr class="<c:if test="${result.noticePopupType eq 'img' }">d-none</c:if>" style="height: 300px;max-height: 500px;overflow-y: scroll;">
					<th scope="row">내용</th>
					<td>
						<div id="noticeContent">
							<textarea class="form-control border-0" rows="15" name="noticeContent" readonly="readonly">${result.noticeContent}</textarea>
						</div>
					</td>
				</tr>
				<tr class="<c:if test="${result.noticePopupType eq 'text' }">d-none</c:if>">
					<th scope="row">이미지파일</th>
					<td>
						<c:forEach var="file" items="${result.fileList}" varStatus="i">
							<a class="file-name" href="data:application/png;base64,${file.fileData}" download="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>
							<c:if test="${not i.last}"><br/></c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th scope="row">게시기간</th>
					<td>
						<span <c:if test="${result.noticeExposedNowYn ne 'Y'}">class="color-status-disable"</c:if>>
							<c:choose>
								<c:when test="${result.noticeAlwaysPostYn eq 'Y'}">
									상시게시
								</c:when>
								<c:otherwise>
										<fmt:formatDate value="${result.noticeExposedStartDateByLongType}" pattern="yyyy.MM.dd HH:mm"/> ~ <fmt:formatDate value="${result.noticeExposedEndDateByLongType}" pattern="yyyy.MM.dd HH:mm"/>
								</c:otherwise>
							</c:choose>
							
						</span>
					</td>
				</tr>
				<tr>
					<th scope="row">팝업설정</th>
					<td>
						<input type="checkbox"  class="switch_popup" data-plugin="switchery" data-color="#14b34c" data-size="small" <c:if test="${result.noticePopupSetting eq 'Y'}">checked</c:if>
							<c:if test="${not isUpdate}">disabled</c:if>/>
					</td>
				</tr>
				<tr>
					<th scope="row">상단고정</th>
					<td>
						<input type="checkbox"  class="switch_fixed_top" data-plugin="switchery" data-color="#14b34c" data-size="small" <c:if test="${result.noticeTopExposed eq 'Y'}">checked</c:if>
							<c:if test="${not isUpdate}">disabled</c:if>/>
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
				<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnDelete">
					삭제<span class="btn-label-right"><i class="far fa-trash-alt"></i></span>
				</button>
			</c:if>
			<c:if test="${isUpdate}">
				<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark " id="btnEdit">
					수정<span class="btn-label-right"><i class=" fas fa-pencil-alt"></i></span>
				</button>
			</c:if>
		</div>
	</div>
</div>

<div id="modal"></div>

<!-- End page -->
<script>
	$(document).ready(function() {
		<c:if test="${empty result.resultCode}">
			alert('공지사항 상세 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('공지사항 상세 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
		
	});
	
	
	//상단고정, 팝업설정 토글 기본설정
	$('[data-plugin="switchery"]').each(function(e,a){
		var switchery = new Switchery($(this)[0],$(this).data())
	});
	
	//상단고정 변경 시 상태값 변경
	$('.switch_fixed_top').on('change', function(){
		var noticeSeq = $(this).parents('.info-box').data('notice_seq');
		var index = $('.switch_fixed_top').index(this);
		var topFlag = $(this).is(':checked') ?  'Y': 'N'
		var popupFlag = $('.switch_popup').eq(index).is(':checked') ?  'Y': 'N'
		
		//console.log(noticeSeq, topFlag, popupFlag);
		updateStatus(noticeSeq, topFlag, popupFlag);
	});
	
	//팝업설정 변경 시 상태값 변경
	$('.switch_popup').on('change', function(){
		var noticeSeq = $(this).parents('.info-box').data('notice_seq');
		var index = $('.switch_popup').index(this);
		var topFlag = $('.switch_fixed_top').eq(index).is(':checked') ?  'Y': 'N'
		var popupFlag = $(this).is(':checked') ?  'Y': 'N';
		
		//console.log(noticeSeq, topFlag, popupFlag);
		updateStatus(noticeSeq, topFlag, popupFlag);
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
	
	//삭제버튼 클릭
	$('#btnDelete').on('click', function(){
		var seq = $('#detail').data('notice_seq');
		if(seq == '' || seq == undefined){	//공지사항ID가 없을 경우 return
			return; 
		}
		
		if(!confirm('해당 게시글을 삭제하시곘습니까?')){	// 아니오를 클릭했을 경우 return
			return; 
		}
		
		//삭제함수 호출
		deleteNotice(seq);
	});
	
	//수정버튼 클릭
	$('#btnEdit').on('click', function(){
		var seq = $('#detail').data('notice_seq');
		if(seq == '' || seq == undefined){	//공지사항ID가 없을 경우
			return;
		} 
		routie('edit/'+seq);
	});
</script>
