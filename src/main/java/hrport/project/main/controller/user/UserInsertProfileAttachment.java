package hrport.project.main.controller.user;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

/**
 * Servlet implementation class UserInsertProfileAttachment
 */
@WebServlet("/upload-image-profile")
@MultipartConfig
public class UserInsertProfileAttachment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            Part filePart = request.getPart("file");
            InputStream fileContent = filePart.getInputStream();

            ServletContext sc = getServletContext();
            String fileName = "desiredFileName.ext"; // You may want to generate a unique filename
            Path filePath = Paths.get("/path/to/upload/directory", fileName);

            try (OutputStream out = Files.newOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int length;
                while ((length = fileContent.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
            }

            response.getWriter().println("File uploaded successfully!");
        } catch (Exception e) {
            response.getWriter().println("Error uploading file: " + e.getMessage());
        }
	}

}
