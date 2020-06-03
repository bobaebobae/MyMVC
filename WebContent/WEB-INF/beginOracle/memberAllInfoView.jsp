<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<%
	String ctxPath = request.getContextPath();
		//    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 회원정보 조회를 해주는 페이지</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	body{
  		padding: 20px;
  	}
  	a {
  		text-decoration: none !important;
  		font-size: 14pt;
  	}
  	div#content{
  		width: 80%;
  		margin-top: 30px auto;
  	}
  	
  	th {
  		font-size: 12pt;
  	}
  </style>
  
 <script type="text/javascript">
 
	$(document).ready(function(){
		
		// 체크박스에 선택된 회원들을 삭제하기 
		$("button#btnMemberDelete").click(function(){
			
			// == 체크박스에서 체크된 value값 (each 이용) == //
			var arrCheckedVal = new Array();
			
			$("input:checkbox[name=chkboxUserid]:checked").each(function(){
				arrCheckedVal.push($(this).val());
			});
			arrCheckedVal = arrCheckedVal.join(",");
			//alert("확인용 : "+arrCheckedVal);
			
			var frm = document.deleteFrm;
			frm.userides.value = arrCheckedVal;
			frm.action = "<%= ctxPath%>/memberDelete.do";
			frm.method = "post"; // 담았다가 post 방식으로 넘겨버림. ?가 전혀 보이지 않음~!
			frm.submit();
			
			// location.href = "/MyMVC/deleteMember.do?userides"+arrCheckedVal;	// userides들을 
		});
	});
	
	/* <script type="text/javascript">

	function delete_member(){
		var selectedMembersId = "";

		console.log($("input[type=checkbox]"));
		$("input[type=checkbox]").each(function(index){
			if(this.checked) {
				selectedMembersId += this.value + " ";
			}
		})
		
		alert(selectedMembersId);
	} */
	
	
</script>
  
  
</head>	
<body>
	<div id="navi">
		<a href="index.do">홈으로</a>
	</div>
	<h2>모든 회원정보 조회를 해주는 페이지</h2>
	<div id="content">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>아이디</th>
				<th>성명</th>
				<th>관심분야</th>
				<th>가입일자</th>	
				<th>상세정보조회</th>	
				<th>회원변경</th>
				<th>회원삭제</th>	
			</tr>
		</thead>
		<tbody>
		<c:forEach var="mvo" items="${memberList}">
			<tr>
				<td>${mvo.userid}</td>	
				<td>${mvo.name}</td>
				<td>${mvo.attention}</td>
				<td>${mvo.registerday}</td>
				<td><button onclick="location.href='/MyMVC/myInfoView.do?userid=${mvo.userid}'">조회</button></td>    <!-- javascript: 생략가능  / 전체 암데나 클릭하면 반응오게~!-->
				<td><button onclick="location.href='/MyMVC/updateMember.do?userid=${mvo.userid}'">변경</button></td>   
				<td><input type="checkbox" name="chkboxUserid" value="${mvo.userid}"/></td>
			</tr>
		</c:forEach>
		<tr align = center style="padding: 30px;">
			<td colspan="6"><button id="btnMemberDelete">회원삭제하기</button></td>
		</tr>
		</tbody>
	</table>
	<form name="deleteFrm">
		<input type="hidden" name="userides"/>  <!-- hidden쓰면 있지만 안보여짐 -->
	</form>
	</div>
</body>
</html>