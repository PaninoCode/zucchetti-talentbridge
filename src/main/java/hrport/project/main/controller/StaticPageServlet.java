package hrport.project.main.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StaticPageServlet")
public class StaticPageServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, 
      HttpServletResponse response)
      throws ServletException, IOException {
		
        String queryUrl = request.getRequestURI().substring(request.getContextPath().length());

        if(queryUrl.length() == 1){
        	queryUrl = "index";
        }
         
        if(queryUrl.endsWith(".html")){
          response.sendRedirect(request.getContextPath() + queryUrl.replace(".html", ""));
        }else if(queryUrl.endsWith(".css") || queryUrl.endsWith(".js") || queryUrl.endsWith(".png") || queryUrl.endsWith(".jpg")){
          request.getRequestDispatcher("/WEB-INF/views/" + queryUrl);
        }else{
          request.getRequestDispatcher("/WEB-INF/views/" + queryUrl + ".jsp").forward(request, response);
        }
    }
}
