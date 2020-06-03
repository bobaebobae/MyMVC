<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- === JSTL(JSP Standard Tag Library) 사용하기 === --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 숫자나오게 하는 것 -->

<%--
     fmt 태그는 Formatting 태그로 포맷에 관련된 태그입니다.
         참조사이트  https://sinna94.tistory.com/11
--%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정수로 되어진 데이터를 세자리 마다 콤마를 찍어서 나타내어주기</title>
</head>
<body>
	<h2>정수로 되어진 데이터를 세자리 마다 콤마를 찍어서 나타내어주기</h2>
	<c:set var="sum" value="0"/>	<!-- 누적 --><!-- sum 변수는 숫자로 인식. value에는 문자든 숫자든 "쌍따옴표" 꼭 써줘야함 --> 
	<c:if test="${not empty priceArr }">	<!-- pointArr1 앞에 requestScope. 생략 -->
		<ul>
			<c:forEach var="price" items="${priceArr}">
				<li>${price}</li>
				<c:set var = "sum" value="${sum+price }"/><!-- 누적하자 -->
			</c:forEach>	
		</ul>
		priceArr 누적의 합계 : ${sum}
	</c:if>
	
	<br/><br/>
	
	<c:set var="sum" value="0"/>	<!-- 누적 -->
	<c:if test="${not empty priceArr }">	<!-- pointArr1 앞에 requestScope. 생략 -->
		<ul>
			<c:forEach var="price" items="${priceArr}">
				<li><fmt:formatNumber value="${price}" pattern="#,###"/></li>
				<c:set var = "sum" value="${sum+price }"/><!-- 누적하자 -->
			</c:forEach>	
		</ul>
		priceArr 누적의 합계 : <fmt:formatNumber value="${sum}" pattern="#,###" />
	</c:if>
</body>
</html>