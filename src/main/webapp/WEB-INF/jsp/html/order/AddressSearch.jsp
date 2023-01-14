<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="addressSearchPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">주소검색</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-10">
                        <input type="text" class="form-control" id="searchAddrText" placeholder="도로명 및 지번 주소를 입력하세요.">
                    </div>
                    <div class="col-2"><button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark w-100" name="searchBtn">검색</button></div>
                </div>
                
                <div class="modal-address-list-wrap">
                    <h5 class="card-title">검색결과</h5>
					<div class="addrList"></div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
var param = {};
var addrMode = "${mode}";

$(document).ready(function(){
	addrLoadList(addrMode);
});

//목록
function addrLoadList(mode) {
	//console.log('=== loadList ===');
	//console.log(param);
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/addr/list/'/>" + mode,
		data : param,
		cache : false,
		async : true,
		success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}

			$('.addrList').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//검색
$('button[name="searchBtn"]').on('click', function(){
	param.terms = $('#searchAddrText').val();
	addrLoadList(addrMode);
});

$('#searchAddrText').on('keyup', function(event) {
	if (event.keyCode == 13) {
		$('button[name="searchBtn"]').click();
        return;
    }
});
</script>
