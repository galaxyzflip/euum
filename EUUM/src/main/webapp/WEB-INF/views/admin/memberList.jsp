<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Custom styles for this page -->
<link href="/resources/sbadmin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원 목록</h1>
<!-- 	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p> -->	
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>아이디(이메일)</th>
							<th>전화번호</th>
							<th>이름</th>
							<th>회원 등급</th>
							<th>가입 날짜</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>회원번호</th>
							<th>아이디(이메일)</th>
							<th>전화번호</th>
							<th>이름</th>
							<th>회원 등급</th>
							<th>가입 날짜</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="memberList" varStatus="member" items="${memberList}">
						
						<tr>
							<td>${memberList.memberNum}</td>
							<td data-bs-toggle="modal" data-bs-target="#exampleModal_${member.index}" onclick="openModal('${memberList.memberNum}')">${memberList.memberEmail}</td>
							<td>${memberList.memberMobile}</td>
							<td>${memberList.memberName}</td>
							<td>${memberList.memberClass}</td>
							<td>${memberList.memberRegDate}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  		<form id="frm" method="post">
			  		<input type="hidden" name="memberNum" value=""/>
			  		<input type="hidden" name="sellerNum" value=""/>
			  		<div class="modal-dialog">
			    		<div class="modal-content">
			      			<div class="modal-header">
			        			<h1 class="modal-title fs-5" id="exampleModalLabel">회원 삭제</h1>
			        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      			</div>
			      			<div class="modal-body">
			        			이 회원을 블랙리스트로 지정 하시겠습니까?
			      			</div>
			     			<div class="modal-footer">
			        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        		<button type="button" class="btn btn-primary" data-oper="delete" id="delete">변경</button>
			      			</div>
			    		</div>
			  		</div>
			  		</form>
				</div>
				<!-- modal --> 
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

	<script type="text/javascript">
	
	// modal
	 $(document).ready(function(){
		 
	   var frm = $("#frm");
		
	   $("#delete").on("click", function(e){   
		   
			e.preventDefault();
			
			var oper = $(this).data("oper");
			
			 if(oper === 'delete'){

				 frm.attr("action", "/admin/leavePro");
	
			}
			 
			 frm.submit();
		
	   });
	});		


	function openModal(memberNum){
		$('#exampleModal').modal('show');
		$('input[name="memberNum"]').val(memberNum);

	}
	
	</script>
	
	<script>
	
/* 	function openModal(memberNum) {
		
	    let formData = new FormData(); // 가상의 <form>태그 객체를 생성
	    let memberNum;
	    
	    alert(status);
	    
	    if(!confirm("정말 삭제하시겠습니까?")) { return false; }
	    else {}
	    
		switch(status) {
			case '승인완료':
				goodsNum = document.querySelector('div.myGoodsList input[id=goodsNum_' + index + ']').value;
				break;
				alert('이거뜨면먼가오류있음');
		}

		// 1. 가상의 <form>태그에 전송할 data를 담기
		formData.append("memberNum", memberNum);
			
		$.ajax({
			url: '/admin/leavePro',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			
			success: function(result) { 
			    
			    var html = jQuery('<div>').html(result);
				var contents = html.find("div.modal fade").html();
				$("#exampleModal").html(contents);
			}	
		}); // $.ajax
		
		
		document.getElementById(tr).remove();
	}
	 */
	</script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>

