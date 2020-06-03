<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산된 결과값 보여주는 곳</title>
</head>
<body>
	<h3>계산된 결과값(EL을 사용한 것)</h3>
	<br/><br/>
	${requestScope.firstNum} 부터 ${requestScope.secondNum} 까지의 합은?<br/>
	결과값 : <span style="color:red;">${requestScope.sum}</span> <!-- requestScopt request저장소 -->
	<br/><br/>
	${firstNum} 부터 ${secondNum} 까지의 합은?<br/>
	결과값 : <span style="color:blue;">${sum}</span>	
	<br/><br/>
	${firstNum+1} 부터 ${secondNum+1} 까지의 합은?<br/>
	결과값 : <span style="color:blue;">${sum+10}</span> <!-- ${sum+10} 이렇게도 할 수 있다. 즉, 결과물에서 연산이 가능하다. -->
</body>
</html>