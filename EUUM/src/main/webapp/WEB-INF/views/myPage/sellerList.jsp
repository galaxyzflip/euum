<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.br-crop {
	position: relative;
	width: 100px;
	height: 50px;
	overflow: hidden;
}

.bg-crop:hover {
	transform: scale(1.1);
}

.fav-img {
	position: absolute;
	width: 120px;
}

.boardimg ul {
	list-style: none;
	padding: 0;
}

.boardimg li {
	display: inline-block;
}



.hrline {
	width: 80%;
	height: 1px;
	background: #D5D5D5;
	margin: 0 auto;
	margin-bottom: 20px;
}

.category_mp li {
	margin-bottom: 30px;
	font-size: 17px;
}

.category_mp a {
	color: #333;
}

.category_mp a {
	color: #333;
}

.boardimg a {
	color: #333;
}

.stars {
	color: #fb8500;
}
</style>

<div class="mpmain">

	<!-- 메인 내용 -->

	<section id="book-a-table" class="book-a-table" style="    padding: 10px 0;">
		<div class="container" data-aos="fade-up">
			<c:choose>
				<c:when test="${fn:length(myCartList) > 0}">
					<c:forEach items="${myCartList}" var="row">
						<div class="row g-0" style="margin-bottom: 20px;">

							<div class="col-lg-4 reservation-img"
								style="background-image: url(${row.sellerImage}); width: 250px; height: 250px;min-height: 250px;"
								data-aos="zoom-out" data-aos-delay="500"></div>

							<div
								class="col-lg-8 d-flex align-items-center reservation-form-bg"
								style="flex-grow: 1;">

								<div class="php-email-form" data-aos="fade-up"
									data-aos-delay="100" style="padding: 22px;">
									<div class="row gy-4" style="height: 230px;">
										<div class="col-lg-6" style="width: 38%">
											<div class="testimonial-content">
												<p>
													<i class="bi bi-quote quote-icon-left"></i>${row.sellerDescription}<i
														class="bi bi-quote quote-icon-right"></i>
												</p>
												<h3>${row.sellerNickName}</h3>
												<h4>${row.goodsCategory}</h4>
												<div class="stars">
													<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
														class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
														class="bi bi-star-fill"></i>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="testimonial-content">
												<div style="width: 100%; height: 210px; padding: 20px;">
													<table border="0" cellpadding="10px" class="boardimg"
														align="center">
														<tr height="80%">
															<td>

																<div class="bg-crop"
																	style="position: relative; width: 120px; height: 100px; overflow: hidden;">
																	<a href=""><img class="fav-img"
																		src="${row.goodsImage1}" /></a>
																</div>
															</td>
															<td>
																<div class="bg-crop"
																	style="position: relative; width: 120px; height: 100px; overflow: hidden;">
																	<a href=""><img class="fav-img"
																		src="${row.goodsImage2}" /></a>
																</div>
															</td>
															<td>
																<div class="bg-crop"
																	style="position: relative; width: 120px; height: 100px; overflow: hidden;">
																	<a href=""><img class="fav-img"
																		src="${row.goodsImage3}" /></a>
																</div>
															</td>
														</tr>
														<tr height="20%">
															<td colspan="2"><h4 style="font-size: 16px;">
																	<!-- 게시글 링크 -->
																	<a href="#"><strong>${row.goodsName}</strong></a>
																</h4></td>
															<td align="right"><h4 style="font-size: 18px;">
																	<a href="#"><strong style="color: #red;"><fmt:formatNumber
																				value="${row.goodsPrice}" pattern="#,###,###" />￦</strong></a>
																</h4></td>
														</tr>
													</table>
												</div>
											</div>
										</div>
										<div class="xicon"
											style="position: absolute; top: -5; right: -760;"
											data-aos="zoom-out" data-aos-delay="200">
											<!-- 찜삭제 -->
											<a data-toggle="modal" data-target="#sellerListModal" data-goodsnum="${row.goodsNum}" class="deleteicon"><i
												class="icon bi bi-x-lg"> </i></a>
										</div>
									</div>
								</div>
								<!-- End Reservation Form -->

							</div>
						</div>
						<!-- modal -->
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</section>
	<!-- End Book A Table Section -->
</div>
<!-- ======= Book A Table Section ======= -->

<div class="modal fade" id="sellerListModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">관심작가 삭제확인</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">리스트에서 삭제하시겠습니까?</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>

				<a class="btn btn-primary" onclick="deleteCarton();">삭제하기</a>
			</div>
		</div>
	</div>
</div>





<script>
var goodsNum = "";
$(document).ready(function() {     
    $('#sellerListModal').on('show.bs.modal', function(event) {          
        goodsNum = $(event.relatedTarget).data('goodsnum');
        console.log(goodsNum);
    });
});

function deleteCarton()
{
    location.href='/myPage/delSellerList?goodsNum='+goodsNum;
}


</script>