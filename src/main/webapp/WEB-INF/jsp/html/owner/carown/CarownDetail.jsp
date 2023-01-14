<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isOk" value="true"/>
<c:if test="${empty result.resultCode or result.resultCode ne '00000'}"><c:set var="isOk" value="false"/></c:if>

<!-- Begin page -->
<div class="card-box info-box" data-car_owner_id="${vo.carOwnerId}">
	<h5 class="card-title">차주 상세 정보</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">구분</th>
					<td>
						<c:choose>
							<c:when test="${result.carOwnerType eq 'normal'}">일반</c:when>
							<c:when test="${result.carOwnerType eq 'contract'}">계약차주</c:when>
							<c:otherwise>${result.carOwnerType}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">회원명</th>
					<td>${result.carOwnerName}</td>
				</tr>
				<tr>
					<th scope="row">ID</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerId}">-</c:when>
							<c:otherwise>${result.carOwnerId}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">상호</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerCorporateRegistrationName}">-</c:when>
							<c:otherwise>${result.carOwnerCorporateRegistrationName}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">사업자등록번호</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerCorporateRegistrationNumber}">-</c:when>
							<c:otherwise>${result.carOwnerCorporateRegistrationNumber}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerTelephoneNum}">-</c:when>
							<c:otherwise>${result.carOwnerTelephoneNum}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">이메일주소</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerEmail}">-</c:when>
							<c:otherwise>${result.carOwnerEmail}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">추천인 ID</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerRecommendId}">-</c:when>
							<c:otherwise>${result.carOwnerRecommendId}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">거래통장</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerBank}">-</c:when>
							<c:otherwise>${result.carOwnerBank} ${result.carOwnerAccount}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">회원가입일</th>
					<td>
						<fmt:formatDate value="${result.carOwnerJoinDateTime}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
				<tr>
					<th scope="row">최종이용일</th>
					<td>
						<fmt:formatDate value="${result.carOwnerLastUseDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
				<tr>
					<th scope="row">이용상태</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="carOwnerMemberStatus">
									<c:forEach var="row" items="${memberStatus}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq result.carOwnerMemberStatus}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-check-inline ml-2">
								<input type="checkbox" class="form-check-input" name="carOwnerFileAdminCheckYn" id="carOwnerFileAdminCheckYn" value="${result.carOwnerFileAdminCheckYn}" <c:if test="${not isOk}">disabled</c:if> <c:if test="${result.carOwnerFileAdminCheckYn eq 'Y'}">checked</c:if>>
								<label class="form-check-label" for="carOwnerFileAdminCheckYn">관리자 가입서류확인</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">가입승인상태</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carOwnerJoinApprovalStatusName}">-</c:when>
							<c:otherwise>${result.carOwnerJoinApprovalStatusName}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">패널티</th>
					<td>
						<c:if test="${result.Penalty > 0}">
							<button type="button" class="btn btn-white waves-effect waves-dark btnCarInfo" id="btnPenalty">
								<i class="fas fa-exclamation-triangle color-status-issue"  ></i>
							</button>
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">지급방법</th>
					<td>
						<div class="row">
							<div class="col-2">
								<div class="col-10 col-form-label p-1 text-left">
									<div class="form-check form-check-inline">
										<input type="radio" id="paymentMethodN" name="carOwnerPaymentMethod" <c:if test="${!empty result.carOwnerPaymentApplyDate}">disabled</c:if> class="form-check-input" value="nextDayPayment" <c:if test="${result.carOwnerPaymentMethod eq 'nextDayPayment'}">checked</c:if>>
										<label class="form-check-label" for="paymentMethodN">익일결제</label>
									</div>
									<div class="form-check form-check-inline pl-2">
										<input type="radio" id="paymentMethodM" name="carOwnerPaymentMethod" <c:if test="${!empty result.carOwnerPaymentApplyDate}">disabled</c:if> class="form-check-input" value="monthEndPayment" <c:if test="${result.carOwnerPaymentMethod eq 'monthEndPayment' }">checked</c:if>>
										<label class="form-check-label" for="paymentMethodM">월말결제</label>
									</div>
								</div>
							</div>
							<div class="col-2">
								<label class="col-form-label" style="color:red;"><c:if test="${!empty result.carOwnerPaymentApplyDate}">※ 적용예정일 : <c:out value="${result.carOwnerPaymentApplyDate}" /></c:if></label>
							</div>
						</div>					
					</td>
				</tr>				
			</tbody>
		</table>
	</div>
	<hr/>
	<div class="table-responsive pt-3">
		<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
			<thead>
				<tr role="row">
					<th class="sorting_asc">차량번호</th>
					<th class="sorting">차종</th>
					<th class="sorting">톤수</th>
					<th class="sorting">옵션</th>
					<th class="sorting">팔레트/BOX</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty result.carList}">
					<tr>
						<td colspan="5">조회 결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="car" items="${result.carList}">
					<tr>
						<td>
							${car.carNumber}
						</td>
						<td>
							${car.carTypeName}
						</td>
						<td>
							${car.carModelName}
						</td>
						<td>
							<c:choose>
								<c:when test="${empty car.carOptionList}">-</c:when>
								<c:otherwise>
									<c:forEach var="option" items="${car.carOptionList}">
										${option.carOptionName}
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${empty car.carPackagingTypeName}">-</c:when>
								<c:otherwise>${car.carPackagingTypeName}</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="card-box">
	<h5 class="card-title"></h5>
	<div class="row mb-2">
		<div class="col-6">
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnSendSms" disabled>
				파일수정 SMS 발송(<span id="fileCheckCtn">0</span>)<span class="btn-label-right"><i class="far fa-envelope"></i></span>
			</button>
		</div>
		<div class="col-6 text-right">
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" data-toggle="modal" data-target="#pop-alert-0301">미리보기</button>
		</div>
	</div>
    <!-- pop-mid-upload -->
    <div id="pop-alert-0301" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">첨부파일 미리보기</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body doc-preview">
                    <ul class="nav nav-btns">
                        <li class="nav-item">
							<c:set var="corperateRegistration" value="0"/>
							<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'corperateRegistration'}">
                            <a href="#file-preview-001" data-toggle="tab" aria-expanded="true" class="nav-link active">사업자등록증</a>
							</c:if>
							</c:forEach>
                            
                        </li>
                        <li class="nav-item">
								<c:set var="driverLicense" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'driverLicense'}">
                            <a href="#file-preview-002" data-toggle="tab" aria-expanded="false" class="nav-link">운전면허증</a>
							</c:if>
							</c:forEach>
                        </li>
                        <li class="nav-item">
								<c:set var="vehicleRegistration" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'vehicleRegistration'}">
                            <a href="#file-preview-003" data-toggle="tab" aria-expanded="false" class="nav-link">차량등록증</a>
							</c:if>
							</c:forEach>
                        </li>
                        <li class="nav-item">
								<c:set var="transportLicense" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'transportLicense'}">
                            <a href="#file-preview-004" data-toggle="tab" aria-expanded="false" class="nav-link">화물운송자격증</a>
							</c:if>
							</c:forEach>
                        </li>
                        <li class="nav-item">
								<c:set var="bankBook" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'transportLicense'}">
                            <a href="#file-preview-005" data-toggle="tab" aria-expanded="false" class="nav-link">거래통장사본</a>
							</c:if>
							</c:forEach>
                        </li>
                        <li class="nav-item">
								<c:set var="other" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'other'}">
                            <a href="#file-preview-006" data-toggle="tab" aria-expanded="false" class="nav-link">기타</a>
							</c:if>
							</c:forEach>
                        </li>
                    </ul>
                    <!-- //.nav-tabs -->
                    <div class="tab-content">
                        <div class="tab-pane show active" id="file-preview-001">
                        	<div class="img-wrap">
								<c:set var="corperateRegistration" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'corperateRegistration'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="corperateRegistration" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'corperateRegistration'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드</button>
								</c:if>
								</c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane show" id="file-preview-002">
                        	<div class="img-wrap">
								<c:set var="driverLicense" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'driverLicense'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="driverLicense" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'driverLicense'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드</button>
								</c:if>
								</c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane show" id="file-preview-003">
                        	<div class="img-wrap">
								<c:set var="vehicleRegistration" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'vehicleRegistration'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="vehicleRegistration" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'vehicleRegistration'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드</button>
								</c:if>
								</c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane show" id="file-preview-004">
                        	<div class="img-wrap">
								<c:set var="transportLicense" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'transportLicense'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="transportLicense" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'transportLicense'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드</button>
								</c:if>
								</c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane show" id="file-preview-005">
                        	<div class="img-wrap">
								<c:set var="bankBook" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'bankBook'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="bankBook" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'bankBook'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드</button>
								</c:if>
								</c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane show" id="file-preview-006">
                        	<div class="img-wrap">
								<c:set var="other" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'other'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="other" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'other'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드5</button>
								</c:if>
								</c:forEach>
                            </div>
                   	 	</div>
                   	</div>
                    <!-- //.tab-content -->
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->		
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 4%;">
				<col style="width: 10%;">
				<col style="/">
				<col style="width: 10%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="사업자등록증" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(사업자등록증)
					</th>
					<td>
						<c:set var="corperateRegistration" value="0"/>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'corperateRegistration'}">
								<c:set var="corperateRegistration" value="${corperateRegistration+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
							</c:if>
						</c:forEach>
						<c:if test="${corperateRegistration eq 0}">-</c:if>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'corperateRegistration'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
					</td>
				</tr>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="운잔자면허증" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(운전면허증)
					</th>
					<td>
						<c:set var="driverLicense" value="0"/>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'driverLicense'}">
								<c:set var="driverLicense" value="${driverLicense+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
							</c:if>
						</c:forEach>
						<c:if test="${driverLicense eq 0}">-</c:if>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'driverLicense'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
					</td>
				</tr>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="차량등록증" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(차량등록증)
					</th>
					<td>
						<c:set var="vehicleRegistration" value="0"/>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'vehicleRegistration'}">
								<c:set var="vehicleRegistration" value="${vehicleRegistration+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
							</c:if>
						</c:forEach>
						<c:if test="${vehicleRegistration eq 0}">-</c:if>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'vehicleRegistration'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
					</td>
				</tr>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="화물운송자격증" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(화물운송자격증)
					</th>
					<td>
						<c:set var="transportLicense" value="0"/>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'transportLicense'}">
								<c:set var="transportLicense" value="${transportLicense+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
							</c:if>
						</c:forEach>
						<c:if test="${transportLicense eq 0}">-</c:if>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'transportLicense'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
					</td>
				</tr>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="거래통장사본" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(거래통장사본)
					</th>
					<td>
						<c:set var="bankBook" value="0"/>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'bankBook'}">
								<c:set var="bankBook" value="${bankBook+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
							</c:if>
						</c:forEach>
						<c:if test="${bankBook eq 0}">-</c:if>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'bankBook'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
					</td>
				</tr>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="기타" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(기타)
					</th>
					<td>
						<c:set var="others" value="0" />
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'others'}">
								<c:set var="others" value="${others+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
							</c:if>
						</c:forEach>
						<c:if test="${others eq 0}">-</c:if>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'others'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="col-6">
		<div class="button-list">
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnBack">목록</button>
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnHistory" <c:if test="${not isOk}">disabled</c:if>>
				변경내역<span class="btn-label-right"><i class="fas fa-history"></i></span>
			</button>
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnMasking" <c:if test="${not isOk}">disabled</c:if>>
				마스킹 해제<span class="btn-label-right"><i class="fas fa-eye"></i></span>
			</button>
		</div>
	</div>
	<div class="col-6 text-right">
		<div class="button-list">
			<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnWithdraw" <c:if test="${not isOk}">disabled</c:if>>
						탈퇴(승인)<span class="btn-label-right"><i class="far fa-trash-alt"></i></span></button>
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave" <c:if test="${not isOk}">disabled</c:if>>저장</button>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>

<div id="modalDetail"></div>
<div id="modalDetail"></div>

<!-- End page -->
<script>
	<c:if test="${empty result.resultCode}">
		alert('차주 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result}')
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('차주 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
	
	//관리자확인 
	$('#carOwnerFileAdminCheckYn').on('change', function(){
		if($(this).is(':checked')){
			$(this).val('Y');
		}else{
			$(this).val('N');
		}
	});
	
	//패널티내역
	$('#btnPenalty').on('click', function(e){
		var id = $('.info-box').data('car_owner_id'); //회원ID
		loadPopup('penalty', id);
	});
	
	//첨부파일 체크박스
	$('input[name="chk"]').on('change', function(){
		//가입승인상태가 심사중일 경우 파일수정 SMS 발송 비활성 by 2022.05.18 ktds요청으로 인하여 추가
		if('${result.carOwnerJoinApprovalStatus}' == 'underReview'){
			return;
		}
	
		var length = $('input[name="chk"]:checked').length;
		$('#btnSendSms #fileCheckCtn').html(length);
		
		//선택된 첨부파일이 없을 경우 버튼 비활성화
		if(length == 0){ 
			$('#btnSendSms').attr('disabled', true);
		}else{
			$('#btnSendSms').attr('disabled', false);
		}
	});
	
	//파일수정요청 버튼
	$('#btnSendSms').on('click', function(){
		//가입승인상태가 심사중일 경우 파일수정 SMS 발송 비활성 by 2022.05.18 ktds요청으로 인하여 추가
		if('${result.carOwnerJoinApprovalStatus}' == 'underReview'){
			$('#btnSendSms').attr('disabled', true);
			return;	
		}
		
		var length = $('input[name="chk"]:checked').length;
		if(length == 0){	//선택된 파일이 없을 경우 return;
		 	return; 
		}
		
		if(!confirm('선택한 첨부파일에 대하여 재요청 SMS를 발송하시겠습니까?')){
			return;
		}
		
		sendSMS();
	});    
	
	
	//목록
	$('#btnBack').on('click', function(){
		var tempData = searchedData;
		if($.isEmptyObject(tempData)){
			routie('list');
		}else{
			routie('list/'+encodeURIComponent(JSON.stringify(tempData)));
		}
	});
	
	//변경내역
	$('#btnHistory').on('click', function(){
		var id =  $('.info-box').data('car_owner_id'); //회원ID
		loadPopup('history', id);
	});
	
	//마스킹해제
	$('#btnMasking').on('click', function(){
		//maskingHistoryType: 메뉴형식 (차주상세)
		var params = {
		    	"maskingHistoryType" : "carownInfo"
    	};
		showMakingPopup(params);
	});	
		
	//마스킹해제사유(파일다운로드사유) 등록
	$('#modalDetail').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
		unmask();
	});
	
	//탈퇴승인
	$('#btnWithdraw').on('click', function(){
		var id = $('.info-box').data('car_owner_id'); //회원ID
		loadUpdateReasonPopup('withdraw', id);
	});
	
	//저장
	$('#btnSave').on('click', function(){
		var id =  $('.info-box').data('car_owner_id'); //회원ID
		//변경사유팝업 load
		loadUpdateReasonPopup('update', id);
	});
	
	//변경사유poup> 저장
	$("#modal").on('click', '#popupUpdateReason #btnUpdate', function(){
		var type = $('#modal #popupUpdateReason').data('param_type');
		if(type == 'update'){
			update(); //수정
		}else if(type == 'withdraw'){
			withdraw(); //탈퇴(승인)
		}else{
			//console.log(type);
			return;
		}
	});
	
	//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.17 mijin.kim
	$('.file-name').on('click', function(){
		$(this).addClass('img_down');
		
		//maskingHistoryType: 메뉴형식 (차주상세)
		var params = {
		    	"maskingHistoryType" : "carownInfo"
		    	, "type": "download"
	    };
		showMakingPopup(params);
	});
	
	
</script>
