<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.common.model.vo.PageInfo, java.util.ArrayList, com.kh.semi.car.model.vo.Car" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Car> carlist = (ArrayList<Car>)request.getAttribute("carlist");
	
	//System.out.println(carlist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
<style>
	#salemonth {
		margin : auto;
		width : 100%;
	}
	.salesList>a{
		text-align : center;
		margin : auto;
	}

	#container{
		margin: auto;
		width: 100%;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer" id="salemonth">
		<div class="container" id="container">
			
			<div>
			
				<h2 style="margin:20px 0px;" align="center">이번 달 매출내역</h2>   
				
				<div class="salesList" style="margin-bottom:20px;" align="right">		
					<a type="submit" class="btn btn-outline-info" onclick="detailModel();" href="#">모델별 매출 내역</a>
					<a type="submit" class="btn btn-outline-primary" href="#">기간별 매출 내역</a>
					<a type="submit" class="btn btn-outline-warning" href="#">지점별 매출 내역</a>
				</div>
			</div>
			
			
			
			<div style="display: none;" id="detailModelName">
				<label for="">모델명</label>
				<button type="button" id="changeInput"></button>

				<select id="changeTest" onchange="selectmodel1(this.value);">
					<option class="ch" id="idid1" value="avante">아반때</option>
					<option class="ch" value="sonata">소나타</option>
                    <option class="ch" value="K3">K3</option>
                    <option class="ch" value="GV80">GV80</option>
                    <option class="ch" value="QM3">QM3</option>
                    <option class="ch" value="carnival">카니발</option>
                    <option class="ch" value="ionick5">아이오닉5</option>
                    <option class="ch" value="morning">모닝</option>
                    <option class="ch" value="kaien">카이엔</option>
                    <option class="ch" value="sportage">스포티지</option>
                    <option class="ch" value="starex">스타렉스</option>
				</select>
			</div>
			
			


			<script>

					let aa = "";
					
					
					let selectmodel1 = function(value){
						console.log(value);
						aa = value;
						//$('#changeInput').val(value);
					}

					//console.log($('#changeInput').val(value));

				
					console.log(aa);

					// $('#changeTest').change(function(){
					// 	var aa = $(this).val();
					// 	console.log(aa);
						
					// })
					
			

				function detailModel(){
					
					$('#detailModelName').show();
				
					
				};
				
				
				
				
				
				$.ajax({
					url : 'modelsale',
					data : {
						checkmodels : $('aa')
						
					},
					success : function(result){
						console.log(result);
						
					}
						
				});

			</script>
			
			
			
			
			<div>
				<table class="table" style="text-align:center">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>회원아이디</th>
							<th>결재금액</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody>
					<% for(int i = 0; i < carlist.size() ; i++){ %>
						<tr>
							<td id="carreserNo<%=i%>"><%= carlist.get(i).getReservationNo()  %></td>
							<td><%= carlist.get(i).getMemberId()  %></td>
							<td>123</td>
							<td id="car<%=i%>"><button onclick="btn1(this);" type="button" class="btn btn-secondary btn1">상세보기</button></td>
						</tr>
						<% } %>
					</tbody>
				</table>
				
				
				<script>
	
					function btn1(e){
						
						//console.log($(e).parent().siblings().first().text());
						// console.log(e.target);
						
						$.ajax({
							url : 'sales2',
							data: {
								 checkReservationNo :  $(e).parent().siblings().first().text()
							},
							success : function(result){
								let resultStr = '';
								
								
								//console.log(result);
								//console.log(result['memberName'])
								//console.log(result['modelName'])
								
								//resultStr += '<tr>'
								//	  + '<td>' +'아이디 : '+ result['memberId'] + '</td>'
								//	  + '<td>' +'이름 : '+ result['memberName'] + '</td>'
								//	  + '<td>' +'모델명 :'+ result['modelName'] + '</td>'
								//	  + '<td>' +'대여날짜 : '+ result['startDate'] + '</td>'
								//	  + '<td>' +'반납날짜 : '+ result['endDate'] + '</td>'
									  
								//	  + '</tr>';
								
								//$('#reservationdetail').html(resultStr);
								$('#noneDiv').show();
								$('#detailMemberName').html(result['memberName']);
								$('#detailMemberId').html(result['memberId']);
								$('#detailModelName1').html(result['modelName']);
								$('#detailStartDate').html(result['startDate']);
								$('#detailEndDate').html(result['endDate']);
								$('#detailPhone').html(result['phone']);
								$('#detailEmail').html(result['email']);
							
						}
						});
						
						
					};
					
					function show(){
						$('#noneDiv').hide();
					}
				
				</script>
			</div>
		</div>
			
			
			
	
		

		<div id="noneDiv" class="container" style="text-align:center; display: none ; line-height:64px;">
			<h3 style="margin: 30px 0px;">상세내역</h3>
			<div><button onclick="show();" id="showDiv" style="float: right; height: 30px; text-align:center; display: flex;align-items: center; margin-bottom: 20px;">상세내역 닫기</button></div>
			<table class="table table-bordered">
			
			<thead>
			</thead>
			
				<tbody>
					<tr>
						<th>이름</th>
						<th id="detailMemberName"></th>
						<!-- <td><button type="submit" class="btn btn-secondary">수정</button></td> -->
					</tr>
					<tr>
						<th>아이디</th>
						<td id="detailMemberId"></td>
						<!-- <td><button type="submit" class="btn btn-secondary">수정</button></td> -->
					</tr>
					<tr>
						<th>모델명</th>
						<td id="detailModelName1"></td>
						<!-- <td><button type="submit" class="btn btn-secondary">수정</button></td> -->
					</tr>
					<tr>
						<th>대여한 날짜</th>
						<td id="detailStartDate"></td>
						<!-- <td><button type="submit" class="btn btn-secondary">수정</button></td> -->
					</tr>
					<tr>
						<th>반납 날짜</th>
						<td id="detailEndDate"></td>
						<!-- <td><button type="submit" class="btn btn-secondary">수정</button></td> -->
					</tr>
					<tr>
						<th>연락처</th>
						<td id="detailPhone"></td>
						<!-- <td><button type="submit" class="btn btn-secondary">수정</button></td> -->
					</tr>
					<tr>
						<th>이메일</th>
						<td id="detailEmail"></td>
						<!-- <td><button type="submit" class="btn btn-secondary">수정</button></td> -->
					</tr>
				</tbody>

			</table>
		</div>
		
	</div>
	
	
	
	
	<!-- The Modal -->
		<div class="modal" id="reserdetail">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:1000px; color:white; font-weight:bold; background:silver;">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title" style="font-size : 36px; margin-top:30px; margin-bottom:30px;">회원 상세 정보</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body" style="text-align:center; line-height:64px;">
					<h3 style="margin: 30px 0px;">상세내역</h3>
					<table class="table table-bordered"  >
					
					<thead>
					</thead>
					
						<tbody>
							<tr>
								<th>모델명</th>
								<th>연식</th>
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
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>


		<!-- <div id="top1">
	                
	                
	           
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">차 모델 검색 : </label>
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 차량의 모델명을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">기간 검색 : </label>
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 기간을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">지점 검색 : </label>
	                    <!-- 얘는 뭔가 그 지점검색 누르면 아래에 모든 지점 뜨게끔 하고 그걸 누르면 아래에 지점별 목록 뜨게끔 하고 싶음 -->
	                    <!-- <input type="text" class="form-control" id="userId" placeholder="조회하실 기간을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            
	            
			</div> -->

			
			<!-- <table class="table" style="text-align:center">
				<thead>
					<tr>
						<th>기간</th>
						<th>예약건수</th>
						<th>예약금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
					</tr>
				</tbody>
			</table>
			
			
			<table class="table" style="text-align:center">
				<thead>
					<tr>
						<th>지점</th>
						<th>예약건수</th>
						<th>예약금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
					</tr>
				</tbody>
			</table> -->
</body>
</html>