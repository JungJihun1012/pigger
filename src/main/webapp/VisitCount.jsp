<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    	String strcnt = (String) application.getAttribute("counter");
    	int count = (strcnt == null) ? 0 : Integer.valueOf(strcnt);
    	out.print("방문자수: "+ count);
    	application.setAttribute("counter", String.valueOf(++count));
    %>