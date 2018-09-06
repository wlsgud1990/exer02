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
	
	//2.sql�����غ�
	public BoardDao() throws IOException { // ������
		//3.builder�߰�
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//4.xml���� input
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		//5. ������ xml���
		factory = builder.build(is);
	}
	
	//6.�Խ��ǵ��
	public int addBoard(Map param) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("board.addBoard", param);
			if(r==1) {	//���强���ϸ�
				sql.commit(); // ����
			}
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	//7.�Խ�������select
	public List<Map> getBoard(){
		//1.����
		SqlSession sql = factory.openSession();
		
		try{
			//2.��������
			List<Map> list = sql.selectList("board.getBoard");
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	//8. �Խ��ǻ� 
	public Map getOneByNo(int no) {
		//1.����
		SqlSession sql = factory.openSession();
		try {
			Map detail_list = sql.selectOne("board.getOneBoard",no); // �Ķ���;ȳѱ�
			return detail_list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//9 .��õ
	public int updateGood(int no) {
		//1.����
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
	//10.��õ�α�
	public int insertGoodlog(Map param) {
		//����
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
