package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
	
	//3.�α��ε����� ����
	public int addLoginData(String login_id, Date date) {
		try {
			//1.����
			Connection conn = DriverManager.getConnection(url, user, password);
			//2.������
			String sql = "insert into loginlog values(?,?)";
			//3.�������غ�
			PreparedStatement ps = conn.prepareStatement(sql);
			//4.�������߰�
			ps.setString(1, login_id);
			ps.setDate(2, date);
			//5.����������
			int r = ps.executeUpdate();
			System.out.println("�� "+r+"���� �����Ͱ� �߰��Ǿ����ϴ�.");
			//6.��������
			conn.close();			
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	//4.������ ���̵� ���� ����Ʈ //20180901 ������, �α���Ȯ��
	public Map<String, Object> getLoginData(String id){
		try {
			//1.����
			Connection conn = DriverManager.getConnection(url, user, password);
			//2.������
			String sql = "select * from account where id = ?";
			//3.������ �غ�
			PreparedStatement ps = conn.prepareStatement(sql);
			//4.�������߰�
			ps.setString(1, id);
			//5.����������
			ResultSet rs = ps.executeQuery();
			//6.������ �� �߰�
			Map<String,Object> ret;
			//6.��������ȸ
			if(rs.next()) {
				ret = new LinkedHashMap<>();
				ret.put("id", rs.getString("id"));
				ret.put("pass", rs.getString("pass"));
				ret.put("name", rs.getString("name"));
				ret.put("gender", rs.getString("gender"));
			}else {
				ret =null;
			}
			conn.close();
			return ret;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//5.������ ���̵� �����ϱ�
	public int updateLoginData(String id, String pass , String name, String gender) {
		try {
			//1.����
			Connection conn = DriverManager.getConnection(url, user, password);
			//2.������
			String sql = "update account set pass =? , name =? , gender =? where id = ?";
			//3.���������
			PreparedStatement ps = conn.prepareStatement(sql);
			//4.�������߰�
			ps.setString(1, pass);
			ps.setString(2, name);
			ps.setString(3, gender);
			ps.setString(4, id);
			//5.������ ����
			int r = ps.executeUpdate();		
			System.out.println("r:"+r);
			//6.��������
			conn.close();
			return r;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	//6.����������
	public int sendMessage(Map param) {
		try {
			//1.����
			Connection conn = DriverManager.getConnection(url, user, password);
			//2.������
			String sql = "insert into message values(?,?,?,?,?,?)";
			//3.���������
			PreparedStatement ps = conn.prepareStatement(sql);
			//4.? �� �ֱ�
			ps.setString(1,(String)param.get("code"));
			ps.setString(2,(String)param.get("sender"));
			ps.setString(3,(String)param.get("receiver"));
			ps.setString(4,(String)param.get("content"));
			ps.setDate(5,(Date)param.get("senddate"));
			ps.setDate(6,(Date)param.get("receivedate"));
			//5.����
			int r = ps.executeUpdate();
			//6.��������
			conn.close();
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	//7.����Ȯ��
	public List<Map<String,Object>> receiveMessage(String receiver){
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			//1.������
			String sql = "select * from message where receiver =?";
			//2.������ ���
			PreparedStatement ps = conn.prepareStatement(sql);
			//2-1 ? ��
			ps.setString(1, receiver);
			//3.��������
			ResultSet rs = ps.executeQuery();
			//4.List
			List<Map<String,Object>> list;
			//5.���
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					Map<String,Object> map = new HashMap<>();
					map.put("code", rs.getString("code"));
					map.put("sender", rs.getString("sender"));
					map.put("receiver", rs.getString("receiver"));
					map.put("content", rs.getString("content"));
					map.put("senddate", rs.getDate("senddate"));
					map.put("receivedate", rs.getDate("receivedate"));
					list.add(map);
				}while(rs.next());
			}else {
				list = null;
			}
			conn.close();
			return list;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//8.����Ȯ�νð�
		public int receiveDate(String code, Date receive) {
			try {
				//0.����
				Connection conn = DriverManager.getConnection(url, user, password);
				//1.������
				String sql = "update message set receivedate=? where code=?";
				//2.�غ�
				PreparedStatement ps = conn.prepareStatement(sql);
				//3.�Ķ����
				ps.setDate(1, receive);
				ps.setString(2, code);
				//4.����
				int r = ps.executeUpdate();
				//5.��������
				conn.close();
				return r;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
	
}
