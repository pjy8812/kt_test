<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="card-box">
	<h5 class="card-title">조회조건</h5>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="select01" class="col-1 col-form-label">사용여부</label>
				<div class="col-8 col-form-label text-left">
					<div class="form-check-inline">
						<input type="checkbox" class="form-check-input" name="useYn" id="using" value="Y" checked>
						<label class="form-check-label" for="using">사용중(Y)</label>
					</div>
					<div class="form-check-inline pl-2">
						<input type="checkbox" class="form-check-input" name="useYn" id="usingStop" value="N">
						<label class="form-check-label" for="usingStop">사용중지(N)</label>
		 			</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="searchType" class="col-1 col-form-label">검색어</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="searchType">
								<option value="codeGroupId">코드그룹ID</option>
								<option value="codeGroupName">코드그룹명</option>
								<option value="codeId">코드ID</option>
								<option value="codeName">코드명</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="keyword" placeholder="검색어를 입력하세요.">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
			<button type="button" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
		</div>
	</div>
</div>

<div id="popup_editCode"></div>
		
		
<script>

	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		searchList();
	});
	
	// get 조회조건
	function getData() {
		
		var object = data;
		
		// 사용여부 
		if($('input:checkbox[name=useYn]:checked').length == $('input:checkbox[name=useYn]').length) {
			object.codeUseYn = "all";
		} else {
			object.codeUseYn = $('[name="useYn"]:checked').val();
		}
		
		// 검색타입
		object.searchType = $('#searchType').val();
		
		// 검색어
		object.searchText = $('#keyword').val();
		
		return object;
	}

</script>
