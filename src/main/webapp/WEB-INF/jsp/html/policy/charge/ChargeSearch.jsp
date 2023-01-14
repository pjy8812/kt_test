<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card-box search-box">
	<h5 class="card-title">조회조건</h5>
	<div class="row">
		<div class="col-10">
			<div class="row">
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="useYn" class="col-2 col-form-label">사용여부</label>
						<div class="col-3">
							<select class="form-control" id="chargeUse">
								<option value="all">전체</option>
								<option value="Y" <c:if test="${vo.chargeUse eq 'Y'}">selected</c:if>>Y</option>
								<option value="N" <c:if test="${vo.chargeUse eq 'N'}">selected</c:if>>N</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="form-group row mb-3">
						<label for="normalYn" class="col-4 col-form-label">기본요금제여부</label>
						<div class="col-3">
							<select class="form-control" id="chargeBasic">
								<option value="all">전체</option>
								<option value="Y" <c:if test="${vo.chargeBasic eq 'Y'}">selected</c:if>>Y</option>
								<option value="N" <c:if test="${vo.chargeBasic eq 'N'}">selected</c:if>>N</option>
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
				<label for="" class="col-1 col-form-label">검색어</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="searchType">
								<option value="name" <c:if test="${vo.searchType eq 'name'}">selected</c:if>>요금제명</option>
								<option value="worker" <c:if test="${vo.searchType eq 'worker'}">selected</c:if>>수정자</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="searchText" placeholder="검색어를 입력하세요." value="${vo.searchText}">
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

<div class="searchList">
</div>


<script>
	// 조회
	$('button[name="searchBtn"]').on('click touch', function () {
		searchList();
	})
</script>
