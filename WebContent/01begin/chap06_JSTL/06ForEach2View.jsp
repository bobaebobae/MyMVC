<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- === JSTL(JSP Standard Tag Library) 사용하기 === --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원명단 출력하기(JSTL을 사용한 것)</title>
</head>
<body>
	<h2>회원명단 출력하기(JSTL을 사용한 것)</h2>
	<c:if test="${not empty nameArr}">
	<ol>
		<c:forEach var = "irum" items="${nameArr}">	<!-- 배열 몇개인지 모르니까 items로 부른다..? -->
		<li>${irum}</li>
		</c:forEach>
	</ol>
	</c:if>
	
	<br/>
	<hr style="border:solid 1px orange"/>
	<ol>
		<c:forEach var = "irum2" items="${nameArr2}">	<!-- 배열 몇개인지 모르니까 items로 부른다..? -->
			i>${irum2}</li>
		</c:forEach>
	</ol>
	
	<br/>
	
	<hr style="border:solid 1px orange"/>
	<c:if test="${!empty nameArr2}">
		<ol>
			<c:forEach var = "irum2" items="${nameArr2}">	<!-- 배열 몇개인지 모르니까 items로 부른다..? -->
				<li>${irum2}</li>
			</c:forEach>
		</ol>
	</c:if>
	
	<c:if test="${!empty nameArr2}">
		nameArr2에는 회원명단이 없습니다.<br/>
	</c:if>		
</body>
</html>