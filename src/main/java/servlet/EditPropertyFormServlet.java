package servlet;

import model.Property;
import model.ResidentialProperty;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class EditPropertyFormServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String id = req.getParameter("id");
        String filePath = getServletContext().getRealPath("/properties.txt");

        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        Property found = null;
        String line;
        while ((line = reader.readLine()) != null) {
            if (line.startsWith(id + "|")) {
                if (line.split("\\|").length == 6)
                    found = ResidentialProperty.fromFileString(line);
                else
                    found = Property.fromFileString(line);
                break;
            }
        }
        reader.close();

        req.setAttribute("property", found);
        RequestDispatcher dispatcher = req.getRequestDispatcher("editProperty.jsp");
        dispatcher.forward(req, res);
    }
}
