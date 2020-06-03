<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
	// ctxPath -> /MyMVC
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> form 태그를 사용한 데이터 전송 시 useBean 사용하기  </title>

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

</style>

<script type="text/javascript" src="/MyMVC/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/MyMVC/Util/myutil.js"></script>  <!-- myutil 쓰겠다 -->
<script type="text/javascript">

	$(document).ready(function(){ // 문서가 로딩되면 
		//$("span.error").hide();
		//또는
		$("span.error").css('display','none'); // error 선택자 숨겨라~~ error인 클래스는 숨겨라 css 또는 hide 씀 // display를 ''는 디폴트로   'none'은 없는 값을 주겠다.
		
		/*
			$("input#userid").bind('blur',function(){	// 이벤트 blur를 준다.	 포커스를 잃어버렸을 때 blur 발생! 초점 제거하고 다른 곳으로 이동시킴
				// 선택자에서 포커스를 잃어버리는 순간 발생되어지는 이벤트이다.
				alert("호호호");
			
		*/
		
		/*
			$("input#userid").blur(function(){
				// 선택자에서 포커스를 잃어버리는 순간 발생되어지는 이벤트 처리를 해주는 메소드(함수)이다.
				alert("헤헤헤");
		*/
		
			//아이디
			$("input#userid").blur(function(){
				// 아이디는 5글자 이상 10글자 이하로 첫글자는 영문대문자이고 나머지는 영문자,숫자로 혼합 되어져야 한다. 	
				// == 정규표현식 객체 만들기 ==
				// 항상/로 시작해서 /로 끝나고;을 붙인다.
				var regExp = /^[A-Z][A-Za-z0-9]{4,9}$/;
				
				// 생성된 정규표현식 객체 속에 데이터를 넣어서 검사하기
				var bool = regExp.test($(this).val()); //this는 $("input#userid"을 뜻함. this의 value값을 갖고오겠다.
				// 리턴타입이 boolean이다.
				
				if(!bool){	//올바르지 않을 때
				//	$("span.userid_error").show();
					$("span.userid_error").css('display','');
					
					$(":input").attr("disabled", true);	// .attr/prop : 모든 input태그를 뜻하고 못쓰게 비활성화. 막아버림.   true로 안되게 해버림.
					//또는
					//$(":input").prop("disabled", true);
					// $(":input")은 모든 input 태그를 말한다.
					
					$(this).prop("disabled",false);	// this로 내것만 제외하고 전부다 비활성화 시켜버림.
					//또는
					//$(this).attr("disabled", true);
					
					$(this).val(""); //값 비움
					$(this).focus();
				}else{	//올바를 때
					//$("span.userid_error").hide();
					$("span.userid_error").css('display','none');
					$(":input").prop("disabled", false);
					$("input#passwd").focus();	//#아이디 값을 가져옴
				}	
			});
				
			//비밀번호	
			$("input#passwd").blur(function(){
				var regExp =  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;         // 암호는 8글자 이상 15글자 이하의 영문자,숫자,특수기호가 혼합된 것이어야 한다.
				var bool = regExp.test($(this).val());
				
				if(!bool){	//올바르지 않을 때
					$("span.password_error").css('display','');
					$(":input").attr("disabled", true); // $(":input") 은 모든 input 태그를 말한다.
					$(this).prop("disabled",false);
					$(this).val(""); //값 비움
					$(this).focus();
				}else{	//올바를 때
					$("span.password_error").css('display','none');// error메세지 감추기
					$(":input").prop("disabled",false);
					$("input#passwdCheck").focus();
				}
			});
			
			//비밀번호 체크
			$("input#passwdCheck").blur(function(){
		
				if( $(this).val() != $("input#passwd").val() ){	//값 비교만 할 거임. 위에 적은 값과 지금 적은 값이 같다면
					$("span.passwdCheck_error").html("암호와 암호 확인 값이 서로 일치 하지 않습니다.").css('display','');	// .html에 비어있으니 넣어주자. //.css('display',''); html찍어주고 감춘 것을 봉라.
					$(":input#passwd").val("");
					$(this).val("");
					
					$(":input").attr("disabled", true);//비활성화
					//$(":input")은 모든 input 태그를 말함.
					
					$("input#passwd").attr("disabled",false);
		        	$(this).attr("disabled",false);
		        	
		        	$("input#passwd").focus();
				}else{	//올바를 때
					$("span.passwdCheck_error").empty();	// 에러메세지를 숨겨라
					$(":input").attr("disabled", false);
					
					$("input#name").focus();
				}
			});
			
			//성명 꼭 입력, 공백  ㄴ  유효성 검사
			$("input#name").blur(function(){
				if($(this).val().trim()==""){	//올바르지 않을 때
					$("span.name_error").html("성명은 필수입력입니다.").css('display','');	
			
					$(":input").attr("disabled", true);//비활성화
					$(this).prop("disabled",false);//활성화
					$(this).val(""); //값 비움
					$(this).focus();
				}else{	//올바를 때
					$("span.name_error").empty();		
					$(":input").attr("disabled",false);
					$("input#email").focus();
				}
			});
				
			//이메일
			$("input#email").blur(function(){
				
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp.test($(this).val());

				if(!bool){	//올바르지 않을 때
					$("span.email_error").html("올바른 이메일이 아닙니다").css('display','');
			
					$(":input").attr("disabled", true);//비활성화
					$(this).attr("disabled",false);//활성화
					$(this).val(""); //값 비움
					$(this).focus();
				}else{	//올바를 때
					$("span.email_error").empty();// error메세지 감추기
					$(":input").prop("disabled",false);
					$("input#tel").focus();
				}
			});
			
			//자택전화
			$("input#tel").blur(function(){
				var regExp = /^0[2-9][1-9]?-[1-9][0-9]{2,3}-[0-9]{4}$/i; //[]?는 없거나 1글자만 존재한다=={0,1} 0부터 1까지라는 뜻!		끝 i는 대소문자 구분하지않는다는 뜻이고 전화는 숫자만 들어와서 i 안씀
				var bool = regExp.test($(this).val());
				
				if(!bool){	//올바르지 않을 때
					$("span.tel_error").html("올바른 자택전화가 아닙니다").css('display','');
			
					$(":input").attr("disabled", true);//비활성화
					$(this).prop("disabled",false);//활성화
					$(this).val(""); //값 비움
					$(this).focus();
				}else{	//올바를 때
					$("span.tel_error").empty();
					$(":input").attr("disabled",false);
					$("input#jubun1").focus();
				}
			});
			
			//주민번호1
			$("input#jubun1").blur(function(){
				var regExp = /^[0-9]{6}$/i; //[]?는 없거나 1글자만 존재한다=={0,1} 0부터 1까지라는 뜻!		끝 i는 대소문자 구분하지않는다는 뜻이고 전화는 숫자만 들어와서 i 안씀
				var bool = regExp.test($(this).val());
				
				if(!bool){	//올바르지 않을 때
					$("span.jubun_error").html("숫자만 입력하세요").css('display','');
			
					$(":input").attr("disabled", true);//비활성화
					$(this).prop("disabled",false);//활성화
					$("input#jubun2").attr("disabled",false);
					$(this).val(""); //값 비움
					$(this).focus();
				}else{	//올바를 때
					$("span.jubun_error").empty();
					$(":input").attr("disabled",false);
					$("input#jubun2").focus();
				}
			});
			
			//주민번호2
			$("input#jubun2").bind("blur",function(){
				var sGender = $(this).val().substring(0,1);
		
				switch (sGender) {
				case "1":
				case "3":	
					$("input:radio[value='M']").prop("checked",true);
					//  $("input:radio[value='M']") 은 선택자가 input 태그의 type이 radio 중 value 값이 'M' 인것을 요소(태그)로 하겠다.
					//  $("input:radio[value='M']").prop("checked", true); 은 해당 선택자(남자 라디오)에 체크를 해라는 말이다.     

					break;
					
				case "2":
				case "4":
					$("input:radio[value='F']").prop("checked",true);

					break;
					
				default:
					$("input#jubun1").val("");
					$(this).val("");
					$("span.jubun_error").html("주민번호가 올바르지 않습니다").css('display','');
					
					$(":input").attr("disabled", true); //모든 input 태그를 끄자. 비활성화 하자
					$("input#jubun1").attr("disabled", false);
					$(this).attr("disabled", false);
					break;
				}
			});
			
			//회원가입 버튼 클릭
			$("#btnRegister").click(function(){
				// name이 registerFrm인 form을 submit하려고 할 때 발생되어지는 이벤트임.
				// 1. 주민번호가 올바른 주민번호인지 아닌지를 검사한다
				var sJubun = $("input#jubun1").val().trim() + $("input#jubun2").val().trim();	//스트링타입
				var bool = func_jubunCheck(sJubun);
				//console.log("submit안에 bool :" + bool);
				// 주민번호 공식이 맞으면 true를 리턴하고, 주민번호 공식에 틀리면 false를 리턴한다.

				if(!bool){ // 올바르지 않다면
					$("span.jubun_error").html("숫자만 입력하세요").css('display','');
					$("input#jubun1").val("");	//가짜니까 다 날려라
					$("input#jubun2").val("");  //가짜니까 다 날려라
					
					$("input:radio[value='M']").prop("checked", false);
					$("input:radio[value='F']").prop("checked", false);
					
					$("input#jubun1").focus();
					
					return;
					//종료한다. 서브밋을 하지 말아야 한다는 뜻이다.
				}
				
				// 2. 학력이 선택되었는지 검사한다.
				var nSchoolCheckedLen = $("input:radio[name=school]:checked").length;	//radio에 선택된 것이 갯수다..
			
				if(nSchoolCheckedLen == 0){ // 선택을 안했다면
					alert("학력을 선택하세요");
					return;
					//종료한다. 서브밋을 하지 말아야 한다는 뜻이다.
				}
				
				// 3. 관심분야는 최소한 2개 이상을 선택했는지 검사한다.
				var nInterestCheckedLen = $("input:checkbox[name=interest]:checked").length;	//radio에 선택된 것이 갯수다..
				if(nInterestCheckedLen < 2){ // 2개 이상 선택을 안했다면
					alert("관심분야는 최소한 2개 이상을 선택하세요");
					return;
					//종료한다. 서브밋을 하지 말아야 한다는 뜻이다.
				}
				
				// 4. 약관에 동의하는지 검사한다.
				var bAgreeChecked = $("input:checkbox[id=agree]").prop("checked");
				if(!bAgreeChecked){
					alert("약관에 동의하셔야 회원가입이 가능합니다.");
					return;
					//종료한다. 서브밋을 하지 말아야 한다는 뜻이다.
				}
				
				var frm = document.registerFrm;
				frm.action="05formUseBeanEnd.jsp";
				frm.method="post";
				frm.submit();
			});
			
	});// end of $(document).ready()------------------

</script>

</head>
<body>
<div id="container">
	<form name="registerFrm">
		<fieldset>
			<legend>회원가입</legend>
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
					<label for="tel">자택전화</label>
					<input type="tel"  name="tel" id="tel" value="" maxlength="13" placeholder="-로 입력하세요"/>
					<span class="error tel_error"></span>
				</li>
				<li>
					<label>주민번호</label>
					<input type="text" name="jubun1" id="jubun1" size="10" maxlength="6" required autocomplete="off" />&nbsp;-
					<input type="password" name="jubun2" id="jubun2" size="10" maxlength="7" required />   
					<span class="error jubun_error"></span>
				</li>
				<li>
					<label>성별</label>
					<label>남<input type="radio" name="gender" value="M" /></label>&nbsp;
					<label>여<input type="radio" name="gender" value="F" /></label>
				</li>
				<li>
					<label>학력</label>
					<div class="schoolInterest">
						<label for="school1">고졸</label><input type="radio" name="school" id="school1" value="고졸" />&nbsp;
				        <label for="school2">초대졸</label><input type="radio" name="school" id="school2" value="초대졸" />&nbsp;
				        <label for="school3">대졸</label><input type="radio" name="school" id="school3" value="대졸" />&nbsp;
				        <label for="school4">대학원졸</label><input type="radio" name="school" id="school4" value="대학원졸" />&nbsp; 
				    </div> 
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
					<label>약관동의</label>
					<label for="agree">동의</label><input type="checkbox" id="agree" />&nbsp;
				</li>
				<li>
					<iframe src="iframeAgree/agree.html" width="85%" height="150px" style="border: solid 1px navy; margin: 20px 0px"></iframe>
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



