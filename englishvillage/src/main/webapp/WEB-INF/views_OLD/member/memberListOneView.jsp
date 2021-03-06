<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>

<script type="text/javascript" 
	src="/springHome/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
	function pageMoveListFnc(){
		
		
		var memberNoObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		
// 		에이태그의.아버지.아버지.아들중태그 이름이 td인거 중. 0번째인덱스
		var url = '';
		
		url += './list.do?';
		url += 'no=' + memberNoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;
		
	}
		
</script>

</head>

<body>
<%-- 	<jsp:include page="/WEB-INF/views/Header.jsp" /> --%>
	
	<h1>회원정보 상세조회</h1>
	<form action='./update.do' method='get'>
		번호: ${memberDto.no}
		<br>
		이름: ${memberDto.name}
		<br>
		이메일: ${memberDto.email}
		<br>
		
		첨부파일:
		<c:choose>
			<c:when test="${empty fileList}">
				첨부파일이 없습니다.<br>
			</c:when>
			<c:otherwise>
				<c:forEach var="row" items="${fileList}">
<!-- 					<input type="button" value="이미지" name="file"> -->
					${row.ORIGINAL_FILE_NAME}
					(${row.FILE_SIZE}KB)<br>
					<img alt="image not found" 
						src="<c:url value='/img/${row.STORED_FILE_NAME}'/>">
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		가입일: <fmt:formatDate value="${memberDto.createdDate}" 
			pattern="yyyy-MM-dd hh:mm"/> 
		<br>
		<div>
			<input id="no" type="hidden" name="no" value="${memberDto.no}">
			<input id="keyword" type="hidden" name="keyword" value="${keyword}">
			<input id="searchOption" type="hidden" name="searchOption" value="${searchOption}">
			
		
		</div>
		<div>
			<input type='submit' value='수정하기 페이지'>
			<input type='button' value='이전 페이지' 
				onclick='pageMoveListFnc();'>
		</div>
	</form>
	
<%-- 	<jsp:include page="/WEB-INF/views/Tail.jsp" /> --%>
</body>
</html>