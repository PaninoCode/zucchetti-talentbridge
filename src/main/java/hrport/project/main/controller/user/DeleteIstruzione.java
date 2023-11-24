package hrport.project.main.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import hrport.project.main.pojo.ProfiloUtente;
import hrport.project.main.service.EspLavorativaService;
import hrport.project.main.service.IstruzioneService;
import hrport.project.main.service.ProfiloUtenteService;

/**
 * Servlet implementation class DeleteIstruzione
 */
@WebServlet("/user/delete-istruzione/*")
public class DeleteIstruzione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		
		String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        String value = pathParts[1];
        
        Integer idTable = null;
        try {
			
        	idTable = Integer.valueOf(value);
		} catch (Exception e) {
			// TODO: handle exception
			String error = "{\"error\" : " + "\"" + e.getMessage() + "\"" + "}";
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(error);
            out.flush();
		}
        
        // parse the json String and take the attributes
        try {
        	
        	ProfiloUtente profilo = ProfiloUtenteService.getProfileUserByIdUtente(idUtente);
        	IstruzioneService.deleteIstruzInfo(idTable, profilo.getIdCv());
			
			String data = "{\"data\" : \"success\"}";
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(data);
            out.flush();
		} catch (Exception e) {
			
			String error = "{\"error\" : " + "\"" + e.getMessage() + "\"" + "}";
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(error);
            out.flush();
		}
	}

}
