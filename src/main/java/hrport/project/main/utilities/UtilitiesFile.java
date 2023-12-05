package hrport.project.main.utilities;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.Part;


public class UtilitiesFile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	public static String generateUniqueFileName(String originalFileName) {
        // Get the current timestamp
        String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());

        // Generate a random component (UUID)
        String randomString = UUID.randomUUID().toString().replace("-", "");

        // Extract the file extension from the original file name
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

        // Combine all components to create a unique file name
        return timestamp + "_" + randomString + fileExtension;
    }
	
	public static String getSubmittedFileName(Part part) {
	    String header = part.getHeader("content-disposition");
	    if (header == null) {
	        return null;
	    }

	    // Split the header to get the file name
	    String[] elements = header.split(";");
	    for (String element : elements) {
	        if (element.trim().startsWith("filename")) {
	            // Extract and return the file name
	            return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }

	    return null;
	}
	
	
	
	public static String handleFileUpload(Integer idPos, Part filePart, ServletContext sc) throws IOException {
	    if (filePart != null) {
	        try (InputStream fileContent = filePart.getInputStream()) {
				
	            String path = sc.getRealPath("/WEB-INF/static/immagini_posizioni");

	            String fileName = UtilitiesFile.generateUniqueFileName(UtilitiesFile.getSubmittedFileName(filePart));
	            Path filePath = Paths.get(path, fileName);

	            // Write the file to the directory
	            try (OutputStream out = Files.newOutputStream(filePath)) {
	                byte[] buffer = new byte[1024];
	                int length;
	                while ((length = fileContent.read(buffer)) > 0) {
	                    out.write(buffer, 0, length);
	                }
	            }

	            // Delete the previous file
	            String pathPrevious = path + "/" + idPos + "/" + fileName;
	            File previousFile = new File(pathPrevious);
	            if (previousFile.isFile()) {
	                previousFile.delete();
	            }

	            return fileName;
	        }
	    }
	    return null;
	}
	
}
