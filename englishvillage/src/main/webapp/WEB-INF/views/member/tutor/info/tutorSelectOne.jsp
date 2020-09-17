<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

.contentBox {
	margin-top: 80px;
}

.tutorInfoBox {
	padding: 10px;
	border-radius: 4px;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1);
	border: 1px solid #F5F5F5;
}

#tutorInfoDiv {
	border: 1px solid black;
	width: 650px;
	height: 400px;
	margin-left: 50px;
	padding-top: 30px;
	padding-left: 40px;
	margin-bottom: 40px;
	border-radius: 20px;
}

.tutorImg {
	width: 100%;
}

#onLineCheckDiv {
	width: 120px;
	height: 30px;
	float: right;
}

.studyTitle {
	font-size: 15px;
	font-weight: 900;
	margin-top: 10px;
	margin-left : 5px;
}

#studyStartBtn {
	border: 1px solid black;
	width: 120px;
	height: 40px;
	text-align: center;
	padding: 8px;
}

#nameTitle {
	width: 100px;
}

#nameTitleContent {
	width: 140px;
}

#tutorIntroduceDiv {
	width: 100%;
	height: 200px;
	margin-top: 20px;
	margin-bottom: 30px;
	border-radius: 20px;
	padding: 20px;
	border-radius: 20px;
	box-shadow: 0 6px 10px 10px rgba(3, 0, 0, 0.1);
	border: 1px solid white;
}

tr {
	height: 40px;
}

#writeComment {
	border: 1px solid black;
	width: 1400px;
	height: 200px;
	margin-bottom: 30px;
}

#modifyComment {
	border: 1px solid black;
	width: 1400px;
	height: 200px;
	margin-bottom: 60px;
	border-radius: 20px;
}

#studyTitleStr {
	font-weight: bold;
	font-size: 16px;
	padding-right: 20px;
	padding-left: 20px;
}

/* #commentList { */
/* 	width: 1140px; */
/* } */
#studentNameTh {
	width: 250px;
	vertical-align: middle;
	font-size: 25px;
}

#thSize {
	width: 150px;
	font-size: 20px;
}

.commentOne {
	margin-bottom: 20px;
	border: 1px solid black;
	border-radius: 20px;
}

.commentCreateDate {
	width: 700px;
	height: 50px;
	padding-top: 15px;
	padding-left: 10px;
}

.commentContents {
	width: 700px;
	height: 150px;
	padding: 10px;
}

.commentModified {
	border: 1px solid black;
	width: 120px;
	height: 37px;
	padding-top: 10px;
	text-align: center;
	float: right;
}

#commentWriteBtn {
	border: 1px solid black;
	width: 120px;
	height: 37px;
	padding-top: 10px;
	text-align: center;
	float: right;
}

#commentModifyBtn {
	width: 120px;
	height: 37px;
	padding-top: 10px;
	text-align: center;
	float: right;
	margin-left: 30px;
}

#commentModifyCancelBtn {
	width: 120px;
	height: 37px;
	padding-top: 10px;
	text-align: center;
	float: right;
	margin-left: 30px;
}

.commentDelete {
	width: 120px;
	height: 37px;
	padding-top: 10px;
	text-align: center;
	float: right;
	margin-left: 30px;
}

#writeCommentContents {
	border: 1px solid black;
	width: 700px;
	height: 200px;
	padding: 10px;
	float: left;
	border-radius: 10px;
}

#modifyCommentContentsDiv {
	border: 1px solid black;
	width: 700px;
	height: 200px;
	padding: 10px;
	border-radius: 10px;
}

/* 댓글쓰기 */
#commentContents {
	width: 680px;
	height: 180px;
	resize: none;
	border: none;
}

#modifyCommentContents {
	width: 680px;
	height: 180px;
	resize: none;
	border: none;
}

.scoreTitle {
	float: left;
	width: 100px;
	height: 5px;
	font-size: 25px;
	margin-right: 20px;
}

#scoreOne, #scoreTwo, #scoreThree, #scoreFour, #scoreFive {
	float: left;
	width: 5px;
	font-size: 25px;
	margin-right: 25px;
	color: grey;
	cursor: pointer;
}

#modifyScoreOne, #modifyScoreTwo, #modifyScoreThree, #modifyScoreFour,
	#modifyScoreFive {
	float: left;
	width: 5px;
	font-size: 25px;
	margin-right: 25px;
	color: grey;
	cursor: pointer;
}

#modifyCommentTitle {
	font-weight: bold;
	font-size: 25px;
}

.partTitle {
	font-weight: bold;
	font-size: 25px;
	margin-bottom: 10px;
}

.studyImpossibleBtn {
	display: inline-block;
	margin-bottom: 0;
	font-weight: normal;
	text-align: center;
	vertical-align: middle;
	touch-action: manipulation;
	background-image: none;
	border: 1px solid transparent;
	white-space: nowrap;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	color: #A3A7B8;
	background-color: #EFEFEF;
	border-color: #A8A8A8;
	margin-right: 15px;
	float: right;
	width: 250px;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.1);
}
</style>

<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#scoreOne').click(function() {
					$('#scoreOne').css('color', '#ff8b13');
					$('#scoreTwo').css('color', 'grey');
					$('#scoreThree').css('color', 'grey');
					$('#scoreFour').css('color', 'grey');
					$('#scoreFive').css('color', 'grey');
					$('#scoreNum').val(1);
				});
				$('#scoreTwo').click(function() {
					$('#scoreOne').css('color', '#ff8b13');
					$('#scoreTwo').css('color', '#ff8b13');
					$('#scoreThree').css('color', 'grey');
					$('#scoreFour').css('color', 'grey');
					$('#scoreFive').css('color', 'grey');
					$('#scoreNum').val(2);
				});
				$('#scoreThree').click(function() {
					$('#scoreOne').css('color', '#ff8b13');
					$('#scoreTwo').css('color', '#ff8b13');
					$('#scoreThree').css('color', '#ff8b13');
					$('#scoreFour').css('color', 'grey');
					$('#scoreFive').css('color', 'grey');
					$('#scoreNum').val(3);
				});
				$('#scoreFour').click(function() {
					$('#scoreOne').css('color', '#ff8b13');
					$('#scoreTwo').css('color', '#ff8b13');
					$('#scoreThree').css('color', '#ff8b13');
					$('#scoreFour').css('color', '#ff8b13');
					$('#scoreFive').css('color', 'grey');
					$('#scoreNum').val(4);
				});
				$('#scoreFive').click(function() {
					$('#scoreOne').css('color', '#ff8b13');
					$('#scoreTwo').css('color', '#ff8b13');
					$('#scoreThree').css('color', '#ff8b13');
					$('#scoreFour').css('color', '#ff8b13');
					$('#scoreFive').css('color', '#ff8b13');
					$('#scoreNum').val(5);
				});

				/* 이하 수정 */

				$('#modifyScoreOne').click(function() {
					$('#modifyScoreOne').css('color', '#ff8b13');
					$('#modifyScoreTwo').css('color', 'grey');
					$('#modifyScoreThree').css('color', 'grey');
					$('#modifyScoreFour').css('color', 'grey');
					$('#modifyScoreFive').css('color', 'grey');
					$('#modifyScoreNum').val(1);
				});
				$('#modifyScoreTwo').click(function() {
					$('#modifyScoreOne').css('color', '#ff8b13');
					$('#modifyScoreTwo').css('color', '#ff8b13');
					$('#modifyScoreThree').css('color', 'grey');
					$('#modifyScoreFour').css('color', 'grey');
					$('#modifyScoreFive').css('color', 'grey');
					$('#modifyScoreNum').val(2);
				});
				$('#modifyScoreThree').click(function() {
					$('#modifyScoreOne').css('color', '#ff8b13');
					$('#modifyScoreTwo').css('color', '#ff8b13');
					$('#modifyScoreThree').css('color', '#ff8b13');
					$('#modifyScoreFour').css('color', 'grey');
					$('#modifyScoreFive').css('color', 'grey');
					$('#modifyScoreNum').val(3);
				});
				$('#modifyScoreFour').click(function() {
					$('#modifyScoreOne').css('color', '#ff8b13');
					$('#modifyScoreTwo').css('color', '#ff8b13');
					$('#modifyScoreThree').css('color', '#ff8b13');
					$('#modifyScoreFour').css('color', '#ff8b13');
					$('#modifyScoreFive').css('color', 'grey');
					$('#modifyScoreNum').val(4);
				});
				$('#modifyScoreFive').click(function() {
					$('#modifyScoreOne').css('color', '#ff8b13');
					$('#modifyScoreTwo').css('color', '#ff8b13');
					$('#modifyScoreThree').css('color', '#ff8b13');
					$('#modifyScoreFour').css('color', '#ff8b13');
					$('#modifyScoreFive').css('color', '#ff8b13');
					$('#modifyScoreNum').val(5);
				});

				if ($('#memberGrade').val() == 'Y'
						|| $('#evaluateCheck').val() == 'Y'
						|| $('#evaluateCheck').val() == '') {
					$('#commentWriteFormDiv').css("display", "none");
				}

				$('#commentModifyCancelBtn').click(function() {

					$('#commentModifyFormDiv').css("display", "none");

				});

				$('#modifyBtn').click(function() {

					$('#commentModifyFormDiv').css("display", "");
					$('#modifyCommentContents').focus();

				});
			});
					
	var removeCommentFnc = function() {

		$('#commentRemoveForm').submit();
	}

	function modifyFormFnc() {

		if ($('#modifyCommentContents').val() == "") {
			alert("내용을 입력해주세요");
			$('#modifyCommentContents').focus();
			return false;
		} else if ($('#modifyScoreNum').val() == "") {
			alert("강사의 평점을 주세요");
			return false
		}

	}

	function writeFormFnc() {

		if ($('#commentContents').val() == "") {
			alert("내용을 입력해주세요");
			$('#commentContents').focus();
			return false;
		} else if ($('#scoreNum').val() == "") {
			alert("강사의 평점을 주세요");
			return false
		}

	}
	
</script>


</head>

<body>
	<jsp:include page="/WEB-INF/views/common/Header.jsp" />

	<div class="container bs-docs-container contentBox">

		<!-- 강사 유투브 영상 -->
		<div class="col-md-8">
			<iframe width="100%" height="540px;" src="${tutorDto.youtubeUrl}"
				frameborder="0" allowfullscreen style="border-radius: 10px;"></iframe>
		</div>

		<!-- 강사 정보  -->
		<div class="col-md-4">
			<div class="tutorInfoBox">
				<div>
					<div id="onLineCheckDiv" class="text-right">
						<span>On-Line</span>
						<c:choose>
							<c:when test="${tutorDto.statusCheck eq 'Y'}">
								<span style="color: green">●</span>
							</c:when>
							<c:otherwise>
								<span style="color: red">●</span>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="tutorImgDiv">
						<img alt="image not found" class="tutorImg"
							src="<c:url value='/img/${tutorDto.storeFileName}'/>">
					</div>
					<!--강의 제목  -->
					<div class="">
						<h3 class="studyTitle">${tutorDto.studyName}</h3>
					</div>

					<div id="tutorInfoTableDiv">
						<table id="tutorInfoTable" class="table table-bordered">

							<tr>
								<td id="nameTitle">이름</td>
								<td id="nameTitleContent">${tutorDto.memberName}</td>
							</tr>
							<tr>
								<td>국적</td>
								<td>${tutorDto.memberCountry}</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>${tutorDto.age}</td>
							</tr>
							<tr>
								<td>평점</td>
								<td><c:forEach begin="1" end="${tutorDto.score}">
										<span style="color: #ff8b13;">★</span>
									</c:forEach> <c:forEach begin="${tutorDto.score}" end="4">
										<span style="color: grey;">★</span>
									</c:forEach></td>
							</tr>
							<tr>

								<td>수업료</td>
								<td>${tutorDto.price}</td>
							</tr>
						</table>
					</div>
					<!-- 사진 -->

					<input id="tutorNoNum" type="hidden" value="${tutorDto.memberNo}">
					<input id="tutorPrice" type="hidden" value="${tutorDto.price}">
					<input id="memberPoint" type="hidden" value="${member.memberPoint}">

					<input id="statusCheck" type="hidden"
						value="${tutorDto.statusCheck}">
				</div>
			</div>
		</div>
	</div>
	<!-- 강사정보 끝  -->

	<!-- 소개글 -->
	<div id="evaluate" class="container" style="margin-top: 20px">
		<span class="partTitle" style="clear: left;">강의 소개</span>
		<!--수업시작 버튼 -->
		<c:choose>
			<c:when
				test="${tutorDto.statusCheck eq 'Y' && member.memberGrade eq 'N'}">
				<div class="btn btn-primary studyImpossibleBtn" onclick="send();">수업시작</div>
			</c:when>

			<c:otherwise>
				<div class="studyImpossibleBtn">수업시작</div>
			</c:otherwise>
		</c:choose>
		<div id="tutorIntroduceDiv">${tutorDto.tutorIntroduce}</div>
	</div>

	<!-- 댓글 -->

	<c:if test="${member.memberGrade ne 'Y' && (studentTutorCommentDtoList.evaluateCheck eq 'N' || studentTutorCommentDtoList.evaluateCheck eq '')}">


	<div id="commentWriteFormDiv" class="container">
		<form id="commentWrite" action="writeCommentCtr.do" method="post"
			onsubmit="return writeFormFnc();">


			<table class="table table-bordered">
				<tbody>
					<tr>
						<!--회원이름  -->
						<th rowspan="3" class="text-center"
							style="vertical-align: middle;">${member.memberName}</th>
						<!-- 회원평점 -->
						<th id="thSize" class="text-center"
							style="vertical-align: middle;">평점</th>

						<td>
							<!-- 별입력  -->
							<div class="commentScore clearfix">
								<div id="scoreOne">★</div>
								<div id="scoreTwo">★</div>
								<div id="scoreThree">★</div>
								<div id="scoreFour">★</div>
								<div id="scoreFive">★</div>
								<input id="scoreNum" type="hidden" name="score" value="">
							</div>
						</td>
					</tr>

					<tr>
						<th id="thSize" class="text-center"
							style="vertical-align: middle;">내용</th>
						<td>
							<div id="writeCommentContents">
								<textarea id="commentContents" name="evaluateContent"
									placeholder="댓글을 입력해주세요"></textarea>
							</div>
							<div class="commentBtns clearfix" style="margin-top: 163px">
								<!-- 버튼 -->
								<input type="submit" id="commentWriteBtn"
									class="btn btn-primary" value="작성하기">
							</div>
						</td>

					</tr>
				</tbody>
			</table>

			<input type="hidden" name="studentName" value="${member.memberName}">
			<input id="studentNoNum" type="hidden" name="studentNo"
				value="${member.memberNo}"> <input type="hidden"
				name="tutorNo" value="${tutorDto.memberNo}">

		</form>
	</div>
	
	</c:if>
	
	<!-- 댓글 확인 부분 -->
	<c:choose>
		<c:when test="${not empty tutorCommentDtoList}">
			<!-- 				<div id="commentList"> -->
			<div class="container">

				<div class="partTitle" style="clear: left;">
					${tutorDto.evaluationCount}개의 후기</div>
				<!-- 댓글 입력창 -->
				<c:forEach var="tutorCommentDto" items="${tutorCommentDtoList}">

					<table class="table table-bordered">
						<tbody>
							<tr>
								<th id="studentNameTh" rowspan="2" class="text-center"
									style="vertical-align: middle;">${tutorCommentDto.studentName}</th>
								<th id="thSize" class="text-center"
									style="vertical-align: middle;">평점</th>
								<td>
									<div>
										<div class="commentScore clearfix">
											<div>
												<c:forEach begin="1" end="${tutorCommentDto.score}">
													<span style="color: #ff8b13;">★</span>
												</c:forEach>
												<c:forEach begin="${tutorCommentDto.score}" end="4">
													<span style="color: grey;">★</span>
												</c:forEach>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<th id="thSize" class="text-center"
									style="vertical-align: middle;">내용</th>
								<td>
									<div>${tutorCommentDto.evaluateContent}</div>
									<div class="pull-right">
										작성일 :
										<fmt:formatDate value="${tutorCommentDto.evaluateCreateDate}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</div>
								</td>
							</tr>

							<!-- 수정버튼 등장 -->
							<c:if test="${tutorCommentDto.studentNo eq member.memberNo}">
								<tr>
									<td colspan="3" style="border: 1px solid white;">
										<form id="commentRemoveForm"
											action="./tutorCommentRemoveCtr.do" method="post">

											<input type="submit" id="commentDeleteBtn"
												class="commentDelete btn btn-primary" value="삭제하기">
											<input type="hidden" name="tutorNo"
												value="${tutorCommentDto.tutorNo}"> <input
												type="hidden" name="studentNo"
												value="${tutorCommentDto.studentNo}">
										</form>

										<div id="modifyBtn" class="commentModified btn btn-primary">
											수정하기</div>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>

					<!-- 댓글 수정부분  -->
					<c:if test="${tutorCommentDto.studentNo eq member.memberNo}">
						<div id="commentModifyFormDiv" class="container"
							style="display: none;">
							<form id="commentModifyForm" action="./tutorCommentModifyCtr.do"
								method="post" onsubmit="return modifyFormFnc();">


								<table class="table">
									<tbody>
										<tr>
											<!--회원이름  -->
											<th rowspan="3" class="text-center"
												style="vertical-align: middle;">${studentTutorCommentDtoList.studentName}</th>
											<!-- 회원 수정 평점 -->
											<th id="thSize" class="text-center"
												style="vertical-align: middle;">평점</th>

											<td>
												<!-- 별입력  -->
												<div class="commentScore clearfix">
													<div id="modifyScoreOne">★</div>
													<div id="modifyScoreTwo">★</div>
													<div id="modifyScoreThree">★</div>
													<div id="modifyScoreFour">★</div>
													<div id="modifyScoreFive">★</div>
													<input id="modifyScoreNum" type="hidden" name="score"
														value="">
												</div>
											</td>
										</tr>

										<tr>
											<th id="thSize" class="text-center"
												style="vertical-align: middle;">내용</th>
											<td>
												<div id="modifyCommentContentsDiv">
													<textarea id="modifyCommentContents" name="evaluateContent"
														placeholder="댓글을 입력해주세요">${studentTutorCommentDtoList.evaluateContent}</textarea>
												</div>
											</td>
										</tr>

										<tr>
											<td colspan="3">
												<div class="commentBtns clearfix">
													<!-- 버튼 -->
													<input type="button" id="commentModifyCancelBtn"
														class="btn btn-primary" value="취소"> <input
														type="submit" id="commentModifyBtn"
														class="btn btn-primary" value="수정완료">
												</div>
											</td>
										</tr>

									</tbody>
								</table>
								<input id="studentName" type="hidden" name="studentName"
									value="${member.memberName}"> <input id="studentNoNum"
									type="hidden" name="studentNo"
									value="${studentTutorCommentDtoList.studentNo}"> <input
									type="hidden" name="tutorNo"
									value="${studentTutorCommentDtoList.tutorNo}">

							</form>

						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:when>
		<c:when test="${empty tutorCommentDtoList}">
			<div class="container" style="font-size: 40px; margin-top: 40px; width: 2000px; text-align: center; margin-bottom: 200px;">아직 등록된 후기가 없습니다</div>
		</c:when>
	</c:choose>
</body>

<script type="text/javascript"
	src="/englishvillage/resources/js/alert.js"></script>

</html>