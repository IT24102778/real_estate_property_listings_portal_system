<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - MyLocal RealEstate</title>
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
            url('https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 420px;
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
            margin-bottom: 25px;
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

        .login-btn {
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
            margin-top: 10px;
        }

        .login-btn:hover {
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

        .social-login {
            margin: 20px 0;
        }

        .social-login p {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 15px;
            position: relative;
        }

        .social-login p::before, .social-login p::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #ddd;
            margin: auto;
        }

        .social-login p::before {
            margin-right: 10px;
        }

        .social-login p::after {
            margin-left: 10px;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            transition: all 0.3s;
        }

        .social-icon:hover {
            transform: translateY(-3px);
        }

        .facebook { background-color: #3b5998; }
        .google { background-color: #db4437; }
        .linkedin { background-color: #0077b5; }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">
        <h2><i class="fas fa-home"></i> MyLocal RealEstate</h2>
    </div>
    <h2>Welcome Back</h2>

    <% if (request.getParameter("error") != null && request.getParameter("error").equals("invalid_credentials")) { %>
    <div class="error-message">
        <i class="fas fa-exclamation-circle"></i> Invalid email or password. Please try again.
    </div>
    <% } %>

    <form id="loginForm" action="login" method="POST">
        <div class="form-group">
            <label for="loginEmail">Email Address</label>
            <input type="email" id="loginEmail" name="email" required placeholder="Enter your email">
        </div>
        <div class="form-group">
            <label for="loginPassword">Password</label>
            <div class="password-container">
                <input type="password" id="loginPassword" name="password" required placeholder="Enter your password">
                <i class="fas fa-eye password-toggle" id="togglePassword"></i>
            </div>
        </div>
        <button type="submit" class="login-btn">Sign In</button>

        <div class="social-login">
            <p>or continue with</p>
            <div class="social-icons">
                <a href="#" class="social-icon facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon google"><i class="fab fa-google"></i></a>
                <a href="#" class="social-icon linkedin"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>

        <p class="form-footer">
            Don't have an account? <a href="Signup.jsp">Create account</a><br>
            <a href="#" style="margin-top: 5px; display: inline-block;">Forgot password?</a>
        </p>
    </form>
</div>

<script>
    // Toggle password visibility
    const togglePassword = document.querySelector('#togglePassword');
    const password = document.querySelector('#loginPassword');

    togglePassword.addEventListener('click', function() {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        this.classList.toggle('fa-eye-slash');
    });
</script>
</body>
</html>