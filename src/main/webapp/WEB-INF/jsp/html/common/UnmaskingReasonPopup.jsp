<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<!-- Begin 마스킹해제사유 입력팝업 -->
<div id="popupUnmaskingReason" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-param_type="${maskingHistoryType}" data-type="${type}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                	<c:choose>
                		<c:when test="${type eq 'download'}">파일 다운로드 사유</c:when>
                		<c:otherwise>마스킹 해제 사유</c:otherwise>
                	</c:choose>
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <textarea class="form-control" id="unmaskingReason" maxlength="50" rows="3" style="resize:none;" 
                	placeholder="<c:choose><c:when test="${type eq 'download'}">파일 다운로드 사유를 입력하세요</c:when><c:otherwise>마스킹 해제사유를 입력하세요.</c:otherwise></c:choose>"></textarea>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="unmaskingSave" disabled>저장</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End 마스킹해제사유 입력팝업 -->


<script>
//저장버튼 활성화
$('#unmaskingReason').on('keyup', function(){
	var reason = $('#unmaskingReason').val();
	
	if(reason != '') {
		$('#unmaskingSave').prop('disabled', false);
	} else {
		$('#unmaskingSave').prop('disabled', true);
	}
});
</script>