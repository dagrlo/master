package es.uv.isw.sparrow.registereduser.management;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uv.isw.sparrow.bean.User;
import es.uv.isw.sparrow.dao.MySQLUserDAO;
import es.uv.isw.sparrow.dao.UserDAO;

/**
 * Servlet implementation class UserManagementServlet
 */
@WebServlet("/UserManagement")
public class UserManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String USER_ATTR = "user";   
    private static final String MESSAGE_ATTR = "message";
    private static final String PASS_PARAM = "password";
    private static final String NAME_PARAM = "name";
    private static final String NAME2_PARAM = "name2";
    private static final String SEX_PARAM = "sex";
    private static final String LANGUAGE_PARAM = "language";
    private static final String SUBMIT_PARAM = "change_user";
    
    private static UserDAO userDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementController() {
        super();
        userDao = new MySQLUserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Take id from session user
		int userId = 1;
		String message = "";
		//When try to change user configuration
		if(request.getParameterMap().containsKey(SUBMIT_PARAM))
		{
			User user = new User(null, request.getParameter(PASS_PARAM), null, request.getParameter(NAME_PARAM), 
								request.getParameter(NAME2_PARAM), request.getParameter(SEX_PARAM),
								request.getParameter(LANGUAGE_PARAM));
			user.setId(userId);
			
			try 
			{
				userDao.update(user);
				message = "Éxito cambio";
			} 
			catch(SQLException e)
			{
				e.printStackTrace();
				message = "Error actualización";
			}
			
			try 
			{
				user = userDao.findById(userId);
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				message = "Error extracción";
			}
			request.setAttribute(USER_ATTR, user);
			
		}
		else
		{
			
			User user = null;
			try 
			{
				user = userDao.findById(userId);
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				message = "Error extracción";
			}
			request.setAttribute(USER_ATTR, user);
		}
		
		request.setAttribute(MESSAGE_ATTR, message);
		String nextPage = "/ManagementUserView.jsp";
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
