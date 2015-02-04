package uv.mesas.paks;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MesasServlet
 */
@WebServlet("/MesasServlet")
public class MesasServlet extends HttpServlet {
			
	private static final long serialVersionUID = 1L;
	private ArrayList<ResultadoMesa> resultados;
	private Gson gson;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MesasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		resultados=new ArrayList<ResultadoMesa>();	
		InputStream is = null;
		String linea;		
		
		ServletContext context = getServletContext();		
		try {
			is = context.getResourceAsStream("/WEB-INF/resultados_mesas.txt");
			BufferedReader br=new BufferedReader(new InputStreamReader(is));
			while ((linea=br.readLine())!=null){
				String[] trozos=linea.split(";");
				resultados.add(new ResultadoMesa(Integer.parseInt(trozos[0]),Integer.parseInt(trozos[1]),trozos[2].charAt(0),trozos[3],Integer.parseInt(trozos[4]),Integer.parseInt(trozos[5]),
								Double.parseDouble(trozos[6]),Integer.parseInt(trozos[7]),Double.parseDouble(trozos[8]),Integer.parseInt(trozos[9]),
								Double.parseDouble(trozos[10]),Integer.parseInt(trozos[11]),Double.parseDouble(trozos[12])));
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		gson=new Gson();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("lista", resultados);
		getServletContext().getRequestDispatcher("/mostrarResultados.jsp").forward(request, response);
		
		/*PrintWriter pw=response.getWriter();
		int i;
		
		if (request.getHeader("Accept").contains("html")){			
			pw.println("<html><head><title>Mesas</title></head><body><table>");
			for (i=0;i<resultados.size();i++){
				pw.println(resultados.get(i).toHTMLTableRow());
			}
			pw.println("</table></body></html>");
		}
		
		if (request.getHeader("Accept").contains("json")){			
			for (i=0;i<resultados.size();i++){
				pw.println(gson.toJson(resultados.get(i)));
			}			
		}		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultadoMesa res;
		
		//El token utilizado es 0b79
		
		synchronized(this){
			if (request.getHeader("Authorization").contains("0b79")){
				res=new ResultadoMesa();
				
				if (request.getHeader("Content-Type").contains("json")){			
					BufferedReader r=request.getReader();
					res=gson.fromJson(r, ResultadoMesa.class);
					resultados.add(res);			
				}
			}			
		}		
	}

}
