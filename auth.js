document.addEventListener('DOMContentLoaded', function() {
    // Get modal elements
    const loginModal = document.getElementById('loginModal');
    const signupModal = document.getElementById('signupModal');
    const loginLink = document.getElementById('loginLink');
    const signupLink = document.getElementById('signupLink');
    const showSignup = document.getElementById('showSignup');
    const showLogin = document.getElementById('showLogin');
    const closeButtons = document.querySelectorAll('.close-btn');

    // Show login modal
    loginLink.addEventListener('click', function(e) {
        e.preventDefault();
        loginModal.style.display = 'block';
    });

    // Show signup modal
    signupLink.addEventListener('click', function(e) {
        e.preventDefault();
        signupModal.style.display = 'block';
    });

    // Switch to signup from login
    showSignup.addEventListener('click', function(e) {
        e.preventDefault();
        loginModal.style.display = 'none';
        signupModal.style.display = 'block';
    });

    // Switch to login from signup
    showLogin.addEventListener('click', function(e) {
        e.preventDefault();
        signupModal.style.display = 'none';
        loginModal.style.display = 'block';
    });

    // Close modals
    closeButtons.forEach(button => {
        button.addEventListener('click', function() {
            loginModal.style.display = 'none';
            signupModal.style.display = 'none';
        });
    });

    // Close when clicking outside modal
    window.addEventListener('click', function(e) {
        if (e.target === loginModal) {
            loginModal.style.display = 'none';
        }
        if (e.target === signupModal) {
            signupModal.style.display = 'none';
        }
    });

    // Form submissions
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const email = document.getElementById('loginEmail').value;
        const password = document.getElementById('loginPassword').value;

        // Here you would typically send to server for authentication
        console.log('Login attempt with:', email, password);
        alert('Login functionality would connect to backend in production');
        loginModal.style.display = 'none';
    });

    document.getElementById('signupForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const name = document.getElementById('signupName').value;
        const email = document.getElementById('signupEmail').value;
        const password = document.getElementById('signupPassword').value;
        const confirmPassword = document.getElementById('signupConfirm').value;

        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return;
        }

        // Here you would typically send to server to create account
        console.log('Signup attempt with:', name, email, password);
        alert('Account creation would connect to backend in production');
        signupModal.style.display = 'none';
    });
});