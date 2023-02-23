<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin">
		<!-- <div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div> -->
		<div class="sidebar-brand-text mx-3">EUUM</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="../admin">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>대시보드</span>
		</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">admin interface</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
	<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			<i class="fas fa-fw fa-cog"></i> <span>회원</span>
		</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">회원 관리:</h6>
				<a class="collapse-item" href="/admin/memberList">회원 목록</a>
				<a class="collapse-item" href="#">회원 머시깽이</a>
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-wrench"></i> <span>알림사항</span>
		</a>
		<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">관리 정보:</h6>
				<a class="collapse-item" href="utilities-color.html">알림</a>
				<a class="collapse-item" href="utilities-border.html">문의사항</a>
				<a class="collapse-item" href="utilities-border.html">신고</a>
			</div>
		</div></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBoard" aria-expanded="true" aria-controls="collapseBoard">
			<i class="fas fa-fw fa-table"></i> <span>관리자 게시판</span>
		</a>
		<div id="collapseBoard" class="collapse" aria-labelledby="headingBoard" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">게시판 목록:</h6>

				<a class="collapse-item" href="/admin/requestList">의뢰게시판</a> 
				<a class="collapse-item" href="/admin/goodsQNAList">상품문의</a> 
				<a class="collapse-item" href="/admin/reviewList">상품리뷰</a>

				<a class="collapse-item" href="#"></a>
			</div>
		</div></li>



	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">goods</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseGoods" aria-expanded="true" aria-controls="collapsePages">
			<i class="fas fa-fw fa-folder"></i> <span>상품</span>
		</a>
		<div id="collapseGoods" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">상품 관리사항:</h6>
				<a class="collapse-item" href="/admin/adminGoodsList">상품 조회</a>
				<div class="collapse-divider"></div>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">order</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
	<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
			<i class="fas fa-fw fa-folder"></i> <span>주문 관리</span>
		</a> <!-- 2023/02/03 최창선 관리자 주문 목록 링크 수정 -->
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">의뢰물 관리사항:</h6>
				<a class="collapse-item" href="login.html">전문가 목록</a>
				<a class="collapse-item" href="register.html">의뢰 게시물 목록</a>
				<a class="collapse-item" href="/admin/orderList">주문 목록</a>
				<div class="collapse-divider"></div>
			</div>
		</div></li>

	<!-- Nav Item - Charts -->

	<li class="nav-item"><a class="nav-link" href="charts.html">
			<i class="fas fa-fw fa-chart-area"></i> <span>주문 차트</span>
		</a></li>



	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->