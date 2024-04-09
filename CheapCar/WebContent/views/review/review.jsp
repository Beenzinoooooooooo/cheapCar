<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
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
		padding-bottom: 30px;
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
		
	}
	.search_write{
		margin-top: 10px;
		display: inline;
		text-align: center;
		margin-right: 0px;
	}
	.do-hyeon-regular {  /* 타이틀 글꼴 */ 
		font-family: "Do Hyeon", sans-serif;
		font-weight: 300px;
		font-style: normal;
		font-size: 60px;
		color: #6caddf;
	}
	.table{
		font-size: 18px;
	}
	#review_list{
		display:flex;
		gap: 10%;
		flex-wrap: wrap;
		margin-top: 30px;
		overflow: hidden;
		list-style-type: none;
	}
	#review_list > li{
		width: 400px;
		height: 450px;
		text-decoration: none;
	}
	.img-area{
		width: 100%;
		height: 55%;
		border: 4px solid #6caddf;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}
	.text-area{
		width: 100%;
		height: 35%;
		border: 4px solid #6caddf;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		color: whitesmoke;
		background-color: #6caddf;
		font-size: 20px;
	}
    .review_1:hover{
        cursor: pointer;
        opacity: 0.8;
    }
    .paging-area{margin-bottom: 20px;}
    #btn-search{margin-right: 20px}
	#NoMsg{
		font-family: "Do Hyeon", sans-serif;
		font-size: 20px;
		color: #6caddf;
		text-align: center;
	}
	#titleImg{
		width: 100%;
		height: 100%;
		border-top-left-radius: 18px;
		border-top-right-radius: 18px;
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
				<h2 class="page-header do-hyeon-regular" align="left">리&nbsp;&nbsp;뷰
				</h2>
				<div class="review_content">
					<ul id="review_list">
						<c:choose>
						<c:when test="${ empty list }">
						<li id="NoMsg"> 리스트가 존재하지 않습니다. <li>
						</c:when>
						<c:otherwise>
						
						  <c:forEach var="r" items="${ list }">
						  		
							<li>
								<a>
									<div class="img-area review_1 content">
									 <input type="hidden" value="${ r.reviewNo }"/>
									 <c:choose>
										 <c:when test="${ r.titleImg == '/' }">
										 <img src="views\common\차빌려조로고.gif" id="titleImg"/>
										 </c:when>
									 <c:otherwise>
								 	 	<img src="${ r.titleImg }" id="titleImg"/>
								 	 </c:otherwise>
								 	 </c:choose>
								 	</div>
									<div class="text-area review_1 content">
									<input type="hidden" value="${ r.reviewNo }"/>
									 <span> ${ r.reviewTitle } </span><br><br>
								     <span style="font-size: 15px;">조회수 :  ${ r.count }</span>
									</div>
								</a>
							</li>
							</c:forEach>
						</c:otherwise>
						</c:choose>

				</div>            
			 </div>
		  </div>
		</div>         
		<div class="paging-area" align="center" style="margin-top:12px">
			
			<c:if test="${ pi.currentPage > 1}">
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.review?currentPage=${ (pi.currentPage - 1) }'">이전</button>
			</c:if>	
			
			<c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ pi.currentPage ne i }">
						<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.review?currentPage=${ i }'">${ i }</button>
					</c:when>
					<c:otherwise>
						<button disabled class="btn btn-outline-info" style="color:#6caddf;">${ i }</button>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
			
			<c:if test="${ pi.currentPage ne pi.maxPage and pi.currentPage lt pi.maxPage }">
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.review?currentPage=${ pi.currentPage  + 1 }'">다음</button>
			</c:if>
			
	    </div>	
        <div class="search_write">
			<form>
				<c:if test="${ loginUser != null }">
					<a href="${ path }/insertForm.review" class="btn btn-info" id="write" style="height: 32px;">글쓰기</a>
				</c:if>
				
			</form>


	   </div>			  					  
	</div>
	
	<script>
		$(function(){

			$('.content').click(function(){

				const reviewNo = $(this).children().eq(0).val(); 

				location.href = '${path}/detail.review?reviewNo=' + reviewNo
			})


		})
	</script>	
	
	
	
	
	   
	
		
	
</body>
</html>