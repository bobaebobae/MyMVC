<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그를 사용한 데이터 전송 시 useBean 사용한 결과 보기</title>
</head>
<body>
	<jsp:useBean id="user" class="begin.chap04_StandardAction.UserDTO"/>	<!-- 1. 객체만들기(DTO) / 기본생성자로 객체 만듦-->
	<%-- <jsp:setProperty property="userid" name="user" value="${param.userid}"/>	<!-- param.name값(UserDTO) 적기 -->
	<jsp:setProperty property="passwd" name="user" value="${param.passwd}"/>	<!-- form태그 네임/ DTO네임/해당테이블 컬럼 명은 똑같이 써준다! -->
	<jsp:setProperty property="name" name="user" value="${param.name}"/>
	<jsp:setProperty property="email" name="user" value="${param.email}"/>
	<jsp:setProperty property="tel" name="user" value="${param.tel}"/>
	<jsp:setProperty property="jubun1" name="user" value="${param.jubun1}"/>
	<jsp:setProperty property="jubun2" name="user" value="${param.jubun2}"/>
	<jsp:setProperty property="school" name="user" value="${param.school}"/>
	
	<jsp:setProperty property="interest" name="user" value="${paramValues.interest}"/>	<!-- 얘는 체크박스 배열이기 때문에 paramValues다. -->
	 --%>
	 
	 <jsp:setProperty property="*" name="user"/> <!-- form태그에 있는 name...? 이름이 같기 때문에 자동적으로 자기꺼 찾아서 쑥쑥 알아서 들어감,,,?-->
	 
	<h2>회원가입 정보 결과(JSP 표준액션 중 useBean을 사용한 것)</h2>
	<ul>
		<li>아이디 : <jsp:getProperty property="userid" name="user"/></li>
		<li>암호 : <jsp:getProperty property="passwd" name="user"/></li>
		<li>성명 : <jsp:getProperty property="name" name="user"/></li>
		<li>이메일 : <jsp:getProperty property="email" name="user"/></li>
		<li>전화번호 : <jsp:getProperty property="tel" name="user"/></li>
		<li>주민번호 : <jsp:getProperty property="jubun" name="user"/></li>
		<li>학력 : <jsp:getProperty property="school" name="user"/></li>
		<li>관심분야 : <jsp:getProperty property="interestStr" name="user"/></li>	
		<li>성별 : <jsp:getProperty property="gender" name="user"/></li>	
		<li>현재나이 : <jsp:getProperty property="age" name="user"/></li>	
	</ul>
</body>
</html>