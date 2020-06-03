<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션 중 forward에 대해서 알아봅니다.(실행은 Test에서 돌려야 함)</title>

<script type="text/javascript">
	function goSubmit(){
		var frm = document.myFrm;
		var num1 = frm.firstNum.value.trim(); // firstNum의 value 값을 가져오자
		var num2 = frm.secondNum.value.trim();
		
		if(num1==""||num2==""){
			alert("값을 입력하세요!!");
			frm.firstNum.value="";
			frm.secondNum.value="";
			frm.firstNum.focus();
			return; // 종료
		}
		var regExp=/^[0-9]{1,5}$/;	// 한글자 이상 5글자 이하~ 유효성검사로인해 숫자형태만 옴
		if( !( regExp.test(num1) && regExp.test(num2) ) ){		// 한개라도 false라면
				alert("값을 입력하세요!!");
				frm.firstNum.value="";
				frm.secondNum.value="";
				frm.firstNum.focus();
				return; // 종료
			}
		frm.action = "02forwardCalc.jsp";
		// frm.method = "get";	// method를 명기하지 않으면 기본은 "GET"이다. get 대소문자 관계 없음.
		frm.submit();
	}
	
</script>

</head>
<body>
	<h2>입력한 두개의 수 사이를 누적한 값 알아오기</h2> <!-- ex> 1,5 적으면 1~5에서 누적된 값 알아보자 -->
	
	<form name="myFrm">
		<p>
			첫번째 수 : <input type="text" name="firstNum" size="5" maxlength="5"/><br/>
			두번째 수 : <input type="text" name="secondNum" size="5" maxlength="5"/><br/>
			<button type="button" onclick="goSubmit()">계산하기</button>
		</p>
	</form>
</body>
</html>