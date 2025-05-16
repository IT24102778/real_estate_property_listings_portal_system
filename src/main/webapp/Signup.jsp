<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up - MyLocal RealEstate</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
      url('https://images.unsplash.com/photo-1560520031-3a4dc4e9de0c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
      background-size: cover;
      color: #333;
    }

    .signup-container {
      background-color: rgba(255, 255, 255, 0.95);
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      width: 450px;
      text-align: center;
      backdrop-filter: blur(5px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .logo {
      margin-bottom: 25px;
    }

    .logo h2 {
      color: #2c8a40;
      margin: 0;
      font-size: 28px;
      font-weight: 700;
      letter-spacing: 1px;
    }

    h2 {
      color: #2c3e50;
      margin-bottom: 25px;
      font-weight: 600;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: left;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: #2c3e50;
      font-size: 14px;
    }

    .form-group input {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 6px;
      box-sizing: border-box;
      font-size: 15px;
      transition: all 0.3s;
    }

    .form-group input:focus {
      border-color: #2c8a40;
      box-shadow: 0 0 0 3px rgba(44, 138, 64, 0.2);
      outline: none;
    }

    .checkbox-group {
      display: flex;
      align-items: center;
      margin-bottom: 25px;
      font-size: 14px;
    }

    .checkbox-group input {
      margin-right: 10px;
      width: auto;
    }

    .checkbox-group a {
      color: #2c8a40;
      text-decoration: none;
      font-weight: 500;
    }

    .checkbox-group a:hover {
      text-decoration: underline;
    }

    .signup-btn {
      background-color: #2c8a40;
      color: white;
      border: none;
      padding: 14px 20px;
      width: 100%;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
      font-weight: 600;
      transition: all 0.3s;
    }

    .signup-btn:hover {
      background-color: #247a34;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .form-footer {
      margin-top: 25px;
      color: #7f8c8d;
      font-size: 14px;
    }

    .form-footer a {
      color: #2c8a40;
      text-decoration: none;
      font-weight: 500;
      transition: all 0.2s;
    }

    .form-footer a:hover {
      color: #247a34;
      text-decoration: underline;
    }

    .error-message {
      color: #e74c3c;
      margin-bottom: 20px;
      padding: 12px;
      background-color: #fdecea;
      border-radius: 6px;
      border-left: 4px solid #e74c3c;
      font-size: 14px;
      animation: shake 0.5s;
    }

    .success-message {
      color: #2c8a40;
      margin-bottom: 20px;
      padding: 12px;
      background-color: #e8f5e9;
      border-radius: 6px;
      border-left: 4px solid #2c8a40;
      font-size: 14px;
    }

    @keyframes shake {
      0%, 100% { transform: translateX(0); }
      20%, 60% { transform: translateX(-5px); }
      40%, 80% { transform: translateX(5px); }
    }

    .password-container {
      position: relative;
    }

    .password-toggle {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #95a5a6;
    }

    .strength-meter {
      height: 4px;
      background-color: #eee;
      margin-top: 8px;
      border-radius: 2px;
      overflow: hidden;
    }

    .strength-meter-fill {
      height: 100%;
      width: 0;
      transition: width 0.3s, background-color 0.3s;
    }

    .password-hints {
      font-size: 12px;
      color: #7f8c8d;
      margin-top: 5px;
      text-align: left;
    }

    .password-hints ul {
      padding-left: 20px;
      margin: 5px 0;
    }

    .password-hints li {
      margin-bottom: 3px;
    }

    .password-hints .valid {
      color: #2c8a40;
    }

    .password-hints .invalid {
      color: #e74c3c;
    }
  </style>
</head>
<body>
<div class="signup-container">
  <div class="logo">
    <h2><i class="fas fa-home"></i> MyLocal RealEstate</h2>
  </div>
  <h2>Join Our Community</h2>

  <% if (request.getParameter("error") != null && request.getParameter("error").equals("password_mismatch")) { %>
  <div class="error-message">
    <i class="fas fa-exclamation-circle"></i> Passwords do not match. Please try again.
  </div>
  <% } %>

  <% if (request.getParameter("error") != null && request.getParameter("error").equals("email_exists")) { %>
  <div class="error-message">
    <i class="fas fa-exclamation-circle"></i> Email already exists. Please use a different email.
  </div>
  <% } %>

  <% if (request.getParameter("signup") != null && request.getParameter("signup").equals("success")) { %>
  <div class="success-message">
    <i class="fas fa-check-circle"></i> Signup successful! Please login.
  </div>
  <% } %>

  <form id="signupForm" action="signup" method="POST">
    <div class="form-group">
      <label for="signupName">Full Name</label>
      <input type="text" id="signupName" name="fullName" required placeholder="Enter your full name">
    </div>
    <div class="form-group">
      <label for="signupEmail">Email Address</label>
      <input type="email" id="signupEmail" name="email" required placeholder="Enter your email">
    </div>
    <div class="form-group">
      <label for="signupPassword">Password</label>
      <div class="password-container">
        <input type="password" id="signupPassword" name="password" required placeholder="Create a password">
        <i class="fas fa-eye password-toggle" id="togglePassword"></i>
      </div>
      <div class="strength-meter">
        <div class="strength-meter-fill" id="strengthMeter"></div>
      </div>
      <div class="password-hints" id="passwordHints">
        <ul>
          <li class="invalid" id="lengthHint">At least 8 characters</li>
          <li class="invalid" id="uppercaseHint">At least 1 uppercase letter</li>
          <li class="invalid" id="numberHint">At least 1 number</li>
          <li class="invalid" id="specialHint">At least 1 special character</li>
        </ul>
      </div>
    </div>
    <div class="form-group">
      <label for="signupConfirm">Confirm Password</label>
      <div class="password-container">
        <input type="password" id="signupConfirm" name="confirmPassword" required placeholder="Confirm your password">
        <i class="fas fa-eye password-toggle" id="toggleConfirmPassword"></i>
      </div>
    </div>
    <div class="checkbox-group">
      <input type="checkbox" id="termsAgree" required>
      <label for="termsAgree">I agree to the <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a></label>
    </div>
    <button type="submit" class="signup-btn">Create Account</button>
    <p class="form-footer">
      Already have an account? <a href="../Page/Login.jsp">Sign in</a>
    </p>
  </form>
</div>

<script>
  // Password visibility toggle
  const togglePassword = document.querySelector('#togglePassword');
  const password = document.querySelector('#signupPassword');
  const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
  const confirmPassword = document.querySelector('#signupConfirm');

  togglePassword.addEventListener('click', function() {
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    this.classList.toggle('fa-eye-slash');
  });

  toggleConfirmPassword.addEventListener('click', function() {
    const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
    confirmPassword.setAttribute('type', type);
    this.classList.toggle('fa-eye-slash');
  });

  // Password strength meter
  password.addEventListener('input', function() {
    const strengthMeter = document.getElementById('strengthMeter');
    const passwordValue = this.value;
    let strength = 0;

    // Check for length
    if (passwordValue.length >= 8) {
      strength += 25;
      document.getElementById('lengthHint').classList.add('valid');
      document.getElementById('lengthHint').classList.remove('invalid');
    } else {
      document.getElementById('lengthHint').classList.add('invalid');
      document.getElementById('lengthHint').classList.remove('valid');
    }

    // Check for uppercase letters
    if (/[A-Z]/.test(passwordValue)) {
      strength += 25;
      document.getElementById('uppercaseHint').classList.add('valid');
      document.getElementById('uppercaseHint').classList.remove('invalid');
    } else {
      document.getElementById('uppercaseHint').classList.add('invalid');
      document.getElementById('uppercaseHint').classList.remove('valid');
    }

    // Check for numbers
    if (/[0-9]/.test(passwordValue)) {
      strength += 25;
      document.getElementById('numberHint').classList.add('valid');
      document.getElementById('numberHint').classList.remove('invalid');
    } else {
      document.getElementById('numberHint').classList.add('invalid');
      document.getElementById('numberHint').classList.remove('valid');
    }

    // Check for special characters
    if (/[^A-Za-z0-9]/.test(passwordValue)) {
      strength += 25;
      document.getElementById('specialHint').classList.add('valid');
      document.getElementById('specialHint').classList.remove('invalid');
    } else {
      document.getElementById('specialHint').classList.add('invalid');
      document.getElementById('specialHint').classList.remove('valid');
    }

    // Update strength meter
    strengthMeter.style.width = strength + '%';

    // Update color based on strength
    if (strength < 50) {
      strengthMeter.style.backgroundColor = '#e74c3c';
    } else if (strength < 75) {
      strengthMeter.style.backgroundColor = '#f39c12';
    } else {
      strengthMeter.style.backgroundColor = '#2c8a40';
    }
  });

  // Form validation
  document.getElementById('signupForm').addEventListener('submit', function(e) {
    const password = document.getElementById('signupPassword').value;
    const confirmPassword = document.getElementById('signupConfirm').value;
    const termsChecked = document.getElementById('termsAgree').checked;

    if (password !== confirmPassword) {
      e.preventDefault();
      document.getElementById('signupConfirm').focus();
      alert('Passwords do not match!');
      return false;
    }

    if (!termsChecked) {
      e.preventDefault();
      alert('You must agree to the Terms & Conditions and Privacy Policy');
      return false;
    }
  });
</script>
</body>
</html>