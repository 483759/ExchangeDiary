package com;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginCheck {
	public static boolean pass(String id, String pwd) {
		String pass = null;

		Connection conn = DiaryDB.connect();

		String sql = "select * from member where id = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("pwd");

			DiaryDB.disconnect(rs);
			DiaryDB.disconnect(pstmt);
			DiaryDB.disconnect(conn);
			if(pass.equals(pwd))
				return true;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
