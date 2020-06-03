<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] nameArr = {"일순신","이순신","삼순신","사순신","오순신"};
	request.setAttribute("nameArr", nameArr);
	
	String[] nameArr2 = {};
	request.setAttribute("nameArr2", nameArr2);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("06ForEach2View.jsp");
	dispatcher.forward(request, response);
%>