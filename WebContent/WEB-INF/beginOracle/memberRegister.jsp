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
<title>회원가입</title>

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
	
	//	$("span.error").hide();
	//  또는 	
		$("span.error").css('display','none');
		
		/* $("input#userid").bind("blur", function(){ 
			// 선택자에서 포커스를 잃어버리는 순간 발생되어지는 이벤트 
			alert("호호호");	
		}); */
		
		/* $("input#userid").blur(function(){ 
			// 선택자에서 포커스를 잃어버리는 순간 발생되어지는 이벤트처리를 해주는 메소드  
			alert("헤헤헤");
		}); */
			
		$("input#userid").blur(function(){ 
			// 아이디는 5글자 이상 10글자 이하로 첫글자는 영문대문자이고 나머지는 영문자,숫자로 혼합이 되어져야 한다. 
			// == 정규표현식 객체 만들기 == 
			//    항상 / 로 시작해서 / 로 끝나고 ; 을 붙인다. 
			var regExp = /^[A-Z][A-Za-z0-9]{4,9}$/;
			
			// 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기 
			var bool = regExp.test($(this).val());
			// 리턴타입이 boolean 이다.
			
			if(!bool) {
			//	$("span.userid_error").show();
				$("span.userid_error").css('display','');
				
				$(":input").prop("disabled", true);
			//  또는 
			//  $(":input").attr("disabled", true);
			// 	$(":input") 은 모든 input 태그를 말한다.
			//  비활성시킨다.
				
				$(this).prop("disabled", false);
			//  또는 
			//  $(this).attr("disabled", true);
			
				$(this).val("");
				$(this).focus();
			}
			else {
            //	$("span.userid_error").hide();
				$("span.userid_error").css('display','none');
				$(":input").prop("disabled", false);
				$("input#passwd").focus();
			}
			
		}); // end of $("input#userid").blur()---------------
		
		
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
		
		
		
		$("#btnRegister").click(function(){
			// name 이 registerFrm 인 form 을 submit 하려고 할 때 발생되어지는 이벤트임.
			
			// 성별을 선택했는지 검사한다.
			var nLength = $("input:radio[name=gender]:checked").length;
			if( nLength == 0 ){
				alert("성별을 선택하세요");
				return;
				// 종료한다. 서브밋을 하지 말아야 한다는 뜻이다.
			}
			// 약관에 동의하는지 검사한다.
			var bAgreeChecked = $("input:checkbox[id=agree]").prop("checked");
			if(!bAgreeChecked) {
				alert("약관에 동의 하셔야 회원가입이 가능합니다.");
				return;
				// 종료한다. 서브밋을 하지 말아야 한다는 뜻이다.
			}
			
			var frm = document.registerFrm;
			frm.action="memberRegister.do";
			frm.method="post";
			frm.submit();
			
		});// end of $("#btnRegister").click(function(){})--------
		
	});// end of $(document).ready()---------------------------

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
					<input type="text" name="name" id="name" value="" maxlength="20" required />
				    <span class="error name_error"></span>
				</li>
				
				<li>
					<label for="email">e메일</label>
					<input type="email" name="email" id="email" value="" maxlength="40" placeholder="예 abc@gmail.com" required />
				    <span class="error email_error"></span>
				</li>
								
				<li>
					<label>성별</label>
					<label>남<input type="radio" name="gender" value="M" /></label>&nbsp;
					<label>여<input type="radio" name="gender" value="F" /></label>
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
					<label for="introduce">자기소개</label>
					<textarea rows="7" cols="40" id="introduce" name="introduce"></textarea>
				</li>
				
				<li>
					<label>약관동의</label>
					<label for="agree">동의</label><input type="checkbox" id="agree" />&nbsp;
				</li>
				
				<li>
					<iframe src="<%= ctxPath%>/iframeAgree/agree.html" width="85%" height="150px" style="border: solid 1px navy; margin: 20px 0px"></iframe>
					 <!-- html안에 또 다른 html을 넣을 때 iframe을 씀 -->
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