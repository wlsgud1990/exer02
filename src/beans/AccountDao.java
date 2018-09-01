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
	
	//1.계정 정보 조회
	public List<Map<String,Object>> getAllDatas(){
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			//1.쿼리문
			String sql = "select * from account";
			//2.쿼리문 준비
			PreparedStatement ps = conn.prepareStatement(sql);
			//3.쿼리문 실행
			ResultSet rs = ps.executeQuery();
			//4.list이름생성
			List<Map<String,Object>> rst; // rst = 회원정보 map으로 묶음으로담음(id,pw,name,gender)
			
			//5.데이터뽑음
			if(rs.next()) { // rs가 true여야만 뽑음
				rst = new ArrayList<>(); // true일떄 객체생성
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
	
	//2.계정생성
	public int addData(Map param) {	
		try { 
			Connection conn = DriverManager.getConnection(url, user, password);
			//1.쿼리문
			String sql = "insert into account values(?,?,?,?)";
			//2.쿼리문 준비
			PreparedStatement ps = conn.prepareStatement(sql);
			//3.추가값넣기
			ps.setString(1, (String)param.get("id"));
			ps.setString(2, (String)param.get("pass"));
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
	
	//3.로그인데이터 저장
	public int addLoginData(String login_id, Date date) {
		try {
			//1.연결
			Connection conn = DriverManager.getConnection(url, user, password);
			//2.쿼리문
			String sql = "insert into loginlog values(?,?)";
			//3.쿼리문준비
			PreparedStatement ps = conn.prepareStatement(sql);
			//4.데이터추가
			ps.setString(1, login_id);
			ps.setDate(2, date);
			//5.쿼리문실행
			int r = ps.executeUpdate();
			System.out.println("총 "+r+"개의 데이터가 추가되었습니다.");
			//6.연결종료
			conn.close();			
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	//4.접속한 아이디 정보 셀렉트 //20180901 수정중
	public Map<String, Object> getLoginData(String id){
		try {
			//1.연결
			Connection conn = DriverManager.getConnection(url, user, password);
			//2.쿼리문
			String sql = "select * from account where id = ?";
			//3.쿼리문 준비
			PreparedStatement ps = conn.prepareStatement(sql);
			//4.데이터추가
			ps.setString(1, id);
			//5.쿼리문실행
			ResultSet rs = ps.executeQuery();
			//6.저장할 맵 추가
			Map<String,Object> ret;
			//6.데이터조회
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
	
}
