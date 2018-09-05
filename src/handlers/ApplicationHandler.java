package handlers;

import java.util.LinkedHashSet;

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
		//setAttribute안해주면 초기값이 null이므로 로그인시 에러발생
		sc.setAttribute("users", new LinkedHashSet<>());//실행시1
		System.out.println("servletContext 실행완료");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("servletContext 종료");
	}

}
