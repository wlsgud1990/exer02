package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class AccountDao {
	String url ="jdbc:oracle:thin:@13.125.210.38:1521:xe";
	String user ="dev";
	String password ="oracle";
	
	public int addData(Map param) { //계정 생성		
		try { 
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("연결성공");
			//1.쿼리문
			String sql = "insert into account values(?,?,?,?)";
			//2.쿼리문 준비
			PreparedStatement ps = conn.prepareStatement(sql);
			//3.추가값넣기
			ps.setString(1, (String)param.get("id"));
			ps.setString(2, (String)param.get("pw"));
			ps.setString(3, (String)param.get("name"));
			ps.setString(4, (String)param.get("gender"));
			//4.쿼리실행
			int r = ps.executeUpdate(); // 실행 r은무조건1
			conn.close(); // 종료
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 실패하면 -1
		}
	}
	
}
