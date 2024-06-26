<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 결제 조회</title>
</head>
<body>

<%@ include file="../../common/adminMain.jsp" %>

	<div class="outer">

		<div id="top1" style = "border : 1px solid green";>
				
			<form class="form-inline" action="abc.do">
				<div id="top11" style="display: flex;">
					<label for="userId" style="margin: 0px 15px;">회원 아이디 : </label>
					<input type="text" class="form-control" id="userId" placeholder="조회하실 회원 아이디를 입력해주세요." name="userId" style="width: 300px;">
					
					<button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
				</div>
				
			</form>
		
		</div>

		<div class="container">
			<h2>회원 결제 내역</h2>   
			<table class="table">
				<thead>
				<tr>
					<th>번호</th>
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
				<tr>
					<td>1</td>
					<td>user01</td>
					<td>user02</td>
					<td>욕설이 너무 많아요</td>
					<td>2024-01-01</td>
					<td>3</td>
					<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
				</tr>
				<tr>
					<td>1</td>
					<td>user01</td>
					<td>user02</td>
					<td>욕설이 너무 많아요</td>
					<td>2024-01-01</td>
					<td>3</td>
					<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
				</tr>
				<tr>
					<td>1</td>
					<td>user01</td>
					<td>user02</td>
					<td>욕설이 너무 많아요</td>
					<td>2024-01-01</td>
					<td>3</td>
					<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
				</tr>
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
			
		<div id="abcd">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"><</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">></a></li>
			</ul>
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