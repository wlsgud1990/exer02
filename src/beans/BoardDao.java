package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDao {
	//1.SqlSessionFactory 
	SqlSessionFactory factory;
	
	//2.sql세션준비
	public BoardDao() throws IOException { // 생성자
		//3.builder추가
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//4.xml파일 input
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		//5. 빌더에 xml담기
		factory = builder.build(is);
	}
	
	//6.게시판등록
	public int addBoard(Map param) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("board.addBoard", param);
			if(r==1) {	//저장성공하면
				sql.commit(); // 저장
			}
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	//7.게시판전부select
	public List<Map> getBoard(){
		//1.세션
		SqlSession sql = factory.openSession();
		
		try{
			//2.쿼리실행
			List<Map> list = sql.selectList("board.getBoard");
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	//8. 게시판상세 
	public Map getOneByNo(int no) {
		//1.세션
		SqlSession sql = factory.openSession();
		try {
			Map detail_list = sql.selectOne("board.getOneBoard",no); // 파라미터안넘김
			return detail_list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//9 .추천
	public int updateGood(int no) {
		//1.세션
		SqlSession sql = factory.openSession();
		try {
			int r = sql.update("board.incGoodByNo", no);
			if(r==1) {
				sql.commit();
			}
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	//10.추천로그
	public int insertGoodlog(Map param) {
		//세션
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("board.addGood",param);
			if(r==1) {
				sql.commit();
			}
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
