<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String notice_no = request.getParameter("notice_no");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    conn = DriverManager.getConnection(url, "hr", "1234");

    String sql = "select * from notice where notice_no = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, notice_no);
    rs = pstmt.executeQuery();
	if(rs.next()) {
%>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title><%=rs.getString("title")%></title>
</head>
<body>
    <div class="header">
        <h1><%=rs.getString("name")%>님의 '<%=rs.getString("title")%>'</h1>
    </div>
    <hr>
    <div class="container">
        <div class="box_Container">
            <div class="read_text">
                <p class="title">
                    <input name="title" type="text" value="<%=rs.getString("title")%>" readonly="readonly" />
                </p>
                <p class="name">
                    <input name="name" type="text" value="<%=rs.getString("name")%>님" readonly="readonly" />
                </p>
                <p class="text">
                    <input name="content" type="text" value="<%=rs.getString("content")%>" readonly="readonly" />
                </p>
            </div>
            <div class="close_contianer">
                <button class="close">
                    <a href="./Main.jsp">닫기</a>
                </button>
            </div>
        </div>
    </div>
</body>
</html>
<%
	}
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
