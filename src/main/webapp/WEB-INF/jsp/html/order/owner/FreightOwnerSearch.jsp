<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="freightOwnerPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">화주 선택</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="card-box pt-0">
                    <h5 class="card-title">조회조건</h5>
                    <div class="row">
                        <div class="col-10">
                            <div class="row">
                                <div class="col-3">
                                    <div class="form-group row mb-3">
                                        <label for="" class="col-4 col-form-label">계약구분</label>
                                        <div class="col-6">
                                            <select class="form-control" id="frgownType">
                                            	<option value="all">전체</option>
                                            	<c:forEach items="${freightOwnerType}" var="list">
                                            		<option value="${list.codeId}">${list.codeName}</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group row mb-3">
                                        <label for="" class="col-4 col-form-label">사업자 구분</label>
                                        <div class="col-6">
                                            <select class="form-control" id="memberType">
                                            	<option value="all">전체</option>
                                            	<c:forEach items="${memberType}" var="list">
                                            		<option value="${list.codeId}">${list.codeName}</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group row mb-3">
                                        <label for="" class="col-4 col-form-label">사업자 유형</label>
                                        <div class="col-6">
                                            <select class="form-control" id="businessType">
                                            	<option value="all">전체</option>
                                            	<c:forEach items="${businessType}" var="list">
                                            		<option value="${list.codeId}">${list.codeName}</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="form-group row mb-3">
                                <label for="frgownSearchType" class="col-1 col-form-label">검색어</label>
                                <div class="col-11">
                                    <div class="row">
                                        <div class="col-2">
                                            <select class="form-control" id="frgownSearchType">
                                                <option value="freightOwnerName">화주명</option>
                                                <option value="freightOwnerId">ID</option>
                                                <option value="freightOwnerTelephone">전화번호</option>
                                                <option value="freightOwnerEmail">이메일</option>
                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <input type="text" class="form-control" id="frgownKeyword" placeholder="검색어를 입력하세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-2 text-right">
                            <button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="searchFrgownList">조회</button>
                        </div>
                    </div>
                </div>
                
                <div id="freightOwnerList"></div>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
var param = {
	nowPage : 1
	, pageSize : 10
	, maskingYn : "N"
};

$(document).ready(function() {
	loadOwnerList();
});

// 목록
function loadOwnerList() {
	//console.log('=== loadList ===');
	//console.log(param);
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/freightowner/list'/>",
		data : param,
		cache : false,
		async : true,
		success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}

			$('#freightOwnerList').empty();
			$('#freightOwnerList').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//조회
$('#searchFrgownList').on('click', function(){
	param.nowPage = 1;
	
	//계약구분
	if($('#frgownType').val() != 'all') {
		param.freightOwnerType = $('#frgownType').val();
	} else {
		delete param.freightOwnerType;
	}
	
	//사업자구분
	if($('#memberType').val() != 'all') {
		param.freightOwnerMemberType = $('#memberType').val();
	} else {
		delete param.freightOwnerMemberType;
	}

	//사업자유형
	if($('#businessType').val() != 'all') {
		param.freightOwnerBusinessType = $('#businessType').val();
	} else {
		delete param.freightOwnerBusinessType;
	}
	
	// 검색어
	var searchText = $('#frgownKeyword').val();
	if(searchText != '' && searchText != undefined){
		param.searchType = $('#frgownSearchType').val();
		param.searchText = searchText;
	} else {
		delete param.searchType;
		delete param.searchText;
	}
	
	//console.log(param)
	loadOwnerList();
});
</script>
