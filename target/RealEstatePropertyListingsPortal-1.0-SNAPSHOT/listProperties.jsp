<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Listings - MyLocal RealEstate</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
                <li><a href="#"><i class="fas fa-home"></i> Buy</a></li>
                <li><a href="#"><i class="fas fa-key"></i> Rent</a></li>
                <li><a href="#"><i class="fas fa-tag"></i> Sold</a></li>
                <li><a href="#"><i class="fas fa-user-tie"></i> Agents</a></li>
                <li><a href="#"><i class="fas fa-building"></i> New Builds</a></li>
                <li><a href="#"><i class="fas fa-file-signature"></i> Loans</a></li>
                <li><a href="#"><i class="fas fa-newspaper"></i> News</a></li>
                <li><a href="#" id="loginLink"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a href="#" id="signupLink" class="signup-btn"><i class="fas fa-user-plus"></i> Sign Up</a></li>
            </ul>
        </nav>
    </div>
    <div class="secondary-nav">
        <ul>
            <li class="active"><a href="#"><i class="fas fa-list"></i> Properties</a></li>
            <li><a href="#"><i class="fas fa-heart"></i> Saved</a></li>
            <li><a href="#"><i class="fas fa-bell"></i> Alerts</a></li>
            <li><a href="#"><i class="fas fa-chart-line"></i> Market Trends</a></li>
        </ul>
    </div>
</header>

<main class="container">
    <div class="search-section">
        <div class="d-flex">
            <div class="page-title">
                <h2><i class="fas fa-home"></i> Property Listings</h2>
                <p class="property-count">${not empty properties ? properties.size() : '0'} properties found</p>
            </div>
            <a href="#" class="cta-btn floating-btn">
                <i class="fas fa-plus"></i> Add Property
            </a>
        </div>

        <div class="search-tools">
            <form class="search-container" action="list" method="get">
                <div class="search-wrapper">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" name="search" placeholder="Search by title, location or features..." value="${param.search}">
                    <button type="submit" class="search-btn">Search</button>
                    <c:if test="${not empty param.search}">
                        <a href="list" class="clear-search">Clear</a>
                    </c:if>
                </div>
            </form>

            <div class="filters">
                <div class="filter-group">
                    <span>Sort by:</span>
                    <!-- Price sorting with toggle -->
                    <a href="list?sort=price&order=${param.sort eq 'price' && param.order eq 'asc' ? 'desc' : 'asc'}<c:if test="${not empty param.search}">&search=${param.search}</c:if>"
                       class="filter-btn ${param.sort eq 'price' ? 'active' : ''}">
                        <i class="fas fa-dollar-sign"></i> Price
                        <c:if test="${param.sort eq 'price'}">
                            <i class="fas ${param.order eq 'asc' ? 'fa-arrow-up' : 'fa-arrow-down'}"></i>
                        </c:if>
                    </a>

                    <!-- Bedrooms sorting with toggle -->
                    <a href="list?sort=bedrooms&order=${param.sort eq 'bedrooms' && param.order eq 'asc' ? 'desc' : 'asc'}<c:if test="${not empty param.search}">&search=${param.search}</c:if>"
                       class="filter-btn ${param.sort eq 'bedrooms' ? 'active' : ''}">
                        <i class="fas fa-bed"></i> Bedrooms
                        <c:if test="${param.sort eq 'bedrooms'}">
                            <i class="fas ${param.order eq 'asc' ? 'fa-arrow-up' : 'fa-arrow-down'}"></i>
                        </c:if>
                    </a>

                    <a href="list<c:if test="${not empty param.search}">?search=${param.search}</c:if>"
                       class="filter-btn">
                        <i class="fas fa-sync-alt"></i> Reset
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="quick-links">
        <c:choose>
            <c:when test="${not empty properties}">
                <c:forEach var="p" items="${properties}">
                    <div class="link-card property-card">
                        <div class="property-badge">
                            <span class="badge ${p.price < 300000 ? 'affordable' : p.price < 600000 ? 'mid-range' : 'luxury'}">
                                    ${p.price < 300000 ? 'Affordable' : p.price < 600000 ? 'Mid-Range' : 'Luxury'}
                            </span>
                        </div>
                        <div class="property-image-container">
                            <img src="${p['class'].simpleName == 'ResidentialProperty' && not empty p.imageUrl ? p.imageUrl : 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'}"
                                 alt="${p.title}" class="property-image" loading="lazy">
                        </div>
                        <div class="property-details">
                            <h3>${p.title}</h3>
                            <p class="property-location">
                                <i class="fas fa-map-marker-alt"></i> ${p.location}
                            </p>
                            <p class="property-price">$${String.format("%,.0f", p.price)}</p>
                            <c:if test="${p['class'].simpleName == 'ResidentialProperty'}">
                                <p class="property-description">${p.description}</p>
                                <div class="property-features">
                                    <span><i class="fas fa-bed"></i> ${p.bedrooms} beds</span>
                                    <span><i class="fas fa-bath"></i> ${p.bedrooms > 1 ? p.bedrooms - 1 : 1} baths</span>
                                    <span><i class="fas fa-vector-square"></i> ${p.bedrooms * 800} sqft</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-results">
                    <div class="empty-state">
                        <i class="fas fa-home"></i>
                        <c:choose>
                            <c:when test="${not empty param.search}">
                                <h3>No properties found matching "${param.search}"</h3>
                                <p>Try adjusting your search or filter criteria</p>
                            </c:when>
                            <c:otherwise>
                                <h3>Your property list is empty</h3>
                                <p>Start by adding your first property</p>
                            </c:otherwise>
                        </c:choose>
                        <a href="addProperty.jsp" class="cta-btn">
                            <i class="fas fa-plus"></i> Add Property
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<footer>
    <div class="footer-content">
        <div class="footer-section">
            <h4>MyLocal RealEstate</h4>
            <p>Finding your dream home since 2023</p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>
        <div class="footer-section">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h4>Services</h4>
            <ul>
                <li><a href="#">Property Valuation</a></li>
                <li><a href="#">Mortgage Calculator</a></li>
                <li><a href="#">Agent Finder</a></li>
                <li><a href="#">Neighborhood Guides</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2025 MyLocal RealEstate. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</footer>

<script>
    // Price formatting
    document.querySelectorAll('.property-price').forEach(priceEl => {
        const priceText = priceEl.textContent.replace('$', '').replace(/,/g, '');
        const price = parseFloat(priceText);
        if (price > 1000000) {
            priceEl.innerHTML = '$' + (price / 1000000).toFixed(1) + 'M';
        }
    });

    // Responsive search bar adjustment
    function adjustSearchLayout() {
        const searchWrapper = document.querySelector('.search-wrapper');
        if (window.innerWidth < 768) {
            searchWrapper.classList.add('mobile-layout');
        } else {
            searchWrapper.classList.remove('mobile-layout');
        }
    }

    // Run on load and resize
    window.addEventListener('load', adjustSearchLayout);
    window.addEventListener('resize', adjustSearchLayout);
</script>
</body>
</html>