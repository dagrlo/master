package es.uv.isw.sparrow.registereduser.showtopic;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uv.isw.sparrow.bean.Chip;
import es.uv.isw.sparrow.dao.MySQLChipDAO;

/**
 * Servlet implementation class ShowTopic
 */
@WebServlet("/pages/mainPage.jsp")
public class ShowTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static final String TOPICS_PARAM = "topics_null";
	private static final String NEXT_PAGE_PARAM = "/mainPage.jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTopic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MySQLChipDAO mscd;
		ArrayList<Chip> selected_chips = new ArrayList<Chip>();
		

		try {
			mscd = new MySQLChipDAO();
			if(mscd.getThreads().size() > 0){
				selected_chips = mscd.getThreads();
			}else{
				selected_chips.add(new Chip());
			}
		} catch (Exception e) {//Si falla la conexion con la base de datos, añade un chip con id -2.
			Chip a = new Chip();
			a.setId(-2);
			selected_chips.add(a);
		}
		
		request.setAttribute(TOPICS_PARAM, selected_chips);
		request.getRequestDispatcher(NEXT_PAGE_PARAM).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}