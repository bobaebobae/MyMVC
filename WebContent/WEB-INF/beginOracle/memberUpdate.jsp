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
<title>회원정보 변경하기</title>

<style type="text/css">
   
   body {
         font-family: Arial, "MS Trebuchet", sans-serif;
         font-size: 16pt; 
   }
   
   * {margin: 0;}

   div#container { 
      width: 90%;
       margin: 0 auto;
       padding: 50px 0;
      text-align: center;               
      /* border: 1px solid red; */
   }
   
   fieldset {
             text-align: left;
             background: #ffffe6;}
   
   legend {font-size: 24pt;}
   
   fieldset>ul {
      list-style: none;
      padding: 0;
   }
   
   fieldset>ul>li {
      line-height: 40px;
   }
   
   fieldset>ul>li>label:first-child {
      display: inline-block;
      width: 10%;
      /* border: solid 1px green; */
   }
   
   fieldset>ul>li>input {
      width: 20%;
      height: 20px;
      /* border: solid 1px blue; */
   }
   
   div.schoolInterest {
      display: inline-block;
      width: 50%;
      /* border: solid 1px gray; */
   }
   
   div.schoolInterest>label {
      margin-right: 2%;
   }
   
   div.schoolInterest>input {
      margin-right: 5%;
   }
   
    fieldset>ul>li:last-child>input {
       width: 10%;
       height: 50px;
       margin: 2% 4% 0 0;
       font-size: 16pt;
       font-weight: bold;
       background: #006600;
       color: #eee;
       border: none;
    }
    
    fieldset>ul>li:last-child>input:hover {
       opacity: 0.8;
       cursor: pointer;
       color: #ffffcc;
    }
   
   span.error {
      color: red;
      font-size: 10pt;
   }
   
   label#agree {
      font-size: 10px;
   }
   

</style>

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/util/myutil.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
	
		var attention = "${mvo.attention}";	// 제이쿼리 선택자는 괄호고 얘는 중괄호니까 헷갈리면 안됨~!!! 자바스크립트는 입력되는 데이터(밸류) 값에 의해 바뀌니 반드시 쌍따옴표나 헛따옴표 해줘야함 !!!! requestScope. 생략가능
		// alert(attention);     //Java, Oracle, HTML, JavaScript
		
		if(attention != "없음") { // 체크한게 있다면
			var arrAttention = attention.split(","); // 쪼개서 배열로 만들기
			
			$("input:checkbox[name=interest]").each(function(){  // each는 반복문
				
				for(var i=0; i<arrAttention.length; i++){
					if( $(this).val() == arrAttention[i] ){ // 관심분야가 오라클이야? html?? 자바스크립트야? 하나씩 비교  즉, Oracle == Oracle 일치하면
						// 같다면 체크박스에 체크해야한다.
						$(this).prop("checked", true); // 체크박스에 체크해라~!
						break; // 그리고 break로 빠져나오자
					}
				}
			});
		}
		
		//	$("span.error").hide();
		//  또는 	
		$("span.error").css('display','none');
		
	    $("input#passwd").blur(function(){
	    	
	    	var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
	    	var bool = regExp.test($(this).val());
	    	
	    	if(!bool) {
	        	$("span.password_error").css('display','');
	        	
	        	$(":input").attr("disabled",true);
	        	// $(":input") 은 모든 input 태그를 말한다.
	        	
	        	$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
	        }
	        else {
	        	$("span.password_error").css('display','none');
	        	$(":input").attr("disabled",false);
	        	$("input#passwdCheck").focus();
	        }
	    	
	    });// end of $("input#passwd").blur()------------
	    

	    $("input#passwdCheck").blur(function(){
	    	
	    	if( $(this).val() != $("input#passwd").val() ) {
	        	$("span.passwdCheck_error").html("암호와 암호확인값이 서로 일치하지 않습니다.").css('display','');
	        	
	        	$("input#passwd").val("");
	        	$(this).val("");
	        	
	        	$(":input").attr("disabled",true);
	        	// $(":input") 은 모든 input 태그를 말한다.
	        	
	        	$("input#passwd").attr("disabled",false);
	        	$(this).attr("disabled",false);
	        	
	        	$("input#passwd").focus();
	        }
	        else {
	        	$("span.passwdCheck_error").empty();
	        	$(":input").attr("disabled",false);
	        	
	        	$("input#name").focus();
	        }
	    	
	    });// end of $("input#passwdCheck").blur()------------	    
	    

	    $("input#name").blur(function(){
			
			if( $(this).val().trim()=="" ) {
				$("span.name_error").html("성명은 필수입력란 입니다").css('display','');
				
				$(":input").attr("disabled",true);
	        	$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			}
			else {
				$("span.name_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#email").focus();
			}
			
		});// end of $("input#name").blur()----------------	    
	    
		
		$("input#email").blur(function(){
			
	        var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	        var bool = regExp.test($(this).val());  
			
	        if(!bool) {
	        	$("span.email_error").html("올바른 이메일이 아닙니다.").css('display','');
	        	
	        	$(":input").attr("disabled",true);
	        	$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
	        }
	        else {
	        	$("span.email_error").empty();
	        	$(":input").attr("disabled",false);
	        	$("input#tel").focus();
	        }

		});// end of $("input#email").blur()------------------
		
		
		
		$("#btnUpdate").click(function(){
			// name 이 registerFrm 인 form 을 submit 하려고 할 때 발생되어지는 이벤트임.
			
			var frm = document.updateFrm;
			frm.action="updateMember.do";
			frm.method="post";
			frm.submit();
			
		});// end of $("#btnRegister").click(function(){})--------
		
	});// end of $(document).ready()---------------------------
</script>

</head>
<body>
<div id="container">
	<form name="updateFrm">
		<fieldset>
			<legend>회원정보 변경하기( ${method} )</legend>
			<ul>
				<li>
					<label for="userid">아이디</label>
					<input type="text" name="userid" id="userid" value="${mvo.userid}" readonly />
				</li>
				
				<li>
					<label for="passwd">암호</label>
					<input type="password" name="passwd" id="passwd" value="" maxlength="20" required />
					<span class="error password_error">암호는 8글자 이상 15글자 이하의 영문자,숫자,특수기호가 혼합된 것이어야 합니다.</span>
				</li>
				
				<li>
					<label for="passwdCheck">암호확인</label>
					<input type="password" id="passwdCheck" value="" required />
				    <span class="error passwdCheck_error"></span>
				</li>
				
				<li>
					<label for="name">성명</label>
					<input type="text" name="name" id="name" value="${mvo.name}" maxlength="20" required readonly />
				    <span class="error name_error"></span>
				</li>
				
				<li>
					<label for="email">e메일</label>
					<input type="email" name="email" id="email" value="${mvo.email}" maxlength="40" placeholder="예 abc@gmail.com" required />
				    <span class="error email_error"></span>
				</li>
				
				<li>
					<label>관심분야</label>
					<div class="schoolInterest">
						<label for="interest1">Java</label><input type="checkbox" name="interest" id="interest1" value="Java" />&nbsp;
				        <label for="interest2">Oracle</label><input type="checkbox" name="interest" id="interest2" value="Oracle" />&nbsp;
				        <label for="interest3">HTML</label><input type="checkbox" name="interest" id="interest3" value="HTML" />&nbsp;
				        <label for="interest4">JavaScript</label><input type="checkbox" name="interest" id="interest4" value="JavaScript" />&nbsp;
					</div> 
				</li>
				
				<li>
					<input type="button" id="btnUpdate" value="회원변경" />
					<input type="reset" value="취소" />
				</li>
			</ul>
		</fieldset>
	</form>
</div>
</body>
</html>