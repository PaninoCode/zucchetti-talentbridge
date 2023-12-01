package hrport.project.main.controller.user;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import hrport.project.main.service.ProfiloUtenteService;
import hrport.project.main.utilities.UtilitiesFile;

/**
 * Servlet implementation class UserInsertProfileAttachment
 */
@WebServlet("/upload-attachment/*")
@MultipartConfig
public class UserInsertProfileAttachment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		
		String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        String value = pathParts[1];
		
		try {
            Part filePart = request.getPart("file");
            InputStream fileContent = filePart.getInputStream();

            ServletContext sc = getServletContext();
            String path = sc.getRealPath("/WEB-INF/static/" + value);
            String fileName = UtilitiesFile.generateUniqueFileName(UtilitiesFile.getSubmittedFileName(filePart));
            Path filePath = Paths.get(path, fileName);

//          scrive il file nella directory
            OutputStream out = Files.newOutputStream(filePath);
            byte[] buffer = new byte[1024];
            int length;
            while ((length = fileContent.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
            
            ProfiloUtenteService.insertProfilePdf(fileName, idUtente);

            response.getWriter().println("File uploaded successfully!");
        } catch (Exception e) {
        	response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Error uploading file: " + e.getMessage());
        }
	}

}
