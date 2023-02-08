<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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

.profile_con{
	margin-top: 40px;
	margin-bottom: 20px;

}


.profile_mp{
    width: 130px;
    height: 130px;
    display: inline-block;
    border-radius: 50%;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-size: cover;
    border:0;
}

.hrline{
	width:80%;
	height: 1px;
	background: #D5D5D5;
	margin: 0 auto;	
	margin-bottom: 20px;
}

.category_mp li{
margin-bottom:30px;
font-size:17px;
}

.category_mp a{
color: #333;
}
.category_mp a{
color: #333;
}


.boardimg a{
	color: #333;
}

.stars{
	color: #fb8500;
}


</style>
<!-- 


<div class="mypagecon" style="margin-top: 160px;">
			<div class="backgroundimg"
			style="flex-direction: row; flex-wrap: wrap; z-index:-1; position: absolute; top: 90; right: 0; width: 100%; height: 150px; background: url('https://cdna.artstation.com/p/assets/images/images/028/597/404/large/quan-yi-1.jpg?1594921438');"
			data-aos="fade-up" data-aos-delay="100"></div>
	<div class="backgroundwhitebox" style="background: #fff; z-index:1;	max-width:1320px; min-height:900px; margin:0 auto; display:flex; flex-direction: row;
    flex-wrap: wrap;
    width: 90%;">

		<div class="mpsidebar" style="width: 18%; text-align:center;" >
			<div>
				<div class="profile_con" data-aos="fade-up" data-aos-delay="100">
					<button class="profile_mp" title="프로필 상세 보기" data-event="profile" style="background-image: url('https://cdna.artstation.com/p/assets/images/images/059/006/526/20230203043155/smaller_square/german-reina-carmona-p6-zaltornpc-turnaround-13oct2020.jpg?1675420316');"></button>				
					<div style="margin-top:10px; font-size:23px;">
					<div><strong>김명식</strong><span style="font-size:21px;color:#777"><strong>님</strong></span></div>
					<span style="font-size:14px; color:#999;">일반회원</span>
					</div>
				</div>
				
			</div>
			<div class="hrline" data-aos="fade-up" data-aos-delay="100"></div>
			<div class="category_mp">
				<ul style="list-style: none; padding: 0;" data-aos="fade-up" data-aos-delay="100">
					<li><a href="/member/sellerDetail">내 프로필</a></li>
					<li><a href="/myPage/orderList">주문 관리</a></li>
					<li><a href="/myPage/myGoodsList">내 작품 관리</a></li>
					<li><a href="/myPage/sellerList">내 관심 작가</a></li>
					<li><a href="/myPage/modifyForm">회원정보 수정</a></li>
				</ul>
			</div>
		</div> -->
		<div class="mpmain"  >
		
		<!-- 메인 내용 -->
		
		<section id="book-a-table" class="book-a-table">
			<div class="container" data-aos="fade-up">

				<div class="section-header">
					<p style="text-align:left;">
						나의 <span>관심 작가</span>
					</p>
				</div>

				<div class="row g-0" style="margin-bottom:20px;">

					<div class="col-lg-4 reservation-img"
						style="background-image: url(../resources/assets/img/reservation.jpg); width: 250px; height: 250px;min-height: 250px;"
						data-aos="zoom-out" data-aos-delay="500"></div>

					<div class="col-lg-8 d-flex align-items-center reservation-form-bg"
						style="flex-grow: 1;">

						<div class="php-email-form" data-aos="fade-up"
							data-aos-delay="100" style="padding:22px;">
							<div class="row gy-4" style="height: 230px;">
								<div class="col-lg-6" style="width:38%">
									<div class="testimonial-content">
										<p>
											<i class="bi bi-quote quote-icon-left"></i> Export tempor
											illum tamen malis malis eram quae irure esse labore quem
											cillum quid cillum eram <i
												class="bi bi-quote quote-icon-right"></i>
										</p>
										<h3>Sara Wilsson</h3>
										<h4>Designer</h4>
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
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
												</tr>
												<tr height="20%">
													<td colspan="2"><h4 style="font-size: 16px;">
															<!-- 게시글 링크 -->
															<a href="#"><strong>게시글 이름 1 태그 태그</strong></a>
														</h4></td>
													<td align="right"><h4 style="font-size: 18px;">
															<a href="#"><strong style="color: #red;">9,000￦</strong></a>
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
									<a href="#"><i class="icon bi bi-x-lg"> </i></a>
								</div>
							</div>
						</div>
							
						<!-- End Reservation Form -->

					</div>
				</div>
				<div class="row g-0" style="margin-bottom:20px;">

					<div class="col-lg-4 reservation-img"
						style="background-image: url(../resources/assets/img/reservation.jpg); width: 250px; height: 250px;min-height: 250px;"
						data-aos="zoom-out" data-aos-delay="500"></div>

					<div class="col-lg-8 d-flex align-items-center reservation-form-bg"
						style="flex-grow: 1;">

						<div class="php-email-form" data-aos="fade-up"
							data-aos-delay="100" style="padding:22px;">
							<div class="row gy-4" style="height: 230px;">
								<div class="col-lg-6" style="width:38%">
									<div class="testimonial-content">
										<p>
											<i class="bi bi-quote quote-icon-left"></i> Export tempor
											illum tamen malis malis eram quae irure esse labore quem
											cillum quid cillum eram <i
												class="bi bi-quote quote-icon-right"></i>
										</p>
										<h3>Sara Wilsson</h3>
										<h4>Designer</h4>
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
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
												</tr>
												<tr height="20%">
													<td colspan="2"><h4 style="font-size: 16px;">
															<!-- 게시글 링크 -->
															<a href="#"><strong>게시글 이름 1 태그 태그</strong></a>
														</h4></td>
													<td align="right"><h4 style="font-size: 18px;">
															<a href="#"><strong style="color: #red;">9,000￦</strong></a>
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
									<a href="#"><i class="icon bi bi-x-lg"> </i></a>
								</div>
							</div>
						</div>
							
						<!-- End Reservation Form -->

					</div>
				</div>
				<div class="row g-0" style="margin-bottom:20px;">

					<div class="col-lg-4 reservation-img"
						style="background-image: url(../resources/assets/img/reservation.jpg); width: 250px; height: 250px;min-height: 250px;"
						data-aos="zoom-out" data-aos-delay="500"></div>

					<div class="col-lg-8 d-flex align-items-center reservation-form-bg"
						style="flex-grow: 1;">

						<div class="php-email-form" data-aos="fade-up"
							data-aos-delay="100" style="padding:22px;">
							<div class="row gy-4" style="height: 230px;">
								<div class="col-lg-6" style="width:38%">
									<div class="testimonial-content">
										<p>
											<i class="bi bi-quote quote-icon-left"></i> Export tempor
											illum tamen malis malis eram quae irure esse labore quem
											cillum quid cillum eram <i
												class="bi bi-quote quote-icon-right"></i>
										</p>
										<h3>Sara Wilsson</h3>
										<h4>Designer</h4>
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
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
												</tr>
												<tr height="20%">
													<td colspan="2"><h4 style="font-size: 16px;">
															<!-- 게시글 링크 -->
															<a href="#"><strong>게시글 이름 1 태그 태그</strong></a>
														</h4></td>
													<td align="right"><h4 style="font-size: 18px;">
															<a href="#"><strong style="color: #red;">9,000￦</strong></a>
														</h4></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="xicon"
									style="position: absolute; top: -5; right: -760;"
									data-aos="fade-up" data-aos-delay="200">
									<!-- 찜삭제 -->
									<a href="#"><i class="icon bi bi-x-lg"> </i></a>
								</div>
							</div>
						</div>
							
						<!-- End Reservation Form -->

					</div>
				</div>
				<div class="row g-0" style="margin-bottom:20px;">

					<div class="col-lg-4 reservation-img"
						style="background-image: url(../resources/assets/img/reservation.jpg); width: 250px; height: 250px;min-height: 250px;"
						data-aos="zoom-out" data-aos-delay="500"></div>

					<div class="col-lg-8 d-flex align-items-center reservation-form-bg"
						style="flex-grow: 1;">

						<div class="php-email-form" data-aos="fade-up"
							data-aos-delay="100" style="padding:22px;">
							<div class="row gy-4" style="height: 230px;">
								<div class="col-lg-6" style="width:38%">
									<div class="testimonial-content">
										<p>
											<i class="bi bi-quote quote-icon-left"></i> Export tempor
											illum tamen malis malis eram quae irure esse labore quem
											cillum quid cillum eram <i
												class="bi bi-quote quote-icon-right"></i>
										</p>
										<h3>Sara Wilsson</h3>
										<h4>Designer</h4>
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
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
												</tr>
												<tr height="20%">
													<td colspan="2"><h4 style="font-size: 16px;">
															<!-- 게시글 링크 -->
															<a href="#"><strong>게시글 이름 1 태그 태그</strong></a>
														</h4></td>
													<td align="right"><h4 style="font-size: 18px;">
															<a href="#"><strong style="color: #red;">9,000￦</strong></a>
														</h4></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="xicon"
									style="position: absolute; top: -5; right: -760;"
									data-aos="fade-up" data-aos-delay="200">
									<!-- 찜삭제 -->
									<a href="#"><i class="icon bi bi-x-lg"> </i></a>
								</div>
							</div>
						</div>
							
						<!-- End Reservation Form -->

					</div>
				</div>
				<div class="row g-0" style="margin-bottom:20px;">

					<div class="col-lg-4 reservation-img"
						style="background-image: url(../resources/assets/img/reservation.jpg); width: 250px; height: 250px;min-height: 250px;"
						data-aos="zoom-out" data-aos-delay="500"></div>

					<div class="col-lg-8 d-flex align-items-center reservation-form-bg"
						style="flex-grow: 1;">

						<div class="php-email-form" data-aos="fade-up"
							data-aos-delay="100" style="padding:22px;">
							<div class="row gy-4" style="height: 230px;">
								<div class="col-lg-6" style="width:38%">
									<div class="testimonial-content">
										<p>
											<i class="bi bi-quote quote-icon-left"></i> Export tempor
											illum tamen malis malis eram quae irure esse labore quem
											cillum quid cillum eram <i
												class="bi bi-quote quote-icon-right"></i>
										</p>
										<h3>Sara Wilsson</h3>
										<h4>Designer</h4>
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
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
													<td>
														<div class="bg-crop"
															style="position: relative; width: 120px; height: 100px; overflow: hidden;">
															<a href=""><img class="fav-img"
																src="https://artmug.kr/image/goods_img1/1/19403.jpg?ver=1671417164" /></a>
														</div>
													</td>
												</tr>
												<tr height="20%">
													<td colspan="2"><h4 style="font-size: 16px;">
															<!-- 게시글 링크 -->
															<a href="#"><strong>게시글 이름 1 태그 태그</strong></a>
														</h4></td>
													<td align="right"><h4 style="font-size: 18px;">
															<a href="#"><strong style="color: #red;">9,000￦</strong></a>
														</h4></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="xicon"
									style="position: absolute; top: -5; right: -760;"
									data-aos="fade-up" data-aos-delay="200">
									<!-- 찜삭제 -->
									<a href="#"><i class="icon bi bi-x-lg"> </i></a>
								</div>
							</div>
						</div>
							
						<!-- End Reservation Form -->

					</div>
				</div>
			</div>
		</section>
		<!-- End Book A Table Section -->
		
		
		</div>
		<!-- ======= Book A Table Section ======= -->
<!-- 		
	</div>
</div> -->
