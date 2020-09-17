<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
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
		margin-top: 80px;
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
	}
	
	#memberProfileText {
		font-size: 40px;
		font-weight: bold;
	}
	
	#tutor {
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
	width:500px;
	margin-bottom: 20px;
}

.student {
	font-weight: bold;
	font-size: 35px;
	color: gray; 
}
.allManual {
	margin-left: 100px;
	margin-top: 20px;
}
.tutor {
		float: right;
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
		margin-left: 20px;
	}


input:focus {outline:none;}
textarea:focus {outline:none;}
</style>
<script type="text/javascript" src="/englishvillage/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		//이벤트와 태그를 연동시켜주는 바인딩 기술(,)에서 첫번째가 이벤트이다
		//"a[id^='delete']"는 속성선택자이다(여기서는 delete로 시작하는 모든것을 선택하는 것)
			var toDay = new Date();
			var birthDay = $('#subAge').val().substring(24, 28);
			
			var age = (toDay.getFullYear()) - birthDay;
			$('#age').val(age);
			
			$('.layoutUl').children().eq(1).addClass('on');
			
		$("a[id^='delete']").on("click", function(e) {
			e.preventDefault();//태그가 작동할 수 없게도 만들수 있는 기술-여기서는 a태그의 default를 무시하고 나의 함수를 우선시 했다
			deleteFileFnc($(this));
		});
		
		$('#tutorIntroduceBox').val($('#tutorHiddenIntroduce').val());
		
		$('#counter').html("("+$('#tutorIntroduceBox').val().length+" / 최대 200자)");
		
		$('#tutorIntroduceBox').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#counter').html("(200 / 최대 200자)");
		    }
		});
		
	});
	
	function checkFnc() {
	
		
		if($('#priceInput').val().trim() == '') {
			alert('가격을 입력해 주십시오.');
			return false;
		}else if($('#titleInput').val().trim() == '') {
			alert('강의 제목을 입력해 주십시오.');
			return false;
		}else if($('#urlInput').val().trim() == '') {
			alert('URL을 입력해 주십시오');
			return false;
		}else if($('#tutorIntroduceBox').val().trim() == '') {
			alert('소개글을 입력해 주십시오');
			return false;
		}else {
			for (var i=0; i<$("#priceInput").val().length; i++)  {
				
				var chk = $("#priceInput").val().substring(i,i+1);
				
				if(chk.match(/[a-z]|[A-Z]|[가-힣]|[ㄱ-ㅎ]|[ㅏ-ㅣ]/)){
			    	alert('제대로된 가격을 입력해주세요')
	
			        return false;
			    }		
			}
				
		}
		
		
		
	}

	
	
	function pageMoveListFnc(){
		var url = "./list.do";
		location.href = url;
	}
	
	function pageMoveDeleteFnc(no){
		
		var deleteCheck = confirm('정말 삭제하시겠습니까??');
		
		if(deleteCheck) {
			alert("삭제 되었습니다.");
		}else {
			return false;
		}
		var url = "./tutordeleteCtr.do?no=" + no;
		location.href = url;		
	}
	
	function pageMoveBeforeFnc(no) {
		var url = "./tutorListOne.do?no=" + no;
		location.href = url;
	}
	
	function deleteFileFnc(obj) {
		obj.parent().remove(); //obj는 객체이다
	}
	
	function addFileFnc() {
		var obj = $('#fileContent');
		
		var htmlStr = '';
		
		htmlStr += '<div>'
		htmlStr += '<input type="hidden" id="fileIdx" name="fileIdx" value="">';
		htmlStr += '<input type="file" id="file0" name="file0">';
		htmlStr += '<a href="#this" id="delete0">';
		htmlStr += '삭제';
		htmlStr += '</a>';
		htmlStr += '</div>'
		
		obj.html(htmlStr);
		
		//관계가 이어져 htmlStr의 모든 것을 찾아서 지운다
		$("a[id^='delete']").on('click', function(e) {
			e.preventDefault();
			deleteFileFnc($(this));
		});
	}
	
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

	<jsp:include page="/WEB-INF/views/common/Header.jsp" />
	<div id='allDiv'>
	
		<div id="menuDiv" class="col-md-3 layoutText">
			<div style="margin-bottom: 70px; font-size: 40px; font-weight: bold;">
				<span>회원 관리(강사)</span>
			</div>
			<jsp:include page="/WEB-INF/views/common/adminLayoutEx.jsp" />
		</div>
		
		<div class="col-md-6" id='studentProfileDiv'>
				
				<div id='tutorProfileDiv'>
					<form action='./tutorProUpdateCtr.do' method='post' enctype="multipart/form-data" onsubmit="return checkFnc();">
						<div style="font-size: 35px; font-weight: bold;">
						<span class='student'>강사 정보</span>
						<span class='tutor'>강사 상세 정보</span>
					</div>	
					
					<div id='lineDiv'>
					</div>
						<div class='allManual'>
					<div id="photoAndInfoDiv">
					
						<div id="inputPhotoDiv" class="clearfix">
						    <div id='preview'>
						    <input type="hidden" name="original_File_Name" value="${memberListDto.original_File_Name}">
						    <input type="hidden" name="store_File_Name" value="${memberListDto.store_File_Name}">
						        <img alt="image not found" id="previewImg"
							src="<c:url value='/img/${memberListDto.store_File_Name}'/>">
						    </div>
						    <div id="inputPhotoBtn">
						    	<input type="file" id="uploadFile" name='profilePicture' class="hidden" onchange="setThumbnailFnc(event);"/>
								<label id="fileSelectLabel" for="uploadFile"><img id="selectPictureButton" src="/englishvillage/resources/imgs/camera.jpg"></label>
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
									<td><input id='priceInput' type="text" name="price" value="${memberListDto.price}"> 원 / 40분</td>
								</tr>
								<tr>
									<td>강의제목:</td>
									<td><input id='titleInput' type="text" name="tutorTitle" value="${memberListDto.tutorTitle}"></td>
								</tr>
								<tr>
									<td>URL:</td>
									<td><input id='urlInput' type="text" name="url" value="${memberListDto.url}"></td>
								</tr>
							</table>
						</div>
					   <input type="hidden" value="${memberListDto.birthDate}" id='subAge'>
				</div>
				
				<div id="tutorIntroduceBoxDiv">
					<span>소개글 :</span>
					<textarea id="tutorIntroduceBox" rows="10" cols="30" name="tutorText"></textarea>
					<br>
					<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
				</div>
				<input type="hidden" id='tutorHiddenIntroduce' value="${memberListDto.tutorText}">
						<div>
							<input type="hidden" id='no' name="no" value="${memberListDto.no}">
							<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
							<input type="hidden" id='keyword' name="keyword" value="${keyword}">
						</div>
						</div>
							<div id='btn'>
								<input type='submit' value='수정하기'>
								<input type='button' value='회원탈퇴' onclick='pageMoveDeleteFnc(${memberListDto.no});'>
								<input type='button' value='뒤로가기' onclick='pageMoveBeforeFnc(${memberListDto.no});'>	
							</div>
						</form>
					</div>
				</div>
			</div>

</body>

</html>