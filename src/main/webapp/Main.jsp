<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/Main.css">
<title>게시판</title>
</head>
<body>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(url, "hr", "1234");
		String sql = "select * from notice order by notice_no desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	%>

	<div class="header">
		<h1>게시판</h1>
	</div>
	<hr>
	<div class="container">
		<div class="session">
			<div class="notice_board_top">
				<button>
					<a href="Create.jsp">글쓰기</a>
				</button>
			</div>
			<div class="notice_board_mid">
				<hr>
				<hr>
				<div class="nbm">
					<div class="nbm_number">
						<p>번호</p>
					</div>
					<div class="nbm_title">
						<p>제목</p>
					</div>
					<div class="nbm_name">
						<p>이름</p>
					</div>
					<div class="nbm_text">
						<p>내용</p>
					</div>
					<div class="nbm_count">
						<p>방문자 수</p>
					</div>
				</div>
				<hr>
				<hr>
				<div class="sub_nbm_content">

					<%
					while (rs.next()) {
					%>
					<div class="nbm">
						<div class="nbm_number">
							<p><%=rs.getString("notice_no")%></p>
						</div>
						<div class="nbm_title">
							<a href="Read.jsp?notice_no=<%=rs.getString("notice_no")%>"><%=rs.getString("title")%></a>
						</div>
						<div class="nbm_name">
							<p><%=rs.getString("name")%></p>
						</div>
						<div class="nbm_text">
							<p><%=rs.getString("content")%></p>
						</div>
						<div class="nbm_count">
							<p><%=rs.getString("notice_no")%></p>
						</div>
						<div class="delete_update">
							<a href="Update.jsp?notice_no=<%=rs.getString("notice_no")%>"><button
									class="update">수정</button></a>

							<form action="DeleteAction.jsp" method="post">
								<button class="delete">
									<a
										href="DeleteAction.jsp?notice_no=<%=rs.getString("notice_no")%>">삭제</a>
								</button>

							</form>
						</div>
					</div>
					<hr>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%
} catch (Exception e) {
e.printStackTrace();
} finally {
try {
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
} catch (Exception e) {
	e.printStackTrace();
}
}
%>
