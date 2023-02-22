<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<script>	
$(document).ready(function(){
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='requestNum' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/request/requestDetail");
		actionForm.submit();
	});

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {

				e.preventDefault();

				console.log('click');

				actionForm.find("input[name='rqpageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
	
	/* var actionForm1 = $("#actionForm1");
	$('#requestSort').on('change', function(){
		let requestSort = $(this).find('option:selected').val();
		console.log(requestSort);
		$('input[name="requestCategory"]').val(requestCategory);
		console.log($('input[name="requestCategory"]').val());
		alert(requestSort);
		$('#actionForm1').submit();
	}) */
	
	/* var searchForm = $("#searchForm");

	$("#searchForm button").on("click",function(e) {

			if (!searchForm.find("input[name='rqkeyword']").val()) {
			alert("Ű���带 �Է��ϼ���");
			return false;
			}

			searchForm.find("input[name='rqpageNum']").val("1");
			e.preventDefault();
			searchForm.submit();

			}); */
	

	var actionForm = $("#actionForm");
		/* actionForm.find("input[name='rqpageNum']").val('1'); */

		$('#category').on('change', function() {
					let requestCategory = $(this).find('option:selected').val();
					alert(requestCategory);
					$('select[name="requestCategory"]').val(requestCategory);
					alert($('select[name="requestCategory"]').val());
					$('#actionForm').submit();
				});

		$('#use').on('change', function() {
							let requestUse = $(this).find('option:selected').val();
							alert(requestUse);
							$('select[name="requestUse"]').val(requestUse);
							alert($('select[name="requestUse"]').val());
							$('#actionForm').submit();
						});

		$("#actionForm button").on("click",function(e) {
	
			
			e.preventDefault();
					let keyword= $(actionForm).find("input[name='rqkeyword']").val();
					alert("�ܾʵȵ�"+keyword);
					if (!keyword) {
						alert("Ű���带 �Է��ϼ���");
						return false;
					}

					actionForm.find("input[name='rqpageNum']").val("1");
					
					actionForm.submit();

				});

	});
</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/>
<div>
	<div class="requestSort">
		<ul align="center" >
			<form id="actionForm" method="get" action="/request/requestList">
				<input type='hidden' name='rqpageNum' value='${rqpageMaker.rqcri.rqpageNum}'>
				<input type='hidden' name='rqamount' value='${rqpageMaker.rqcri.rqamount}'>
				
				<select id="category" name="requestCategory">
					<option value="">�������ּ���</option>
					<option value="�Ϸ���Ʈ"
						${rqpageMaker.rqcri.requestCategory eq "�Ϸ���Ʈ" ? 'selected' : ''}>�Ϸ���Ʈ</option>
					<option value="������"
						${rqpageMaker.rqcri.requestCategory eq "������" ? 'selected' : ''}>������</option>
					<option value="�����"
						${pageMaker.rqcri.requestCategory eq "�����" ? 'selected' : ''}>�����</option>
					<option value="����"
						${rqpageMaker.rqcri.requestCategory eq "����" ? 'selected' : ''}>����</option>
					<option value="����"
					${rqpageMaker.rqcri.requestCategory eq "����" ? 'selected' : ''}>����</option>
					<option value="��Ÿ"
					${rqpageMaker.rqcri.requestCategory eq "��Ÿ" ? 'selected' : ''}>��Ÿ</option>
				</select>
			
				<select id="use" name="requestUse">
					<option value="">�������ּ���</option>
					<option value="�����"
						${rqpageMaker.rqcri.requestUse eq "�����" ? 'selected' : ''}>�����</option>
					<option value="��ۿ�"
						${rqpageMaker.rqcri.requestUse eq "��ۿ�" ? 'selected' : ''}>��ۿ�</option>
					<option value="������"
						${pageMaker.rqcri.requestUse eq "������" ? 'selected' : ''}>������</option>
				</select>
				
				<input type='text' name='rqkeyword' value='${rqpageMaker.rqcri.rqkeyword}' placeholder="����,�ۼ���" /> 
				<input type="hidden" name="rqtype" value="TW">
				<button type="submit">Search</button>
			</form>
		</ul>
	</div>

	<table border="1" align="center" >
		<thead>
			<tr>
				<th>����</th>
				<th>ī�װ�</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>��������</th>
				<th>�Ϸ����</th>
			</tr>	
		</thead>
		
		<div>
			<form>
				<c:forEach items="${rqlist }" var="rqlist">
					<tr>	
						<%-- <input type="hidden" value="${rqlist.requestNum } }"/> --%>
						<td><c:out value="${rqlist.requestStatus }"/></td>
						<td><c:out value="${rqlist.requestCategory }"/></td>
						<td>
						<a class='move' href='<c:out value="${rqlist.requestNum }"/>'>	
						<c:out value="${rqlist.requestUse }"/> &nbsp;-&nbsp;<c:out value="${rqlist.requestTitle }"/></a></td>
						<td><c:out value="${rqlist.requestWriter }"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestFinish }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestDead }" /></td>							
					</tr>	
				</c:forEach>
			</form>		
		</div>						
	</table>
	
	<div class='pull-right'>
		<ul class="pagination" align="center">
		
			<c:if test="${rqpageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${rqpageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${rqpageMaker.startPage}"
					end="${rqpageMaker.endPage}">
					<li class="paginate_button  ${rqpageMaker.rqcri.rqpageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${rqpageMaker.next}">
					<li class="paginate_button next"><a
						href="${rqpageMaker.endPage +1 }">Next</a></li>
				</c:if>
		</ul>
	</div>	
	
	<c:if test="${loginUser != null }">
	<a href="/request/requestInsertForm">
		<button type="submit" value="�۾���">�۾���</button>
	</a>
	</c:if>
</div>

</body>
</html>