package hrport.project.main.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hrport.project.main.service.CandidaturaService;

/**
 * Servlet implementation class ChangeStateApplication
 */
@WebServlet("/admin/change-status-application")
public class ChangeStateApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()))) {
			
			StringBuilder jsonContent = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonContent.append(line);
            }
            
            JsonObject json = (JsonObject) JsonParser.parseString(jsonContent.toString());
			Integer idCand = json.get("idCand").getAsInt();
			Integer stato = json.get("stato").getAsInt();
			
			CandidaturaService.updateStatoCandidaturaAdmin(idCand, stato);
			
			String data = "{\"data\" : \"success\"}";
			
			PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(data);
            out.flush();
        }catch(Exception e) {
        	
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
