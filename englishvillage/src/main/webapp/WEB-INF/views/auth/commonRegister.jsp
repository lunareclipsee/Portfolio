<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	
	#mainBox {
		height: 800px;
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
		margin-bottom: 10px;
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
		background-color:#E1E1E1;
		border: none;
		padding-left: 10px;
	}

	#emailCheckBtn {
		width: 100px;
		height: 42px;
		margin-bottom: 10px;
		background-color: #FFE146;
		border: none;
		font-size: 12px;
	}
	
	.twoInputBox {
		width: 141px;
		height: 40px;
		margin-right: 10px;
		background-color: #E1E1E1;
		border: none;
		padding-left: 10px;
	}
		
	.twoInputBoxBtn {
		width: 153px;
		height: 40px;
		margin-right: 10px;
		margin-top: 10px; 
		text-align: center;
		font-weight: bold;
		border: none;
		background-color: black;
		color: white;
	}
	
	.verifyNumBtn {
		width: 100px;
		height: 42px;
		margin-right: 10px;
		text-align: center;
		background-color: #FFE146;
		border: none;
	}
	
	#inputVerifyNum {
		width: 80px;
		height: 40px;
		margin-right: 10px;
		text-align: center;
		background-color: #E1E1E1;
		border: none;
		padding-left: 10px;
	}
	
	#selectCountry {
		width: 203px;
		height: 40px;
		margin-right: 10px;
		border: none; 
		background-color: #E1E1E1;
		color: gray;
		padding-left: 10px;
	}

	#selectGender {
		width: 100px;
		height: 40px;
		border: none; 
		background-color: #E1E1E1;
		color: gray;
		padding-left: 10px;
	}

</style>
<script type="text/javascript" src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">


	$(document).ready(function() {
		
		var verifyNum = Math.floor(Math.random() * 9999);
		
		$('#sendVerifyNum').val(verifyNum);
				
		$('#requestNumBtn').click(function() {
			
			
			$.ajax({
			      url : "/englishvillage/auth/authSendMailVerifyNumCtr.do",
			      type : "POST",
			      data : "memberEmail=" + $('#memberEmail').val() + "&verifyNum=" + $('#sendVerifyNum').val(),
			      success : function(data) {
			    	  
		          console.log("1 = 이메일 o / 0 = 이메일 x : "+ data);                     
 				alert($('#memberEmail').val() + '로 인증번호를 전송하였습니다.');


			      }, error : function() {
			               console.log("실패");
		    
			      }
		 
			});

		});
		
		
		
		$('#memberEmail').change(function() {
			$("#emailCheck").val("N");
			$("#verifyNumResult").val('N');
			
		});
		
	});
	

	function emailChkFnc() {
		
		if($("#memberEmail").val() == ""){
			alert("이메일을 다시 입력하세요.");
			return false;
		}
		
		$.ajax({
			url: "/englishvillage/auth/emailCheck.do",
			type: "POST",
			data: "memberEmail=" + $("#memberEmail").val(),
			success: function(data) {
				if(data >= 1){
					$("#emailCheck").val('N');
					alert("중복된 이메일입니다.");
				} else if(data == 0) {
					$("#emailCheck").val('Y');
					alert("사용가능한 이메일입니다.");
				}
				
			}
			
		});
				
	}

	function backPageBtn() {
		location.href = "login.do";
	}

	function checkNumFnc() {
		var inputVerifyNumObj = document.getElementById('inputVerifyNum');
		var sendVerifyNumObj = document.getElementById('sendVerifyNum');
		var verifyNumResultObj = document.getElementById('verifyNumResult');
		
		if(inputVerifyNumObj.value == sendVerifyNumObj.value){
			verifyNumResultObj.value = "Y";
			alert("인증이 성공됐습니다.");
		}
		
		else if(inputVerifyNumObj.value != sendVerifyNumObj.value){
			verifyNumResultObj.value = "N";
			alert("인증번호가 일치하지 않습니다.");
		}
		
	}
	
	/* 회원가입 유효성 */
	function commonRegisterBtn(){
		
		var memberNameObj = document.getElementById('memberName');
		var memberEmailObj = document.getElementById('memberEmail');
		var verifyNumObj = document.getElementById('inputVerifyNum');
		var memberPasswordObj = document.getElementById('memberPassword');
		var verifyPasswordObj = document.getElementById('verifyPassword');
		var memberBirthDateObj = document.getElementById('memberBirthDate');
		
		if(memberNameObj.value.length == 0){		
			alert("이름을 입력해주세요.");
			return false;
		} else if(memberEmailObj.value.length == 0){		
			alert("이메일을 입력해주세요.");
			return false;
		} else if($('#emailCheck').val() == 'N'){
			alert("이메일 중복확인을 해주세요")
			return false;
		} else if(verifyNumObj.value.length == 0){		
			alert("인증번호를 입력해주세요.");
			return false;
		} else if($('#verifyNumResult').val() == 'N'){		
			alert("인증번호가 확인되지 않았습니다.");
			return false;
		} else if(memberPasswordObj.value.length == 0){		
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if(verifyPasswordObj.value.length == 0){		
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		} else if(verifyPasswordObj.value.length != memberPasswordObj.value.length){		
			alert("비밀번호가 일치하지 않습니다.");
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
			<span>회원가입</span>
		</div>
		<div id="secondBox">
			<form action="./commonRegisterCtr.do" method="post" onsubmit="return commonRegisterBtn();">
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
						<input id="memberEmail" type="email" name="memberEmail" placeholder="이메일을 입력하세요"
								style="width: 190px; height: 40px; float: left; margin-right: 10px;
								background-color: #E1E1E1;border: none;padding-left: 10px;">
					</div>
					<div>
						<input id="emailCheckBtn" type="button" value="이메일 중복확인" onclick="emailChkFnc();">
						<input id="emailCheck" type="hidden" value="N">
					</div>
				</div>
				<div class="thirdBox">
					<div>
						<input id="requestNumBtn" class="verifyNumBtn" type="button" value="인증번호 요청">
					</div>
					<div>
						<input id="inputVerifyNum" type="text">
						<input type="hidden" id="sendVerifyNum" value="">
					</div>
					<div>
						<input type="hidden" id="verifyNumResult" value="N">
					</div>
					
					<div>
						<input class="verifyNumBtn" type="button" value="인증번호 확인"	onclick="checkNumFnc();">
					</div>
				</div>
				<div>
					<div>
						<span>비밀번호</span>
					</div>
					<div>
						<input class="oneInputBox" id="memberPassword" type="password" name="memberPassword" placeholder="비밀번호를 입력하세요">
					</div>
					<div>
						<span>비밀번호 확인</span>
					</div>
					<div>
						<input class="oneInputBox" id="verifyPassword" type="password" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<div>
					<div>
						<span>생년월일</span>
					</div>
					<div>
						<input class="oneInputBox" id="memberBirthDate" type="date" name="birthDate" placeholder="생년월일을 입력하세요"
								style="width: 303px;color: gray;">
					</div>
					<div class="thirdBox">
						<div>
							<div>
								<span>국적</span>
							</div>
							<select id="selectCountry" name="memberCountry">
    							<option value="KOREA">한국</option>
    							<option value="USA">미국</option>
    							<option value="Ireland">아일랜드</option>
    							<option value="England">영국</option>
    							<option value="Canada">캐나다</option>
  							</select>
						</div>
						<div>
							<div>
								<span>성별</span>
							</div>
							<select id="selectGender" name="memberGender"> 
    							<option value="M">남</option>
    							<option value="F">여</option>
  							</select>
						</div>
					</div>
					<div class="thirdBox">
						<div>
							<input class="twoInputBoxBtn" type="button" value="뒤로가기" onclick="backPageBtn();">
						</div>
						<div>
							<input class="twoInputBoxBtn" type="submit" value="입력완료" >
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

</html>