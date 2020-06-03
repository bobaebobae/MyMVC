<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 페이지</title>

<style type="text/css">

	span#error {
		color: red;
		font-size: 14pt;
	}

</style>

</head>
<body>
	<h2>오류 발생</h2>
	발생된 오류 메시지 : <span id="error">${eMsg}</span>
</body>
</html>