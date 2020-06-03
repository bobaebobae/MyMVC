<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 회원정보 조회를 해주는 페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

	body {
		padding: 20px;
	}
	
	a{
		text-decoration: none !important;
		font-size: 14pt;
	}
	
	div#content {
		width: 80%;
		margin: 30px auto;
	}
	
	th {
		font-size: 12pt;
	}
	
	
</style>
</head>
<body>
	
	<h2>모든 회원정보 조회를 해주는 페이지</h2>
	<div id="content">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>성명</th>
					<th>성별</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mvo" items="${memberList}">
					<tr>
						<td>${mvo.userid}</td>
						<td>${mvo.name}</td>
						<td>${mvo.sexual}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<form name="deleteFrm">
		<input type="hidden" name="userides" />
	</form>
</body>
</html>