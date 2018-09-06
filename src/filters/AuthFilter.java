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
		
		System.out.println("원래목적지는:"+request.getRequestURI());
		String uri = request.getRequestURI();
		
		//0.로그인확인
		//1.세션뽑아야함
		HttpSession session = request.getSession();
		Boolean logincondition = (Boolean)session.getAttribute("login_condition");//true 로그인
		
		if(logincondition!=null) {//로그인됬으면
			chain.doFilter(request, response); // 로그인됬으면 필터통과
		}else {
			response.setContentType("text/html;charset=UTF-8");
			//PrintWriter out = response.getWriter();
			//out.println("accsee denied");
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}
}
