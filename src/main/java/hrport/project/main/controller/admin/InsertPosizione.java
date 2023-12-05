package hrport.project.main.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.google.gson.Gson;

import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Quiz;
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
 * Servlet implementation class InsertNewPosition
 */
@WebServlet("/admin/insert-new-position")
@MultipartConfig
public class InsertPosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Get Parameter inside of the try/catch block
		try {
            String nome = request.getParameter("nome");
            Boolean aperta = true;
            String fotoUrl = null;
            String descrizione = request.getParameter("descrizione");
            String jsonListQuiz = request.getParameter("quiz");
            
            Quiz[] quiz = new Gson().fromJson(jsonListQuiz, Quiz[].class);

            Part filePart = request.getPart("file");

            if (filePart != null) {
                InputStream fileContent = filePart.getInputStream();
                
                //uso diretamente il parametro GetServletContext() 
                String path = getServletContext().getRealPath("/WEB-INF/static/immagini_posizioni");
                String fileName = UtilitiesFile.generateUniqueFileName(UtilitiesFile.getSubmittedFileName(filePart));
                Path filePath = Paths.get(path, fileName);

                fotoUrl = fileName;
                //Output Stream inside a try/catch block
                try (OutputStream out = Files.newOutputStream(filePath)) {
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = fileContent.read(buffer)) > 0) {
                        out.write(buffer, 0, length);
                    }
                }
            }

            Posizione newPosition = new Posizione(nome, aperta, fotoUrl, descrizione);
            PosizioneService.insertNewPosition(newPosition, quiz);

            response.getWriter().println("Success");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Error: " + e.getMessage());
        }
		
	}
	
}
			


