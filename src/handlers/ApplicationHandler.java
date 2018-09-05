package handlers;

import java.util.LinkedHashSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ApplicationHandler implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("servletContext ����");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		ServletContext sc = sce.getServletContext();
		sc.setRequestCharacterEncoding("UTF-8"); //getParameter �� �ѱ۰����ϵ��� post�Ͻ�
		//setAttribute�����ָ� �ʱⰪ�� null�̹Ƿ� �α��ν� �����߻�
		sc.setAttribute("users", new LinkedHashSet<>());//�����1
		System.out.println("servletContext ����Ϸ�");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("servletContext ����");
	}

}
