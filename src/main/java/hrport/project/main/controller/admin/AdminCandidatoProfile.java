package hrport.project.main.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.ProfiloUtente;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.CandidaturaService;
import hrport.project.main.service.UtenteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/admin/profilo/*")
public class AdminCandidatoProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String dataUser = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		
		 String pathInfo = request.getPathInfo();
	        if (pathInfo != null) {
	            String[] pathParts = pathInfo.split("/");
	            if (pathParts.length > 1) {
	                String userId = pathParts[1];
	                System.out.println(userId);
	                
	                try {
						
						Utente utente = UtenteService.getUserByIdUtenteWithProfile(Integer.valueOf(userId));
						dataUser = gson.toJson(utente);
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	                request.setAttribute("dataUser", dataUser);
	                request.getRequestDispatcher("/WEB-INF/view-admin/profilo_candidato.jsp").forward(request, response);
	                return;
	            }
	        }
     
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User id not specified in the path");
	
	}
}
