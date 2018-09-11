package handlers;


import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.AccountDao;

public class RequestHandler implements ServletRequestListener {
	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		ServletRequest req = sre.getServletRequest();
		HttpServletRequest request = (HttpServletRequest) req;
		//if(request.getSession().isNew()) { // 최초요청인지
			
		//}
		//----------쿠키로그인유지--------------------
		Cookie[] ar = request.getCookies();
		String value = null;
		if (ar != null) {
			for (int i = 0; i < ar.length; i++) {
				//System.out.println(ar[i].getName()+"/"+ar[i].getValue());
				if (ar[i].getName().equals("freepass")) {
					value = ar[i].getValue(); //쿠키벨류값뽑기
				}
			}

		}
		if (value != null) {
			System.out.println("[CookieHandler] this client has a freepass cookie. value is"+ value);
			
			//----------쿠키로그인유지--------------------
			request.getSession().setAttribute("login_condition", true); // 필터에서true안해주면튕기니깐
			HttpSession session = request.getSession();
			session.setAttribute("login_condition", true); //로그인확인 true
			session.setAttribute("login_id", value); //접속한 id 세션에저장
			
			AccountDao dao = new AccountDao();
			Map info = dao.getLoginData(value);
			Date date = new Date(System.currentTimeMillis());//현재시간update
			//if (log != null) {
			//	session.setAttribute("latest", log.get("time"));
			//}
			dao.addLoginData(value,date); //시간
			//----------쿠키로그인유지--------------------
			
		}else {
			System.out.println("[CookieHandler] this client does not hava a freepass cookie");
		}
	}

}
