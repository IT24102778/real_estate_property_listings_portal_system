<%--<%@ page import="model.Property" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%--%>
<%--  Property p = (Property) request.getAttribute("property");--%>
<%--%>--%>
<%--<html>--%>
<%--<head><title>Edit Property</title></head>--%>
<%--<body>--%>
<%--<h2>Edit Property</h2>--%>
<%--<form action="editProperty" method="post">--%>
<%--  <input type="hidden" name="id" value="<%= p.getId() %>">--%>
<%--  Title: <input type="text" name="title" value="<%= p.getTitle() %>"><br>--%>
<%--  Location: <input type="text" name="location" value="<%= p.getLocation() %>"><br>--%>
<%--  Price: <input type="number" step="0.01" name="price" value="<%= p.getPrice() %>"><br>--%>
<%--  Description: <input type="text" name="description" value="<%= p.getDescription() %>"><br>--%>
<%--  Bedrooms: <input type="number" name="bedrooms" value="<%= p instanceof model.ResidentialProperty ? ((model.ResidentialProperty) p).getBedrooms() : "" %>"><br>--%>
<%--  <input type="submit" value="Update Property">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%--<%@ page import="model.Property" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%--%>
<%--  Property p = (Property) request.getAttribute("property");--%>
<%--%>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Edit Property</title>--%>
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body class="bg-light">--%>
<%--<div class="container mt-5">--%>
<%--  <h2 class="mb-4 text-center">Edit Property</h2>--%>
<%--  <form action="editProperty" method="post" class="card p-4 shadow-sm">--%>
<%--    <input type="hidden" name="id" value="<%= p.getId() %>">--%>
<%--    <div class="mb-3">--%>
<%--      <label class="form-label">Title</label>--%>
<%--      <input type="text" name="title" class="form-control" value="<%= p.getTitle() %>" required>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label class="form-label">Location</label>--%>
<%--      <input type="text" name="location" class="form-control" value="<%= p.getLocation() %>" required>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label class="form-label">Price</label>--%>
<%--      <input type="number" step="0.01" name="price" class="form-control" value="<%= p.getPrice() %>" required>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label class="form-label">Description</label>--%>
<%--      <textarea name="description" class="form-control" required><%= p.getDescription() %></textarea>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label class="form-label">Bedrooms</label>--%>
<%--      <input type="number" name="bedrooms" class="form-control" value="<%= p instanceof model.ResidentialProperty ? ((model.ResidentialProperty) p).getBedrooms() : "" %>" required>--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary w-100">Update Property</button>--%>
<%--  </form>--%>
<%--  <div class="text-center mt-3">--%>
<%--    <a href="listProperties" class="btn btn-link">Back to Listings</a>--%>
<%--  </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--<%@ page import="model.Property" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%--%>
<%--  Property p = (Property) request.getAttribute("property");--%>
<%--%>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Edit Property</title>--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>

<%--  <link rel="stylesheet" href="css/style.css">--%>
<%--&lt;%&ndash;  <style>&ndash;%&gt;--%>
<%--&lt;%&ndash;    body {&ndash;%&gt;--%>
<%--&lt;%&ndash;      background: linear-gradient(to right, #a1c4fd, #c2e9fb);&ndash;%&gt;--%>
<%--&lt;%&ndash;      min-height: 100vh;&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;    .form-card {&ndash;%&gt;--%>
<%--&lt;%&ndash;      background: white;&ndash;%&gt;--%>
<%--&lt;%&ndash;      border-radius: 15px;&ndash;%&gt;--%>
<%--&lt;%&ndash;      padding: 30px;&ndash;%&gt;--%>
<%--&lt;%&ndash;      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;    h2 {&ndash;%&gt;--%>
<%--&lt;%&ndash;      font-weight: 700;&ndash;%&gt;--%>
<%--&lt;%&ndash;      color: #333;&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;  </style>&ndash;%&gt;--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container py-5">--%>
<%--  <div class="row justify-content-center">--%>
<%--    <div class="col-md-8 col-lg-6">--%>
<%--      <div class="form-card">--%>
<%--        <h2 class="text-center mb-4">✏️ Edit Property</h2>--%>
<%--        <form action="editProperty" method="post" >--%>
<%--          <input type="hidden" name="id" value="<%= p.getId() %>">--%>
<%--          <div class="form-floating mb-3">--%>
<%--            <input type="text" name="title" class="form-control" value="<%= p.getTitle() %>" required>--%>
<%--            <label>Title</label>--%>
<%--          </div>--%>
<%--          <div class="form-floating mb-3">--%>
<%--            <input type="text" name="location" class="form-control" value="<%= p.getLocation() %>" required>--%>
<%--            <label>Location</label>--%>
<%--          </div>--%>
<%--          <div class="form-floating mb-3">--%>
<%--            <input type="number" step="0.01" name="price" class="form-control" value="<%= p.getPrice() %>" required>--%>
<%--            <label>Price</label>--%>
<%--          </div>--%>
<%--          <div class="form-floating mb-3">--%>
<%--            <textarea name="description" class="form-control" style="height: 100px" required><%= p.getDescription() %></textarea>--%>
<%--            <label>Description</label>--%>
<%--          </div>--%>
<%--          <div class="form-floating mb-3">--%>
<%--            <input type="number" name="bedrooms" class="form-control" value="<%= p instanceof model.ResidentialProperty ? ((model.ResidentialProperty) p).getBedrooms() : "" %>" required>--%>
<%--            <label>Bedrooms</label>--%>
<%--          </div>--%>
<%--          <div class="form-floating mb-4">--%>
<%--            <input type="text" name="imageURL" class="form-control" value="<%=--%>
<%--                            p.getClass().getMethod("getImageUrl").invoke(p)--%>
<%--                        %>">--%>
<%--            <label>Image URL</label>--%>
<%--          </div>--%>
<%--          <button type="submit" class="btn btn-primary w-100">Update Property</button>--%>
<%--        </form>--%>
<%--        <div class="text-center mt-3">--%>
<%--          <a href="listProperties" class="btn btn-link">⬅ Back to Listings</a>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page import="model.Property" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Property p = (Property) request.getAttribute("property");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Property - MyLocal RealEstate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Custom CSS and Fonts -->
  <link rel="stylesheet" href="Home/css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
      <li class="active"><a href="#">Edit Property</a></li>
    </ul>
  </div>
</header>

<main style="padding: 3rem 1rem;">
  <div style="max-width: 600px; margin: 0 auto; background: white; padding: 2rem; border-radius: 15px; box-shadow: var(--shadow);">
    <h2 class="text-center" style="color: var(--secondary); margin-bottom: 2rem;">✏️ Edit Property</h2>

    <form action="editProperty" method="post">
      <input type="hidden" name="id" value="<%= p.getId() %>">

      <div class="form-group">
        <label for="title">Title</label>
        <input type="text" name="title" id="title" value="<%= p.getTitle() %>" required>
      </div>

      <div class="form-group">
        <label for="location">Location</label>
        <input type="text" name="location" id="location" value="<%= p.getLocation() %>" required>
      </div>

      <div class="form-group">
        <label for="price">Price ($)</label>
        <input type="number" step="0.01" name="price" id="price" value="<%= p.getPrice() %>" required>
      </div>

      <div class="form-group">
        <label for="description">Description</label>
        <textarea name="description" id="description" rows="4" required><%= p.getDescription() %></textarea>
      </div>

      <div class="form-group">
        <label for="bedrooms">Bedrooms</label>
        <input type="number" name="bedrooms" id="bedrooms"
               value="<%= p instanceof model.ResidentialProperty ? ((model.ResidentialProperty) p).getBedrooms() : "" %>" required>
      </div>

      <div class="form-group">
        <label for="imageURL">Image URL</label>
        <input type="text" name="imageURL" id="imageURL"
               value="<%= p.getClass().getMethod("getImageUrl").invoke(p) %>">
      </div>

      <button type="submit" class="cta-btn" style="width: 100%; margin-top: 1rem;">Update Property</button>
    </form>

    <div style="text-align: center; margin-top: 2rem;">
      <a href="listProperties" class="modal-btn" style="background-color: var(--secondary); color: white; padding: 0.8rem 2rem; border-radius: 50px;">⬅ Back to Listings</a>
    </div>
  </div>
</main>

<footer>
  <p>© 2025 MyLocal RealEstate. All rights reserved.</p>
</footer>

</body>
</html>





