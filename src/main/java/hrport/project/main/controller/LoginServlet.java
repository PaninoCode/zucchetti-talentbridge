package hrport.project.main.controller;

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
import java.sql.SQLException;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginUser")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//String email = request.getParameter("email");
		//String password = request.getParameter("password");
		//String returnTo = request.getParameter("returnTo");
		
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
		
		try {
			
			JsonObject json = (JsonObject) JsonParser.parseString(jsonContent.toString());
			String email = json.get("email").getAsString();
			String password = json.get("password").getAsString();
			
			Utente utente = UtenteService.getUserByEmailAndPassword(email, password);
			if(utente != null) {
				
				HttpSession session = request.getSession(true);
				
				session.setAttribute("idUtente", utente.getIdUtente());
				
				String isAdmin = utente.isAdmin() ? "true" : "false";
				session.setAttribute("admin", isAdmin);
				

				String error = "{\"data\" : {\"result\" : \"success\", \"admin\" :" + "\"" + isAdmin + "\"" + "}}";
	        	
	        	PrintWriter out = response.getWriter();
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            out.print(error);
	            out.flush();
				
				
			}
		} catch (Exception e) {

			String error = "{\"error\" : \"Credenziali Errate\"}";
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			
			if(e instanceof SQLException) {
				
				//String respError = "Credenziali Errate";
				//response.addHeader("data", respError);

	            out.print(error);
			}
			
			out.flush();
			//request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			//response.getWriter().append("").flush();
		}
	}
}
