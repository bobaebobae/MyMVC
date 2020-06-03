<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String ctxPath = request.getContextPath();
	// ctxPath ==> /MyMVC
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과 페이지</title>

<style type="text/css">
	span#name{
		color: blue;
		font-size: 14pt;
	}
</style>

<script type="text/javascript">
	function goMyinfo(userid){
		location.href = "<%=ctxPath%>/myInfoView.do?userid="+userid+""; 
		// ==> /MyMVC/myInfoView.do?userid=Leess 주소로 URL 페이지 이동을 하겠다는 말이다.
	}
</script>

</head>
<body>
	<h2>회원가입 결과</h2>
	<c:if test="${result == 'success'}"> <!-- requestScope영역에 있는! key값이 result -->
		<span id="name">${name}</span>님 회원가입이 정상적으로 처리되었습니다.
		<br/><br/>
		<button onclick="goMyinfo('${userid}')">내 정보 조회하기1</button><!-- "" '' 주의해서 >>꼭<< 넣어주기 --><!-- 동명이인이 많기때문에 아이디를 불러온다 -->
     	 &nbsp;&nbsp;
		<button onclick="javascript:location.href='<%=ctxPath%>/myInfoview.do?${userid}'">내 정보 조회하기 2</button>
	</c:if>

	<c:if test="${result == 'fail'}">
		회원가입이 실패했습니다.	
	</c:if>
	
</body>
</html>