<%--<%@ page import="java.util.*, model.Property" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>All Properties</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <!-- Bootstrap CSS -->--%>


<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>

<%--    <link rel="stylesheet" href="css/style.css">--%>

<%--&lt;%&ndash;    <style>&ndash;%&gt;--%>
<%--&lt;%&ndash;        body {&ndash;%&gt;--%>
<%--&lt;%&ndash;            background: linear-gradient(to right, #74ebd5, #9face6);&ndash;%&gt;--%>
<%--&lt;%&ndash;            min-height: 100vh;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>

<%--&lt;%&ndash;        h2 {&ndash;%&gt;--%>
<%--&lt;%&ndash;            font-weight: 700;&ndash;%&gt;--%>
<%--&lt;%&ndash;            color: #333;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>

<%--&lt;%&ndash;        .property-card {&ndash;%&gt;--%>
<%--&lt;%&ndash;            border: none;&ndash;%&gt;--%>
<%--&lt;%&ndash;            border-radius: 15px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            overflow: hidden;&ndash;%&gt;--%>
<%--&lt;%&ndash;            transition: all 0.3s ease;&ndash;%&gt;--%>
<%--&lt;%&ndash;            transform: scale(1);&ndash;%&gt;--%>
<%--&lt;%&ndash;            box-shadow: 0 5px 10px rgba(0,0,0,0.1);&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>

<%--&lt;%&ndash;        .property-card:hover {&ndash;%&gt;--%>
<%--&lt;%&ndash;            transform: scale(1.02);&ndash;%&gt;--%>
<%--&lt;%&ndash;            box-shadow: 0 12px 24px rgba(0,0,0,0.2);&ndash;%&gt;--%>
<%--&lt;%&ndash;            cursor: pointer;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>

<%--&lt;%&ndash;        .property-image {&ndash;%&gt;--%>
<%--&lt;%&ndash;            width: 100%;&ndash;%&gt;--%>
<%--&lt;%&ndash;            height: 200px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            object-fit: cover;&ndash;%&gt;--%>
<%--&lt;%&ndash;            transition: transform 0.3s ease;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>

<%--&lt;%&ndash;        .property-card:hover .property-image {&ndash;%&gt;--%>
<%--&lt;%&ndash;            transform: scale(1.05);&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>

<%--&lt;%&ndash;        .card-footer {&ndash;%&gt;--%>
<%--&lt;%&ndash;            background-color: rgba(0, 0, 0, 0.03);&ndash;%&gt;--%>
<%--&lt;%&ndash;            border-top: none;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>

<%--&lt;%&ndash;        .btn-outline-primary, .btn-outline-danger {&ndash;%&gt;--%>
<%--&lt;%&ndash;            border-radius: 50px;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    </style>&ndash;%&gt;--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container py-5">--%>
<%--    <div class="d-flex justify-content-between align-items-center mb-4">--%>
<%--        <h2>🏠 Property Listings</h2>--%>
<%--        <a href="addProperty.jsp" class="btn btn-light border shadow-sm">+ Add Property</a>--%>
<%--    </div>--%>
<%--    <div class="row">--%>
<%--        <%--%>
<%--            List<Property> properties = (List<Property>) request.getAttribute("properties");--%>
<%--            if (properties != null && !properties.isEmpty()) {--%>
<%--                for (Property p : properties) {--%>
<%--                    String imageUrl = "";--%>
<%--                    try {--%>
<%--                        imageUrl = (String) p.getClass().getMethod("getImageUrl").invoke(p);--%>
<%--                    } catch (Exception e) {--%>
<%--                        imageUrl = "";--%>
<%--                    }--%>

<%--                    // If image path is missing, use placeholder--%>
<%--                    if (imageUrl == null || imageUrl.trim().isEmpty()) {--%>
<%--                        imageUrl = "https://via.placeholder.com/400x200?text=No+Image";--%>
<%--                    } else {--%>
<%--                        imageUrl = request.getContextPath() + "/" + imageUrl;--%>
<%--                    }--%>
<%--        %>--%>
<%--        <div class="col-md-6 col-lg-4 mb-4">--%>
<%--            <div class="card property-card h-100 shadow-sm">--%>
<%--                <img src="<%= imageUrl %>" class="property-image" alt="Property Image">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title"><%= p.getTitle() %></h5>--%>
<%--                    <h6 class="text-muted"><%= p.getLocation() %> — <span class="text-success">$<%= p.getPrice() %></span></h6>--%>
<%--                    <p class="card-text"><%= p.getDescription() %></p>--%>
<%--                </div>--%>
<%--                <div class="card-footer d-flex justify-content-between">--%>
<%--                    <a href="editPropertyForm?id=<%= p.getId() %>" class="btn btn-sm btn-outline-primary">Edit</a>--%>
<%--                    <a href="deleteProperty?id=<%= p.getId() %>" class="btn btn-sm btn-outline-danger">Delete</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <%--%>
<%--            }--%>
<%--        } else {--%>
<%--        %>--%>
<%--        <div class="col-12">--%>
<%--            <div class="alert alert-light shadow-sm text-center">No properties found. Add one now!</div>--%>
<%--        </div>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>



<%--<%@ page import="java.util.*, model.Property" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Property Listings</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <link rel="stylesheet" href="Home/css/style.css">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;<%@ include file="header.jsp" %> <!-- Optional -->&ndash;%&gt;--%>

<%--<main class="container py-5">--%>
<%--    <div class="d-flex justify-content-between align-items-center mb-4">--%>
<%--        <h2>🏠 Property Listingssssssssss</h2>--%>
<%--        <a href="addProperty.jsp" class="btn btn-light border shadow-sm">+ Add Property</a>--%>
<%--    </div>--%>
<%--    <div class="row">--%>
<%--        <%--%>
<%--            List<Property> properties = (List<Property>) request.getAttribute("properties");--%>
<%--            if (properties != null && !properties.isEmpty()) {--%>
<%--                for (Property p : properties) {--%>
<%--                    String imageUrl = "";--%>
<%--                    try {--%>
<%--                        imageUrl = (String) p.getClass().getMethod("getImageUrl").invoke(p);--%>
<%--                    } catch (Exception e) {--%>
<%--                        imageUrl = "";--%>
<%--                    }--%>
<%--                    if (imageUrl == null || imageUrl.trim().isEmpty()) {--%>
<%--                        imageUrl = "https://via.placeholder.com/400x200?text=No+Image";--%>
<%--                    } else {--%>
<%--                        imageUrl = request.getContextPath() + "/" + imageUrl;--%>
<%--                    }--%>
<%--        %>--%>
<%--        <div class="col-md-6 col-lg-4 mb-4">--%>
<%--            <div class="card property-card h-100 shadow-sm">--%>
<%--                <img src="<%= imageUrl %>" class="property-image" alt="Property Image">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title"><%= p.getTitle() %></h5>--%>
<%--                    <h6 class="text-muted"><%= p.getLocation() %> — <span class="text-success">$<%= p.getPrice() %></span></h6>--%>
<%--                    <p class="card-text"><%= p.getDescription() %></p>--%>
<%--                </div>--%>
<%--                <div class="card-footer d-flex justify-content-between">--%>
<%--                    <a href="editPropertyForm?id=<%= p.getId() %>" class="btn btn-sm btn-outline-primary">Edit</a>--%>
<%--                    <a href="deleteProperty?id=<%= p.getId() %>" class="btn btn-sm btn-outline-danger">Delete</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <%  } } else { %>--%>
<%--        <div class="col-12">--%>
<%--            <div class="alert alert-light shadow-sm text-center">No properties found. Add one now!</div>--%>
<%--        </div>--%>
<%--        <% } %>--%>
<%--    </div>--%>
<%--</main>--%>

<%--&lt;%&ndash;<%@ include file="footer.jsp" %> <!-- Optional -->&ndash;%&gt;--%>

<%--<script src="Home/js/auth.js"></script>--%>
<%--</body>--%>
<%--</html>--%>

<%--after this wards new theme--%>

<%@ page import="java.util.*, model.Property" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Listings - MyLocal RealEstate</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Shared CSS & FontAwesome -->
    <link rel="stylesheet" href="Home/css/style.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>

<header>
    <div class="top-bar">
        <div class="logo">
            <h1>MyLocal</h1>
            <h2>RealEstate</h2>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="#">Buy</a></li>
                <li><a href="#">Rent</a></li>
                <li><a href="#">Sold</a></li>
                <li><a href="#">Find Agents</a></li>
                <li><a href="#">New Builds</a></li>
                <li><a href="#">Home Loans</a></li>
                <li><a href="#">News</a></li>
                <li><a href="#" id="loginLink">Login</a></li>
                <li><a href="#" id="signupLink" class="signup-btn">Sign Up</a></li>
            </ul>
        </nav>
    </div>
    <div class="secondary-nav">
        <ul>
            <li class="active"><a href="#">Properties</a></li>
        </ul>
    </div>
</header>

<main class="container" style="padding: 3rem 2rem;">
    <div class="d-flex" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
        <h2 style="color: var(--secondary);">🏠 Property Listings</h2>
        <a href="addProperty.jsp" class="cta-btn" style="text-decoration: none;">+ Add Property</a>
    </div>

    <div class="quick-links" style="flex-wrap: wrap; gap: 2rem;">
        <%
            List<Property> properties = (List<Property>) request.getAttribute("properties");
            if (properties != null && !properties.isEmpty()) {
                for (Property p : properties) {
                    String imageUrl = "";
                    try {
                        imageUrl = (String) p.getClass().getMethod("getImageUrl").invoke(p);
                    } catch (Exception e) {
                        imageUrl = "";
                    }
                    if (imageUrl == null || imageUrl.trim().isEmpty()) {
                        imageUrl = "https://via.placeholder.com/400x200?text=No+Image";
                    } else {
                        imageUrl = request.getContextPath() + "/" + imageUrl;
                    }
        %>
        <div class="link-card" style="max-width: 300px;">
            <img src="<%= imageUrl %>" alt="Property Image" style="width: 100%; border-radius: 10px; height: 180px; object-fit: cover; margin-bottom: 1rem;">
            <h3><%= p.getTitle() %></h3>
            <p style="margin: 0.5rem 0; color: var(--dark-gray);">
                <strong><%= p.getLocation() %></strong> —
                <span style="color: var(--primary);">$<%= p.getPrice() %></span>
            </p>
            <p style="font-size: 0.95rem; color: var(--black);"><%= p.getDescription() %></p>
            <div style="display: flex; justify-content: space-between; margin-top: 1rem;">
                <a href="editPropertyForm?id=<%= p.getId() %>"
                   style="padding: 0.7rem 2rem; background-color: var(--primary); color: white; border-radius: 50px; text-align: center; font-weight: 600; text-decoration: none; box-shadow: 0 4px 10px rgba(231, 76, 60, 0.3);">
                    Edit
                </a>
                <a href="deleteProperty?id=<%= p.getId() %>"
                   style="padding: 0.7rem 2rem; background-color: #c0392b; color: white; border-radius: 50px; text-align: center; font-weight: 600; text-decoration: none; box-shadow: 0 4px 10px rgba(192, 57, 43, 0.3);">
                    Delete
                </a>
            </div>

        </div>
        <% } } else { %>
        <div class="alert alert-light text-center">No properties found. Add one now!</div>
        <% } %>
    </div>
</main>

<footer>
    <p>© 2025 MyLocal RealEstate. All rights reserved.</p>
</footer>

<script src="Home/js/auth.js"></script>
</body>
</html>
