package filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter extends HttpFilter{
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("������������:"+request.getRequestURI());
		String uri = request.getRequestURI();
		
		//0.�α���Ȯ��
		//1.���ǻ̾ƾ���
		HttpSession session = request.getSession();
		Boolean logincondition = (Boolean)session.getAttribute("login_condition");//true �α���
		
		if(logincondition!=null) {//�α��Ή�����
			chain.doFilter(request, response); // �α��Ή����� �������
		}else {
			response.setContentType("text/html;charset=UTF-8");
			//PrintWriter out = response.getWriter();
			//out.println("accsee denied");
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}
}
