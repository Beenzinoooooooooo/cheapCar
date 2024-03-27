<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height : 600px;
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
    
    .reserve-info{
        width : 600px;
        height : auto;
        float : right;
        margin-right : 50px;
        text-align: center;
        padding : 10px;
    }
    
    .image{
        width : 580px;
        height: auto;
    }

    .reserve-info > div{
        text-align: left;
        padding : 10px;
    }

</style>
</head>
<body>

	<%@ include file="../common/menuBar.jsp" %>
	
    <div class="area-board">
        
            <div class="car-image">
                <img class="image" src="data:image/jpeg;base64,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" alt="차량이미지">
            </div>
            <div class="reserve-info">
                <div class="reserve-detail">예약자 : </div>
                <div class="reserve-detail">차량 모델 : </div>
                <div class="reserve-detail">연식 : </div>
                <div class="reserve-detail">연료 : </div>
                <div class="reserve-detail">렌트 기간 : </div>
                <div class="reserve-detail">결제 금액 : </div>
            </div>

    </div>

</body>
</html>