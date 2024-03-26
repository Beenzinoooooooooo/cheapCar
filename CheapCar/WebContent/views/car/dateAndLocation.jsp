<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 및 위치 지정</title>
<style>
    div{
        border : 1px solid red;
    }  

    .area-board{
        width : 100%;
        height : 100%;
    }
    .area-board > form{
        text-align: center;
    }
    form > div{
        padding-top : 30px;
        padding-bottom: 30px;
    }

    #totalHour{
        width : 30px;
        text-align : center;
    }
</style>
</head>
<body>
	<%@ include file="../common/menuBar.jsp" %>
	
    <div class="area-board">
        <form method="post" name="dateAndLocation" action="selectedCarList.do?currentPage=1">
            <div class="calendar">
                <%@ include file="../common/dateRangePicker.jsp"%> <br>
                총 대여시간 :         
                <input id="totalHour" type="text" readonly value=""/>  
               
            </div>
            <div class="location">
                <select >
                    <option value="강남점">강남점</option>
                    <option value="종로점">종로점</option>
                    <option value="일산점">일산점</option>
                    <option value="강북점">강북점</option>
                    <option value="구리점">구리점</option>
                </select>
            </div>
            <button class="btn btn-primary" type="submit">검색</button>
        </form>
    </div>
	
</body>
</html>