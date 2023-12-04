package hrport.project.main.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import hrport.project.main.service.PosizioneService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateEsperienzaLav
 */
@WebServlet("/admin/delete-posizione/*")
public class DeletePosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		
		 String[] pathInfo = request.getPathInfo().split("/");
	     String idPosParam = pathInfo[1];
	     
        try {
        	PosizioneService.deletePosizione(Integer.parseInt(idPosParam));
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
