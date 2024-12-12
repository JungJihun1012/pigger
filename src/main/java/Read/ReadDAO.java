package Read;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ReadDAO {

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

// 생성자
public ReadDAO() {
	try {
		Class.forName(driver);
	} catch (Exception e) {
		e.printStackTrace();
	}
}

// connection (데이터 베이스 연결)
public Connection getConnection() {
	Connection conn = null;

	try {
		conn = DriverManager.getConnection(url, "hr", "1234");
	} catch (Exception e) {
		e.printStackTrace();
	}

	return conn;
}

// update (업데이트)
public void Update(UpdateDTO updatedto) {

	Connection conn = null;
	PreparedStatement pstmt = null;

	String sql = "update notice set title = ?, name = ?, content = ? where notice_no = ?";
	conn = getConnection();

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, updatedto.getTitle());
		pstmt.setString(2, updatedto.getName());
		pstmt.setString(3, updatedto.getContent());
		pstmt.setString(4, updatedto.getNotice_no());

		System.out.println("notice_no af : " + updatedto.getNotice_no());

		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

}