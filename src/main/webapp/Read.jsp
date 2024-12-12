<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Update.UpdateDAO"%>
<%@page import="Update.UpdateDTO"%>
<!DOCTYPE html>
<html>
<head>
<%
String notice_no = request.getParameter("notice_no");
UpdateDAO updatedao = new UpdateDAO();
UpdateDTO updatedto = updatedao.getDataByNoticeNo(notice_no);
%>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title><%=updatedto.getName()%>님의 '<%=updatedto.getTitle()%>'</title>
</head>
<body>
	<div class="header">
		<h1><%=updatedto.getName()%>님의 '<%=updatedto.getTitle()%>'
		</h1>
	</div>
	<hr>
	<div class="container">
		<div class="box_Container">
			<div class="read_text">
				<%
				// notice_no에 맞는 데이터가 있으면 수정 폼을 표시
				if (updatedto != null) {
				%>
				<p class="title">
					<input name="title" type="text" value="<%=updatedto.getTitle()%>"
						readonly="readonly" />
				</p>
				<p class="name">
					<input name="name" type="text" value="<%=updatedto.getName()%>님"
						readonly="readonly" />
				</p>
				<p class="text">
					<input name="content" type="text"
						value="<%=updatedto.getContent()%>" readonly="readonly" />
				</p>
				<%
				}
				%>
			</div>
			<div class="btn_container">
				<button class="close">
					<a href="./Main.jsp">닫기</a>
				</button>
			</div>
		</div>
	</div>
</body>
</html>
