<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
	page import="java.util.ArrayList, 
	java.util.List,
	com.kh.semi.car.model.vo.*,
	com.kh.semi.common.model.vo.PageInfo" 
%>

<%
	Car car = (Car)request.getAttribute("car");
	List<Option> optionList = (ArrayList<Option>)request.getAttribute("optionList");
%>

<%
	int carPrice = 0;
	int optionPrice = 0;
	int totalPrice = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약 페이지</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

    .image{
        width : 580px;
        height: auto;
    }

    .car-info > div{
        text-align: right;
    }

    .modal-area{
        text-align: left;
    }

    .modal-area > div{
        padding-top: 10px;
    }
    
    .date > input{
    	width : 100px;
    }
</style>
</head>
<body>
    <div>
        <%@ include file="../common/menuBar.jsp" %>
    </div>

    <div class="area-board">

	<% if(loginUser == null) { %>
		<script>
			alert('렌트 예약은 회원만 가능합니다.');
			location.href = '<%=contextPath%>/loginPage';
		</script>
	<% } else { %>


        <div class="car-image"> 
            <img class="image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAyMzEyMjZfMjI4%2FMDAxNzAzNTc4NDIxNzM0.uTcxc4cFKOcNWG2Nc7Me-BpdXCV-s8vaWFYVcQOzDSQg.vfvPPCebjKLB0RGojjK6uRpMuPXX4gVZVvxvZhTua68g.JPEG%2FIm1KxuoEiMndVQdXGhKBl3wBDjbM.jpg&type=sc960_832" alt="대표이미지">
        </div>
        
        <div class="car-info"> 차량 상세 정보
        
			<span>
				<form class="date">
					<input type="text" id="datepicker1" readonly> - 
					<input type="text" id="datepicker2" readonly>
				</form>
			</span>
			
			<script> 
				$(function(){
					$.datepicker.setDefaults({
						dateFormat : 'yy-mm-dd'
						,showOn: "both"
						,showMonthAfterYear: true
						,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
						,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
						,dayNamesMin: ['일','월','화','수','목','금','토']
						,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
						,minDate: "+0D"
						,maxDate: "+3M"
						,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
						,buttonImageOnly: true
						,buttonText: "선택"   
					});
					$("#datepicker1").datepicker();
					$("#datepicker2").datepicker();
					$('#datepicker1').datepicker('setDate', 'today');
					$('#datepicker2').datepicker('setDate', '+1D');
					
				});
			</script>
          
            	
            <div> <%= car.getModelName()%> </div>
            <div> <%= car.getGradeName()%> </div>
            <div> <%= car.getBrandName()%></div>
            <div> <%= car.getYear()%>년 식</div>
            <div> <%= car.getFuelName()%></div>
            
            	<% carPrice = car.getGradePrice()+ car.getModelPrice() + car.getYearPrice(); %>
            	
            <div class="car-info-detail"> 옵션 리스트 : 
            
            	<% for(Option o : optionList) { %>
	                
	                <span><%= o.getOptionName() %></span>
            		<% optionPrice += o.getOptionPrice(); %>
            
            	<% } %>
      
            </div>
            
            	<% totalPrice = carPrice + optionPrice; %>
            	
			<div>      	
	        	시간당 가격 : <%=totalPrice%>
	        	<br>
	            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
				  	Open modal
				</button>
				
				<div class="modal" id="myModal">
				    <div class="modal-dialog">
				        <div class="modal-content">
				
                            <div class="modal-header">
                                <h4 class="modal-title">저렴하니카 결제 화면</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
				
                            <div class="modal-body">
                                <form>
	                                <div class="modal-area">
                                        <div>
                                       	    결제 방식 : 
                                            <select name="">
                                                <option value="선불충전">선불충전</option>
                                                <option value="가상계좌">가상계좌</option>
                                                <option value="카드결제">신용카드</option>
                                            </select>
                                        </div>
                                        <div>
                                          	예약자 명 :
                                            <span><%= loginUser.getMemberName()%></span>
                                        </div>
                                        <div>
                                           	예약 차량 : 
                                            <span><%= car.getBrandName()%> / <%= car.getCarNo()%></span>
                                        </div>
                                        <div>
                                         	이메일 : 
                                            <input type="text">
                                        </div>
                                        <div>
                                        	총 가격 : 
                                        	
                                        </div>
	                                </div>
                                </form>
                            </div>
				
                            <div class="modal-footer">
                            
                                <button id="paid"type="button" class="btn btn-sm btn-primary" href="<%=contextPath%>/views/common/reserveDetail.do">결제</button>
                                <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">취소</button>
                              
                            </div>
				        </div>
				    </div>
			    </div>
	        </div>	  
	        
        </div>

        <br clear="both">
        
    <% } %>        
    </div>


</body>
</html>