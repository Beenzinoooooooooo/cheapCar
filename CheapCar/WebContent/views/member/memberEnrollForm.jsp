<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<style>
		#enroll-form input{
			margin : 8px;
		}
	</style>
<body>

	<%@ include file="../common/menuBar.jsp" %>

	<section style="background-color: #eee;  height: 100%;"><!--class="vh-100"-->
		<div class="container h-100">
		  <div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-lg-12 col-xl-11">
			  <div class="card text-black" style="border-radius: 25px;">
				<div class="card-body p-md-5">
				  <div class="row justify-content-center">
					<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
	  
					  <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4" style="font-weight: 800;">회원가입 </p>
	  
					  <form id="enroll-form" method="post" action="${ path }/insert">
	  
						<div class="d-flex flex-row align-items-center mb-4">
						  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
						  <div class="form-outline flex-fill mb-0">
							<label class="form-label" for="form3Example1c" style="padding-left:10px;">아이디 : </label>
							
							<input type="text" class="form-control" id="memberId" maxlength="15" required name="memberId" placeholder="4~15글자 사이로 입력">
							&nbsp;&nbsp;<button type="button" onclick="idCheck();">중복확인</button>
						  </div>
						</div>


	  
						<div class="d-flex flex-row align-items-center mb-4">
						  <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
						  <div class="form-outline flex-fill mb-0">
							<label class="form-label" for="form3Example4c" style="padding-left:10px;">비밀번호</label>
							<input type="password" class="form-control" id="memberPwd" maxlength="15" required name="memberPwd" placeholder="4~15글자 사이로 입력">
						  </div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
						  <i class="fas fa-key fa-lg me-3 fa-fw"></i>
						  <div class="form-outline flex-fill mb-0">
							<label class="form-label" for="form3Example4cd" style="padding-left:10px;">비밀번호&nbsp;확인</label>
							<input type="password" id="checkPwd"  class="form-control" maxlength="30" required>
						  </div>
						</div>


						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
							  <label class="form-label" for="form3Example4cd" style="padding-left:10px;">이름 </label>
							  <input type="text" id="memberName" class="form-control" maxlength="30" required name="memberName">
							</div>
						  </div>

						  <div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-key fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
							  <label class="form-label" for="form3Example4cd" style="padding-left:10px;">생년월일</label>
							  <input type="text" id="birthday" class="form-control" placeholder="-포함해서 입력해주세요." required name="birthday">
							</div>
						  </div>



						  <div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-key fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
							  <label class="form-label" for="form3Example4cd" style="padding-left:10px;">전화번호</label>
							  <input type="text" id="phone" class="form-control" placeholder="-포함해서 입력해주세요." required name="phone">
							</div>
						  </div>

						  <div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-key fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
							  <label class="form-label" for="form3Example4cd" style="padding-left:10px;">생년월일</label>
							  <input type="text" id="birthday" class="form-control" placeholder="-포함해서 입력해주세요." required name="birthday">
							</div>
						  </div>


						  <div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-key fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
							  <label class="form-label" for="form3Example4cd" style="padding-left:10px;">이메일</label>
							  <input type="email" id="email" class="form-control" placeholder="@포함해서 입력해주세요." required name="email">
							</div>
						  </div>

	  

	  
						<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
						  <button type="reset" class="btn btn-danger btn-lg">취소</button>&nbsp;&nbsp;
						  <button id="submit" class="btn btn-info btn-lg" type="submit" disabled>회원가입</button>
						</div>
	  
					  </form>
	  
					</div>
					<!-- <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
					  <img src="https://skygame24.com/UploadFiles/20200702025400%eb%93%9c%eb%a6%ac%ed%94%84%ed%8a%b8.gif"
						class="img-fluid" width="100%" alt="칸세이 드리프트~">
					</div> -->
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </section>


	  


	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	

			<script>

				function idCheck(){
					
					const $memberId = $('#enroll-form input[name=memberId]');

					$.ajax({
						url : 'idCheck.do',
						data : {checkId : $memberId.val()},
						success : function(result){
							//console.log(result);
								
							if(result == 'NNN'){
								alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
								
								$memberId.val('')
							}
							else{
								
								if(confirm('사용 가능합니다 사용하시겠습니까?')){
									
									$memberId.attr('readonly', true);
									
									$('#enroll-form button[type=submit]').removeAttr('disabled');
									
								} else{
									$memberId.focus();
								}
							}
						}
					});
				}

				$(function(){

					var memberIdCheck = /^[a-zA-Z0-9]{4,15}$/;
					var memberPwdCheck = /^[a-zA-Z0-9]{4,15}$/;
					var memberNameCheck = /^[가-힣]{2,6}$/;
					var birthdayCheck = /^(19[0-9]{2}|20[0-9]{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
					//  regExp = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])-[1-4]\d{6}$/;
					var phoneCheck = /^01[0179]-[0-9]{4}-[0-9]{4}$/;
					var emailCheck = /^[a-zA-Z0-9]{2,20}@[a-z]{2,5}.[a-z]{3}$/;

					$('#memberId').blur(function(){
						
						var idvalue = $('#memberId').val();

						if(!memberIdCheck.test(idvalue)){
							alert('아이디를 제대로 입력해주세요');
							$('#memberId').val("");
						} 
					});

					$('#memberPwd').blur(function(){

						var pwdvalue = $('#memberPwd').val();

						if(!memberPwdCheck.test(pwdvalue)){
							alert('비밀번호를 제대로 입력해주세요');
							$('#memberPwd').val("");
						}

					});

					$('#checkPwd').blur(function(){
						if($('#memberPwd').val() != $('#checkPwd').val()){

						alert('입력하신 비밀번호와 다릅니다 다시입력해주세요.');
						$('#checkPwd').val("");
						}
					});
					
					$('#memberName').blur(function(){

						var namevalue = $('#memberName').val();

						if(!memberNameCheck.test(namevalue)){
							alert('이름은 한글 2~6글자입니다. 다시입력해주세요.');
							$('#memberName').val("");
						}
					});

					$('#birthday').blur(function(){

						var birthdayvalue = $('#birthday').val();

						if(!birthdayCheck.test(birthdayvalue)){
							alert('생년월일을 다시입력해주세요.');
							$('#birthday').val("");
						}

					});

					$('#phone').blur(function(){

						var phonevalue = $('#phone').val();

						if(!phoneCheck.test(phonevalue)){
							alert('전화번호를 다시입력해주세요');
							$('#phone').val('');
						}

					});

					$('#email').blur(function(){

						var emailvalue = $('#email').val();

						if(!emailCheck.test(emailvalue)){
							alert('이메일을 다시입력해주세요.');
							$('#email').val('');
						}
					});
				});

			</script>
			
</body>
</html>