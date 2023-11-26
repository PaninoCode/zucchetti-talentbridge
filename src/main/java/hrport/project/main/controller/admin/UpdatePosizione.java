package hrport.project.main.controller.admin;

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
import hrport.project.main.service.ProfiloUtenteService;

/**
 * Servlet implementation class UpdateEsperienzaLav
 */
@WebServlet("/admin/update-posizione")
public class UpdatePosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		
		StringBuilder jsonContent = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonContent.append(line);
            }
        }catch(Exception e) {
        	
        	String error = "{\"data\" : " + "\"" + e.getMessage() + "\"" + "}";
        	
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
        	EspLavorativaService.updateEsperienza(jsonContent.toString(), profilo.getIdCv());
			
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
		
		
		/*HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		
		 BufferedReader reader2 = request.getReader();
		 StringBuilder requestBody = new StringBuilder();
		 String line2;
		 
		 while ((line2 = reader2.readLine()) != null) {
	            requestBody.append(line2);
	        }
		 
		 System.out.println(line2);
		 
		 response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        out.println("{ \"status\": \"success\", \"message\": \"Posizione updated successfully\" }");
   */
		
		 /*
		StringBuilder jsonContent = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonContent.append(line);
            }
            System.out.println(jsonContent);
        }catch(Exception e) {
        	
        	String error = "{\"data\" : " + "\"" + e.getMessage() + "\"" + "}";
        	
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
        	EspLavorativaService.updateEsperienza(jsonContent.toString(), profilo.getIdCv());
			
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
		}*/
	}

}
