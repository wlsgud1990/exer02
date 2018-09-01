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
	
	public int addData(Map param) { //���� ����		
		try { 
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���Ἲ��");
			//1.������
			String sql = "insert into account values(?,?,?,?)";
			//2.������ �غ�
			PreparedStatement ps = conn.prepareStatement(sql);
			//3.�߰����ֱ�
			ps.setString(1, (String)param.get("id"));
			ps.setString(2, (String)param.get("pw"));
			ps.setString(3, (String)param.get("name"));
			ps.setString(4, (String)param.get("gender"));
			//4.��������
			int r = ps.executeUpdate(); // ���� r��������1
			conn.close(); // ����
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // �����ϸ� -1
		}
	}
	
}
