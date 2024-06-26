<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.cs.model.vo.Cs, java.util.ArrayList, com.kh.semi.common.model.vo.BoardAttachment"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의글 수정</title>

<link rel="stylesheet" href="resources/css/adminStyle.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swapBlack+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">


</head>
<body>

	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	
	<c:if test="${ loginUser eq null }">

		<script>
			alert('로그인 후 글 작성을 해주세요')
			location.href='${ path }';
		</script>
	</c:if>
	
	<div class="outer" >
		<div class="row">
		  <div class="col-lg-1">
		  </div>
			 <div class="col-lg-10">
				<div class="panel-body">
					<h2 class="page-header do-hyeon-regular" align="left">문의글 수정</h2>
				</div>
                
                <div class="content_outer">
                	<form action="${ path }/update.cs" method="post" id="insert-form" enctype="multipart/form-data">
	                    <input type="hidden" name="csNo" value="${ cs.csNo }">
	                    <input type="hidden" name="memberNo" value="${ cs.memberNo }">
	                    <div class="content_header">
	                        <div class="content_header2">
	                            <label class="form-title">제목 : </label>
	                            <input type="text" name="title" value="${ cs.csTitle }">
	                        </div>
                  		</div>
                  		
                    	<div class="content_sub">
                        	<span class="content_sub1">작성자 : ${ loginUser.memberName }</span>
                   		</div>
                   		
	                    <div class="content_body">
	                        <textarea name="content" class="form-control" rows="20" id="comment" style="resize: none;">${ cs.csContent }</textarea>
	                    </div>
	                    
	                    <div class="content_add_img">
	                    	<span id="addInfo"><br>&lt;파일첨부&gt;</span><br><br>
	                    	
	                    	<c:choose>
	                    		<c:when test="${ empty list }">
	                    			<span id="addInfo"><br>&lt;등록되어있는 첨부파일이 없습니다.&gt;</span><br><br>
		                            <input type="file" name="upfile1"><br><br>
		                            <input type="file" name="upfile2"><br><br>
		                            <input type="file" name="upfile3"><br><br>
		                            <input type="file" name="upfile4"><br><br>
	                    		</c:when>
	                    		
	                    		<c:otherwise>
	                    			<c:forEach var="i" begin="0" end="${ list.size() - 1 }">
		                    			<input type="file" name="reUpfile${ i+1 }" id="reUpfile${ i+1 }" value="${ list[i].originName }">
										첨부파일 : <label>${ list[i].originName }</label> 
										<br><br>
										<input type="hidden" name="fileNo${ i+1 }" value="${ list[i].fileNo }">
										<input type="hidden" name="changeName${ i+1 }" value="${ list[i].changeName }">
										<br><br>
	                    			</c:forEach>
	                    			
	                    			<c:forEach var='i' begin="${ list.size() + 1 }" end="4">
	                    				<input type="file" name="upfile${ i }">
										<input type="hidden" name="fileNo${ i }">
										<input type="hidden" name="changeName${ i }">
										<br><br>
	                    			</c:forEach>
	                    		</c:otherwise>
	                    	</c:choose>
	                    
					    </div>
	                    
	                    <div class="content_btn" align="center">
	                        <div align="center">
	                            <button type="submit" class="btn btn-sm btn-primary">수정하기</button>
	                            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back()">뒤로가기</button>
	                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	                        </div>
	                    </div>
					</form>
					
                </div>
			 </div>
		  </div>
	</div>
	   

	
		
	
</body>
</html>