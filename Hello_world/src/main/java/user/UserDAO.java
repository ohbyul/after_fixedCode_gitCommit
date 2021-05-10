package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class UserDAO {
	//데이터 베이스 접근 객체

	public int join(String userID,String userPW){
		String SQL = "INSERT INTO USER VALUES(?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			return pstmt.executeUpdate();
			//리턴 반환된 값 오류가 발생하면 데이터가 안들어가서0 이됨 void가 아니라 int 값으로 반환 변경
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		//오류가 발생한 경우 -1값 반환
	}
	
}
