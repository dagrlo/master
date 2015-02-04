package edu.uv.dawts.trabajofinal;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerTareas2
 */
@WebServlet("/programador/VerTareas")
public class VerTareas2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerTareas2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usuario=(int) getServletContext().getAttribute("usr");
		AccesoDatos ad = (AccesoDatos) getServletContext().getAttribute("bd");		
		ArrayList<Tarea> tareas=new ArrayList<Tarea>();
		System.out.println("usr:"+usuario);
		try {
			tareas=ad.getTareasUsuario(usuario);
		} catch (Exception e) {
			request.setAttribute("msg",
					"Se ha producido un error interno al crear el proyecto");
			request.setAttribute("ex", e);
			getServletContext().getRequestDispatcher("/errorPage.jsp").forward(
					request, response);
			e.printStackTrace();
		}
		request.setAttribute("tareas", tareas);
		getServletContext().getRequestDispatcher("/programador/verTareas.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
