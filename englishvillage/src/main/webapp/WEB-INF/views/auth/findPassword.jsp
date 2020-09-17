<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	
	.thirdBox {
		display: flex; 
		justify-content: flex-start;		
	}
	
	#titleBox {
		background-color: black;
		color: white;
		font-size: 40px;
		font-weight: bold;
		text-align: center;
		margin-bottom: 70px;
	}
	
	#subTitleBox {
		font-size: 25px;
		font-weight: bold;
		padding-left: 37px;
		margin-bottom: 20px;		
	}
	
	.oneInputBox {
		width: 300px;
		height: 40px;
		margin-bottom: 10px;
		background-color: #E1E1E1;
		border: none;
		padding-left: 10px;
	}
	
	.twoInputBoxBtn {
		width: 152px;
		height: 40px;
		margin-right: 10px;
/* 		margin-top: 10px;  */
		text-align: center;
		font-weight: bold;
		background-color: black;
		color: white;
		border: none;
		
	}
	
</style>
<script type="text/javascript">
	function backPageBtn() {
		location.href = "login.do";
	}

	
	/* 비밀번호 찾기 유효성 */
	function findPasswordBtn(){
		var memberNameObj = document.getElementById('memberName');
		var memberEmailObj = document.getElementById('memberEmail');
		var memberBirthDateObj = document.getElementById('memberBirthDate');
		
		if(memberNameObj.value.length == 0){
			alert("이름을 입력해주세요.");
			return false;
		} else if(memberEmailObj.value.length == 0){		
			alert("이메일을 입력해주세요.");
			return false;
		} else if(memberBirthDateObj.value.length == 0){		
			alert("생일을 입력해주세요.");
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
			<span>비밀번호 찾기</span>
		</div>
		<div id="secondBox">
			<form action="./findPasswordCtr.do" method="post" onsubmit="return findPasswordBtn();">
				<div>
					<div>
						<span>이름</span>
					</div>
					<div>
						<input class="oneInputBox" id="memberName" type="text" name="memberName" placeholder="이름을 입력하세요">
					</div>
				</div>
				<div>
					<div>
						<span>이메일</span>
					</div>
					<div>
						<input class="oneInputBox" id="memberEmail" type="email" name="memberEmail" placeholder="이메일을 입력하세요">
					</div>
				</div>
				<div>
					<div>
						<span>생년월일</span>
					</div>
					<div style="margin-bottom: 10px;">
						<input class="oneInputBox" id="memberBirthDate" type="date" name="memberBirthDate" placeholder="생년월일을 입력하세요"
								style="width: 303px;color: gray;">
					</div>
					<div class="thirdBox">
						<div>
							<input class="twoInputBoxBtn" type="button" value="뒤로가기" onclick="backPageBtn();">
						</div>
						<div>
							<input class="twoInputBoxBtn" type="submit" value="입력완료">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

</html>