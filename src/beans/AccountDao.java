package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class AccountDao {
	String url ="jdbc:oracle:thin:@13.125.210.38:1521:xe";
	String user ="dev";
	String password ="oracle";
	
	//1.���� ���� ��ȸ
	public List<Map<String,Object>> getAllDatas(){
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			//1.������
			String sql = "select * from account";
			//2.������ �غ�
			PreparedStatement ps = conn.prepareStatement(sql);
			//3.������ ����
			ResultSet rs = ps.executeQuery();
			//4.list�̸�����
			List<Map<String,Object>> rst; // rst = ȸ������ map���� �������δ���(id,pw,name,gender)
			
			//5.�����ͻ���
			if(rs.next()) { // rs�� true���߸� ����
				rst = new ArrayList<>(); // true�ϋ� ��ü����
				do {
					Map<String, Object> one = new LinkedHashMap<>();
					one.put("id", rs.getString("id"));
					one.put("pass", rs.getString("pass"));
					one.put("name", rs.getString("name"));
					one.put("gender", rs.getString("gender"));
					rst.add(one);
				}while(rs.next());
			}else {
				rst = null;
			}
			conn.close();
			return rst;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//2.��������
	public int addData(Map param) {	
		try { 
			Connection conn = DriverManager.getConnection(url, user, password);
			//1.������
			String sql = "insert into account values(?,?,?,?)";
			//2.������ �غ�
			PreparedStatement ps = conn.prepareStatement(sql);
			//3.�߰����ֱ�
			ps.setString(1, (String)param.get("id"));
			ps.setString(2, (String)param.get("pass"));
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
