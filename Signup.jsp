<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyLocal RealEstate</title>
  <style>
    /* Base Styles & Reset */
    :root {
      --primary-color: #4361ee;
      --primary-dark: #3a56d4;
      --secondary-color: #3f37c9;
      --text-color: #2b2d42;
      --light-gray: #f8f9fa;
      --medium-gray: #e9ecef;
      --dark-gray: #adb5bd;
      --error-color: #ef233c;
      --success-color: #4cc9f0;
      --border-radius: 8px;
      --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      --transition: all 0.3s ease;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Roboto', sans-serif;
      line-height: 1.6;
      color: var(--text-color);
      background-color: var(--light-gray);
    }

    /* Dashboard Styles */
    .dashboard-container {
      display: flex;
      min-height: 100vh;
    }

    .sidebar {
      width: 250px;
      background-color: #2c3e50;
      color: white;
      padding: 20px 0;
      transition: transform 0.3s ease;
    }

    .logo {
      padding: 0 20px 20px;
      border-bottom: 1px solid #3d5166;
      margin-bottom: 20px;
    }

    .logo h1 {
      font-size: 20px;
      margin-bottom: 5px;
    }

    .logo p {
      font-size: 12px;
      color: #bdc3c7;
    }

    .nav-menu {
      list-style: none;
    }

    .nav-menu li {
      padding: 12px 20px;
      transition: background-color 0.3s;
    }

    .nav-menu li:hover {
      background-color: #34495e;
    }

    .nav-menu li.active {
      background-color: #34495e;
      border-left: 4px solid #3498db;
    }

    .nav-menu li a {
      color: white;
      text-decoration: none;
      display: block;
    }

    .main-content {
      flex: 1;
      padding: 20px;
    }

    .header {
      margin-bottom: 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .header h2 {
      color: #2c3e50;
      font-size: 24px;
    }

    /* Auth Container Styles */
    .auth-container {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-color: var(--light-gray);
      padding: 2rem;
    }

    .signup-container {
      background: white;
      padding: 2.5rem;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      width: 100%;
      max-width: 600px;
      transition: var(--transition);
    }

    .signup-container h1 {
      text-align: center;
      margin-bottom: 1.5rem;
      color: var(--primary-color);
      font-weight: 500;
    }

    .input-group {
      margin-bottom: 1.25rem;
    }

    .input-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
      color: var(--text-color);
    }

    .input-group input {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid var(--medium-gray);
      border-radius: var(--border-radius);
      font-size: 1rem;
      transition: var(--transition);
    }

    .input-group input:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
    }

    .name-group {
      display: flex;
      gap: 1rem;
    }

    .half-width {
      flex: 1;
    }

    .password-hint {
      font-size: 0.75rem;
      color: var(--dark-gray);
      margin-top: 0.25rem;
    }

    .auth-button {
      width: 100%;
      padding: 0.75rem;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: var(--border-radius);
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: var(--transition);
      margin-top: 0.5rem;
    }

    .auth-button:hover {
      background-color: var(--primary-dark);
    }

    .switch-auth {
      text-align: center;
      margin-top: 1.5rem;
      color: var(--dark-gray);
    }

    .switch-link {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
      transition: var(--transition);
    }

    .switch-link:hover {
      text-decoration: underline;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
      .dashboard-container {
        flex-direction: column;
      }

      .sidebar {
        width: 100%;
        position: static;
      }

      .name-group {
        flex-direction: column;
      }

      .half-width {
        width: 100%;
      }

      .auth-container {
        padding: 1rem;
      }

      .signup-container {
        padding: 1.5rem;
      }
    }

    /* Utility Classes */
    .hidden {
      display: none;
    }
  </style>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
<%-- Check if user is logged in --%>
<% if (session.getAttribute("user") == null) { %>
<div class="auth-container">
  <div class="signup-container" id="signupContainer">
    <h1>Sign Up</h1>

    <form id="signupForm" method="post" action="signup">
      <div class="name-group">
        <div class="input-group half-width">
          <label for="firstName">First Name</label>
          <input type="text" id="firstName" name="firstName" required>
        </div>

        <div class="input-group half-width">
          <label for="lastName">Last Name</label>
          <input type="text" id="lastName" name="lastName" required>
        </div>
      </div>

      <div class="input-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
      </div>

      <div class="input-group">
        <label for="phone">Contact Number</label>
        <input type="tel" id="phone" name="phone" required>
      </div>

      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <div class="password-hint">Use 8 or more characters with a mix of letters, numbers & symbols</div>
      </div>

      <div class="input-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
      </div>

      <button type="submit" class="auth-button">Sign Up</button>
    </form>

    <div class="switch-auth">
      Already have an account? <a href="Login.jsp" class="switch-link">Login</a>
    </div>
  </div>
</div>
<% } else { %>
<div class="dashboard-container">
  <!-- Sidebar Navigation -->
  <div class="sidebar">
    <div class="logo">
      <h1>MyLocal RealEstate</h1>
      <p>MyLocation, well</p>
    </div>
    <ul class="nav-menu">
      <li class="active"><a href="DashboardServlet">Dashboard</a></li>
      <li><a href="PropertiesServlet">My Properties</a></li>
      <li><a href="AddPropertyServlet">Add Property</a></li>
      <li><a href="FavoritesServlet">Favorites</a></li>
      <li><a href="NotificationsServlet">Notifications</a></li>
      <li><a href="SettingsServlet">Settings</a></li>
      <li><a href="HelpServlet">Help</a></li>
    </ul>
  </div>

  <!-- Main Content Area -->
  <div class="main-content">
    <div class="header">
      <h2>Dashboard Overview</h2>
    </div>

    <!-- Stats Cards -->
    <div class="stats-container">
      <div class="stat-card">
        <h3>Active Listings</h3>
        <p class="stat-value">5</p>
      </div>
      <div class="stat-card">
        <h3>Total Views</h3>
        <p class="stat-value">12</p>
      </div>
      <div class="stat-card">
        <h3>Messages</h3>
        <p class="stat-value">3</p>
      </div>
    </div>

    <!-- Recent Activity Section -->
    <div class="activity-section">
      <div class="section-header">
        <h3>Recent Activity</h3>
        <a href="#" class="view-all">View All ></a>
      </div>
      <ul class="activity-list">
        <li>
          <span class="activity-icon new-property">+</span>
          <div class="activity-content">
            <p class="activity-title">New Property Added</p>
            <p class="activity-desc">You listed a new property at 123 Main St. New York</p>
            <p class="activity-time">2 hours ago</p>
          </div>
        </li>
        <li>
          <span class="activity-icon price-reduction">-</span>
          <div class="activity-content">
            <p class="activity-title">Price Reduction</p>
            <p class="activity-desc">Prior reduced for your property at 645 Oak Ave, Chicago</p>
            <p class="activity-time">1 day ago</p>
          </div>
        </li>
        <li>
          <span class="activity-icon new-message">✉</span>
          <div class="activity-content">
            <p class="activity-title">New Message</p>
            <p class="activity-desc">You received a new message from John Smith about 123 Main St.</p>
            <p class="activity-time">2 days ago</p>
          </div>
        </li>
      </ul>
    </div>

    <!-- Favorites Section -->
    <div class="favorites-section">
      <div class="section-header">
        <h3>Favorites</h3>
      </div>
      <div class="favorites-stats">
        <div class="favorite-stat">
          <p class="stat-value">3</p>
          <p class="stat-label">Messages</p>
        </div>
        <div class="favorite-stat">
          <p class="stat-value">5</p>
          <p class="stat-label">Unused Messages</p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Form validation
    const signupForm = document.getElementById('signupForm');
    if (signupForm) {
      signupForm.addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
          e.preventDefault();
          alert('Passwords do not match!');
          return false;
        }

        if (password.length < 8) {
          e.preventDefault();
          alert('Password must be at least 8 characters long!');
          return false;
        }

        return true;
      });
    }

    // Mobile menu toggle
    const header = document.querySelector('.header');
    if (header) {
      const mobileMenuToggle = document.createElement('div');
      mobileMenuToggle.className = 'mobile-menu-toggle';
      mobileMenuToggle.innerHTML = '☰';
      header.prepend(mobileMenuToggle);

      mobileMenuToggle.addEventListener('click', function() {
        document.querySelector('.sidebar').classList.toggle('active');
      });
    }

    // Responsive behavior
    function handleResponsive() {
      const sidebar = document.querySelector('.sidebar');
      if (sidebar && window.innerWidth < 768) {
        sidebar.classList.remove('active');
        const toggle = document.querySelector('.mobile-menu-toggle');
        if (toggle) toggle.style.display = 'block';
      } else if (sidebar) {
        sidebar.classList.add('active');
        const toggle = document.querySelector('.mobile-menu-toggle');
        if (toggle) toggle.style.display = 'none';
      }
    }

    if (document.querySelector('.sidebar')) {
      handleResponsive();
      window.addEventListener('resize', handleResponsive);
    }
  });
</script>
</body>
</html>