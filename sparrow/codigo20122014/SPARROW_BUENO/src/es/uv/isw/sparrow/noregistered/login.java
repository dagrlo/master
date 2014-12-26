package es.uv.isw.sparrow.noregistered;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uv.isw.sparrow.bean.UserBean;
import es.uv.isw.sparrow.bean.UserBeanFactory;

/**
 * Servlet implementation class login
 */
@WebServlet("/pages/*")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String USERNAME_PARAM = "username";
	private static final String PASSWORD_PARAM = "password";
	private static final String USERBEAN_ATTR = "userbean";
	private static final String CONTROLLER_PREFIX = "/pages";
	private static final String PRIVATE_PREFIX = "/WEB-INF/private";
	
	private static final String USER_ID = "userId";
	private static final String USER_NAME = "userName";
	private static final String USER_IS_LOGGED = "userIsLogged";
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// The default next page
		String nextPage = request.getPathInfo().replaceAll(CONTROLLER_PREFIX,"");
		nextPage = PRIVATE_PREFIX + nextPage;

		// Find userbean from session
		HttpSession session = request.getSession(true);
		UserBean userBean = (UserBean) session.getAttribute(USERBEAN_ATTR);
		
		if (userBean == null) {
			userBean = UserBeanFactory.newInstance();
            session.setAttribute(USERBEAN_ATTR, userBean);
			nextPage = "/login.jsp";
		}
		else if (!userBean.isLoggedIn()) {
			// Read request parameters
			String username = request.getParameter(USERNAME_PARAM);
			String password = request.getParameter(PASSWORD_PARAM);

			// Record username and password values
			userBean.setUsername(username);
			userBean.setPassword(password);
		
			// Attempt to login
			boolean result = false;
			try {
				result = userBean.doLogin(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
			
			if (!result) {
				nextPage = "/login.jsp";
			}
		}	
		
		
		//si el usuario se logea nos guardamos el id, el nombre y si esta logeado o no		 
		session.setAttribute(USER_ID, userBean.getId());
		session.setAttribute(USER_NAME, userBean.getName());
		session.setAttribute(USER_IS_LOGGED, userBean.isLoggedIn());
		
		// Transfer control to the selected page controller
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
