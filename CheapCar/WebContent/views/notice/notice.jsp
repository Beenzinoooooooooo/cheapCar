<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">



<style>
	.outer{
		width: 1200px;
		height: auto;
		margin: auto;
		padding-bottom: 50px;
	}
	.page-header{
		padding-top: 20px;
		font-size: 40px;
		font-weight: bold;
		border-bottom: 6px solid #6caddf;
	}
	#title{
		background-color: aquamarine;
		font-size: large;
		font-weight: bolder;
	}
	#write{
		text-align: right;
		padding-right: 0%;
		margin-bottom: 2px;
	}
	.do-hyeon-regular {  /* 공지사항 글꼴 */ 
		font-family: "Do Hyeon", sans-serif;
		font-weight: 300px;
		font-style: normal;
		font-size: 60px;
		color: #6caddf;
	}
	.table{
		font-size: 18px;
	}

</style>
</head>
<body>


	<jsp:include page="../common/menuBar.jsp"></jsp:include>

	<div class="outer" >
		<div class="row">
		  <div class="col-lg-1">
		  </div>
			 <div class="col-lg-10">
				<div class="panel-body">
				<h2 class="page-header do-hyeon-regular" align="left">공지사항				   
				</h2>


					<c:if test="${ loginUser != null and loginUser.memberStatus == 'A' }">  
					<div id="write">
						<a href="${ path }/insertForm.notice" class="btn btn-info">글쓰기</a>
						
					</div> 
				    </c:if>

				
				   <table class="table table-bordered table-hover" style="margin-top:30px; border-radius: 5px;">
				   
					  <tr style="background-color: #6caddf; margin-top: 0; height: 40px; color: white; opacity: 0.8">
						 <th style="width: 8%; text-align:center">번호</th>
						 <th style="width: 45%; text-align:center">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						 <th style="width: 10%; text-align:center">작성자</th>
						 <th style="width: 15%; text-align:center">작성일</th>
						 <th style="width: 8%; text-align:center">조회수</th>
					  </tr>
					  <c:choose>
					  <c:when test="${ empty list }">
					  <tr>
						<th colspan="5"> 공지사항이 존재하지 않습니다.</th>
					  </tr>
					  </c:when>
					  <c:otherwise>
						
					 	<c:forEach var="n" items="${ list }" >
							<tr class="notice_list">
								<th style="text-align:center">${ n.noticeNo }</th>
								<th>${ n.noticeTitle }</th>
								<th style="text-align:center">${ n.noticeWriter }</th>
								<th style="text-align:center">${ n.createDate }</th>
								<th style="text-align:center">${ n.count }</th>
							</tr>
						</c:forEach>
					 </c:otherwise>
					 </c:choose>
					  
				   </table>               
				</div>            
			 </div>
		  </div>
		<div class="paging-area" align="center" style="margin-top:12px">
			
			<c:if test="${ pi.currentPage > 1}">
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.notice?currentPage=${ (pi.currentPage - 1) }'">이전</button>
			</c:if>
			
			<c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ pi.currentPage ne i }">
						<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.notice?currentPage=${ i }'">${ i }</button>
					</c:when>
					<c:otherwise>
						<button disabled class="btn btn-outline-info" style="color:#6caddf;">${ i }</button>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
			
			<c:if test="${ pi.currentPage ne pi.maxPage and pi.currentPage lt pi.maxPage }">
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.notice?currentPage=${ pi.currentPage  + 1 }'">다음</button>
			</c:if>
			
	    </div>	

	</div>

	<script>
		$('.notice_list').click(function(){
			 const noticeNo = $(this).children().eq(0).text();
			location.href = '${path}/detail.notice?noticeNo=' + noticeNo;

		})
	</script>

		

	   
	
		
	
</body>
</html>