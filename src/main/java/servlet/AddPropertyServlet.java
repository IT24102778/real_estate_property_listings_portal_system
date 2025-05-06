package servlet;

import jakarta.servlet.annotation.MultipartConfig;
import model.ResidentialProperty;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.UUID;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,     // 1MB
        maxFileSize = 5 * 1024 * 1024,       // 5MB
        maxRequestSize = 10 * 1024 * 1024    // 10MB
)
public class AddPropertyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        // Get form inputs
        String title = req.getParameter("title");
        String location = req.getParameter("location");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        int bedrooms = Integer.parseInt(req.getParameter("bedrooms"));
        String id = UUID.randomUUID().toString().substring(0, 8);

        // Handle uploaded image
        Part filePart = req.getPart("imageFile");
        String originalFileName = filePart.getSubmittedFileName();
        String fileName = UUID.randomUUID() + "_" + originalFileName;

        // Path to save under webapp/images
        String relativeImagePath = "/images";
        String absoluteImagePath = getServletContext().getRealPath(relativeImagePath);

        File imageDir = new File(absoluteImagePath);
        if (!imageDir.exists()) {
            imageDir.mkdirs(); // create images directory if missing
        }

        // Save uploaded file
        File savedFile = new File(imageDir, fileName);
        filePart.write(savedFile.getAbsolutePath());

        // This is the path to be stored in the property model (relative for front-end access)
        String imagePathForApp = "images/" + fileName;

        // Create and store the property
        ResidentialProperty prop = new ResidentialProperty(id, title, location, price, description, imagePathForApp, bedrooms);

        // Save to file
        String filePath = getServletContext().getRealPath("/properties.txt");
        try (FileWriter fw = new FileWriter(filePath, true)) {
            fw.write(prop.toFileString() + "\n");
        }

        res.sendRedirect("listProperties");
    }
}
