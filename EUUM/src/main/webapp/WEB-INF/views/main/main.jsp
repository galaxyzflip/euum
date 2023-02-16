<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
@media ( min-width : 1200px) .col-xl-4 {
	flex:0 0 auto;
	width:20%;
}

@media ( min-width : 992px) .col-lg-8 {
	flex:0 0 auto;
	width:100%;
}

.add {
	width: 20%;
}

.catsub {
	font-size: 16px;
}


.stats-counter {
    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://cdnb.artstation.com/p/assets/images/images/058/265/325/large/quanyi-jianzhux.jpg?1673780860) center center;
    background-size: cover;
    padding: 100px 0;
}

.iconimg{
	margin-bottom:25px;
}
.loginBtn{
	font-size: 16px;
	transition: 0.5s;
	margin-left: 25px;
	color: var(--font-secondary);
	font-weight: 600;
	align-items: center!important;
	display: flex!important;
}
</style>
	


<!-- ======= Hero Section ======= -->
<section id="hero" class="hero d-flex align-items-center section-bg">
	<div class="container">
		<div class="row justify-content-between gy-5">
			<div
				class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center align-items-center align-items-lg-start text-center text-lg-start">
				<h2 data-aos="fade-up">안전하게 전문가에게 맡기세요</h2>
				<p data-aos="fade-up" data-aos-delay="100">당신이 필요한 전문가가 당신과의 이음을
					기다리고 있습니다.</p><br>
					
				<c:choose>
				<c:when test="${loginUser == null}">
					<!-- 로그인하지 않았을 때 -->
					<div class="d-flex" data-aos="fade-up" data-aos-delay="200">
						<a href="member/joinForm1" class="btn-book-a-table">회원가입</a> 
						<a href="member/loginForm" class="loginBtn">
						<span>로그인</span></a>
					</div>
				</c:when>
				<c:otherwise>

					
					&nbsp;
				</c:otherwise>
			</c:choose>
				
			</div>
			<div class="col-lg-5 order-1 order-lg-2 text-center text-lg-start">
				<img
					src="https://genshin.honeyhunterworld.com/img/zhongli_030_gacha_splash.webp"
					class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="300">
			</div>
		</div>
	</div>
</section>
<!-- End Hero Section -->

<main id="main">

	<!-- ======= Why Us Section ======= -->
	<section id="why-us" class="why-us section-bg" style="padding-top: 0px;">
		<div class="container" data-aos="fade-up">

			<div class="row gy-4">


				<div class="col-lg-8 d-flex align-items-center" style="width: 100%;">
					<div class="row gy-4" style="width: 100%; margin: 0 auto;">

						<div class="col-xl-4 add" data-aos="fade-up" data-aos-delay="100">
							<a href="">
								<div
									class="icon-box d-flex flex-column justify-content-center align-items-center">
									<img src="../resources/img/icon/01.png" class="iconimg">
									<h5 class="catsub">캐릭터 / 일러스트</h5>
								</div>
							</a>
						</div>
						<!-- End Icon Box -->

						<div class="col-xl-4 add" data-aos="fade-up" data-aos-delay="200">
							<a href="">
								<div
									class="icon-box d-flex flex-column justify-content-center align-items-center">
									<img src="../resources/img/icon/03.png" class="iconimg">
									<h5 class="catsub">일러스트</h5>
								</div>
							</a>
						</div>
						<!-- End Icon Box -->

						<div class="col-xl-4 add" data-aos="fade-up" data-aos-delay="300">
							<a href="">
								<div
									class="icon-box d-flex flex-column justify-content-center align-items-center">
									<img src="../resources/img/icon/04.png" class="iconimg">
									<h5 class="catsub">디자인</h5>
								</div>
							</a>
						</div>
						<!-- End Icon Box -->

						<div class="col-xl-4 add" data-aos="fade-up" data-aos-delay="400">
							<a href="">
								<div
									class="icon-box d-flex flex-column justify-content-center align-items-center">
									<img src="../resources/img/icon/02.png" class="iconimg">
									<h5 class="catsub">3D 모델링</h5>
								</div>
							</a>
						</div>
						<!-- End Icon Box -->

						<div class="col-xl-4 add" data-aos="fade-up" data-aos-delay="500">
							<a href="">
								<div
									class="icon-box d-flex flex-column justify-content-center align-items-center">
									<img src="../resources/img/icon/05.png" class="iconimg">
									<h5 class="catsub">웹툰 / 만화</h5>
								</div>
							</a>
						</div>
						<!-- End Icon Box -->

					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- End Why Us Section -->

	<!-- ======= Stats Counter Section ======= -->
	<section id="stats-counter" class="stats-counter">
		<div class="container" data-aos="zoom-out">

			<div class="row gy-4">

				<div class="col-lg-3 col-md-6">
					<div class="stats-item text-center w-100 h-100">
						<span data-purecounter-start="0" data-purecounter-end="232"
							data-purecounter-duration="1" class="purecounter"></span>
						<p>의뢰자</p>
					</div>
				</div>
				<!-- End Stats Item -->

				<div class="col-lg-3 col-md-6">
					<div class="stats-item text-center w-100 h-100">
						<span data-purecounter-start="0" data-purecounter-end="521"
							data-purecounter-duration="1" class="purecounter"></span>
						<p>등록된 게시물</p>
					</div>
				</div>
				<!-- End Stats Item -->

				<div class="col-lg-3 col-md-6">
					<div class="stats-item text-center w-100 h-100">
						<span data-purecounter-start="0" data-purecounter-end="1453"
							data-purecounter-duration="1" class="purecounter"></span>
						<p>진행된 의뢰</p>
					</div>
				</div>
				<!-- End Stats Item -->

				<div class="col-lg-3 col-md-6">
					<div class="stats-item text-center w-100 h-100">
						<span data-purecounter-start="0" data-purecounter-end="32"
							data-purecounter-duration="1" class="purecounter"></span>
						<p>전문가</p>
					</div>
				</div>
				<!-- End Stats Item -->

			</div>

		</div>
	</section>
	<!-- End Stats Counter Section -->

	


	

	<!-- ======= Chefs Section ======= -->
	<section id="chefs" class="chefs section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-header">
				<p style="font-size:30px;">
					우리의 <span>문제를 해결해줄</span> 전문가
				</p>
			</div>

			<div class="row gy-4">

				<div class="col-lg-4 col-md-6 d-flex align-items-stretch"
					data-aos="fade-up" data-aos-delay="100">
					<div class="chef-member">
						<div class="member-img">
							<img src="https://cdnweb01.wikitree.co.kr/webdata/editor/202205/13/img_20220513145322_7474becc.webp"
								class="img-fluid" alt="">
							<div class="social">
								<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
									class="bi bi-facebook"></i></a> <a href=""><i
									class="bi bi-instagram"></i></a> <a href=""><i
									class="bi bi-linkedin"></i></a>
							</div>
						</div>
						<div class="member-info">
							<h4>침착맨</h4>
							<span>만화가</span>
							<p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트.</p>
						</div>
					</div>
				</div>
				<!-- End Chefs Member -->

				<div class="col-lg-4 col-md-6 d-flex align-items-stretch"
					data-aos="fade-up" data-aos-delay="200">
					<div class="chef-member">
						<div class="member-img">
							<img src="https://upload.wikimedia.org/wikipedia/commons/8/81/Joo_Ho-min_%EC%A3%BC%ED%98%B8%EB%AF%BC_161207.png"
								class="img-fluid" alt="">
							<div class="social">
								<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
									class="bi bi-facebook"></i></a> <a href=""><i
									class="bi bi-instagram"></i></a> <a href=""><i
									class="bi bi-linkedin"></i></a>
							</div>
						</div>
						<div class="member-info">
							<h4>주호민</h4>
							<span>일러스트</span>
							<p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스.</p>
						</div>
					</div>
				</div>
				<!-- End Chefs Member -->

				<div class="col-lg-4 col-md-6 d-flex align-items-stretch"
					data-aos="fade-up" data-aos-delay="300">
					<div class="chef-member">
						<div class="member-img">
							<img src="https://file.mk.co.kr/meet/neds/2021/06/image_readtop_2021_542687_16228104364670690.jpg"
								class="img-fluid" alt="">
							<div class="social">
								<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
									class="bi bi-facebook"></i></a> <a href=""><i
									class="bi bi-instagram"></i></a> <a href=""><i
									class="bi bi-linkedin"></i></a>
							</div>
						</div>
						<div class="member-info">
							<h4>기안</h4>
							<span>만화가</span>
							<p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트.</p>
						</div>
					</div>
				</div>
				<!-- End Chefs Member -->

			</div>

		</div>
	</section>
	<!-- End Chefs Section -->
	
	
	<!-- ======= Events Section ======= -->
	<section id="events" class="events">
		<div class="container-fluid" data-aos="fade-up">

			<div class="section-header">
				<p style="font-size:30px;">
					<span>인기있는</span> 게시물
				</p>
			</div>

			<div class="slides-3 swiper" data-aos="fade-up" data-aos-delay="100">
				<div class="swiper-wrapper">

					<div
						class="swiper-slide event-item d-flex flex-column justify-content-end"
						style="background-image: url(https://i.pinimg.com/564x/0d/be/89/0dbe89275cc20f915bcafa722f302dea.jpg)">
						<h3>게시물이름1</h3>
						<div class="price align-self-start">9,900￦</div>
						<p class="description">테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트</p>
					</div>
					<!-- End Event item -->

					<div
						class="swiper-slide event-item d-flex flex-column justify-content-end"
						style="background-image: url(https://cdnb.artstation.com/p/assets/images/images/058/882/015/large/jjjjjam-kiwi1.jpg?1675175358)">
						<h3>게시물이름2</h3>
						<div class="price align-self-start">80,000￦</div>
						<p class="description">테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트</p>
					</div>
					<!-- End Event item -->

					<div
						class="swiper-slide event-item d-flex flex-column justify-content-end"
						style="background-image: url(https://i.pinimg.com/564x/3a/4c/c6/3a4cc6f6c8e3cacca7a870f9b0791997.jpg)">
						<h3>게시물이름3</h3>
						<div class="price align-self-start">980,000￦</div>
						<p class="description">테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트	
						</p>
					</div>
					<!-- End Event item -->

				</div>
				<div class="swiper-pagination"></div>
			</div>

		</div>
	</section>
	<!-- End Events Section -->
	
	



	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div style="margin-top:10px;">&nbsp</div>
		<div class="container" data-aos="fade-up">

			<div class="section-header">
				<p style="font-size:25px;">
					도움이 필요하시다면 <span>회사로 방문해주세요</span>
				</p>
			</div>

			<div class="mb-3">
				<iframe style="border: 0; width: 100%; height: 350px;"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.370646780154!2d126.98379995126514!3d37.56988897969819!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e884abcbd9%3A0x153663d78acba97f!2z7J207KCg7JWE7Lm0642w66-47Lu07ZOo7YSw7ZWZ7JuQIOyiheuhnOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1675238992736!5m2!1sko!2skr"
					frameborder="0" allowfullscreen></iframe>
			</div>
			<!-- End Google Maps -->

			<div class="row gy-4">

				<div class="col-md-6">
					<div class="info-item  d-flex align-items-center">
						<i class="icon bi bi-map flex-shrink-0"></i>
						<div>
							<h3>주소</h3>
							<p>서울특별시 종로구 미려빌딩6층</p>
						</div>
					</div>
				</div>
				<!-- End Info Item -->

				<div class="col-md-6">
					<div class="info-item d-flex align-items-center">
						<i class="icon bi bi-envelope flex-shrink-0"></i>
						<div>
							<h3>이메일</h3>
							<p>m2dic@naver.com</p>
						</div>
					</div>
				</div>
				<!-- End Info Item -->

				<div class="col-md-6">
					<div class="info-item  d-flex align-items-center">
						<i class="icon bi bi-telephone flex-shrink-0"></i>
						<div>
							<h3>전화번호</h3>
							<p>010-xxxx-xxxx</p>
						</div>
					</div>
				</div>
				<!-- End Info Item -->

				<div class="col-md-6">
					<div class="info-item  d-flex align-items-center">
						<i class="icon bi bi-share flex-shrink-0"></i>
						<div>
							<h3>영업시간</h3>
							<div>
								<strong>월-금:</strong> 10AM - 18PM  <strong>일요일:</strong>
								Closed
							</div>
						</div>
					</div>
				</div>
				<!-- End Info Item -->

			</div>
			<!--End Contact Form -->

		</div>
	</section>
	<!-- End Contact Section -->

</main>
<!-- End #main -->