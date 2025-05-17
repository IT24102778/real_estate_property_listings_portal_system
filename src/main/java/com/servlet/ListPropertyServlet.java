package com.servlet;

import com.DAO.PropertyDAO;
import com.model.Property;
import com.util.PropertyQuickSort;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class ListPropertyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String filePath = getServletContext().getRealPath("/WEB-INF/properties.txt");
        PropertyDAO dao = new PropertyDAO(filePath);
        List<Property> properties = dao.getAllProperties();

        // Check for search parameter
        String searchQuery = req.getParameter("search");
        if (searchQuery != null && !searchQuery.isEmpty()) {
            properties = dao.searchByTitle(searchQuery);
        }

        // Check for sort parameters
        String sortBy = req.getParameter("sort");
        String sortOrder = req.getParameter("order");

        if (sortBy != null && !sortBy.isEmpty()) {
            if ("price".equals(sortBy) || "bedrooms".equals(sortBy)) {
                PropertyQuickSort.quickSort(properties, sortBy, sortOrder != null ? sortOrder : "asc");
            }
        }

        req.setAttribute("properties", properties);
        req.getRequestDispatcher("listProperties.jsp").forward(req, res);
    }
}