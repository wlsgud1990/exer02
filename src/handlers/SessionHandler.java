package handlers;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionHandler implements HttpSessionListener{
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		
		//세션으로  application뽑기
		ServletContext application = session.getServletContext();
		Set<String> set = (Set)application.getAttribute("users");
		String id = (String)session.getAttribute("login_id");
		set.remove(id);
		application.setAttribute("user", set);// 안시켜도 됨?
	}
}
