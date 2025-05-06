package servlet;

import model.Property;
import model.ResidentialProperty;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class EditPropertyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String location = req.getParameter("location");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        int bedrooms = Integer.parseInt(req.getParameter("bedrooms"));
        String imageUrl = req.getParameter("imageURL");

        String filePath = getServletContext().getRealPath("/properties.txt");
        File inputFile = new File(filePath);
        File tempFile = new File(filePath + ".tmp");

        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));

        String line;
        while ((line = reader.readLine()) != null) {
            if (line.startsWith(id + "|")) {
                // Replace with updated line
                ResidentialProperty updated = new ResidentialProperty(id, title, location, price, description, imageUrl,bedrooms);
                writer.write(updated.toFileString() + "\n");
            } else {
                writer.write(line + "\n");
            }
        }
        writer.close();
        reader.close();

        inputFile.delete();
        tempFile.renameTo(inputFile);

        res.sendRedirect("listProperties");
    }
}
