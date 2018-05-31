package ExchangeDiary.dbconnect;

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

			conn = DriverManager.getConnection(jdbc_url,"root","426795");
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


		String sql ="insert into member(username, id, birth, phone, pwd) values(?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getId());
			pstmt.setString(3,dto.getBirth());
			pstmt.setString(4,dto.getTel());
			pstmt.setString(5,dto.getPassword());

			System.out.println("Hi");
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