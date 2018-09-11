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
		//if(request.getSession().isNew()) { // ���ʿ�û����
			
		//}
		//----------��Ű�α�������--------------------
		Cookie[] ar = request.getCookies();
		String value = null;
		if (ar != null) {
			for (int i = 0; i < ar.length; i++) {
				//System.out.println(ar[i].getName()+"/"+ar[i].getValue());
				if (ar[i].getName().equals("freepass")) {
					value = ar[i].getValue(); //��Ű�������̱�
				}
			}

		}
		if (value != null) {
			System.out.println("[CookieHandler] this client has a freepass cookie. value is"+ value);
			
			//----------��Ű�α�������--------------------
			request.getSession().setAttribute("login_condition", true); // ���Ϳ���true�����ָ�ƨ��ϱ�
			HttpSession session = request.getSession();
			session.setAttribute("login_condition", true); //�α���Ȯ�� true
			session.setAttribute("login_id", value); //������ id ���ǿ�����
			
			AccountDao dao = new AccountDao();
			Map info = dao.getLoginData(value);
			Date date = new Date(System.currentTimeMillis());//����ð�update
			//if (log != null) {
			//	session.setAttribute("latest", log.get("time"));
			//}
			dao.addLoginData(value,date); //�ð�
			//----------��Ű�α�������--------------------
			
		}else {
			System.out.println("[CookieHandler] this client does not hava a freepass cookie");
		}
	}

}
