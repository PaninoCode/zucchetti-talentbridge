package hrport.project.main.controller.admin;

import java.io.IOException;

import hrport.project.main.pojo.Posizione;
import hrport.project.main.service.PosizioneService;
import hrport.project.main.utilities.UtilitiesFile;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class UpdateEsperienzaLav
 */
@WebServlet("/admin/update-posizione")
@MultipartConfig
public class UpdatePosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        Integer idPos = Integer.valueOf(request.getParameter("idPos"));
	        String nome = request.getParameter("nome");
	        Boolean aperta = Boolean.valueOf(request.getParameter("aperta").equalsIgnoreCase("true"));
	        String descrizione = request.getParameter("descrizione");

	        Part filePart = request.getPart("file");

	        //Metodo messo in UtilitiesFile. (CRTL + click to in "UtilitiesFile" to zoom)
	        String fotoUrl = UtilitiesFile.handleFileUpload(idPos, filePart, getServletContext());
	        Posizione oldPosition = PosizioneService.getPosizioneById(idPos);

	        if (fotoUrl == null) {
	            // If no new file was provided, use the existing photo URL
	            fotoUrl = oldPosition.getFotoUrl();
	        }

	        Posizione newPosition = new Posizione(idPos, nome, aperta, fotoUrl, descrizione);

	        PosizioneService.updatePosizione(newPosition);

	        response.getWriter().println("Success");
	    } catch (Exception e) {
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        response.getWriter().println("Error: " + e.getMessage());
	    }
	}

}
