<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>	<!-- isErrorPage="true"  이걸해야 에러페이지설정,,, exception 내장객체 쓸 수 있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류페이지</title>
<style type="text/css">
	span#error {
		color: red;
		font-size: 14pt;
	}
</style>

</head>
<body>
	<h2>오류발생</h2>
	발생된 오류메세지 : <span id="error">${errMsg}</span>
</body>
</html>