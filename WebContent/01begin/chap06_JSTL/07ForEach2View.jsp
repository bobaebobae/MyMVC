<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 6번과 달리 태그를 안쓰고  순수한자바코드? 스크립틀릿을 쓰겠다. -->   
<%	
	Object obj1 = request.getAttribute("nameArr1");	// 리턴타입은 Object
	Object obj2 = request.getAttribute("nameArr2");
	Object obj3 = request.getAttribute("nameArr3");	
	
	String[] nameArr1 = null;
	String[] nameArr2 = null;
	String[] nameArr3 = null;
	
	if(obj1 != null){
		nameArr1 = (String[]) obj1;
	}
	
	if(obj2 != null){
		nameArr2 = (String[]) obj2;
	}
	
	if(obj3 != null){
		nameArr3 = (String[]) obj3;
	}
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원명단 출력하기(스크립틀릿을 사용한 것)</title>	
</head>
<body>
	<h2>회원명단 출력하기(스크립틀릿을 사용한 것)</h2>
	<%
		if( nameArr1 != null && nameArr1.length>0 ) { %> <!-- nameArr이 null이 아닙니까? 그리고 배열이 null이 아니지만 길이가 0보다 커야 함! / 여기까지가 자바코드이고  --> 
			<ol> <!-- 여기서부턴 html코드이다. --> 
				<%  for(int i=0; i<nameArr1.length; i++){ %> <!-- 여기서부턴 자바코드이다 --> 
						<li><%= nameArr1[i] %></li>
				<%	} %>
			</ol>
	<% } 
		else{ %>
			nameArr1에는 등록된 회원이 없습니다 <br/>
	<% } %>
	
	<br/>
	<hr style="border:solid 1px cyan;" />
	
	<%
		if(nameArr2 == null){ %>
			nameArr2에는 등록된 회원이 없습니다.<br/>	
	<%	}  %>
	
	<%
		if(nameArr2 != null && nameArr2.length == 0){ %>
			nameArr2에는 등록된 회원이 없습니다.<br/>	
	<%	}  %>
	
	<br/>
	<hr style="border:solid 1px cyan;" />
	
	<%
		if(nameArr3 == null){ %>
			nameArr3에는 등록된 회원이 없습니다.<br/>	
	<%	}  %>
	
</body>
</html>