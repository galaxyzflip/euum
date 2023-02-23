<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/includes/include-header.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
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
	margin-bottom: 20px;
}

.profile_mp {
	width: 50px;
	height: 50px;
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
	margin-bottom: 18px;
	font-size: 17px;
	padding-left: 10px;
}

.category_mp a {
	color: #333;
}

.category_mp a {
	color: #333;
}

.category_mp a:hover{
	color: #fb8500;
	font-weight: 900;
}

.boardimg a {
	color: #333;
}
</style>
<title>이음</title>

<meta content="" name="description">
<meta content="" name="keywords">


</head>
<body style="background:#eee;">
<!-- header -->
<div id="header">
	<tiles:insertAttribute name="header" />
</div>

<!-- body -->
<div id="container">
	<div class="mypagecon" style="margin-top: 160px;" >
		<div class="backgroundimg"
			style="flex-direction: row; flex-wrap: wrap; z-index: -1; position: absolute; top: 90; right: 0; width: 100%; height: 150px; background: url('https://cdna.artstation.com/p/assets/images/images/028/597/404/large/quan-yi-1.jpg?1594921438');"
			data-aos="fade-down" data-aos-delay="100"></div>
		<div class="backgroundwhitebox" data-aos="fade-up" data-aos-delay="100" 
			style="background: #fff; z-index: 1; max-width: 1620px; min-height: 900px; margin: 0 auto; display: flex; flex-direction: row; flex-wrap: wrap; width: 90%;">

			<div class="topMenuBar" style="display:block; border-bottom:#C7C7C5 solid 1px; background:#e8e8e8; width:100%; height:60px; ">
			<div style="border-right:#C7C7C5 solid 1px; width:270px; height:78px; display:inline-block;">
			<p style="margin-left:15px; padding:7px; font-size:26px; font-weight:700; vertical-align: middle;">MyPage</p>
			</div>
			<div  style="display:inline-block;"> <img src="/resources/img/icon/CategoryUnder.png" width="30px" style="margin-left:10px; vertical-align: middle;">
				<c:choose>
					<c:when test="${path == '/myPage/modifyForm'}">
						<span style="font-size:18px; font-weight:900; vertical-align: middle;">
						나의 개인정보 수정
						</span>
						<span style="font-size: 14px;vertical-align: middle;margin-left: 5px;color: #888;">일반회원 정보수정 폼입니다.</span>
					</c:when>
					<c:when test="${path == '/myPage/sellerList'}">
						<span style="font-size:18px; font-weight:900; vertical-align: middle;">
						나의 관심작가 목록
						</span>
						<span style="font-size: 14px;vertical-align: middle;margin-left: 5px;color: #888;">관심작가를 확인 할 수 있는 폼입니다.</span>
					</c:when>
					<c:when test="${path == '/myPage/myGoods'}">
						<span style="font-size:18px; font-weight:900; vertical-align: middle;">
						내 상품 관리
						</span>
						<span style="font-size: 14px;vertical-align: middle;margin-left: 5px;color: #888;">내가 올린 게시글을 관리할 수 있는 폼입니다.</span>
					</c:when>
					<c:otherwise>
				<span style="font-size:18px; font-weight:900; vertical-align: middle;">
				하위 카테고리
				</span>
				<span style="font-size: 14px;vertical-align: middle;margin-left: 5px;color: #888;">설명</span>
					</c:otherwise>
				</c:choose>
			</div> 
			</div>
			<c:choose>
				<c:when test="${loginUser.memberClass == 'S' || loginUser.memberClass == 'A' }">

					<div class="mpsidebar" style="width: 270px; min-height: 900px; text-align: center; border-right:#C7C7C5 solid 1px; background:#e5e5e5;"> 
						<div class="category_mp" style="text-align:left; margin:15px; background:#CDCDCD; border:0px; padding: 20px;     border-radius: 5px;">
							<ul style="list-style: none; padding: 0;">
								<li style="font-size:18px; font-weight:900; padding-left:0;"><img src="/resources/img/icon/Category.png" width="20px">Category</li>
								<li><a href="/member/sellerDetail">내 프로필</a></li>
								<li><a href="/myPage/orderList">내 주문 관리</a></li>
								<li><a href="/myPage/myGoods">내 작품 관리</a></li>
								<li><a href="/myPage/goodsQna">상품 문의 내역</a></li>
								<li><a href="/myPage/goodsReview">나의 상품 후기</a></li>
								<li><a href="/myPage/sellerList">관심 작가</a></li>
								<li><a href="/myPage/modifyForm">내 정보 수정</a></li>
							</ul>
						</div>
						<div>
							<div class="profile_con">
								
								<!-- 프로필이미지 url 변경필요 -->
								<div style="display:inline-block;">
								<button class="profile_mp" title="프로필 상세 보기" style="background-image: url('https://cdna.artstation.com/p/assets/images/images/059/006/526/20230203043155/smaller_square/german-reina-carmona-p6-zaltornpc-turnaround-13oct2020.jpg?1675420316');"></button>
								</div>
								<div style="margin-top: 10px; font-size: 20px; display:inline-block;     text-align: left;">


									<div>
										<strong>${loginSeller.sellerNickName}
										<c:if test="${loginUser.memberClass == 'A'}">
										ADMIN
										</c:if>
										</strong>
										<span style="font-size: 20px; color: #777"><strong>님</strong></span>
									</div>
									<span style="font-size: 14px; color: #999; text-align:left;">전문가회원</span>

								</div>
							</div>

						</div>
					</div>

				</c:when>
				<c:otherwise>
					
					<div class="mpsidebar" style="width: 300px; height: 900px; text-align: center; border-right:#C7C7C5 solid 2px; background:#e5e5e5;"> 
						<div>
							<div class="profile_con">
								<div style="display:inline-block;">
								<button class="profile_mp" title="프로필 상세 보기"
									data-event="profile"
									style="background-image: url('https://cdna.artstation.com/p/assets/images/images/059/006/526/20230203043155/smaller_square/german-reina-carmona-p6-zaltornpc-turnaround-13oct2020.jpg?1675420316');"></button>
								</div>
								<div style="margin-top: 10px; font-size: 23px; display:inline-block;">


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
								<li><a href="/myPage/orderList">주문 관리</a></li>
								<li><a href="/myPage/goodsQna">문의 내역</a></li>
								<li><a href="/myPage/sellerList">관심 작가</a></li>
								<li><a href="/myPage/modifyForm">정보 수정</a></li>
							</ul>
						</div>
					</div>

				</c:otherwise>
			</c:choose>



			<div class="mpmain" style="width: 1; background: #dddddd; flex-grow: 1; padding: 15px 30px 20px 20px;">

				<tiles:insertAttribute name="body" />

			</div>

		</div>
	</div>
</div>

<!-- footer -->
<tiles:insertAttribute name="footer" />

</body>
</html>


