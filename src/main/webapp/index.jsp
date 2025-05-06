<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyLocal RealEstate - Sri Lankan Real Estate Portal</title>
    <link rel="stylesheet" href="Home/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<!-- Login Modal -->
<div class="modal" id="loginModal">
    <div class="modal-content">
        <span class="close-btn">&times;</span>
        <h2>Login to MyLocal RealEstate</h2>
        <form id="loginForm">
            <div class="form-group">
                <label for="loginEmail">Email</label>
                <input type="email" id="loginEmail" required>
            </div>
            <div class="form-group">
                <label for="loginPassword">Password</label>
                <input type="password" id="loginPassword" required>
            </div>
            <button type="submit" class="modal-btn">Login</button>
            <p class="form-footer">Don't have an account? <a href="#" id="showSignup">Sign up</a></p>
        </form>
    </div>
</div>

<!-- Signup Modal -->
<div class="modal" id="signupModal">
    <div class="modal-content">
        <span class="close-btn">&times;</span>
        <h2>Create an Account</h2>
        <form id="signupForm">
            <div class="form-group">
                <label for="signupName">Full Name</label>
                <input type="text" id="signupName" required>
            </div>
            <div class="form-group">
                <label for="signupEmail">Email</label>
                <input type="email" id="signupEmail" required>
            </div>
            <div class="form-group">
                <label for="signupPassword">Password</label>
                <input type="password" id="signupPassword" required>
            </div>
            <div class="form-group">
                <label for="signupConfirm">Confirm Password</label>
                <input type="password" id="signupConfirm" required>
            </div>
            <div class="form-group">
                <input type="checkbox" id="termsAgree" required>
                <label for="termsAgree">I agree to the <a href="#">Terms & Conditions</a></label>
            </div>
            <button type="submit" class="modal-btn">Sign Up</button>
            <p class="form-footer">Already have an account? <a href="#" id="showLogin">Login</a></p>
        </form>
    </div>
</div>

<header>
    <div class="top-bar">
        <div class="logo">
            <h1>MyLocal</h1>
            <h2>RealEstate</h2>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="#">Buy</a></li>
                <li><a href="listProperties">Properties</a></li>
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
            <li class="active"><a href="#">BUY</a></li>
            <li><a href="#">RENT</a></li>
            <li><a href="#">SOLD</a></li>
            <li><a href="#">NEW BUILDS</a></li>
            <li><a href="#">OPEN HOMES</a></li>
        </ul>
    </div>
</header>

<main>
    <section class="search-section">
        <h2>Search By Location, Address Or Keyword</h2>
        <div class="search-container">
            <input type="text" placeholder="Search...">
            <button class="search-btn">Search</button>
        </div>
        <div class="filters">
            <select>
                <option>All property types</option>
                <option>House</option>
                <option>Apartment</option>
                <option>Land</option>
            </select>
            <select>
                <option>Beds (min)</option>
                <option>1+</option>
                <option>2+</option>
                <option>3+</option>
            </select>
            <select>
                <option>Beds (max)</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
            <select>
                <option>Price (min)</option>
                <option>$200,000</option>
                <option>$500,000</option>
                <option>$1,000,000</option>
            </select>
            <select>
                <option>Price (max)</option>
                <option>$500,000</option>
                <option>$1,000,000</option>
                <option>$2,000,000</option>
            </select>
        </div>
    </section>

    <section class="quick-links">
        <div class="link-card">
            <i class="fas fa-home"></i>
            <h3>Check My Property Worth</h3>
        </div>
        <div class="link-card">
            <i class="fas fa-tasks"></i>
            <h3>Manage My Property</h3>
        </div>
        <div class="link-card">
            <i class="fas fa-user-tie"></i>
            <h3>Agents Join</h3>
        </div>
        <div class="link-card">
            <i class="fas fa-file-signature"></i>
            <h3>Find Better Home Loans</h3>
        </div>
        <div class="link-card">
            <i class="fas fa-lightbulb"></i>
            <h3>Top Tips to Sell My Property</h3>
        </div>
    </section>

    <section class="marketing-banner">
        <div class="banner-content">
            <h3>Get your business onto mylocalpages</h3>
            <h2>Sri Lankan's Local Area Marketing Platform</h2>
            <div class="progress-container">
                <div class="progress-bar" style="width: 80%"></div>
                <span>80%</span>
            </div>
            <button class="cta-btn">LEARN MORE</button>
        </div>
    </section>
</main>

<footer>
    <!-- Footer content would go here -->
</footer>

<script src="Home/js/script.js"></script>
<script src="Home/js/search.js"></script>
<script src="Home/js/auth.js"></script>
</body>
</html>