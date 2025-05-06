package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.*;

public class DeletePropertyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String idToDelete = req.getParameter("id");
        String filePath = getServletContext().getRealPath("/properties.txt");
        File file = new File(filePath);
        File temp = new File(file.getParent(), "temp.txt");

        BufferedReader reader = new BufferedReader(new FileReader(file));
        PrintWriter writer = new PrintWriter(new FileWriter(temp));

        String line;
        while ((line = reader.readLine()) != null) {
            if (!line.startsWith(idToDelete + "|")) {
                writer.println(line);
            }
        }
        writer.close();
        reader.close();

        file.delete();
        temp.renameTo(file);

        res.sendRedirect("listProperties");
    }
}
