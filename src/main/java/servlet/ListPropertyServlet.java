package servlet;

import model.Property;
import model.ResidentialProperty;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class ListPropertyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Property> properties = new ArrayList<>();
        String filePath = getServletContext().getRealPath("/properties.txt");
        File file = new File(filePath);

        if (file.exists()) {
            Scanner sc = new Scanner(file);
            while (sc.hasNextLine()) {
                String line = sc.nextLine();
                if (line.split("\\|").length == 6)
                    properties.add(ResidentialProperty.fromFileString(line));
                else
                    properties.add(Property.fromFileString(line));
            }
            sc.close();
        }

        req.setAttribute("properties", properties);
        RequestDispatcher dispatcher = req.getRequestDispatcher("listProperties.jsp");
        dispatcher.forward(req, res);
    }
}
