package hrport.project.main.controller.admin;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.google.gson.Gson;

import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Quiz;
import hrport.project.main.utilities.UtilitiesFile;

/**
 * Servlet implementation class InsertNewPosition
 */
@WebServlet("/admin/insert-new-position")
public class InsertNewPosition extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String nome = request.getParameter("nome");
		Boolean aperta = true;
		String fotoUrl = null;
		String descrizione = request.getParameter("descrizione");
		
		// il json deve essere un array di oggetti come in esempio {"id" : 1}, {"id" : 2}
		String jsonListQuiz = request.getParameter("quiz");
		Gson gson = new Gson();
		Quiz[] quiz = gson.fromJson(jsonListQuiz, Quiz[].class);
		
		try {
			
			Part filePart = request.getPart("file");
            InputStream fileContent = filePart.getInputStream();

            ServletContext sc = getServletContext();
            String path = sc.getRealPath("/WEB-INF/static/immagini_posizioni");
            String fileName = UtilitiesFile.generateUniqueFileName(UtilitiesFile.getSubmittedFileName(filePart));
            Path filePath = Paths.get(path, fileName);
            
            fotoUrl = fileName;
            Posizione newPosition = new Posizione(nome, aperta, fotoUrl, descrizione);

//          scrive il file nella directory
            OutputStream out = Files.newOutputStream(filePath);
            byte[] buffer = new byte[1024];
            int length;
            while ((length = fileContent.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
            
            response.getWriter().println("File uploaded successfully!");
		} catch (Exception e) {
			// TODO: handle exception
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Error uploading file: " + e.getMessage());
		}
	}

}
