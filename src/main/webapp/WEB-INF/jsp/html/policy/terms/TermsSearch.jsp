<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin search -->
<div class="card-box searchCard">
	<h5 class="card-title">조회조건</h5>
	<div class="row">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="termsRequiredYn" class="col-2 col-form-label">필수여부</label>
						<div class="col-4">
							<select class="form-control" id="termsRequiredYn" name="termsRequiredYn">
								<option value="all">전체</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="termsServiceClassify" class="col-2 col-form-label">서비스구분</label>
						<div class="col-4">
							<select class="form-control" id="termsServiceClassify" name="termsServiceClassify">
								<option value="all">전체</option>
								<option value="화주">화주</option>
								<option value="차주">차주</option>
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
				<label for="searchType" class="col-1 col-form-label">검색어</label>
				<div class="col-2">
					<select class="form-control" id="searchType" name="searchType">
						<option value="termsName">약관명</option>
						<option value="termsWriter">수정자</option>
					</select>
				</div>
				<div class="col-6">
					<input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
			<button type="button" id="searchBtn" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
		</div>
	</div>
</div>
<!-- End search -->

<!-- Begin result -->
<div class="card-box searchList">

</div>

<script>
	
	$('button[name="searchBtn"]').on('click touch', function() {
		data.pageIndex = 1;
		searchList();
	})
	
	/* function initServiceEvent() {
	} */

	$(document).ready(function() {
		// initServiceEvent();
		// searchList();
	})

</script>
