<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>

	
	<% com.kh.semi.common.JDBCTemplate.getConnection(); %>

	<%@ include file="views/common/menuBar.jsp" %>
</body>
</html>