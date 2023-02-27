<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<style>
li {
	list-style: none;
	padding-left: 0px;
}


.request-table{
	margin:auto;
	width: 900px;
}

.request-table {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	border-right: none;
	border-left: none;
}

.request-table tr td th div {
	text-align: left;
	margin:left;
}

.request-table thead tr {
	height: 20px;
	text-align: left;
}

.request-table thead tr td {
	text-align: center;

}

.request-table tbody tr{
	
	height:30px;
}

.request-table tbody td{
	
	padding:1px;
}


.top ul {
    float: left;
}

.title {
    font-size: 24px;
    margin-left: 24px;
}

.status{
    width: 72px;
    height: 26px;
    line-height: 26px;
    font-size: 14px;
    text-align: center;
    border-radius: 3px;
    
}

.cate {
    margin: 10px 0 0 24px;
    font-size: 13px;
}

#bbs_view{
border-bottom: 1px solid #e7e7e7;
}

#bbs_view ul {
    float: left;
    height: 45px;
    line-height: 45px;
    font-size: 14px;
    /* margin-left: 12px; */
    
}

.line_info {
	
    border-top: 2px solid #626262;
    border-bottom: 1px solid #e7e7e7;
    margin-top: 22px;
    padding: 0 16px;   
}


</style>
<head>



<script type="text/javascript" src="/resources/js/reply.js"></script>


<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/request/requestModifyForm").submit();

		});
		
		$("button[data-oper='list']").on("click", function(e) {
			
			operForm.find("#requestNum").remove();
			operForm.attr("action", "/request/requestList")
			operForm.submit();

		});
		
	
	});
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/>

<div>
	<table class="request-table">
		<thead>
			<tr class="top">
				<td>
				
				<ul class="status"><c:out value="${detail.requestStatus }"/></ul>
				<ul class="title"><c:out value="${detail.requestTitle }"/></ul>
				<ul class="cate"><c:out value="${detail.requestCategory }"/>/<c:out value="${detail.requestUse }"/></ul>
				
				<%-- <th><c:out value="${detail.requestStatus }"/></th>
				<th><c:out value="${detail.requestTitle }"/></th>
				<th><c:out value="${detail.requestCategory }"/>/<c:out value="${detail.requestUse }"/></th> --%>
				
				</td>
			</tr>
		</thead>	
		
			
			<tr id ="bbs_view">
				<td id ="bbs_view">
				 <div class="line_info">
				<ul>접수 마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.requestDead }"/></ul>
				<ul>작업 마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.requestFinish }"/></ul>
				<ul>예산 : <c:out value="${detail.requestMoney }"/></ul>
				 <div class="line_info_b">
				 <ul>${detail.requestWriter } &nbsp;&nbsp; </ul>
				 <ul><fmt:formatDate pattern="yyyy-MM-dd" value="${detail.requestRegDate }"/></ul>
				</div>
			</td>
			</tr>
		
		
		<tbody>
			<tr>
				<th><div><c:out value="${detail.requestContent }"/></div></th>
			</tr>
		<tr>
		<td>
		<div>
			<form id="operForm" action="/request/requestModifyForm" method="get">
				<input type='hidden' name='rqpageNum' value='${rqcri.rqpageNum}'>
				<input type='hidden' name='rqamount' value='${rqcri.rqamount}'>
				<input type='hidden' name='rqtype' value='<c:out value="${ rqpageMaker.rqcri.rqtype }"/>'> 
				<input type='hidden' name='rqkeyword' value='<c:out value="${ rqpageMaker.rqcri.rqkeyword }"/>'>
				<input type='hidden' name='requestNum' value='${detail.requestNum}'>
				<input type='hidden' name='memberNum' value='${detail.memberNum}'>
			</form>
		</div>
		</td>
		</tr>
			
		
			<tr>
				<td>
				<div>
					<c:if test="${detail.memberNum eq loginUser.memberNum }">	
						<button data-oper='modify'>수정</button>
					</c:if>		
						<button data-oper='list'>목록</button>
				</div>		
				</td>
			</tr>	
		
		<tr>
		<td>
		
		<div class='row'>
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						
							 <i class="fa fa-comments fa-fw"></i>
							 	<button id='addCommentBtn' class="btn btn-primary btx-xs pull-right">지원하기</button>
					 	
					</div>
					
					<div class="panel-body">
						<ul class="chat">
							<li class='left clearfix' data-commentnum='"+list[i].commentNum+"' data-commentwriter='"+list[i].commentWriter+"'>
	    	 
	    	  
						</ul>
					</div>
				</div>
			</div>
		</div>	
		</td>
		</tr>
		</tbody>
	</table>	
</div>


<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">댓글 입력</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>내용</label> 
                <input class="form-control" name='commentContent'>
              </div>      
              <div class="form-group">
                <label>작성자</label> 
                <input class="form-control" name='commentWriter' value='${loginUser.memberEmail }' readonly>
              </div>
              <div class="form-group">
                <label>등록일</label> 
                <input class="form-control" name='commentRegdate'>
              </div>
              <div>
              	<input type="hidden" name="commentNum" value="">
              	<input type="hidden" name="memberNum" value="${loginUser.memberNum }">
              </div>
      
            </div>
				<div class="modal-footer">
			        <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
			        <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
			        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
			        <button id='modalCloseBtn' type="button" class="btn btn-default">취소</button>
		      </div>          
	      </div>
          <!-- /.modal-content -->
       </div>
       <!-- /.modal-dialog -->
     </div>
     <!-- /.modal -->

<!-- 댓글 파트 -->

<!-- <div class='row'>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			 <i class="fa fa-comments fa-fw"><i>
			 	<button id='addCommentBtn' class="btn btn-primary btx-xs pull-right">지원하기</button>
			</div>
			
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-commentNum="61">
						
					</li>	
				</ul>
			</div>
		</div>
	</div>
</div> -->


</body>
</html>



<script type="text/javascript">
$(document).ready(function(){
		var requestNum='<c:out value="${detail.requestNum}"/>'
		var replyUL=$(".chat");
		showList(1);
	
		function showList(page){
		
	      
	      replyService.getList({"requestNum":requestNum,page: page|| 1 }, function(list) {
	        
	        var str="";
	       if(list == null || list.length == 0){
	        
	        replyUL.html("");
	        
	        return;
	      }
	       for (var i = 0, len = list.length || 0; i < len; i++) {
	    		          
	    	  /*  str +="<li class='left clearfix' data-commentnum='"+list[i].commentNum+"' data-commentwriter='"+list[i].commentWriter+"'>";
	    	   str +="  <tr><td><div><div><strong>"+list[i].commentWriter+"</strong>"; 
	           str +="    <small>"+replyService.displayTime(list[i].commentRegdate)+"</small></div>";
	           str +="    	<div><p>"+list[i].commentContent+"</p></div></div></li>"; */
	           
	    	   str +="<li class='left clearfix'>";
	    	   str +="  <tr><td><div><div><strong>"+list[i].commentWriter+"</strong>"; 
	           str +="    <small>"+replyService.displayTime(list[i].commentRegdate)+"</small></div>";
	           str +="    	<div><p>"+list[i].commentContent+"</p></div><div><button  data-commentnum='"+list[i].commentNum+"' data-commentwriter='"+list[i].commentWriter+"' id='modi' type='button' class='btn btn-warning'>수정</button></div></div></td></tr></li>";
	             
	         }


	    replyUL.html(str);

	      });//end function
	      
	   }//end showList
	   
		/*모달 스크립트*/
		var modal = $(".modal");
	    var modalInputReply = modal.find("input[name='commentContent']");
	    var modalInputReplyer = modal.find("input[name='commentWriter']");
	    var modalInputReplyDate = modal.find("input[name='commentRegdate']");
	    
	    var modalModBtn = $("#modalModBtn");
	    var modalRemoveBtn = $("#modalRemoveBtn");
	    var modalRegisterBtn = $("#modalRegisterBtn");
	    
	    $("#modalCloseBtn").on("click", function(e){
	    	
	    	modal.modal('hide');
	    });
	    
	    $("#addCommentBtn").on("click", function(e){
	    	
	    	var seller = '${loginUser.memberClass}';
	    	/* alert(seller); */
	    	
	    	if(seller != 'S'){
	    		alert("작가회원만 작성 할 수 있습니다.");
		    	return false;
	    	}
	      
	      /* modal.find("input").val(""); */
	      modalInputReplyDate.closest("div").hide();
	      modal.find("button[id !='modalCloseBtn']").hide();
	      
	      modalRegisterBtn.show();
	      
	      $(".modal").modal("show");
	      
	    });
	    
	    /*------------------------------------*/
	    modalRegisterBtn.on("click",function(e){
	        
	        var reply = {
	              commentContent: modalInputReply.val(),
	              commentWriter:modalInputReplyer.val(),
	              "requestNum":requestNum
	            };
	        replyService.add(reply, function(result){
	          
	          /* alert(result); */
	          
	          modal.find("input").val("");
	          modal.modal("hide");
	          
	          //showList(1);
	          showList(-1);
	          
	        });
	        
	      });
		
	    
	  //댓글 조회 클릭 이벤트 처리 
	    $(".chat").on("click", "button", function(e){
	     
	    	var writer=$(this).data("commentwriter");
	    	/* alert(writer); */
	    	var swriter='${loginUser.memberEmail}';
	    	/* alert(swriter); */
	    	
		    if(writer != swriter){
		    	alert("작성자만 수정 할 수 있습니다.");
		    	return false;
		    }
	    	
	    $(modal).find("input[name='commentNum']").val($(this).data("commentnum"));
	    	
	      var commentNum = $(this).data("commentnum");
	      
	      /* alert(commentNum); */
	      
	      replyService.get(commentNum, function(reply){
	      
      	  modalInputReply.val(reply.commentContent);
      	  modalInputReplyer.val(reply.commentWriter);
 			 modalInputReplyDate.val(replyService.displayTime(reply.commentRegdate))
    	    .attr("readonly","readonly");
	        modal.data("commentNum", reply.commentNum);
	        
	        modal.find("button[id !='modalCloseBtn']").hide();
	        modalModBtn.show();
	        modalRemoveBtn.show();
	        
	        $(".modal").modal("show");
	            
	      });
	    });
	  
	    modalModBtn.on("click", function(e){
	    	  
	    	  let rno = $(modal).find("input[name='commentNum']").val();
	    	  /* alert(rno); */
	     	  var reply = {commentNum:rno, commentContent: modalInputReply.val()};
	   
	     	  
	     	  replyService.update(reply, function(result){
	     	        
	     	    /* alert(result); */
	     	    modal.modal("hide");
	     	    showList();
	     	    
	     	  });
	     	  
	     	});
	    
	    modalRemoveBtn.on("click", function (e){
	     	  
	    	 let rno = $(modal).find("input[name='commentNum']").val();
	    	  /* alert(rno); */
	     	  var reply = {commentNum:rno};
	   
	     	  
	     	  replyService.remove(reply, function(result){
	     	        
	     	    alert(result);
	     	    modal.modal("hide");
	     	    showList();
	     	    
	     	  });
	     	});
	  		
})

</script>