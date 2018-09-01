package handlers;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ApplicationHandler implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("servletContext 실행");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		ServletContext sc = sce.getServletContext();
		sc.setRequestCharacterEncoding("UTF-8"); //getParameter 값 한글가능하도록 post일시
		System.out.println("servletContext 실행완료");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("servletContext 종료");
	}

}
