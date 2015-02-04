package edu.uv.dawts.trabajofinal;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerTareas
 */
@WebServlet("/jefeproyecto/VerTareas")
public class VerTareas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerTareas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoDatos ad = (AccesoDatos) getServletContext().getAttribute("bd");
		ArrayList<Proyecto> proyectos=new ArrayList<Proyecto>();
		System.out.println("GRT");
		try {
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
		getServletContext().getRequestDispatcher("/jefeproyecto/verTareas.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int proyecto=Integer.parseInt(request.getParameter("proyecto"));
		String nombreProyecto=request.getParameter("nombre_pr");
		System.out.println("PRJ:"+nombreProyecto);
		AccesoDatos ad = (AccesoDatos) getServletContext().getAttribute("bd");
		ArrayList<Tarea> tareas=new ArrayList<Tarea>();
		ArrayList<Usuario> usuarios=new ArrayList<Usuario>();
		try {
			tareas=ad.getAllTareas(proyecto);
			usuarios=ad.getAllUsuarios();
			if (nombreProyecto==null){
				nombreProyecto=ad.nombreProyecto(proyecto);
				System.out.println("PRJ2:"+nombreProyecto);
			}
		} catch (Exception e) {
			request.setAttribute("msg",
					"Se ha producido un error interno al crear el proyecto");
			request.setAttribute("ex", e);
			getServletContext().getRequestDispatcher("/errorPage.jsp").forward(
					request, response);
			e.printStackTrace();
		}
		request.setAttribute("proyecto", proyecto);
		request.setAttribute("nombreProyecto", nombreProyecto);
		request.setAttribute("tareas", tareas);
		request.setAttribute("usuarios", usuarios);
		getServletContext().getRequestDispatcher("/jefeproyecto/verTareas.jsp").forward(request, response);
	}

}
