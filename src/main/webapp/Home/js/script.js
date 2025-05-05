document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle functionality would go here
    console.log('Main JS loaded');

    // Example: Add active class to clicked nav item
    const navItems = document.querySelectorAll('.secondary-nav li');
    navItems.forEach(item => {
        item.addEventListener('click', function() {
            navItems.forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });
});