<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입려받은 두개의 문자열이 같은지 다른지 검사하기</title>

<script type="text/javascript">
	function goSubmit(){
		var frm = document.myFrm;
		frm.action = "02IfTestEnd.jsp";
		// frm.method = "get"; 생략해도 get
		frm.submit();
	}
</script>
</head>
<body>
	<form name="myFrm">
		첫번째 입력란 : <input type="text" name="first"/><br/>
		두번째 입력란 : <input type="text" name="second"/><br/>
		<br/>
		<button type="button" onclick="goSubmit();">확인</button>
		<button type="reset">취소</button> <!-- input태그에 입력됐던 글이 다 사라진다. id이거 안해도 됨 -->
	</form>
</body>
</html>