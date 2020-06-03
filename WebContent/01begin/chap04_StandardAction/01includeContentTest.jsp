<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션 중 include에 대해서 알아봅니다.(실행은 Test에서 돌려야 함)</title>
</head>
<body>
	<h3>책소개</h3>
	도서명 : 삼국지<br/>
	저자 : 서영학<br/>
	페이지 : 300페이지<br/>
	<!-- 01includeContent.jsp 내용을 여기에다 끼어넣고 싶다 그럼 어떻게하면 되지? 1. include 지시어 쓰기  2. jsp:include page=""  -->
	<div>
		<jsp:include page="01includeContent.jsp"/>
	</div>
	
	가격 : 20,000원<br/>
</body>
</html>