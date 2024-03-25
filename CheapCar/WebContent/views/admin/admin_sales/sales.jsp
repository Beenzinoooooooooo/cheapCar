<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>

	
	<div class="outer">
		<div class="container">
			<h2>매출내역</h2>   
				<table class="table">
					<thead>
						<tr>
							<th>차종별 매출 내역</th>
							<th>신고받은 아이디</th>
							<th>신고한 아이디</th>
							<th>신고내용</th>
							<th>신고날짜</th>
							<th>신고누적</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>user01</td>
							<td>user02</td>
							<td>욕설이 너무 많아요</td>
							<td>2024-01-01</td>
							<td>3</td>
							<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
						</tr>
						
						
						
						
						
						
					</tbody>
				</table>
		</div>
			
		<div class="paging-area">
	    	<% if(pi.getCurrentPage() > 1) { %>
	       		<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/selectCsList?currentPage=<%= pi.getCurrentPage() - 1 %>'">이전</button>
	        <% } %>
	        
	        <% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
	       		<% if(pi.getCurrentPage() != i) { %>
	       			<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/selectCsList?currentPage=<%=i%>'"><%= i %></button>
				<% } else { %>
					<button disabled class="btn btn-danger"><%= i %></button>
				<% } %>
			<% } %>
			
			<% if(pi.getCurrentPage() != pi.getMaxPage()) { %>
				<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/selectCsList?currentPage=<%= pi.getCurrentPage() + 1 %>'">다음</button>
			<% } %>
		</div>

		<div class="container">       
			<table class="table table-bordered">
			
			<tbody>
				<tr>
					<th>이름</th>
					<td>서준형</td>
					<td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>user01</td>
					<td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>1996-03-01</td>
					<td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>010-1234-5678</td>
					<td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>123@naver.com</td>
					<td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>

</body>
</html>