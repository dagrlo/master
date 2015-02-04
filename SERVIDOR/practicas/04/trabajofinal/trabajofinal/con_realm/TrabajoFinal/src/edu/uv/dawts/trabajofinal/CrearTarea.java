package edu.uv.dawts.trabajofinal;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CrearTarea
 */
@WebServlet("/jefeproyecto/CrearTarea")
public class CrearTarea extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearTarea() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoDatos ad = (AccesoDatos) getServletContext().getAttribute("bd");
		
		ArrayList<Usuario> usuarios=new ArrayList<Usuario>();
		ArrayList<Proyecto> proyectos=new ArrayList<Proyecto>();		
		try {
			usuarios=ad.getAllUsuarios();
			proyectos=ad.getAllProyectos();
		} catch (Exception e) {
			request.setAttribute("msg",
					"Se ha producido un error interno al crear el proyecto");
			request.setAttribute("ex", e);
			getServletContext().getRequestDispatcher("/errorPage.jsp").forward(
					request, response);
			e.printStackTrace();
		}
		request.setAttribute("proyectos", proyectos);
		request.setAttribute("usuarios", usuarios);
		getServletContext().getRequestDispatcher("/jefeproyecto/crearTarea.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tarea=request.getParameter("tarea");
		int proyecto=Integer.parseInt(request.getParameter("proyecto"));
		int usuario=Integer.parseInt(request.getParameter("usuario"));
		int year=Integer.parseInt(request.getParameter("year"));
		int mes=Integer.parseInt(request.getParameter("mes"));
		int dia=Integer.parseInt(request.getParameter("dia"));
		
		AccesoDatos ad = (AccesoDatos) getServletContext().getAttribute("bd");
		
		try {
			System.out.println("->"+usuario);
			ad.creaTarea(tarea, proyecto, usuario, year, mes, dia);
		} catch (Exception e) {
			request.setAttribute("msg",
					"Se ha producido un error interno al crear el proyecto");
			request.setAttribute("ex", e);
			getServletContext().getRequestDispatcher("/errorPage.jsp").forward(
					request, response);
			e.printStackTrace();
		}
	}

}
