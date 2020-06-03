<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="begin.chap04_StandardAction.MemberDTO" %>    <!-- memberDTO 이름 복사 뒤에 .MemberDTO 붙여넣기 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션 중 useBean에 대해서 알아본다.</title>

<style type="text/css">

	div{margin:20px;}

</style>

</head>
<body>
	<div>
		<h2> 스크립틀릿을 사용하여 MemberDTO 클래스의 객체정보를 불러오기 </h2>
		<%
			MemberDTO mbrdto = new MemberDTO();
		
			mbrdto.setName("이순신");
			mbrdto.setJubun("9705201234567");
			
			String name = mbrdto.getName();
			String jubun = mbrdto.getJubun();
			String gender = mbrdto.getGender();
			int age = mbrdto.getAge();
		%>
		
		<ul>
			<li>성명 : <%= name%></li>
			<li>주민번호 : <%= jubun%></li>
			<li>성별 : <%= gender%></li>
			<li>나이 : <%= age%>세</li>
		</ul>
	</div>
	
	<hr style="border:solid 1px red;"/> <!-- 수평선 -->
	
	<div>
		<h2> JSP 표준액션 중 useBean 사용하여 MemberDTO 클래스의 객체정보를 불러오기 </h2>
		<jsp:useBean id="mbrdto2" class="begin.chap04_StandardAction.MemberDTO" /> <!-- bean : 클래스 객체 // 클래스는 위에 적혀있는 class 복붙~ -->	
		<jsp:setProperty property="name" name="mbrdto2" value="엄정화"/>	<!-- property에 set 다음에 나온 이름을 적는 것! 첫글자는 무조건 소문자(법칙) -->
		<jsp:setProperty property="jubun" name="mbrdto2" value="9210202234567"/>
		
		<ul>
			<li>성명 : <jsp:getProperty property="name" name="mbrdto2"/></li>	<!--  get 읽어오자~ -->
			<li>주민번호 : <jsp:getProperty property="jubun" name="mbrdto2"/></li>
			<li>성별 : <jsp:getProperty property="gender" name="mbrdto2"/></li>
			<li>나이 : <jsp:getProperty property="age" name="mbrdto2"/>세</li>
		</ul>
		
	</div>
</body>
</html>