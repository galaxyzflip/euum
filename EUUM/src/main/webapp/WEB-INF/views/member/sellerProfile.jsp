<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
	.ppoimg{
		width: 100%;
		height: 100%;

	}
	.alink{
	position: relative;
	}

	.overlay{		
	width: 100%;
	height: 100%;
	background: linear-gradient(180deg,transparent,rgba(0,0,0,.8)) 0 102% no-repeat;
	background-size: 100% 62%;
	z-index: 4;
	opacity:0;
	transition: opacity .2s linear;
 	position: absolute;
    bottom: 0;
    left: 0; 
    }
    

 .alink:hover .overlay{
    opacity: 1
    }


.gallery-grid-info {
    display: flex;
    padding: 15px;
    font-size: 12px;
    line-height: 1.58;
    color: #fff;
    -webkit-font-smoothing: antialiased;
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
}

.gallery-grid-info-inner {
    padding-left: 10px;
}

.gallery-grid-title {
    font-size: 18px;
    font-weight: 300;
    line-height: 1.16;
    margin-bottom: 3px;
}



.imguri {
    overflow-clip-margin: content-box;
    overflow: clip;
        display: block!important;
}


.square {
  width: 20%;
  position: relative;
  display: inline-block;
}

.square:after {
	content: "";
  display: inline-block;
  padding-bottom: 100%;
}

.inner {
  position: absolute;
  width: 100%;
  height: 100%;
}

.profile_mp {
	width: 120px;
	height: 120px;
	display: inline-block;
	border-radius: 50%;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
	border: 0;
}
.profile_m span{
	display:block;
}

</style> 

<div style="margin-top: 90px; "></div>
<div>
	<div class="all" style="background:#eee;">
		<div style="position: relative; background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${goodsList[0].goodsImage1}') center center;  width:100%; height:500px; ">
			<div class="profile_m"style="color:#fff;   margin:0 auto; padding-top: 250px;   width:160px; text-align:center; ">
				<button class="profile_mp" title="프로필 상세 보기"
									data-event="profile"
									style="background-image: url('${seller.sellerImage}');"></button>
				<div>
				<span style="font-size:36px; font-weight:900; ">${seller.sellerNickName}</span>
				<span style="font-size:15px ; color:#999;  font-weight:900;">${seller.sellerSpecialty}</span> 
				<span style="font-size:14px; color:#999; font-weight:900;">${seller.sellerContact2}</span>
				</div>
			</div>
		</div>
		<div class="midmenu" style="background: #e8e8e8; width:100%; height:40px; text-align:center; vertical-align:middle;">
			<p style="font-size:20px; color:#fb8500;     margin-top: 8px;"><strong>PORTFOLIO</strong></p>
		</div>
		<div class="imgcon" style="letter-spacing: -10; line-height: 0;">
			<c:choose>
				<c:when test="${fn:length(goodsList)>0}">
					<c:forEach items="${goodsList}" var="row">
						<div class="square">
							<div class="inner">
						 		<a class="alink" href="/goods/goodsDetail?goodsNum=${row.goodsNum}" style="position:relative;  letter-spacing: normal; ">
										<div class="overlay">
											<div class="gallery-grid-info">
												<div class="gallery-grid-info-inner">
													<div class="gallery-grid-title">
													<strong style="font-weight:900;">${row.goodsName}</strong>
													</div>
													<div class="gallery-grid-name">
														<div class="pro-badge ng-star-inserted">${seller.sellerSpecialty}</div>
													</div>
												</div>
											</div>
										</div>
										<img src="${row.goodsImage1}" class="imguri" width="100%" height="100%">
										
								
								</a>
							</div>
						</div>
						<div class="square">
							<div class="inner">
						 		<a class="alink" href="/goods/goodsDetail?goodsNum=${row.goodsNum}"  style="position:relative;  letter-spacing: normal;">
						 			<div class="overlay">
											<div class="gallery-grid-info">
												<div class="gallery-grid-info-inner">
													<div class="gallery-grid-title">
													<strong style="font-weight:900;">${row.goodsName}</strong>
													</div>
													<div class="gallery-grid-name">
														<div class="pro-badge ng-star-inserted">${seller.sellerSpecialty}</div>
													</div>
												</div>
											</div>
										</div>
									<img class="imguri" width="100%" height="100%" src="${row.goodsImage2}"/>
								</a>
							</div>
						</div>
						<div class="square">
							<div class="inner">
						 		<a class="alink" href="/goods/goodsDetail?goodsNum=${row.goodsNum}"  style="position:relative;  letter-spacing: normal;">
						 			<div class="overlay">
											<div class="gallery-grid-info">
												<div class="gallery-grid-info-inner">
													<div class="gallery-grid-title">
													<strong style="font-weight:900;">${row.goodsName}</strong>
													</div>
													<div class="gallery-grid-name">
														<div class="pro-badge ng-star-inserted">${seller.sellerSpecialty}</div>
													</div>
												</div>
											</div>
										</div>
									<img class="imguri" width="100%" height="100%" src="${row.goodsImage3}"/>
								</a>
							</div>
						</div>
						<%-- <div class="square">
							<div class="inner">
						 		<a href="/goods/goodsDetail?goodsNum=${row.goodsNum}">
									<img class="ppoimg" src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate1}${row.goodsImage1}"/>
								</a>
							</div>
						</div>
						<div class="square">
							<div class="inner">
						 		<a href="/goods/goodsDetail?goodsNum=${row.goodsNum}">
									<img class="ppoimg" src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate2}${row.goodsImage2}"/>
								</a>
							</div>
						</div>
						<div class="square">
							<div class="inner">
						 		<a href="/goods/goodsDetail?goodsNum=${row.goodsNum}">
									<img class="ppoimg" src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate3}${row.goodsImage3}"/>
								</a>
							</div>
						</div> --%>
					</c:forEach>
				</c:when>
				<c:otherwise>
					올린 상품이 없습니다.
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
