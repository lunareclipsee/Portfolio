<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<title>댓글 달기</title>

<style type="text/css">

	textarea {
		border: 1px solid black;
	}
	#allDiv {
		width: 1500px;
	    position: absolute; 
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
	}

	#lineDiv {
		border-bottom: 1px solid #BDBDBD; 
	}
	#btnDiv {
		margin-top: 20px;
	}
	#btnDiv > input {
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
	
	#replyadd {
		font-size: 40px;
		font-weight: bold;
	}
	
</style>
<script type="text/javascript" src="/englishvillage/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$('.layoutUl').children().eq(2).addClass('on');
		//이벤트와 태그를 연동시켜주는 바인딩 기술(,)에서 첫번째가 이벤트이다
		//"a[id^='delete']"는 속성선택자이다(여기서는 delete로 시작하는 모든것을 선택하는 것)
		$("a[id^='delete']").on("click", function(e) {
			e.preventDefault();//태그가 작동할 수 없게도 만들수 있는 기술-여기서는 a태그의 default를 무시하고 나의 함수를 우선시 했다
			deleteFileFnc($(this));
		});
		
		$('#reply').focus();
		
		if($('#answerStatus').val() == 'Y') {
			$('#reply').attr('readonly', 'readonly');
		}
		
		$('#reply').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#counter').html("(200 / 최대 200자)");
		    }
		});
		
	});
	
	
	function replyChkFnc() {
		if($('#reply').val().trim() == '') {
			alert('답글을 달아주십시오');
			return false;
		}
	}
	function pageMoveBeforeFnc(no) {
		var url = "./questionList.do?no=" + no;
		location.href = url;
	}
	
	function pageMoveListFnc(){

		
			var noObj = $('#no');
			var keywordObj = $('#keyword');
			var searchOptionObj = $('#searchOption');
			
	
			
			var url = '';
			
			url += './questionList.do?';
			url += 'no=' + noObj.val();
			url += '&keyword=' + keywordObj.val();
			url += '&searchOption=' + searchOptionObj.val();
			
			location.href = url;

	}
</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/common/Header.jsp" />
	
	
	<div id='allDiv'>
	
		<div id="menuDiv" class="col-md-3">
			<div class="layoutText">
				<span>문의 게시판</span>
			</div>
			<jsp:include page="/WEB-INF/views/common/adminLayoutEx.jsp" /> 
		</div>
		<div id='qnaTable'  class="col-md-6" >
		<span id='replyadd'>답글 달기</span>
		<div id='lineDiv'></div>
			<form action='./replyAddCtr.do' method='post' enctype="multipart/form-data" onsubmit="return replyChkFnc()">
				<div style="width: 600px; height: 30px; border-bottom: 1px solid #BDBDBD; margin: auto; margin-top: 20px;">
					<div style="float: left;">
						<span>글번호:</span> 
						<input type='text' name='idx' value='${questionBoardDto.idx}' style="margin-left: 25px;" readonly="readonly">
					
						<br>
					</div>
					<div style="float: right;">
						<span>작성일:</span> 
						<input type='text' name='boardCreateDate'  value='<fmt:formatDate value="${questionBoardDto.boardCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>' readonly="readonly" style="width: 150px; margin-right: 30px;">
						<br>
					</div>
				</div>
				<div style="clear:left; width: 600px; height: 30px; border-bottom: 1px solid #BDBDBD; margin: auto; margin-top: 20px;">
					<div style="float: left;">
						<span>회원 번호:</span> 
						<input type='text'  name='no' value='${questionBoardDto.no}' style="margin-left: 7px;" readonly="readonly">
						<br> 
					</div>
					<div style="float: right;">
						<span>회원 등급:</span> 
						<span style="margin-right: 145px;">
						<c:choose>
								<c:when test="${questionBoardDto.grade eq 'Y'}">
									<c:out value="강 사"></c:out>
								</c:when>
								<c:when test="${questionBoardDto.grade eq 'N'}">
									<c:out value="학 생"></c:out>
								</c:when>
							</c:choose>
						</span>
						<input type='hidden' name='grade' value='${questionBoardDto.grade}'>
						<br>
					</div>
				</div>
				<div style="clear:left; width: 600px; height: 30px; border-bottom: 1px solid #BDBDBD; margin: auto; margin-top: 20px;">
					<div style="float: left;">
						<span>회원 이름:</span> 
						<input type='text' name='name' value='${questionBoardDto.name}' style="margin-left: 7px;" readonly="readonly">
						<br>
					</div>
					<div style="float: right;">
						<span>이 메 일 :</span> 
						<input type='text' name='email' value='${questionBoardDto.email}' readonly="readonly" style="width: 150px; margin-right: 30px;">
						<br>
					</div>
				</div>
			
				<div style="clear:left; width: 600px; height: 30px; border-bottom: 1px solid #BDBDBD; margin: auto; margin-top: 20px;">
					<span>글 제 목 :</span> 
					<input type='text' name='title' value='${questionBoardDto.title}'  style="margin-left: 14px; width: 500px;" readonly="readonly">
					<br>
				</div>
				
				<div style="width: 600px; height: 110px; border-bottom: 1px solid #BDBDBD; margin: auto; margin-top: 20px;">
					<div style="float: left;">
						<span>내 용 :</span>
					</div>
					<div style="float:left; margin-left: 5px;">
						<textarea rows="10" cols="30" id='content' name='content' style="margin-left: 31px; width: 500px; height: 80px; resize: none;" readonly="readonly">${questionBoardDto.content}</textarea>
					</div>
				</div>
				
				<div style="width: 600px; height: 110px; border-bottom: 1px solid #BDBDBD; margin: auto; margin-top: 20px;">
					<div style="float: left;">
						<span>답 글 :</span> 
					</div>
					<div style="float:left; margin-left: 5px;">
						<textarea rows="10" cols="30" id='reply' name='reply' style="margin-left: 31px; width: 500px; height: 80px; resize: none;">${questionBoardDto.reply}</textarea>
						<br>
						<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>

					</div>
					<input type="hidden" id='answerStatus' name='answerStatus' value="${questionBoardDto.answerStatus}">
					<br>
				</div>
		
				<div>
					<input type="hidden" id='no' name="no" value="${questionBoardDto.no}">
					<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}"> 
					<input type="hidden" id='keyword' name="keyword" value="${keyword}">
				</div>
				
				<div id='btnDiv'>
					<input type='button' value='뒤로가기' onclick='pageMoveBeforeFnc(${questionBoardDto.no});'>	
					<c:if test="${questionBoardDto.answerStatus eq 'N'}">
						<input type="submit" value="답변하기">
					</c:if>
				</div>
			
			</form>
		</div>
	</div>
	
</body>
</html>