<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>튜터소개수정</title>
<link rel= "stylesheet" type="text/css" href="/englishvillage/resources/css/tutor.css">
<script type="text/javascript" src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
    $('.layoutUl').children().eq(2).addClass('on');
});

function setThumbnailFnc(event) { 
    var reader = new FileReader(); 
    
    reader.onload = function(event) { 
       var img = document.getElementById("previewImg"); 
       img.setAttribute("src", event.target.result); 
 //       document.querySelector("div#image_container").appendChild(img); 
    }; 
    
    reader.readAsDataURL(event.target.files[0]); 
   }
</script>

</head>

<body>

	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">튜터소개수정</div>
				<form action="./tutorIntroduceReviseCtr.do" method="post" enctype="multipart/form-data" >
				<div id="profileImages">
				  
				    <div id='preview'>
					    <input type="hidden" name="storeFileName" value="${tutorDto.storeFileName}">
					        <img alt="image not found" id="previewImg" name="storeFileName"
							src="<c:url value='/img/${tutorDto.storeFileName}'/>">
				    </div>
				    <div id="inputPhotoBtn">
				    	<input type="file" id="uploadFile" name='profilePicture' class="hidden" onchange="setThumbnailFnc(event);"/>
						<label id="fileSelectLabel" for="uploadFile"><img id="selectPictureButton" src="/englishvillage/resources/imgs/camera.jpg"></label>
				    </div>
	
				</div>
				<div id="profileAll" style="margin-top: 50px;">
					<div class="profileInfoContents" >
						이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 : ${member.memberName}<br/>
					</div>
					<div class="profileInfoContents" >
						국&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;적 : ${member.memberCountry}<br/>
					</div>
					<div class="profileInfoContents" >
						나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 : ${tutorDto.age}<br/>
					</div>
					<div class="profileInfoContents" >
						평&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점 : ${tutorDto.score}<br/>
					</div>
					<div>
						수 &nbsp;&nbsp;업 &nbsp;료 :
						<input class="profileInfoContents" 
						style="width: 200px;" type="text" 
						value="${tutorDto.price}" name="price">
						시간/회<br/>
					</div>
					<div>
						U &nbsp;&nbsp;&nbsp;R &nbsp;&nbsp;&nbsp;L &nbsp;:
						<input class="profileInfoContents" style="width: 200px;"
						type="text" value="${tutorDto.youtubeUrl}" 
						name="youtubeUrl"><br/>
					</div>
					<div>
						강의&nbsp; 제목 : <input class="profileInfoContents" type="text" 
						style="width: 200px;"
						value="${tutorDto.studyName}" name="studyName"><br/>
					</div>
				</div>
				
				<div>
					<textarea id="introduceContents" name="tutorIntroduce" style="margin-left: 80px;">${tutorDto.tutorIntroduce}</textarea>
				</div>
				
				<input type="button" class="btn btn-success" id="backBtnMove" 
				onclick="location.href='/englishvillage/tutor/tutorIntroduce.do'" 
				value="뒤로가기">
	
				<button class="btn btn-success" id="updateBtnMove">수정완료</button>
					
				<input type="hidden" name="memberNo" value="${member.memberNo}">
				
			</form>
		</div>
	</div>


</body>

</html>