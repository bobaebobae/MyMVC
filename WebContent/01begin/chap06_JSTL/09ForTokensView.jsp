<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- === JSTL(JSP Standard Tag Library) 사용하기 === --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    <!-- fn 함수 --> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원명단 출력하기</title>
</head>
<body>
	<h2>회원명단</h2>
	
	<c:if test ="${not empty members }">
		<ol>
			<c:forTokens var="name" items="${members}" delims=",">
			<%-- ${members}은 하나의 문자열인데 구분자(,)를 사용하여 하나하나씩 잘라서 배열로 나타내어줌 --%>
				<li>${name}</li>
			</c:forTokens>
		</ol>
	</c:if>
		
	<br/>
	<hr style="border:solid 1px orange;"/>
	<br/>
	
	<h2>친구명단</h2>
	
	<c:if test="${not empty friends }">
		<ol>
			<c:forTokens var="friend" items="${friends }" delims=",/.">
			<%-- ${friendss}은 하나의 문자열인데 구분자, 또는 . 또눈 /를 사용하여 하나하나씩 잘라서 배열로 나타내어줌 --%>
			<li>${friend}</li>
			</c:forTokens>
		</ol>	
	</c:if>
	
</body>
</html>