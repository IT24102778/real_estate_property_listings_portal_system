<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - MyLocal RealEstate</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f8fafc;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #2c3e50;
            color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            z-index: 1000;
        }

        .header-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 24px;
            font-weight: bold;
            color: #2c8a40;
        }

        .logo-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .login-btn {
            background-color: #2c8a40;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .login-btn:hover {
            background-color: #247a34;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
            padding-top: 70px;
        }

        .sidebar {
            width: 280px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            height: 100vh;
            position: fixed;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }

        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid #34495e;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            position: relative;
        }

        .sidebar-header h2 {
            color: #2c8a40;
            margin-top: 15px;
        }

        .sidebar-header p {
            color: #bdc3c7;
            font-size: 14px;
        }

        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #2c8a40;
            margin-bottom: 15px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .user-avatar:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(44, 138, 64, 0.5);
        }

        .edit-profile-btn {
            position: absolute;
            top: 60px;
            right: 30px;
            background-color: #2c8a40;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }

        .edit-profile-btn:hover {
            background-color: #247a34;
            transform: scale(1.1);
        }

        .sidebar-menu {
            margin-top: 20px;
        }

        .menu-item {
            padding: 15px 25px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            margin: 5px 10px;
            border-radius: 6px;
        }

        .menu-item:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .menu-item i {
            margin-right: 12px;
            width: 20px;
            text-align: center;
            font-size: 18px;
            color: #2c8a40;
        }

        .menu-item.active {
            background-color: #34495e;
            border-left: 4px solid #2c8a40;
            font-weight: 600;
        }

        .main-content {
            margin-left: 280px;
            width: calc(100% - 280px);
            padding: 30px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 25px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            border-radius: 10px;
            border-left: 4px solid #2c8a40;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info img {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            margin-right: 12px;
            object-fit: cover;
            border: 2px solid #2c8a40;
            cursor: pointer;
        }

        .user-name {
            font-weight: 600;
            color: #2c3e50;
        }

        .logout-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 6px;
            cursor: pointer;
            margin-left: 15px;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .logout-btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            border-top: 4px solid #2c8a40;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-header h3 {
            color: #2c3e50;
            font-size: 18px;
        }

        .card-header i {
            font-size: 28px;
            color: #2c8a40;
            background: rgba(44, 138, 64, 0.1);
            padding: 12px;
            border-radius: 8px;
        }

        .card-value {
            font-size: 32px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .card-footer {
            color: #7f8c8d;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .card-footer i {
            color: #2c8a40;
        }

        .recent-activity {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .activity-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ecf0f1;
        }

        .activity-header h3 {
            color: #2c3e50;
            font-size: 20px;
        }

        .view-all {
            color: #2c8a40;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .activity-item {
            display: flex;
            padding: 15px 0;
            border-bottom: 1px solid #ecf0f1;
            align-items: center;
            transition: background-color 0.3s;
        }

        .activity-item:hover {
            background-color: #f8fafc;
        }

        .activity-icon {
            width: 45px;
            height: 45px;
            background-color: #e8f5e9;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #2c8a40;
            font-size: 18px;
        }

        .activity-content {
            flex: 1;
        }

        .activity-content h4 {
            color: #2c3e50;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .activity-content p {
            color: #7f8c8d;
            font-size: 14px;
        }

        .activity-time {
            color: #bdc3c7;
            font-size: 13px;
            font-weight: 500;
            min-width: 80px;
            text-align: right;
        }

        .property-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .status-badge {
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            background: #e8f5e9;
            color: #2c8a40;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 2000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            border-radius: 10px;
            width: 500px;
            max-width: 90%;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
            overflow: hidden;
            animation: modalFadeIn 0.3s;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .modal-header {
            padding: 20px;
            background-color: #2c3e50;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h3 {
            margin: 0;
            color: #2c8a40;
        }

        .close-btn {
            background: none;
            border: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
        }

        .modal-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-control:focus {
            border-color: #2c8a40;
            outline: none;
            box-shadow: 0 0 0 2px rgba(44, 138, 64, 0.2);
        }

        .avatar-upload {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }

        .avatar-preview {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #2c8a40;
            margin-bottom: 15px;
        }

        .upload-btn {
            background-color: #2c8a40;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .upload-btn:hover {
            background-color: #247a34;
        }

        .status-toggle {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 24px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #2c8a40;
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        .modal-footer {
            padding: 15px 20px;
            background-color: #f5f7fa;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn {
            padding: 8px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: #2c8a40;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #247a34;
        }

        .btn-secondary {
            background-color: #f5f7fa;
            color: #2c3e50;
            border: 1px solid #ddd;
        }

        .btn-secondary:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
<!-- Header with Logo and Login Button -->
<div class="header">
    <div class="header-logo">
        <img src="https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80" alt="Logo" class="logo-img">
        <span>MyLocal RealEstate</span>
    </div>

    <div class="header-actions">
        <button class="login-btn" onclick="window.location.href='Login.jsp'">
            <i class="fas fa-sign-in-alt"></i> Login
        </button>
    </div>
</div>

<div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <img src="https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80" alt="User" class="user-avatar" id="profileAvatar">
            <button class="edit-profile-btn" id="editProfileBtn">
                <i class="fas fa-pencil-alt"></i>
            </button>
            <h2>MyLocal RealEstate</h2>
            <p>Welcome, <span id="usernameDisplay"><%= session.getAttribute("userName") %></span></p>
            <div class="status-badge" id="statusBadge">Active</div>
        </div>

        <div class="sidebar-menu">
            <div class="menu-item active">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-home"></i>
                <span>My Properties</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-plus-circle"></i>
                <span>Add Property</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-heart"></i>
                <span>Favorites</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-bell"></i>
                <span>Notifications</span>
                <span class="status-badge" style="margin-left: auto;">3 New</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-cog"></i>
                <span>Settings</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-question-circle"></i>
                <span>Help</span>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="top-bar">
            <h2>Dashboard Overview</h2>
            <div class="user-info">
                <img src="https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80" alt="User" id="topBarAvatar">
                <span class="user-name" id="topBarUsername"><%= session.getAttribute("userName") %></span>
                <button class="logout-btn" onclick="window.location.href='Home/Page/Login.jsp'">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
        </div>

        <div class="dashboard-cards">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Property" class="property-image">
                <div class="card-header">
                    <h3>My Properties</h3>
                    <i class="fas fa-home"></i>
                </div>
                <div class="card-value">5</div>
                <div class="card-footer">
                    <i class="fas fa-check-circle"></i> 3 Active Listings
                </div>
            </div>

            <div class="card">
                <img src="https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Favorites" class="property-image">
                <div class="card-header">
                    <h3>Favorites</h3>
                    <i class="fas fa-heart"></i>
                </div>
                <div class="card-value">12</div>
                <div class="card-footer">
                    <i class="fas fa-bookmark"></i> Saved Properties
                </div>
            </div>

            <div class="card">
                <img src="https://images.unsplash.com/photo-1513694203232-719a280e022f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Messages" class="property-image">
                <div class="card-header">
                    <h3>Messages</h3>
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="card-value">3</div>
                <div class="card-footer">
                    <i class="fas fa-envelope"></i> Unread Messages
                </div>
            </div>
        </div>

        <div class="recent-activity">
            <div class="activity-header">
                <h3>Recent Activity</h3>
                <a href="#" class="view-all">View All <i class="fas fa-chevron-right"></i></a>
            </div>

            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-home"></i>
                </div>
                <div class="activity-content">
                    <h4>New Property Added</h4>
                    <p>You listed a new property at 123 Main St, New York</p>
                </div>
                <div class="activity-time">2 hours ago</div>
            </div>

            <div class="activity-item">
                <div class="activity-icon" style="background-color: #fff8e1; color: #ffa000;">
                    <i class="fas fa-bell"></i>
                </div>
                <div class="activity-content">
                    <h4>Price Reduction</h4>
                    <p>Price reduced for your property at 456 Oak Ave, Chicago</p>
                </div>
                <div class="activity-time">1 day ago</div>
            </div>

            <div class="activity-item">
                <div class="activity-icon" style="background-color: #e8f5e9; color: #2c8a40;">
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="activity-content">
                    <h4>New Message</h4>
                    <p>You received a new message from John Smith about 123 Main St</p>
                </div>
                <div class="activity-time">2 days ago</div>
            </div>

            <div class="activity-item">
                <div class="activity-icon" style="background-color: #fce4ec; color: #e91e63;">
                    <i class="fas fa-heart"></i>
                </div>
                <div class="activity-content">
                    <h4>Property Saved</h4>
                    <p>You saved a property at 789 Pine Rd, San Francisco</p>
                </div>
                <div class="activity-time">3 days ago</div>
            </div>
        </div>
    </div>
</div>

<!-- Edit Profile Modal -->
<div class="modal" id="profileModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Edit Profile</h3>
            <button class="close-btn" id="closeModal">&times;</button>
        </div>
        <div class="modal-body">
            <div class="avatar-upload">
                <img src="https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80" alt="Profile Preview" class="avatar-preview" id="avatarPreview">
                <button class="upload-btn" id="uploadBtn">
                    <i class="fas fa-upload"></i> Upload New Photo
                </button>
                <input type="file" id="avatarInput" accept="image/*" style="display: none;">
            </div>

            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" value="<%= session.getAttribute("userName") %>">
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" value="user@example.com">
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" class="form-control" id="phone" value="+1 (555) 123-4567">
            </div>

            <div class="form-group">
                <label>Account Status</label>
                <div class="status-toggle">
                    <label class="toggle-switch">
                        <input type="checkbox" id="statusToggle" checked>
                        <span class="slider"></span>
                    </label>
                    <span id="statusText">Active</span>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" id="cancelBtn">Cancel</button>
            <button class="btn btn-primary" id="saveBtn">Save Changes</button>
        </div>
    </div>
</div>

<script>
    // Profile Modal Functionality
    const editProfileBtn = document.getElementById('editProfileBtn');
    const profileModal = document.getElementById('profileModal');
    const closeModal = document.getElementById('closeModal');
    const cancelBtn = document.getElementById('cancelBtn');
    const saveBtn = document.getElementById('saveBtn');
    const avatarInput = document.getElementById('avatarInput');
    const avatarPreview = document.getElementById('avatarPreview');
    const uploadBtn = document.getElementById('uploadBtn');
    const statusToggle = document.getElementById('statusToggle');
    const statusText = document.getElementById('statusText');
    const fullName = document.getElementById('fullName');
    const profileAvatar = document.getElementById('profileAvatar');
    const topBarAvatar = document.getElementById('topBarAvatar');
    const usernameDisplay = document.getElementById('usernameDisplay');
    const topBarUsername = document.getElementById('topBarUsername');
    const statusBadge = document.getElementById('statusBadge');

    // Open modal when edit button is clicked
    editProfileBtn.addEventListener('click', () => {
        profileModal.style.display = 'flex';
    });

    // Close modal when X button is clicked
    closeModal.addEventListener('click', () => {
        profileModal.style.display = 'none';
    });

    // Close modal when cancel button is clicked
    cancelBtn.addEventListener('click', () => {
        profileModal.style.display = 'none';
    });

    // Close modal when clicking outside the modal content
    window.addEventListener('click', (e) => {
        if (e.target === profileModal) {
            profileModal.style.display = 'none';
        }
    });

    // Handle avatar upload
    uploadBtn.addEventListener('click', () => {
        avatarInput.click();
    });

    avatarInput.addEventListener('change', (e) => {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (event) => {
                avatarPreview.src = event.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

    // Handle status toggle
    statusToggle.addEventListener('change', () => {
        statusText.textContent = statusToggle.checked ? 'Active' : 'Inactive';
    });

    // Save profile changes
    saveBtn.addEventListener('click', () => {
        // Update profile picture if changed
        if (avatarInput.files[0]) {
            const reader = new FileReader();
            reader.onload = (event) => {
                profileAvatar.src = event.target.result;
                topBarAvatar.src = event.target.result;
            };
            reader.readAsDataURL(avatarInput.files[0]);
        }

        // Update username
        usernameDisplay.textContent = fullName.value;
        topBarUsername.textContent = fullName.value;

        // Update status
        if (statusToggle.checked) {
            statusBadge.textContent = 'Active';
            statusBadge.style.backgroundColor = '#e8f5e9';
            statusBadge.style.color = '#2c8a40';
        } else {
            statusBadge.textContent = 'Inactive';
            statusBadge.style.backgroundColor = '#ffebee';
            statusBadge.style.color = '#e74c3c';
        }

        // Close modal
        profileModal.style.display = 'none';

        // Show success message (you can replace this with actual AJAX call to your backend)
        alert('Profile updated successfully!');
    });
</script>
</body>
</html>