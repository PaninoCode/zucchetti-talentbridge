package hrport.project.main.controller.admin;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Quiz;
import hrport.project.main.service.PosizioneService;
import hrport.project.main.utilities.UtilitiesFile;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class UpdateEsperienzaLav
 */
@WebServlet("/admin/update-posizione")
@MultipartConfig
public class UpdatePosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Integer idPos = Integer.valueOf(request.getParameter("idPos"));
		String nome = request.getParameter("nome");
		Boolean aperta = Boolean.valueOf(request.getParameter("aperta").equalsIgnoreCase("true") ? true : false);
		String fotoUrl = null;
		String descrizione = request.getParameter("descrizione");
		
		// il json deve essere un array di oggetti come in esempio {"id" : 1}, {"id" : 2}
		
		try {
			
			Part filePart = request.getPart("file");
			
			ServletContext sc = getServletContext();
			String path = sc.getRealPath("/WEB-INF/static/immagini_posizioni");
			
			Posizione oldPosition = PosizioneService.getPosizioneById(idPos);
			
			if(filePart != null) {
				
				InputStream fileContent = filePart.getInputStream();
				
				String fileName = UtilitiesFile.generateUniqueFileName(UtilitiesFile.getSubmittedFileName(filePart));
				Path filePath = Paths.get(path, fileName);
				
				fotoUrl = fileName;
				
//          	scrive il file nella directory
				OutputStream out = Files.newOutputStream(filePath);
				byte[] buffer = new byte[1024];
				int length;
				while ((length = fileContent.read(buffer)) > 0) {
					out.write(buffer, 0, length);
				}
				
				String pathPrevious = path + "/" + oldPosition.getFotoUrl();
				File previousFile = new File(pathPrevious);
				
				if(previousFile.isFile()) {
					
					previousFile.delete();
				}
			} else {
				
				fotoUrl = oldPosition.getFotoUrl();
			}
			
            Posizione newPosition = new Posizione(idPos, nome, aperta, fotoUrl, descrizione);

            PosizioneService.updatePosizione(newPosition);
            
            response.getWriter().println("Success");
		} catch (Exception e) {
			// TODO: handle exception
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Error: " + e.getMessage());
		}
		
		
		
	}

}
