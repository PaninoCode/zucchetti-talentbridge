package hrport.project.main.controller;

import java.io.IOException;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/candidati")
public class CandidatiServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String test = "testeeee";
		Gson gson = new Gson();
		
		
		request.setAttribute("test", gson.toJson(test));
		
		
	    request.getRequestDispatcher("/temp-admin/candidati.jsp").forward(request, response);
    }
}
