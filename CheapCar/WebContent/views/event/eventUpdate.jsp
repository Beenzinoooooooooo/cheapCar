<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.kh.semi.event.model.vo.EventBoard, com.kh.semi.event.model.vo.EventPhoto"%>

<%
	EventBoard eBoard = (EventBoard)request.getAttribute("eBoard");
	ArrayList<EventPhoto> list = (ArrayList<EventPhoto>)request.getAttribute("list");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트게시글 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">

<style>
	.outer{
		width: 1200px;
		height: auto;
		margin: auto;
		padding-bottom: 50px;
	}
    .content_outer{
        width: 90%;
        height: 1000px;
        margin-top: 50px;
        float: right;
    }
    .content_outer div{
        width: 100%;
        font-family: "Do Hyeon", sans-serif;
    }
    .content_header{
        width: 100%;
        height: 80px;
        float: left;
    }
    .content_header>div{
        height: 100%;
        float: left;
        border-bottom: 4px solid #b1d6f3;
    }
    .content_header1{
        width: 10%;
        
        float: left;
        text-align: center;
        font-size: 30px;
        padding-top: 15px;
        font-weight: bold;
    }
    .content_header2{
        width: 90%;
        float: left;
        text-align: left;
        padding-left: 20px;
        font-size: 40px;
        padding-top: 10px;
        text-align: center;
        border-bottom: 4px solid #b1d6f3;
    }
    .content_sub{
        text-align: right;
        padding-right: 30px;
        
        
    }
    .content_sub1{
        opacity: 0.8;
    }
    .content_body{
        height: auto;
        padding-left: 50px;
        padding-top: 50px;
        border-bottom: 2px solid #b1d6f3;
        font-size: 20px;
        
    }
    .page-header{
		padding-top: 20px;
		font-size: 40px;
		font-weight: bold;
		border-bottom: 8px solid #b1d6f3;
	}
	#title{
		background-color: aquamarine;
		font-size: large;
		font-weight: bolder;
	}
	#write{
		text-align: right;
		padding-right: 0%;
		margin-bottom: 2px;
	}
	.search-area{
		text-align: center;
		margin-top: 10px;
	}
    
	.do-hyeon-regular {  /* 이벤트 글꼴 */ 
		font-family: "Do Hyeon", sans-serif;
		font-weight: 300px;
		font-style: normal;
		font-size: 60px;
		color: #6caddf;
	}
	.content_add_img{
		padding-top: 20px;
		padding-bottom: 40px;
	}
	.img-area>img{
		width: 100%;
		height: 100%;
	}
    .form-control{
        height: auto;
    }
	
    

</style>
</head>
<body>

	<%@ include file="../common/menuBar.jsp" %>
	
	<div class="outer" >
		<div class="row">
		  <div class="col-lg-1">
		  </div>
			 <div class="col-lg-10">
				<div class="panel-body">
				<h2 class="page-header do-hyeon-regular" align="left">이&nbsp;벤&nbsp;트</h2>
				</div> 
                    <div class="content_outer">
                        <form action="<%=contextPath%>/update.event" method="post" id="insert-form" enctype="multipart/form-data">
                            <input type="hidden" name="userNo" value="<%= loginUser.getMemberNo() %>" />
                            <div class="content_header"> 
                            
                            <div class="content_header2">
		    					제목 : <input type="text" name="title" required><%= eBoard.getEventTitle() %> 
			    			</div>
                            </div>
	                        <div class="content_sub">
	                            <span class="content_sub1">작성자 : <%= loginUser.getMemberName() %></span> 
	                        </div>
	                        <div class="content_body">
	                        <div class="img-area" align="center" id="imgArea">
	                          <% for(int i = 0; i < list.size(); i++){ %>
								<img src="<%=contextPath%>/<%= list.get(i).getPhotoPath() %>/<%= list.get(i).getPhotoCname() %>" id="img_<%=i+1%>"/>
							  <% }%>
								
							</div>
	                        <div class="text-area">
	                            <textarea name="content" class="form-control" rows="20" id="comment"><%= eBoard.getEventContent() %></textarea>
	                        </div>
	                        </div>
	                    
						    <div class="content_add_img">
	                            <span id="addInfo" > ※ 첨부파일은 최대 4개까지만 가능합니다. </span> <br><br>
	                            대표이미지 - <input type="file" name="photo1" id="thumbnail" onchange="loadImg(this, 1)" required>
	                            첨부파일_2 - <input type="file" name="photo2" id="subImg1" onchange="loadImg(this, 2)"> <br><br>
	                            첨부파일_3 - <input type="file" name="photo3" id="subImg2" onchange="loadImg(this, 3)">
	                            첨부파일_4 - <input type="file" name="photo4" id="subImg3" onchange="loadImg(this, 4)">

						    </div>
                    

	                        <div class="content_btn" align="center">
	                            <button type="submit" class="btn btn-sm btn-primary">등록하기</button>
                            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back()">뒤로가기</button>
	                        </div>
                        </form>
                    </div>
				</div>            
			 </div>
		  </div>
					  
	</div>
	
	<script>
		

		
        function loadImg(inputFile, num){
            //console.log(inputFile.files.length);
            if(inputFile.files.length){
            	
                const reader = new FileReader();
                //console.log(inputFile.files[0]);
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                    switch(num){
                    	case 1 : $('#img_1').attr('src', e.target.result); break; 
                    	                            			  
                    	case 2 : $('#img_2').attr('src', e.target.result); break;
                    			 
                    	case 3 : $('#img_3').attr('src', e.target.result); break;
                    	   	      
                    	case 4 : $('#img_4').attr('src', e.target.result); break;
                    	         
                    }
                    
                }
            }
            else{
            	const str = ''
            	
            	switch(num){
            		case 1 : $('#img_1').attr('src', str); break;
            		case 2 : $('#img_2').attr('src', str); break;
            		case 3 : $('#img_3').attr('src', str); break;
            		case 4 : $('#img_4').attr('src', str); break;
            	};
            }
        }
        
        
        
		
        

        


	</script>
	
		
	
</body>
</html>