<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>
<style type="text/css">

	#allDiv {
		width: 1600px;
	    position: absolute; 
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        margin-top: 40px;
	}
	
	.tutorProfileDiv {
		border: 1px solid black;
		width: 600px;
		height: 700px;
		font-size: 20px;
		margin-top: 200px;
		float: left;
		box-sizing: border-box;
	}
	
	
	#lineDiv {
		border-bottom: 1px solid #BDBDBD; 
	}
	
	.manual {
		margin-bottom: 80px;
	}
	
	#btn {
		float:right;
	}
	
	#btn > input {
		width: 150px;
		height: 50px;
		float: right;
		background-color: black;
		color: white;
		font-weight: bold;
		border-radius: 5px 5px/5px 5px;
		font-size: 25px;
		margin-top: 15px;
	}
	
	#memberProfileText {
		font-size: 40px;
		font-weight: bold;
	}
	
	.tutor {
		float: right;
	}
	
	
	#preview {
	border:1px solid black;
	width: 200px;
	height: 200px;
	float:left;
	position:relative;
	vertical-align: bottom;
}

#previewImg{
	width:200px;
	height: 200px;
}

#inputPhotoBtn{
	position:relative;
	top:180px; 
	right:20px;
}

.tutorInfoDiv {
	border: 1px solid black;
	width: 340px;
	height: 317px;
	margin-top: 10px;
	margin-right: auto;
	margin-left: auto;
	margin-bottom: 30px;
}

.tutorImgDiv {
	width: 340px;
	height: 200px;
}

.tutorImg{
	width: 337px;
	height: 200px;
}

.studyTitle {
	width: 300px;
	height: 40px;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 17px;
	font-weight: bold;
}

.price{
	margin-left: 10px;
	font-size: 15px;
	font-weight: bold;
}

.score{
	width : 110px;
	margin-top : 10px;
	margin-left: 10px;
	font-size: 15px;
	font-weight: bold;
	border-right: 1px solid black;
	float:left;
}

.country{
	margin-top: 10px;
	padding-left: 10px;
	float: left;
}

.tutorName {
	margin-top:7px;
	font-size: 22px;
	font-weight: bold;
	margin-right : 20px;
	float: right;
}

#contentsDiv {
	padding-top: 100px;
}

#photoAndInfoDiv {
	width: 702px;
	height: 202px;
	margin-bottom: 30px;
}

#inputPhotoDiv {
	height: 200px;
	width: 240px;
	float: left;
}

#selectPictureButton {
	width: 30px;
	height: 30px;
	border-radius: 20px;
}

#inputInfoDiv {
	height: 250px;
	width: 350px;
	float: left;
}

td {
	height: 40px;
}

#firstTd {
	width: 80px;
}

#priceInput {
	border: none;
	border-bottom: 1px solid black;
}

#titleInput {
	width: 230px;
	border: none;
	border-bottom: 1px solid black;
}

#urlInput {
	width: 230px;
	border: none;
	border-bottom: 1px solid black;
}

#tutorIntroduceBox {
	width: 550px;
	height: 200px;
	resize: none;
	border-radius: 20px;
	border: 1px solid #707070;
	padding: 20px;
}

#tutorIntroduceBoxDiv {
	margin-bottom: 20px;
	display: inline-block;
	
}

.tutor {
	color: gray;
	cursor: pointer;
}

.student {
	cursor: pointer;
}
.allManual {
	margin-left: 100px;
	margin-top: 20px;
}



input:focus {outline:none;}
textarea:focus {outline:none;}
	
</style>
<script type="text/javascript" src="/englishvillage/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		$('.layoutUl').children().eq(1).addClass('on');
		
		var toDay = new Date();
		var birthDay = $('#subAge').val().substring(24, 28);
		
		var age = (toDay.getFullYear()) - birthDay;
		$('#age').val(age);
		
	
		
		$('#tutorIntroduceBox').val($('#tutorHiddenIntroduce').val().trim());
	});
	
	function pageMoveListFnc(){

		
		var noObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
	
		var url = '';
		
		url += './tutorList.do?';
		url += 'no=' + noObj.val();
		url += '&keyword=' + keywordObj.val();
		url += ''
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;

	}
	
	function studentProfileFnc() {
		$('#studentProfileDiv').css('display','');
		$('#tutorProfileDiv').css('display','none');
		$('.tutor').css('color','gray');
		$('.student').css('color','black');
	}
	
	function tutorProfileFnc() {
		$('#studentProfileDiv').css('display','none');
		$('#tutorProfileDiv').css('display','');
		$('.tutor').css('color','black');
		$('.student').css('color','gray');
	}
	

</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/Header.jsp" />
	
	
	
		<div id="allDiv">
		
			<div id="menuDiv" class="col-md-3 layoutText">
				<div class="layoutText">
					<span>회원 관리(강사)</span>
				</div>
				<jsp:include page="/WEB-INF/views/common/adminLayoutEx.jsp" />
			</div>
			
			
			<div class="col-md-6" id='studentProfileDiv'>
			
				<form action='./tutorUpdate.do' method='get'>
				<div style="font-size: 35px; font-weight: bold;">
				
					<span class='student' onclick="studentProfileFnc()">강사 정보</span>
					<span class='tutor' onclick="tutorProfileFnc()">강사 상세 정보</span>
				</div>	
				<div id='lineDiv'>
				</div>
					<div class='allManual' style="font-size: 20px; height: 500px;">
					
						<div class="manual">
							<span>성 명:</span> 
							${memberListDto.member_name}
						</div>
						
			<%-- 			번호: ${memberListDto.no}<br> --%>
						<div class="manual">
							Email: ${memberListDto.member_email}
						</div>
						
						<div class="manual"> 
							비밀번호: ${memberListDto.password}
						</div>
						
						<div class="manual">
							성별:<c:choose>
									<c:when test="${memberListDto.gender eq 'F'}">
										<c:out value="여자"></c:out>
									</c:when>
									<c:when test="${memberListDto.gender eq 'M'}">
										<c:out value="남자"></c:out>
									</c:when>
								</c:choose>
						</div>
						
						<div class="manual">
							생년월일: <fmt:formatDate value="${memberListDto.birthDate}" pattern="yyyy.MM.dd"/>
						</div>
						
				<%-- 		언어: ${memberListDto.password}<br> --%>
						<div>
							국적: ${memberListDto.country}
						</div>
						
				<%-- 		시간대: ${memberListDto.password}<br> --%>
						
						<div>
							<input type="hidden" id='no' name="no" value="${memberListDto.no}">
							<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
							<input type="hidden" id='keyword' name="keyword" value="${keyword}">
						</div>
					</div>
					<div id='btn'>
						<input type='submit' value='수정하기' style="margin-right: 30px;">
						<input type='button' value='이전 페이지' onClick='pageMoveListFnc();' style="margin-right: 30px;">	
					</div>
				</form>
			</div>
			
			<div class='col-md-6' id='tutorProfileDiv' style="display: none;">
				<form action='./tutorProUpdate.do' method='get'>
					
					<div style="font-size: 35px; font-weight: bold;">
						<span class='student' onclick="studentProfileFnc();">강사 정보</span>
						<span class='tutor' onclick="tutorProfileFnc();">강사 상세 정보</span>
					</div>	
					
					<div id='lineDiv'>
					</div>
						<div class='allManual'>
					<div id="photoAndInfoDiv">
					
						<div id="inputPhotoDiv" class="clearfix">
						    <div id='preview'>
						        <img alt="image not found" id="previewImg"
							src="<c:url value='/img/${memberListDto.store_File_Name}'/>">
						    </div>
						</div>
						<div id="inputInfoDiv" class="clearfix">
							<table>
								<tr id="firstTr">
									<td id="firstTd">이름:</td>
									<td>${memberListDto.member_name}</td>
								</tr>
								<tr>
									<td>국적:</td>
									<td>${memberListDto.country}</td>
								</tr>
								<tr>
									<td>나이:</td>
									<td><input type="text" value="" id='age' readonly="readonly"><br></td>
								</tr>
								<tr>
									<td>수업료:</td>
									<td><input id='priceInput' type="text" name="price" value="${memberListDto.price}" readonly="readonly"> 원 / 40분</td>
								</tr>
								<tr>
									<td>강의제목:</td>
									<td><input id='titleInput' type="text" name="tutorTitle" value="${memberListDto.tutorTitle}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>URL:</td>
									<td><input id='urlInput' type="text" name="url" value="${memberListDto.url}" readonly="readonly"></td>
								</tr>
							</table>
						</div>
					   <input type="hidden" value="${memberListDto.birthDate}" id='subAge'>
				</div>
				
				<div id="tutorIntroduceBoxDiv">
					<span>소개글 :</span>
					<br>
					<textarea id="tutorIntroduceBox" rows="10" cols="30" name="tutorText"  disabled="disabled"></textarea>
				</div>
				<input type="hidden" id='tutorHiddenIntroduce'  value="${memberListDto.tutorText}">
				
						<div>
							<input type="hidden" id='no' name="no" value="${memberListDto.no}">
							<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
							<input type="hidden" id='keyword' name="keyword" value="${keyword}">
						</div>
						</div>
						<div id='btn'>
							<input type='submit' value='수정하기' style="margin-right: 30px;">
							<input type='button' value='이전 페이지' onClick='pageMoveListFnc();' style="margin-right: 30px;">	
						</div>
					</form>
				</div>
				
				
				
				
		</div>
	
</body>
</html>