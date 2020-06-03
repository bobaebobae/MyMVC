<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- === JSTL(JSP Standard Tag Library) 사용하기 === --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- fmt는 형변환 할 때 있어야하는 taglib --> 

<%--
     fmt 태그는 Formatting 태그로 포맷에 관련된 태그입니다.
         참조사이트  https://sinna94.tistory.com/11
--%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자열로 되어진 숫자를 누적한 결과값(자동형변환, 형변환) 나타내기</title>
</head>
<body>
	<h2>문자열로 되어진 숫자를 누적한 결과값(자동형변환) 나타내기(JSTL을 사용한 것 )</h2>
	<c:set var="sum" value="0"/>	<!-- 누적 -->  
	<c:if test="${not empty pointArr1 }">	<!-- pointArr1 앞에 requestScope. 생략 -->
		<ul>
			<c:forEach var="point" items="${pointArr1}">
				<li>${point}</li>
				<c:set var = "sum" value="${sum+point }"/>
			</c:forEach>	
		</ul>
		pointArr1 누적의 합계 : ${sum}
	</c:if>
	
	<br/>
	<hr style="border:solid 1px orange;"/>
	<br/>
	
	<h2>문자열로 되어진 숫자를(정수로 형변환)하여 누적한 결과값 나타내기(JSTL을 사용한 것 )</h2>
	<c:set var="sum" value="0"/>
	<c:if test="${not empty pointArr1 }">	<!-- pointArr1 앞에 requestScope. 생략 -->
		<ul style="list-style-type: circle;">
			<c:forEach var="point" items="${pointArr1}">
				<li>
					<fmt:parseNumber var="pointInt" value="${point}" integerOnly="true" /> <!-- true는 정수 / flase는 실수  -->
					<!-- frm:parseNumber : 문자열을 숫자형식으로 형변환 시키는 것 -->
					<!-- integerOnly="true" : 소수점은 절삭해버리고 정수만 취해오는 것 -->
					<!-- 정수만 취해온 값을 변수 pointInt에 넣어줌. -->
					${pointInt}
				</li>
				<c:set var = "sum" value="${sum+point }"/>
			</c:forEach>	
		</ul>
		pointArr1을 정수만 취해온 누적의 합계 : ${sum}
	</c:if>
	
	
	<h2>forEach를 사용하면서 index번호를 나타내기</h2>
	<c:if test="${not empty pointArr1 }">	<!-- pointArr1 앞에 requestScope. 생략 -->
		<ul>
			<c:forEach var="point" items="${pointArr1}" varStatus="status"> <!-- status 변수이름은 마음대로 -->
				<li>${point}&nbsp;(인덱스번호 &bsp;${status.index})</li>	<!-- status.indexs 은 0부터 시작한다. -->
			</c:forEach>	
		</ul>
		pointArr1 누적의 합계 : ${sum}
	</c:if>
	
	
	<h2>forEach를 사용하면서 index번호를 나타내기</h2>
	<c:if test="${not empty pointArr1 }">	<!-- pointArr1 앞에 requestScope. 생략 -->
		<ul>
			<c:forEach var="point" items="${pointArr1}" varStatus="status"> <!-- status 변수이름은 마음대로 -->
				<li>${point}&nbsp;(순서번호 &bsp;${status.count})</li>
				<!-- ${status.count})은 1부터 시작한다. -->
			</c:forEach>	
		</ul>
		pointArr1 누적의 합계 : ${sum}
	</c:if>
</body>
</html>