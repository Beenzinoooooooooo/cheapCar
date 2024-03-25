<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
	page import="java.util.ArrayList, 
	com.kh.semi.car.model.vo.*,
	com.kh.semi.common.model.vo.PageInfo" 
%>
<%
	ArrayList<Car> carList = (ArrayList<Car>)request.getAttribute("carList");
	ArrayList<Option> optionList = (ArrayList<Option>)request.getAttribute("optionList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    div{
        border: 1px solid red;
    }

    .area-board{
        width : 1400px;
        height : auto;
        margin : auto;
        padding-top : 50px;
        padding-bottom : 50px;
    }

    .car-image{
        width : 600px;
        height: auto;
        float :left;
        margin-left : 50px;
        padding : 10px;
    }

    .car-info{
        width : 600px;
        height : auto;
        float : right;
        margin-right : 50px;
        text-align: center;
    }

    .img{
        width : 580px;
        height: auto;
    }

    .car-info-detail{
        text-align: right;
    }
</style>
</head>
<body>
    <div>
        <%@ include file="../common/menuBar.jsp" %>
    </div>

    <div class="area-board">

        <div class="car-image"> 
            <img class="img" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAyMzEyMjZfMjI4%2FMDAxNzAzNTc4NDIxNzM0.uTcxc4cFKOcNWG2Nc7Me-BpdXCV-s8vaWFYVcQOzDSQg.vfvPPCebjKLB0RGojjK6uRpMuPXX4gVZVvxvZhTua68g.JPEG%2FIm1KxuoEiMndVQdXGhKBl3wBDjbM.jpg&type=sc960_832" alt="대표이미지">
        </div>
        <div class="car-info"> 차량 설명 

            <div class="car-info-detail"> 차종</div>
            <div class="car-info-detail"> 차이름 </div>
            <div class="car-info-detail"> 차제조사</div>
            <div class="car-info-detail"> 차량 등급</div>
            <div class="car-info-detail"> 사용 연료</div>
            <div class="car-info-detail"> 기타 옵션 리스트
                <span>span</span>
                <span>span</span>
                <span>span</span>
                <span>span</span>
            </div>
            <a class="btn btn-sm btn-primary"href="#">결제버튼</a>
        </div>



        <br clear="both">
    </div>


</body>
</html>