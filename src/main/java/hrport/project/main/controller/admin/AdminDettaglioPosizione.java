package hrport.project.main.controller.admin;

import java.io.IOException;
import java.time.LocalDate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.service.PosizioneService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/admin/dettaglio-posizione/*")
public class AdminDettaglioPosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dataPosizione = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();

		String pathInfo = request.getPathInfo();
		if (pathInfo != null) {
			String[] pathParts = pathInfo.split("/");
			if (pathParts.length > 1) {
				String posizioneId = pathParts[1];
				

				try {
					Posizione posizione = PosizioneService.getPosizioneById(Integer.parseInt(posizioneId));
					
					dataPosizione = gson.toJson(posizione);
					
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("dataPos", dataPosizione);
				request.getRequestDispatcher("/WEB-INF/view-admin/detail_posizione.jsp").forward(request, response);
				return;
			}
		}

		response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User id not specified in the path");
	

	}

}
