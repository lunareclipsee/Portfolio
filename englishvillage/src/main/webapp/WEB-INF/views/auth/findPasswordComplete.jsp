<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>비밀번호 찾기 성공</title>
<style type="text/css">
	
	#mainBox {
		height: 500px;
		width: 400px;
 		position: absolute; 
 		top: 50%;
 		left: 50%;
 		transform: translate(-50%, -50%);
 		background-color: white;
	}
	
	#titleBox {
		background-color: black;
		color: white;
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 100px;
		text-align: center;
	}
	
	#subTitleBox {
		font-size: 25px;
		font-weight: bold;
		margin-bottom: 40px;
		text-align: center;		
	}
	
	
	#loginBtn {
		width: 300px;
		height: 45px;
		font-size: 18px;
		font-weight: bold;
		margin-top: 50px;
		border: none;
		background-color: black;
		color: white;
	}

	.nameNemailBold {
		font-weight: bold;
		color: blue;
	}

</style>
<script type="text/javascript">
	function moveLoginBtn() {
		location.href = "login.do";
	}

</script>

</head>
<body style="background-color: #EEEEEE;">

	<div id="mainBox">
		<div id="titleBox">
			<span>ENGLISH VILLAGE</span>
		</div>
		<div id="subTitleBox">
			<span>비밀번호 찾기 완료</span>
		</div>
			<div  style="text-align: center;">
<!-- 				<span><span class="nameNemailBold">고재민</span>님의  -->
<!-- 					  <span class="nameNemailBold">letzkoh@gmail.com</span>로<br><br>  -->
<!-- 					  	비밀번호를 발송하였습니다. -->
<!-- 				</span><br><br> -->
<!-- 				<span>로그인 후 서비스를 이용하실 수 있습니다.</span><br> -->
				
			<span><span class="nameNemailBold">${memberDto.memberName}</span>님의 
				  <span class="nameNemailBold">${memberDto.memberEmail}</span>로<br>
				  	비밀번호를 발송하였습니다.
			</span><br><br>
			<span>로그인 후 정상적으로 서비스를 이용하실 수 있습니다.</span><br>
				
				
			</div>
			<div style="display: flex; justify-content: center;">		
				<div>
					<input id="loginBtn" type="button" value="로그인 페이지로 이동" onclick="moveLoginBtn();">
				</div>
			</div>
	</div>

</body>

</html>