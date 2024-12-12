<%@page import="Create.createDTO"%>
<%@page import="Create.createDAO"%>
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
<title>게시글 수정</title>
</head>
<body>
	<form action="UpdateAction.jsp" method="post">
		<div class="header">
			<h1>게시글 수정</h1>
		</div>
		<hr>
		<div class="container">

			<div class="box_Container">
				<div class="update_text">
					<%
					// notice_no에 맞는 데이터가 있으면 수정 폼을 표시
					if (updatedto != null) {
					%>
					<p class="number">
						<input name="notice_no" type="text"
							value="No.<%=updatedto.getNotice_no()%>" readonly="readonly" />
					</p>
					<p class="title">
						<input name="title" type="text" value="<%=updatedto.getTitle()%>" />
					</p>
					<p class="name">
						<input name="name" type="text" value="<%=updatedto.getName()%>님" readonly="readonly" />
					</p>
					<p class="text">
						<input name="content" type="text"
							value="<%=updatedto.getContent()%>" />
					</p>
					<%
					}
					%>
				</div>
				<div class="btn_container">
					<button class="negative">수정</button>
					<button class="close">
						<a href="./Main.jsp">닫기</a>
					</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
