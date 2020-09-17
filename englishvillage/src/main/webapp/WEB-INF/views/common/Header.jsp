<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon"> -->
<link rel= "stylesheet" type="text/css" href="/englishvillage/resources/css/bootstrap.css?ver=1.2">
	<script type="text/javascript"
	src="/englishvillage/resources/js/bootstrap.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$('#btn1').click(function(){

		var offset = $('#div1').offset(); //선택한 태그의 위치를 반환

            //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

        $('html').animate({scrollTop : offset.top}, 400);

	});

	
	$('#changeStatusBtn').click(function(e) {
		e.preventDefault();
		
		$.ajax({
			url: "/englishvillage/tutor/changeTutorStatusCheck.do",
			type: "POST",
			data: "memberNo=" + $("#sessionNo").val() + "&statusCheck=" + $('#statusCheck').val(),
			success: function(data) {
					if($('#statusSwitch').text() == 'on'){
						$('#statusSwitch').text('off');
						$('#statusSwitch').css('color', 'red');
						$('#statusCheck').val('N');
					} else {
						$('#statusSwitch').text('on');
						$('#statusSwitch').css('color', 'green');
						$('#statusCheck').val('Y');
					}
				if(data >= 1){
					
					
				} else if(data == 0) {
					$("#emailCheck").attr("value", "Y");
					alert("실패");
				}
				
			}
			
		});
		

		
	});
});


</script>



<style>
#naviUl > li > a{

	font-size: 20px;
    font-weight: bold;
    color: white;
}

#naviUl > li > a:hover{

	color: #d9edf7;
}

a.navbar-brand.active {
    font-size: 30px;
    font-weight: bold;
    color: white;
}

.dropdown-menu {
min-width: 172px;

}

.liLeft {
float: left;
}

.liRight {
float: right;
}

.navbar {
    margin-bottom: 0px;
}
</style>

   
  
    <nav class="navbar navbar-inverse navbar-fixed-top">
    
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand active" href="/englishvillage/tutor/home.do">English Village</a>
        </div>
        
        
        <c:choose>
        	<c:when test="${member.memberGrade eq 'Y'}">
				<div id="navbar" class="navbar-collapse collapse">
	              <ul id="naviUl" class="nav navbar-nav">
	                 <li class="liLeft"><a href="/englishvillage/tutor/home.do#tutorList">튜터목록</a></li>
	                 <li>
	                	 <a id="changeStatusBtn" href="#">
	                		 강의준비
	                		 <c:choose>
	                		 	<c:when test="${tutor.statusCheck eq 'Y'}">
	                		 		<span id="statusSwitch" style="color : green">on</span>
	                		 	</c:when>
	                		 	<c:when test="${tutor.statusCheck eq 'N'}">
	                		 		<span id="statusSwitch" style="color : red">off</span>
	                		 	</c:when>
	                		 </c:choose>
	                	 </a>
	                 </li>
	                 <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${member.memberName} 튜터님 <span class="caret"></span></a>
	                    <ul class="dropdown-menu" role="menu">
	                       <li><a href="tutorMainPage.do">마이 페이지</a></li>
	                       <li><a href="tutorPrivateInfo.do">회원정보 수정</a></li>
	                       <li><a href="#">보유 포인트 : ${member.memberPoint}</a></li>
	                       <li class="divider"></li>
	                       <li><a href="tutorQnABoard.do">문의내역</a></li>
	                       <li><a href="<%=request.getContextPath()%>/auth/logout.do">로그아웃</a></li>
	                    </ul>
	                 </li>
	              </ul>
       		  </div><!--튜터네비 -->
        	</c:when>
        		
        	<c:otherwise>
        		<div id="navbar" class="navbar-collapse collapse">
		           <ul id="naviUl" class="nav navbar-nav">
		              <li class="liLeft"><a href="/englishvillage/tutor/home.do#tutorList">튜터목록</a></li>
		              <li class="liLeft"><a href="/englishvillage/tutor/tutorRegister.do">튜터신청</a></li>
		              <li class="liLeft"><a href="/englishvillage/student/buyPoint.do">수강권</a></li>
		              <li class="dropdown" style="float: right;">
		                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${member.memberName} 회원님 <span class="caret"></span></a>
		                 <ul class="dropdown-menu" role="menu">
		                    <li class="liLeft"><a href="/englishvillage/student/myPage.do">마이 페이지</a></li>
		                    <li class="liLeft"><a href="/englishvillage/student/myInfo.do">회원정보 수정</a></li>
		                    <li class="liLeft"><a href="#">보유 포인트 : ${member.memberPoint}</a></li>
		                    <li class="divider" style="clear: both;"></li>
		                    
		                    <li class="liLeft"><a href="/englishvillage/student/studyList.do">수강내역</a></li>
		                    <li class="liLeft"><a href="/englishvillage/student/questionList.do">문의내역</a></li>
		                    <li class="divider" style="clear: both;"></li>
		                    <li class="liLeft"><a href="<%=request.getContextPath()%>/auth/logout.do">로그아웃</a></li>
		               </ul>
		             </li>
		           </ul>
    		    </div><!--학생 네비-->
        	</c:otherwise>
        </c:choose>
        
      </div>
      <input id="sessionNo" type="text" value="${member.memberNo}" style="display: none; height: 0px;">
      <input id="statusCheck" type="text" value="${tutor.statusCheck}" style="display: none; height: 0px;">
      <input id="alertStr" type="text" style="display: none; height: 0px;">
      <input id="tutorPriceNum" type="text" value="${tutor.price}" style="display: none; height: 0px;">
      
    </nav>
    
    
    
    