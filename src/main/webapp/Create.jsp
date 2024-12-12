<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>게시글 작성</title>
</head>
<body>
	<form action="CreateAction.jsp" method="post">
		<div class="header">
			<h1>게시글 작성</h1>
		</div>
		<hr>
		<div class="container">
			<div class="box_Container">
				<div class="create_text">
					<p class="title">
						<input name="title" type="text" placeholder="제목"/>
					</p>
					<p class="name">
						<input name="name" type="text" placeholder="아이디" />
					</p>
					<p class="text">
						<input name="content" type="text" placeholder="내용을 입력하세요."/>
					</p>
				</div>
				<div class="btn_container">
					<button class="positive">추가</button>
					<button class="close">
						<a href="Main.jsp">닫기</a>
					</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
