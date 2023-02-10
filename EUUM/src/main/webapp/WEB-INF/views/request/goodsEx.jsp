<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
$(document).ready(function(e){
	
	var actionForm = $("#actionForm");
	actionForm.find("input[name='pageNum']").val('1');
	
	let sortCom = '${pagaMaker.cri.sortCom}';
	

	$('#sortCom').on('change', function(){
		let sortCom = $(this).find('option:selected').val();
		console.log(sortCom);
		$('input[name="sortCom"]').val(sortCom);
		console.log($('input[name="sortCom"]').val());
		$('#actionForm').submit();
	})
	
	$(".paginate_button a").on("click", function(e) {

		e.preventDefault();

		console.log('click');

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
})

</script>

	<div class="container">
		<div class="row gy-5">
			<div class="col">
				<div style="float: left; font-size: 14.5px;">
					<div id="searchBox">
						<form id='actionForm' action="/goods/goodsList" method='get'>
							<input type='hidden' name='pageNum'
								value='${pageMaker.cri.pageNum}'> <input type='hidden'
								name='amount' value='${pageMaker.cri.amount}'> <input
								type="hidden" name="sortCom" value="${pageMaker.cri.sortCom }">
							<%-- <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> --%>
							<%-- <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>  --%>
							<!-- </form> -->
							<!-- this.form.submit()<form method="get" action="/goods/goodsSearch">  -->
							<select name="type" value="${pageMaker.cri.type }">
								<option value="goods_Name">상품 이름</option>
								<option value="GOODS_SELLER_NICKNAME">작가 이름</option>
							</select> <span> <input type="text" name="keyword"
								id="searchKeyword"
								value='<c:out value="${ pageMaker.cri.keyword }"/>'
								style="width: 200px; height: 30px; display: inline-block;">
							</span> <span>
								<button type="submit" style="height: 32px; width: 80px;">검색</button>
							</span>
						</form>
					</div>




					<!--    정 렬 옵 션   -->
					<div class="goodsSort">
						<form method="post" action="/goods/goodsSort" name="sortCom">

							<select id="sortCom" name="sortCom">
								<option value="">선택해주세요</option>
								<option value="1"
									${pageMaker.cri.sortCom eq "1" ? 'selected' : ''}>최신순</option>
								<option value="2"
									${pageMaker.cri.sortCom eq "2" ? 'selected' : ''}>상업용</option>
								<option value="3"
									${pageMaker.cri.sortCom eq "3" ? 'selected' : ''}>비상업용</option>
								<option value="4"
									${pageMaker.cri.sortCom eq "4" ? 'selected' : ''}>상업용+비상업용</option>
							</select>
						</form>
					</div>

				</div>


				<div style="float: right; font-size: 14.5px;">
					<div class="sBtn1" style="height: 42px; line-height: 42px;"
						onclick="location.href='<c:url value='/myPage/myGoods'/>';">작품
						등록 / 수정</div>
				</div>
			</div>
		</div>
</body>
</html>