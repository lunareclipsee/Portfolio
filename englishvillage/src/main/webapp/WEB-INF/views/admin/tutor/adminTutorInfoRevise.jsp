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
		width: 1500px;
	    position: absolute; 
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
	}
	
/* 	#updateDiv { */
/* 		float: left; */
/* 		width: 610px; */
/* 		height: 710px; */
/* 		border: 1px solid black; */
/* 		box-sizing: border-box; */
/* 		margin-top: 200px; */
/* 	} */
	
	#lineDiv {
		border-bottom: 1px solid #BDBDBD; 
	}
	
	.memberProfileText {
		font-size: 40px;
		font-weight: bold;
	}

	.text {
		width: 600px;
		height: 50px;
		font-size: 30px;
		margin-bottom: 40px;
	}
	#textarea {
		width:700px;
		height:550px;
		float:left;
		font-size: 30px;

	}
	
	.inpText {
		margin-left: 40px;
		width: 300px;
	}
	
	.inpBtn {
		width: 60px;
		height: 30px;
		font-size: 20px;
		font-weight: bold;
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
	
	#tutor {
		float: right;
		color: gray;
	}
</style>
<script type="text/javascript" src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('.layoutUl').children().eq(1).addClass('on');
		//이벤트와 태그를 연동시켜주는 바인딩 기술(,)에서 첫번째가 이벤트이다
		//"a[id^='delete']"는 속성선택자이다(여기서는 delete로 시작하는 모든것을 선택하는 것)
		$("a[id^='delete']").on("click", function(e) {
			e.preventDefault();//태그가 작동할 수 없게도 만들수 있는 기술-여기서는 a태그의 default를 무시하고 나의 함수를 우선시 했다
			deleteFileFnc($(this));
			
			
		});
		
		if($('#genderChange').val() == "M") {
			$('input[name="gender"]').val(['M']);
			
		}else if($('#genderChange').val() == "F"){
			$('input[name="gender"]').val(['F']);
		}
		
	});
	
function checkFinshFnc() {
		
		if(nameCompareFnc() == false || dateCompareFnc() == false || pwdChkFnc() == false) {
			if(nameCompareFnc() == false) {
				alert('이름이 유효하지 않습니다.');
			}else if(dateCompareFnc() == false) {
				alert('날짜가 유효하지 않습니다.');
			}else if(pwdChkFnc() == false) {
				alert("비밀번호에 공백이 있거나 4자리 미만 또는 8자리 초과입니다.");
			}
			return false;
		}else if(nameCompareFnc() == true &&  dateCompareFnc() == true && pwdChkFnc() == true) {
			return true;
		}
		
		return true;
		
	}
	//이름 유효성 검사
	function nameCompareFnc() {
		
		if($("#name").val().length == 0) {
			$('#nameSpan').html('이름을 정확히 입력해주세요');
			$('#nameSpan').css('color', '#FF4848');
			$('#nameSpan').css('font-size', '20px');
			
			return false;
		}
		
		if(($('#country').val() != 'KOREA')) {
		
			for (var i=0; i<$("#name").val().length; i++)  {
				
				var chk = $("#name").val().substring(i,i+1);
				
				if(chk.match(/[0-9]|[가-힣]|[ㄱ-ㅎ]|[ㅏ-ㅣ]/)){
			    	$('#nameSpan').html('이름을 정확히 입력해주세요');
					$('#nameSpan').css('color', '#FF4848');
					$('#nameSpan').css('font-size', '20px');

			        return false;
			    }
			 
			    if($("#name").val().trim() == ""){
			    	$('#nameSpan').html('이름을 정확히 입력해주세요');
					$('#nameSpan').css('color', '#FF4848');
					$('#nameSpan').css('font-size', '20px');
					
					
			        return false;
			    }
			 
			    if($("#name").val() == ""){
			    	$('#nameSpan').html('이름을 정확히 입력해주세요');
					$('#nameSpan').css('color', '#FF4848');
					$('#nameSpan').css('font-size', '20px');
					
					
			        return false;
			    }
			}
		} 

		if (true) {
			$('#nameSpan').html('올바른 이름입니다.');
			$('#nameSpan').css('color', '#74D36D');
			$('#nameSpan').css('font-size', '20px');
		}
		
		return true;
	}
	
	//비밀번호 유효성검사
	function pwdChkFnc() {
		  var passwordObj = $("#password").val();
		  var pattern = /\s/g;
		    
		  if(passwordObj.match(pattern) || passwordObj.length < 4 || passwordObj > 8) {
		    $('#passwordSpan').html('비밀번호가 올바르지 않습니다.');
			$('#passwordSpan').css('color', '#FF4848');
			$('#passwordSpan').css('font-size', '20px');
		    return false;
		  }
		 
		if(passwordObj.trim() == ""){
	    	$('#passwordSpan').html('비밀번호를 입력해주세요');
			$('#passwordSpan').css('color', '#FF4848');
			$('#passwordSpan').css('font-size', '20px');
	        return false;
	    }else {
	    	$('#passwordSpan').html('완벽한 비밀번호입니다.');
			$('#passwordSpan').css('color', '#74D36D');
			$('#passwordSpan').css('font-size', '20px');
			return true;
	    }
		
		
    }
	
	var cnt = 0;
	//날짜 유효성 검사
	function dateCompareFnc() {
		
		var date = new Date;
		var todayYear = date.getFullYear();
		var todayMonth = date.getMonth() + 1;
		var todayDate = date.getDate();
		
		var today = todayYear + '-' + todayMonth + '-' + todayDate;

		cnt++;
			if($('#birthDateChoose').val() > today) {
				$('#dateSpan').html('현재 날짜보다 날짜가 커서 다시 수정해주시길 바랍니다.');
				$('#dateSpan').css('color', '#FF4848');
				$('#dateSpan').css('font-size', '20px');
				return false;
			}else if($('#birthDateChoose').val() < today && cnt >= 1) {
				$('#dateSpan').html(' 유효한 날짜입니다.');
				$('#dateSpan').css('color', '#74D36D');
				$('#dateSpan').css('font-size', '20px');
				return true;
			
			}
			
			return true;
		}
	
	
	function pageMoveListFnc(){
		var url = "./list.do";
		location.href = url;
	}
	
	function pageMoveDeleteFnc(no){
		
		if(confirm('정말 삭제하시겠습니까??') == true) {
			alert("삭제 되었습니다.");
		}else {
			return false;
		}
		alert();
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
	
</script>

</head>

<body>

	
	<jsp:include page="/WEB-INF/views/common/Header.jsp" />
	<div id="allDiv">
	
		<div id="menuDiv" class="col-md-3">
			<div class="layoutText">
				<span>회원 관리(강사)</span>
			</div>
			<jsp:include page="/WEB-INF/views/common/adminLayoutEx.jsp" />
		</div>
		
		<div id='updateDiv' class="col-md-6">
			<form action='./tutorUpdateCtr.do' method='post'
			enctype="multipart/form-data" onsubmit="return checkFinshFnc()">
				<span class='memberProfileText'>강사 정보</span>
				<span class='memberProfileText' id='tutor'>강사 상세 정보</span>
				<div id='lineDiv'></div>
				<div id='textarea' style="margin-top: 20px;">
					<div class='text'>
						<span>성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 :</span> 
						<input class='inpText' id='name' type='text' name='member_name' value='${memberListDto.member_name}'>
						<input class='inpBtn' type="button" onclick="nameCompareFnc()" value="확 인" style="float: right;">
						<br>
						<span id='nameSpan'></span>
						<br>
					</div>
					<div class='text'>
						<span>E&nbsp;&nbsp;&nbsp;- &nbsp;&nbsp;&nbsp;mail :</span> 
						<input class='inpText' id='email' type="email" name='member_email' value='${memberListDto.member_email}'>
						<span id='emailSpan'></span>
						<br>
					</div>
					<div class='text' >
						<span>비 밀 번 호 :</span> <input class='inpText' type='text' id='password' name='password' value='${memberListDto.password}'>
						<br>
						<span id='passwordSpan'></span>
						<br>
					</div>
					<div class='text'>
						<span>성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별 :</span>
						<input type="hidden" id='genderChange' value='${memberListDto.gender}'>
						<input type="radio" class='menCheck' name='gender' value="M" style="margin-left: 40px;">남자
						<input type="radio" class='girlCheck' name='gender' value="F">여자
						<span id='genderSpan'></span>	
						<br>
					</div>
					<div class='text'>
						<span>생 년 월 일 :</span> 
						<input class='inpText' id="birthDateChoose" type="date"  name="birthDate"
							value="<fmt:formatDate value='${memberListDto.birthDate}' pattern='yyyy-MM-dd'/>">
							<input class='inpBtn' type="button" onclick="dateCompareFnc()" value="확 인" style="float: right;">
							<br>
							<span id='dateSpan'></span>
							<br>
					</div>
					
					<div class='text'>
						<span>국 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;적 :</span>
						<select name='country' style="margin-left: 40px;">
							
							<option value="England"
							<c:if test="${memberListDto.country eq 'England'}">selected</c:if>>England</option>
							<option value="USA"
							<c:if test="${memberListDto.country eq 'USA'}">selected</c:if>>USA</option>
							<option value="Ireland"
							<c:if test="${memberListDto.country eq 'Ireland'}">selected</c:if>>Ireland</option>
							<option value="Canada"
							<c:if test="${memberListDto.country eq 'Canada'}">selected</c:if>>Canada</option>
						</select>
						<input class='inpText' id='country' type="hidden" value='${memberListDto.country}'> 
						<span id='nameSpan'></span>
						<br>
					</div>
					<input type="hidden" name='no' value='${memberListDto.no}'>
				</div>
				
				<div id='btn'>
					<input type='submit' id='adjust' value='수정하기'>
					<input type='button' value='회원탈퇴' onclick='pageMoveDeleteFnc(${memberListDto.no});'>
					<input type='button' value='뒤로가기' onclick='pageMoveBeforeFnc(${memberListDto.no});'>	
				</div>
			
			</form>
		</div>
	</div>
	
	
<%-- 	<jsp:include page="/WEB-INF/views/Tail.jsp" /> --%>
</body>
</html>