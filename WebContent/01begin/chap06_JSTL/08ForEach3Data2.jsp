<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String members = "일순신,이순신,삼순신,사순신,오순신";
	request.setAttribute("members", members);
	
	String friends = "한석규,두석규,세석규,네석규,오석규";
	request.setAttribute("friends", friends);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("08ForEach3View.jsp");
	dispatcher.forward(request, response);
%>		