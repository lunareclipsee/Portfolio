<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	
	#mainBox {
		height: 600px;
		width: 400px;
 		position: absolute; 
 		top: 50%;
 		left: 50%;
 		transform: translate(-50%, -50%);
 		background-color: white;
	}
	
	#secondBox {
		display: flex;
		justify-content: center;
		align-items: center;
		font-weight: bold;
	}
	
	#titleBox {
		background-color: black;
		color: white;
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 70px;
		text-align: center;
	}
	
	#subTitleBox {
		font-size: 25px;
		font-weight: bold;
		padding-left: 37px;
		margin-bottom: 20px;		
	}
	
	.emailPwdBox {
		width: 300px;
		height: 40px;
		margin-bottom: 10px;
		background-color: #E1E1E1;
		border: none;
		padding-left: 10px;
	}
	
	#loginBtn {
		width: 312px;
		height: 40px;
		margin-bottom: 20px;
		font-size: 17px;
		font-weight: bold;
		border: none;
		background-color: black;
		color: white;
	}
	
	.findPwdAndRegister {
		width: 148px;
		height: 40px;
		margin-right: 10px;
 		font-weight: bold; 
 		border: none;
 		background-color: black;
		color: white;
	}
</style>
<script type="text/javascript">
	function moveCommonRegister() {
		location.href = "./commonRegister.do";
	}
	function moveFindPwd() {
		location.href = "./findPassword.do";
	}
	

	/* 로그인 유효성 */
	function loginBtn(){
		var memberEmailObj = document.getElementById('memberEmail');
		var memberPwdObj = document.getElementById('memberPwd');
		
		if(memberEmailObj.value.length == 0){		
			alert("ID를 입력해주세요.");
			return false;
		} else if(memberPwdObj.value.length == 0){		
			alert("패스워드를 입력해주세요.");
			return false;
		}
		
	}
	
	
</script>

</head>
<body style="background-color: #EEEEEE;">

	<div id="mainBox">
		<div id="titleBox">
			<span>ENGLISH VILLAGE</span>
		</div>
		<div id="subTitleBox">
			<span>로그인</span>
		</div>
		<!-- 이메일, 비밀번호 입력란  -->
		<div id="secondBox">
			<form action="/englishvillage/auth/loginCtr.do" method="post" onsubmit=" return loginBtn();">
				<div>
					<div>
						<span>이메일</span>
					</div>
					<div>
						<input class="emailPwdBox" id="memberEmail" type="email"
							name="memberEmail" placeholder="이메일을 입력하세요" value="smith@gmail.com">
					</div>
					<div>
						<span>비밀번호</span>
					</div>
					<div style="margin-bottom: 20px;">
						<input class="emailPwdBox" id="memberPwd" type="password" name="memberPassword" 
							placeholder="비밀번호를 입력하세요" value="test1">
					</div>
				</div>
				<!-- 로그인 버튼, 비밀번호찾기 버튼, 회원가입 버튼  -->
				<div>		
					<div>
						<input id="loginBtn" type="submit" value="로그인">
					</div>
				</div>
				<div>
					<div>
						<input class="findPwdAndRegister" type="button" value="비밀번호 찾기" onclick="moveFindPwd();">
						<input class="findPwdAndRegister" type="button" value="회원가입" onclick="moveCommonRegister();">
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

</html>