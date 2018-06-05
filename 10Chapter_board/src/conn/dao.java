package conn;

import java.sql.*;
import java.util.*;

public class dao { 

	Connection conn = null;
	PreparedStatement pstmt = null;

	/* MySQL*/
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/diary"; 

	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url,"root","");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean insertDB(dto dto) {
		connect();


		String sql ="insert into user(email,pwd,name,birth) values(?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,dto.getEmail());
			pstmt.setString(2,dto.getPassword());
			pstmt.setString(3,dto.getName());
			pstmt.setString(4,dto.getBirth());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
}