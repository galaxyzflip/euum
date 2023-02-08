<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<header id="header" class="header fixed-top d-flex align-items-center">
	<div
		class="container d-flex align-items-center justify-content-between">

		<a href="../" class="logo d-flex align-items-center me-auto me-lg-0">
			<!-- Uncomment the line below if you also wish to use an image logo -->
			<!-- <img src="assets/img/logo.png" alt=""> -->
			<h1>
				EUUM<span>.</span>
			</h1>
		</a>

		<nav id="navbar" class="navbar">
			<ul>
				<li><a href="#about">이용안내</a></li>
				<li><a href="#menu">의뢰게시판</a></li>
				<li><a href="#events">공지사항</a></li>
				<li class="dropdown"><a href="#"><span>카테고리</span> <i
						class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="/goods/goodsList">캐릭터 / 일러스트</a></li>
						<li><a href="#">일러스트</a></li>
						<li><a href="#">디자인</a></li>
						<li><a href="#">3D 모델링</a></li>
						<li><a href="#">웹툰 / 만화</a></li>
					</ul></li>
				<li><a href="/#contact">오시는길</a></li>
			</ul>
		</nav>
		<!-- .navbar -->
		<div>

			<c:choose>
				<c:when test="${loginUser == null}">
					<!-- 로그인하지 않았을 때 -->
					<a href="/member/loginForm">로그인</a>
					<a class="btn-book-a-table" href="/member/joinForm1">회원가입</a>
					<i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
					<i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
				</c:when>
				<c:otherwise>
					<c:if test="${loginUser.memberClass == 'A'}">
						<a href="/admin" style="margin-right: 10px;">관리자</a>
						<a href="/member/logout">로그아웃</a>
						<a class="btn-book-a-table" href="/myPage/modifyForm">마이페이지</a>
						<i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
						<i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

					</c:if>
					<c:if test="${loginUser.memberClass == 'M' || loginUser.memberClass == 'S' }">
						<!-- 로그인한 사람이 관리자가 아닐 때 --> 
						<a href="/member/logout">로그아웃</a>
						<a class="btn-book-a-table" href="/myPage/modifyForm">마이페이지</a>
						<i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
						<i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
					</c:if>
				</c:otherwise>
			</c:choose>


		</div>
	</div>
</header>
<!-- End Header -->
