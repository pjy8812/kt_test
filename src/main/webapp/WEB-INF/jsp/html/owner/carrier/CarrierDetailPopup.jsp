<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
    	<div class="modal-content">
        	<div class="modal-header">
                <h4 class="modal-title">차량조회</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
            	<div class="table-responsive">
					<table class="table mb-0 basic-table">
						<tbody>
							<tr>
								<th scope="row">차량번호</th>
								<th scope="row">차종</th>
								<th scope="row">톤수</th>
								<th scope="row">옵션</th>
								<th scope="row">팔레트/BOX</th>
							</tr>
							<c:if test="${empty result.carList}">
								<tr>
									<td colspan="5">조회 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="car" items="${result.carList}">
								<tr>
									<td>
										${car.carrierCarNum}
									</td>
									<td>
										${car.carrierCarType}
									</td>
									<td>
										${car.carrierCarModel}
									</td>
									<td>
										<c:choose>
											<c:when test="${empty car.carrierCarOption}">-</c:when>
											<c:otherwise>
												<c:forEach var="option" items="${car.carrierCarOption}">
													${option}
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${empty car.carrierCarPackagingType}">-</c:when>
											<c:otherwise>${car.carrierCarPackagingType}</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
        	</div>
    	</div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->