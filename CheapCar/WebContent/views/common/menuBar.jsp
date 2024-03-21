<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.car.model.vo.Car, com.kh.semi.member.model.vo.Member"%> 

<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저렴하니CAR</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<style>
		.login-area{
			float : right;
			padding-right : 20px;
		}

        .menu{
            width: 150px;
            height: 50px;
            display: table-cell;
        }

        .menu>a{
            display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            color: black;
            font-weight: bold;
            font-size: 20px;
            line-height: 50px;
        }

        .menu>a:hover{
            font-size: 21px;
            background-color: lightslategray;
            cursor: pointer;
        }
        
        #wrap{
            padding-top: 50px;
        }

	</style>
</head>
<body>

	<script>
		// script태그 안에서도 스크립틀릿 같은 JSP요소를 사용할 수 있음 
		
		const msg = '<%= alertMsg %>';
		
		if(msg != 'null'){
			alert(msg);
		
			// menubar.jsp가 로딩 될 때마다 alert이 계쏙 수행됨
			// session에 들어있는 alertMsg키값에 해당하는 밸류값을 지워줄 것!
			// xx.removeAttribute("키값");
			<% session.removeAttribute("alertMsg"); %>
		}
		
	
	</script>

	
    <div id="wrap">
        
         <h1 align="center" style="color: skyblue;">  <a href="<%=contextPath%>">저렴하니Car</a></h1>
      
        

        <div class="login-area">
        
         <% if(loginUser == null) { %>

            <form action="" method="post">
                    <div>
                        <a href="<%=contextPath%>/loginPage" >로그인</a>
                        <a href="<%=contextPath%>/enrollPage">회원가입</a>
                    </div>
            </form>
            
            
         <% } else { %>

	
	 		<div id="user-info">
		        <span><%= loginUser.getMemberName() %></span>님 환영합니다~~!! <br><br>
		        <div>
		            <a href="<%= contextPath %>/myPage" class="btn btn-sm btn-primary">마이페이지</a>
		                <!-- <a href="/jsp/logout">로그아웃</a>-->
		            <a href="<%= contextPath %>/logout" class="btn btn-sm btn-secondary">로그아웃</a>
		            <% if(loginUser.getMemberStatus().equals("A")) { %>
		            <a href="<%= contextPath %>/adminMain" class="btn btn-sm btn-warning">관리자페이지</a>
		            <% } %>
		        </div>
	      </div>
		<% } %>

	 </div>















         
        </div>

        <br clear="both">
        
        <div class="nav-area" align="center">
            <div class="menu"><a href="<%= contextPath %>/list.car?currentPage=1">차량렌트</a></div>
            <div class="menu"><a href="<%= contextPath %>/list.event">이벤트</a></div>
            <div class="menu"><a href="<%= contextPath %>/list.notice">공지사항</a></div>
            <div class="menu"><a href="<%= contextPath %>/list.review">후기</a></div>
            <div class="menu"><a href="#">고객센터</a></div>
        </div>
        
    </div>
    
</body>
</html>