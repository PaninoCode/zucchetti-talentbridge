package hrport.project.main.utilities;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

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
	
}
