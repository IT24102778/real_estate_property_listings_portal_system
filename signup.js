document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle functionality
    const mobileMenuToggle = document.createElement('div');
    mobileMenuToggle.className = 'mobile-menu-toggle';
    mobileMenuToggle.innerHTML = '☰';
    document.querySelector('.header').prepend(mobileMenuToggle);

    mobileMenuToggle.addEventListener('click', function() {
        document.querySelector('.sidebar').classList.toggle('active');
    });

    // Close mobile menu when clicking outside
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.sidebar') && !e.target.closest('.mobile-menu-toggle')) {
            document.querySelector('.sidebar').classList.remove('active');
        }
    });

    // Activity item click handler
    const activityItems = document.querySelectorAll('.activity-list li');
    activityItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all items
            activityItems.forEach(i => i.classList.remove('active'));
            // Add active class to clicked item
            this.classList.add('active');

            // Here you could add logic to show more details about the activity
            console.log('Activity selected:', this.querySelector('.activity-title').textContent);
        });
    });

    // Stat card hover effects
    const statCards = document.querySelectorAll('.stat-card');
    statCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px)';
            this.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.1)';
        });

        card.addEventListener('mouseleave', function() {
            this.style.transform = '';
            this.style.boxShadow = '';
        });
    });

    // View All button functionality
    const viewAllBtn = document.querySelector('.view-all');
    if (viewAllBtn) {
        viewAllBtn.addEventListener('click', function(e) {
            e.preventDefault();
            // Here you would typically load more activities or navigate to a full activity page
            alert('Loading all activities...');
            // In a real implementation, you might use:
            // window.location.href = 'ActivitiesServlet';
        });
    });

    // Simulate loading data (in a real app, this would be an AJAX call)
    function loadDashboardData() {
        // Simulate API call delay
        setTimeout(() => {
            // Update stats (in a real app, these values would come from the server)
            document.querySelector('.stat-card:nth-child(1) .stat-value').textContent = '5';
            document.querySelector('.stat-card:nth-child(2) .stat-value').textContent = '12';
            document.querySelector('.stat-card:nth-child(3) .stat-value').textContent = '3';

            // Simulate loading completion
            document.querySelector('.dashboard-container').classList.add('loaded');
        }, 1000);
    }

    // Initialize the dashboard
    loadDashboardData();

    // Add responsive behavior
    function handleResponsive() {
        const sidebar = document.querySelector('.sidebar');
        if (window.innerWidth < 768) {
            sidebar.classList.remove('active');
            mobileMenuToggle.style.display = 'block';
        } else {
            sidebar.classList.add('active');
            mobileMenuToggle.style.display = 'none';
        }
    }

    // Run on load and on resize
    handleResponsive();
    window.addEventListener('resize', handleResponsive);
});