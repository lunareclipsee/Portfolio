<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	#contentsDiv{
		width: 1500px;
		height: 900px;
		margin : 200px auto 0px auto;
		text-align: center;;
	}
	
	#errorImgDiv > img {
		width: 50%;
		height: 50%;
	}
	

	#btnsDiv{
	margin-left : 400px;
	cursor: pointer;
	}

</style>

<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

	function moveMainPageFnc() {
		
		location.href = "/englishvillage/tutor/home.do";
		
	}
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/Header.jsp" />
	<div id="contentsDiv">
		<div id="errorImgDiv">
			<img src="/englishvillage/resources/imgs/404error.jpg" alt="Second slide">
		</div>
		<div id="btnsDiv">
			<img src="/englishvillage/resources/imgs/mainMove.png" alt="Second slide" onclick="moveMainPageFnc()">
		</div>	
	</div>

</body>

</html>