<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트구매페이지</title>

<style type="text/css">

	table tr td {
		font-size: 18px;
		padding-left: 20px;
	} 
	
	td {
		height: 40px;
		width: 150px;
	}

	.pricePoint {
		font-size: 18px;
		width: 130px;
		border: 1px solid red;
		text-align: right;
		padding-right: 20px;
	}
	
	.payBtn {
		width: 370px;
		height: 50px;
		color: white;
		font-weight: bold;
		font-size: 20px;
		background-color: black;
		border: none;
		margin-left: 10px;
		margin-top: 40px;
	}

	.numberAlign {
		text-align: right;
		padding-right: 20px;
	}

	.pageName {
		width: 380px;
		font-size: 35px;
	    font-weight: bold;
	    margin-bottom: 20px;
	    border-bottom: 3px solid #EBEDED;
	}

</style>
<script type="text/javascript" src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$('document').ready(function() {
			$('.layoutUl').children().eq(1).addClass('on');

		$('#priceNum').keyup(function() {
			$('#pointNum').val($('#priceNum').val());
			$('#buyPointPrice').val($('#priceNum').val());
			$('#buyPoint').text($('#priceNum').val());
			$('#resultPoint').text(parseInt($('#originalPoint').val()) + parseInt($('#priceNum').val()));
			$('#realPoint').val(parseInt($('#originalPoint').val()) + parseInt($('#priceNum').val()));
			$('#realPrice').val($('#priceNum').val());
			$('#resultPrice').text($('#priceNum').val())
		});
	});

	function buyPointBtn(){
		
		var priceNumObj = document.getElementById('priceNum');
	
		if(priceNumObj.value.length == 0){		
			alert("구매금액을 입력해주세요.");
			return false;
		}
	}
</script>
</head>

<body>
	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">
	
		<form action="./buyPointCtr.do" method="post" onsubmit="return buyPointBtn();">
			<div style="margin-top: 30px; margin-left: 30px;">
				<div class="pageName">포인트구매</div>
				<table>
					<tr>
						<td>
							<span>결제금액</span>						
						</td>
						<td>
							<input id="priceNum" type="text" class="pricePoint">
						</td>
						<td>원</td>
					</tr>
					<tr>
						<td>
							<span>구매포인트</span>
						</td>
						<td>
							<input id="pointNum" type="text" disabled="disabled" class="pricePoint">
						</td>
						<td>포인트</td>
					</tr>
				</table>
			</div>
			<div style="margin-top: 50px;margin-left: 30px;">
				<div class="pageName">결제정보</div>
				<table>
					<tr>
						<td>보유포인트</td>
						<td class="numberAlign">
							<c:choose>
								<c:when test="${member.memberPoint eq 0}">
									0
								</c:when>
								<c:otherwise>
									${member.memberPoint}
								</c:otherwise>
							</c:choose>
						</td>
						<td>포인트</td>
					</tr>
					<tr>
						<td>구매포인트</td>
						<td id="buyPoint" class="numberAlign">0</td>
						<td>포인트</td>
					</tr>
					<tr>
						<td>결제후포인트</td>
						<td id="resultPoint" class="numberAlign">0</td>
						<td>포인트</td>
					</tr>
					<tr>
						<td>최종결제금액</td>
						<td id="resultPrice" class="numberAlign">0</td>
						<td>원</td>
					</tr>
				</table>
				<input class="payBtn" type="submit" value="결제하기">
				<input id="buyPointPrice" type="hidden" name="price" value="">
				<input id="originalPoint" type="hidden" value="${member.memberPoint}">
			</div>
		</form>
	</div>
		
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>