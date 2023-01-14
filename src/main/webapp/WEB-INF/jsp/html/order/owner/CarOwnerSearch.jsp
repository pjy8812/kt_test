<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="tab-content pt-0">
	<div class="tab-pane show active">
		<div class="card-box shadow">
            <h5 class="card-title">조회조건</h5>
            <div class="row">
                <div class="col-10">
                    <div class="form-group row mb-3">
                        <label for="select05" class="col-1 col-form-label">검색어</label>
                        <div class="col-11">
                            <div class="row">
                                <div class="col-2">
                                    <select class="form-control" id="carownSearchType">
                                        <option value="carOwnerName">차주명</option>
                                        <c:if test="${mode ne 'emergency'}">
                                        	<option value="carOwnerId">ID</option>
                                        </c:if>
                                        <option value="carNum">차량번호</option>
                                        <option value="carOwnerTelephone">전화번호</option>
                                        <c:if test="${mode ne 'emergency'}">
                                        	<option value="carOwnerEmail">이메일</option>
                                        </c:if>
                                     </select>
                                 </div>
                                 <div class="col-4">
                                     <input type="text" class="form-control" id="carownSearchKeyword" placeholder="검색어를 입력하세요.">
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="col-2 text-right">
                     <button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="searchCarownList">조회</button>
                 </div>
             </div>
		</div>
	</div>
</div>


<script>
// 조회
$('#searchCarownList').on('click', function(){
	var mode = $('.nav-link.car-owner.active').attr('id');

	param.nowPage = 1;
	
	var searchText = $('#carownSearchKeyword').val();
	if(searchText != '' && searchText != undefined){
		param.searchType = $('#carownSearchType').val();
		param.searchText = searchText;
	} else {
		delete param.searchType;
		delete param.searchText;
	}
	
	loadCarownList(mode);
});
</script>
