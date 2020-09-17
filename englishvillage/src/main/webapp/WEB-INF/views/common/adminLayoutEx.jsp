<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="/englishvillage/resources/css/bootstrap.css?ver=1.2">
<link rel="stylesheet" type="text/css"
	href="/englishvillage/resources/css/student.css?ver=1.4">
<script type="text/javascript">
	var loginMoveFnc = function() {
		location.href = '/englishvillage/login.do';
	}

	var myPageMoveFnc = function() {
		location.href = '/englishvillage/myPage.do'
	}

	var myInfoMoveFnc = function() {
		location.href = '/englishvillage/myInfo.do'
	}

	var QuestionListMoveFnc = function() {
		location.href = '/englishvillage/QuestionList.do'
	}

	var tutorListMoveFnc = function() {
		location.href = '/englishvillage/home.do'
	}

	var tutorIntroduceMoveFnc = function() {
		location.href = '/englishvillage/tutorIntroduce.do'
	}

	var adminMoveFnc = function() {
		location.href = '/englishvillage/admin/studentList.do'
	}

	var adminMove1Fnc = function() {
		location.href = '/englishvillage/admin/tutorList.do'
	}

	var adminMove2Fnc = function() {
		location.href = '/englishvillage/admin/questionList.do'
	}
</script>

<style type="text/css">
/* dl, ul, ol, menu, li { */
/* 	list-style: none; */
/* } */
#mainBox {
	box-sizing: border-box;
	background-color: black;
	border-radius: 30px;
	padding: 50px 0px;
}

.contentBox {
	margin-top: 100px;
}

#memberName {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding-bottom: 70px;
}

.layoutUl li {
	width: 160px;
	height: 40px;
	margin-bottom: 40px;
	border-radius: 30px;
	text-align: center;
	margin: auto;
	margin-bottom: 40px;
}

.layoutUl li.on {
	margin-bottom: 40px;
	width: 160px;
	height: 40px;
	background-color: #778F44;
	border-radius: 30px;
	text-align: center;
	margin: auto;
	margin-bottom: 40px;
}

ul {
	list-style: none;
	padding-left: 0px;
}

.layoutUl li a:hover {
	color: #d9edf7;
	color: black;
	background-color: #778F44;
	border-radius: 30px;
	width: 160px;
	height: 40px;
}

.layoutUl>li>a {
	color: #d9edf7;
	text-decoration: none;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	line-height: 23px;
	font-size: 30px;
	margin-top: 20px;
}

.layoutText {
	margin-bottom: 40px;
	font-size: 40px;
	font-weight: bold;
	text-align: center;
}
</style>

<div style="height: 500px;">
	<nav id="mainBox"
		class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix-top"
		style="margin-top: 40px">
		<ul class="nav bs-docs-sidenav layoutUl">


			<li><a href="./studentList.do">학 생</a></li>
			<li><a href="./tutorList.do">강 사</a></li>
			<li><a href="./questionList.do">문 의</a></li>

		</ul>
	</nav>
</div>