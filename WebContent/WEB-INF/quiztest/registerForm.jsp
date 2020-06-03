<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 태그라이브러리를 써보겠다~ -->
    
<%
	String ctxPath = request.getContextPath();
	//	/MyMVC
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험_입력폼</title>

<style type="text/css">
   
   body {
         font-family: Arial, "MS Trebuchet", sans-serif;
         font-size: 16pt; 
   }
</style>
   
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/util/myutil.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

		$("span.error").css('display','none');

		$("input#userid").blur(function(){ 
			var regExp = /^[A-Z][A-Za-z0-9]{4,9}$/;
			var bool = regExp.test($(this).val());
			
			if(!bool) {
				$("span.userid_error").css('display','');
				
				$(":input").prop("disabled", true);
				$(this).prop("disabled", false);

				$(this).val("");
				$(this).focus();
			}
			else {
				$("span.userid_error").css('display','none');
				$(":input").prop("disabled", false);
				$("input#passwd").focus();
			}
		});
		
		$("input#name").blur(function(){
			
			if( $(this).val().trim()== "" ) {
				$("span.name_error").html("성명은 필수입력란 입니다").css('display','');
				
				$(":input").attr("disabled",true);
	        	$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			}
			else {
				$("span.name_error").empty();
				$(":input").attr("disabled",false);
			}
			
		});
		
		$("#btnRegister").click(function(){
			var nLength = $("input:radio[name=gender]:checked").length;
			if( nLength == 0 ){
				alert("성별을 선택하세요");
				return;
			}
			
			var frm = document.registerFrm;
			frm.action="memberRegister.do";
			frm.method="post";
			frm.submit();
		});
	});	
</script>
		
</head>
<body>
	<div id="container">
	<form name="registerFrm">
		<fieldset>
			<legend>회원가입( ${method} )</legend>
			<ul>
				<li>
					<label for="userid">아이디</label>
					<input type="text" name="userid" id="userid" value="" maxlength="20" required autofocus autocomplete="off" />
					<span class="error userid_error">아이디는 5글자 이상 10글자 이하로 첫글자는 영문대문자이고 나머지는 영문자,숫자로 혼합되어져야 합니다.</span>     
				</li>
	
				<li>
					<label for="name">성명</label>
					<input type="text" name="name" id="name" value="" maxlength="20" required />
				    <span class="error name_error"></span>
				</li>
						
				<li>
					<label>성별</label>
					<label>남<input type="radio" name="gender" value="M" /></label>&nbsp;
					<label>여<input type="radio" name="gender" value="F" /></label>
				</li>
				
				<li>
					<input type="button" id="btnRegister" value="회원가입" />
					<input type="reset" value="취소" />
				</li>
			</ul>
		</fieldset>
	</form>
</div>
</body>
</html>