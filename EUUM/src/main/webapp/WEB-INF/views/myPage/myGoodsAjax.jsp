<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="myGoods">
	<div class="myGoodsList" style="padding-bottom: 20px">
		<li>[내 상품]</li>
		<c:choose>
			<c:when test="${fn:length(myGoodsMap.myGoodsList) > 0}">
				<c:forEach items="${myGoodsMap.myGoodsList}" var="row" varStatus="status">
					<div style="padding-bottom: 15px">
						<table style="border: solid 1px">
							<tr id="tr_${row.goodsNum}">
								<td class="myg_category">${row.goodsCategory}</td>
								<%-- <td class="myg_category">${row.goodsNum}</td> --%>
								<td>
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage1}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage2}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage3}">
								</td>
								<td class="myg_info">
									<li>${row.goodsName}/ ${row.goodsUse}</li>
									<li>${row.goodsSellerNickname}/ ${row.goodsPrice}</li>
								</td>
								<td class="myg_button">
									<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}" />
									<button type="button" onclick="">수정</button>
									<button type="button" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<span>판매중인 내 상품이 없습니다.</span>
				</c:otherwise>
		</c:choose>
	</div>

	<div class="myUnapprovedGoodsList" style="padding-bottom: 20px">
		<li>[승인대기 중인 상품]</li>
		<c:choose>
			<c:when test="${fn:length(myGoodsMap.myUnapprovedGoodsList) > 0}">
				<c:forEach items="${myGoodsMap.myUnapprovedGoodsList}" var="row" varStatus="status">
					<div style="padding-bottom: 15px">
						<table style="border: solid 1px">
							<tr id="tr_unapproved_${row.goodsNum}">
								<td class="myg_category">${row.goodsCategory}</td>
								<%-- <td class="myg_category">${row.goodsNum}</td> --%>
								<td>
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage1}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage2}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage3}">
								</td>
								<td class="myg_info">
									<li>${row.goodsName}/ ${row.goodsUse}</li>
									<li>${row.goodsSellerNickname}/ ${row.goodsPrice}</li>
								</td>
								<td class="myg_button">
									<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}" />
									<button type="button" onclick="">수정</button>
									<button type="button" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<span>승인 대기중인 상품이 없습니다.</span>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="myTempGoodsList" style="padding-bottom: 20px">
		<li>[임시 저장된 상품]</li>
		<c:choose>
			<c:when test="${fn:length(myGoodsMap.myTempGoodsList) > 0}">
				<c:forEach items="${myGoodsMap.myTempGoodsList}" var="row" varStatus="status">
					<div style="padding-bottom: 15px">
						<table style="border: solid 1px">
							<tr id="tr_temp_${row.goodsNum}">
								<td class="myg_category">${row.goodsCategory}</td>
								<%-- <td class="myg_category">${row.goodsNum}</td> --%>
								<td>
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage1}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage2}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage3}">
								</td>
								<td class="myg_info">
									<li>${row.goodsName}/ ${row.goodsUse}</li>
									<li>${row.goodsSellerNickname}/ ${row.goodsPrice}</li>
								</td>
								<td class="myg_button">
									<input type="hidden" id="goodsNum_${status.index}" name="goodsNum" value="${row.goodsNum}" />
									<button type="button" id="modifyMyGoodsBtn" onclick="">수정</button>
									<button type="button" id="deleteMyGoodsBtn" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
								</td>
							</tr> 
						</table>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<span>임시 저장된 상품이 없습니다.</span>
			</c:otherwise>
		</c:choose>
	</div>
</div>