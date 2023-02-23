<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Custom styles for this page -->
<link href="/resources/sbadmin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script>
    // 페이징 + 정렬 																																					
    $(document).ready(function(e) {

	var actionForm = $("#actionForm");
	actionForm.find("input[name='pageNum']").val('1');

	let sortCom = '${pagaMaker.cri.sortCom}';

	$('#sortCom').on('change', function() {
	    let sortCom = $(this).find('option:selected').val();
	    console.log(sortCom);
	    $('input[name="sortCom"]').val(sortCom);
	    console.log($('input[name="sortCom"]').val());
	    $('#actionForm').submit();
	})

    })
</script>




<div class="container-fluid">


	<form id='actionForm' action="/admin/adminGoodsList" method='get'>
		<input type="hidden" name="sortCom" value="${pageMaker.cri.sortCom }">
		<input type="hidden" name="goodsCategory" value="${pageMaker.cri.goodsCategory}">
	</form>

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">전체작품 관리</h1>
	<p class="mb-4">작가가 등록한 작품을 승인하거나 거래중지 시키는 등 작품 등록 건의 상태를 변경합니다.</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<div style="padding-bottom: 20;">

					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/adminGoodsList?goodsCategory=0&pageNum=1'">전체목록보기</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/adminGoodsList?goodsCategory=1&pageNum=1'">캐릭터 일러스트</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/adminGoodsList?goodsCategory=2&pageNum=1'">일러스트</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/adminGoodsList?goodsCategory=3&pageNum=1'">3D 모델링</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/adminGoodsList?goodsCategory=4&pageNum=1'">디자인</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/adminGoodsList?goodsCategory=5&pageNum=1'">웹툰 · 만화</button>

					<br> <br>

					<div class="goodsSort">
						<select class="form-select" name="sortCom" id="sortCom" aria-label="Default select example" selected="selected" style="width:150px;">
							<option value="">선택하세요</option>
							<option value="1" ${pageMaker.cri.sortCom eq "1" ? 'selected' : ''}>승인대기</option>
							<option value="2" ${pageMaker.cri.sortCom eq "2" ? 'selected' : ''}>승인완료</option>
							<option value="3" ${pageMaker.cri.sortCom eq "3" ? 'selected' : ''}>거래중지</option>
							<option value="4" ${pageMaker.cri.sortCom eq "4" ? 'selected' : ''}>삭제완료</option>
						</select>
					</div>
				</div>
				<br>

				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr align="center">
							<th width="10%">카테고리</th>
							<th width="15%">썸네일</th>
							<th width="*">작품내용</th>
							<th width="15%">작가이름</th>
							<th width="10%">승인상태</th>
							<th width="10%">등록일</th>
						</tr>
					</thead>

					<tbody>


						<c:forEach items="${goodsList}" var="row" varStatus="status">
							<tr align="center">
								<td>${row.goodsCategory}</td>

								<td>
									<a href='javascript:void(0);' onclick="openGoodsManager('${status.index}')">
										<img class="thumb" src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
									</a>
								</td>
								<td>
									<a href='javascript:void(0);' onclick="openGoodsManager('${status.index}')"> ${row.goodsName} </a>
								</td>
								<td>${row.goodsSellerNickname}</td>
								<td>${row.goodsStatus}</td>
								<td>${row.goodsDate}</td>
								<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}" />
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->


<!-- Custom scripts for all pages-->
<script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>

<!-- 선민: 회원정보 상세보기 팝업창 띄우기 + Post로 값 넘기기 -->
<script>
    function openGoodsManager(index) {
	var goodsNum = document.getElementById("goodsNum_" + index).value;

	console.log("index: " + index);
	console.log("goodsNum: " + goodsNum);
	window
		.open('', 'window_adminGoodsManager',
			'width=1000, height=700, location=no, status=no, scrollbars=yes');

	var form = document.createElement("form");
	document.body.appendChild(form); // form이 document의 body에 붙어있어야 form이 전송됨

	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");
	form.setAttribute("action", "/admin/adminGoodsManager");

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "goodsNum");
	hiddenField.setAttribute("value", goodsNum);

	form.target = "window_adminGoodsManager";
	form.appendChild(hiddenField);
	form.submit();
    }
</script>

<style>
.thumb {
	width: 120px;
	height: 90px;
}
</style>