package hrport.project.main.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FormServlet", urlPatterns = "/calculateServlet")
public class TestServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, 
      HttpServletResponse response)
      throws ServletException, IOException {
		
        String ciao = "Hello from the server!";

        // Set the JSON data as a request attribute
        request.setAttribute("saluto", ciao);
		
		request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
    }
}

