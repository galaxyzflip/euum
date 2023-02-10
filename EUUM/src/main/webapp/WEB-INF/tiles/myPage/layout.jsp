<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="/WEB-INF/includes/include-header.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

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

.profile_con {
	margin-top: 40px;
	margin-bottom: 20px;
}

.profile_mp {
	width: 130px;
	height: 130px;
	display: inline-block;
	border-radius: 50%;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
	border: 0;
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
</style>
<title>이음</title>

<meta content="" name="description">
<meta content="" name="keywords">


</head>

<!-- header -->
<div id="header">
	<tiles:insertAttribute name="header" />
</div>

<!-- body -->
<div id="container">
	<div class="mypagecon" style="margin-top: 160px;">
		<div class="backgroundimg"
			style="flex-direction: row; flex-wrap: wrap; z-index: -1; position: absolute; top: 90; right: 0; width: 100%; height: 150px; background: url('https://cdna.artstation.com/p/assets/images/images/028/597/404/large/quan-yi-1.jpg?1594921438');"
			data-aos="fade-up" data-aos-delay="100"></div>
		<div class="backgroundwhitebox"
			style="background: #fff; z-index: 1; max-width: 1320px; min-height: 900px; margin: 0 auto; display: flex; flex-direction: row; flex-wrap: wrap; width: 90%;">

			<div class="mpsidebar" style="width: 18%; text-align: center;">
				<div>
					<div class="profile_con" data-aos="fade-up" data-aos-delay="100">
						<button class="profile_mp" title="프로필 상세 보기" data-event="profile"
							style="background-image: url('https://cdna.artstation.com/p/assets/images/images/059/006/526/20230203043155/smaller_square/german-reina-carmona-p6-zaltornpc-turnaround-13oct2020.jpg?1675420316');"></button>
						<div style="margin-top: 10px; font-size: 23px;">
							<div>
								<strong>${loginUser.memberName}</strong><span
									style="font-size: 21px; color: #777"><strong>님</strong></span>
							</div>
							<span style="font-size: 14px; color: #999;">일반회원</span>
						</div>
					</div>

				</div>
				<div class="hrline" data-aos="fade-up" data-aos-delay="100"></div>
				<div class="category_mp">
					<ul style="list-style: none; padding: 0;" data-aos="fade-up"
						data-aos-delay="100">
						<li><a href="/member/sellerDetail">내 프로필</a></li>
						<li><a href="/myPage/orderList">주문 관리</a></li>
						<li><a href="/myPage/myGoodsList">내 작품 관리</a></li>
						<li><a href="/myPage/sellerList">내 관심 작가</a></li>
						<li><a href="/myPage/modifyForm">회원정보 수정</a></li>
					</ul>
				</div>
			</div>
			<div class="mpmain" style="width: 82%;">

				<tiles:insertAttribute name="body" />

			</div>

		</div>
	</div>
</div>

<!-- footer -->
<tiles:insertAttribute name="footer" />

</body>
</html>