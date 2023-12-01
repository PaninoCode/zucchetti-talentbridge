package hrport.project.main.utilities;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import jakarta.servlet.http.Part;

public class UtilitiesFile {

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
	
}
