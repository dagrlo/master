package es.uv.isw.sparrow.registereduser.showfollowers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uv.isw.sparrow.bean.Follower;
import es.uv.isw.sparrow.bean.UserBean;

/**
 * Servlet implementation class ShowFollowers
 */
@WebServlet("/ShowFollowers")
public class ShowFollowers extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final String USERBEAN_ATTR = "userbean";
	private static final String RETURN_ATTR = "followList";
	private SearchFollowers search;
	private ArrayList<Follower> followList;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFollowers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId=-1;
		int kk;
		
		HttpSession session = request.getSession(true);
		UserBean userBean = (UserBean) session.getAttribute(USERBEAN_ATTR);		
		userId=userBean.getId();
		
		 
				
		System.out.println("ID1:"+userId+" kk:"+session.getAttribute("userId"));
		search=new SearchFollowers(userId);
		followList=new ArrayList<Follower>();
		followList=search.doSearch();
		
		request.setAttribute(RETURN_ATTR, followList);
		getServletContext().getRequestDispatcher("/show_followers.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
