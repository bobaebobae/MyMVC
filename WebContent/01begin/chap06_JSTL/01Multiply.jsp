<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두개의 수를 입력받아서 곱셈하기</title>

<script type="text/javascript">
	function goSubmit(){
		var frm = document.multiplyFrm;
		frm.action = "01MultiplyEnd.jsp";
		// frm.method = "get"; 생략해도 get
		frm.submit();
	}
	
</script>
</head>
<body>
	<form name="multiplyFrm">
		첫번째 수 : <input type="number" name="num1"/><br/>
		두번째 수 : <input type="number" name="num2"/><br/>
		<br/>
		<button type="button" onclick="goSubmit();">확인</button>
		<button type="reset">취소</button> <!-- input태그에 입력됐던 글이 다 사라진다. id이거 안해도 됨 -->
	</form>
</body>
</html>