// Form Validation Functions
document.addEventListener('DOMContentLoaded', function() {
    // Get registration form if it exists
    const registrationForm = document.getElementById('registrationForm');
    if (registrationForm) {
        registrationForm.addEventListener('submit', validateRegistrationForm);
    }

    // Get login form if it exists
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', validateLoginForm);
    }

    // Get profile form if it exists
    const profileForm = document.getElementById('profileForm');
    if (profileForm) {
        profileForm.addEventListener('submit', validateProfileForm);
    }

    // Check for delete account button
    const deleteAccountBtn = document.getElementById('deleteAccountBtn');
    if (deleteAccountBtn) {
        deleteAccountBtn.addEventListener('click', confirmDelete);
    }

    // Initialize any alerts to auto-dismiss
    initAlerts();
});

// Registration form validation
function validateRegistrationForm(event) {
    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const fullName = document.getElementById('fullName').value.trim();

    let isValid = true;
    let errorMessages = [];

    // Username validation (alphanumeric and 3-20 characters)
    if (!username || !/^[a-zA-Z0-9_]{3,20}$/.test(username)) {
        errorMessages.push('Username must be 3-20 characters long and contain only letters, numbers, and underscores.');
        isValid = false;
    }

    // Email validation
    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        errorMessages.push('Please enter a valid email address.');
        isValid = false;
    }

    // Password validation (at least 6 characters)
    if (!password || password.length < 6) {
        errorMessages.push('Password must be at least 6 characters long.');
        isValid = false;
    }

    // Confirm password validation
    if (password !== confirmPassword) {
        errorMessages.push('Passwords do not match.');
        isValid = false;
    }

    // Full name validation
    if (!fullName) {
        errorMessages.push('Full name is required.');
        isValid = false;
    }

    // If validation fails, prevent form submission and show errors
    if (!isValid) {
        event.preventDefault();
        showFormErrors(errorMessages);
    }
}

// Login form validation
function validateLoginForm(event) {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value;

    let isValid = true;
    let errorMessages = [];

    if (!username) {
        errorMessages.push('Username is required.');
        isValid = false;
    }

    if (!password) {
        errorMessages.push('Password is required.');
        isValid = false;
    }

    if (!isValid) {
        event.preventDefault();
        showFormErrors(errorMessages);
    }
}

// Profile form validation
function validateProfileForm(event) {
    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const fullName = document.getElementById('fullName').value.trim();

    let isValid = true;
    let errorMessages = [];

    // Username validation (alphanumeric and 3-20 characters)
    if (!username || !/^[a-zA-Z0-9_]{3,20}$/.test(username)) {
        errorMessages.push('Username must be 3-20 characters long and contain only letters, numbers, and underscores.');
        isValid = false;
    }

    // Email validation
    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        errorMessages.push('Please enter a valid email address.');
        isValid = false;
    }

    // Full name validation
    if (!fullName) {
        errorMessages.push('Full name is required.');
        isValid = false;
    }

    // If password is provided (optional on update), check it
    if (password) {
        if (password.length < 6) {
            errorMessages.push('Password must be at least 6 characters long.');
            isValid = false;
        }

        if (password !== confirmPassword) {
            errorMessages.push('Passwords do not match.');
            isValid = false;
        }
    }

    if (!isValid) {
        event.preventDefault();
        showFormErrors(errorMessages);
    }
}

// Show form validation errors
function showFormErrors(messages) {
    const errorDiv = document.createElement('div');
    errorDiv.className = 'alert alert-danger';

    const errorList = document.createElement('ul');
    errorList.style.marginBottom = '0';
    errorList.style.paddingLeft = '20px';

    messages.forEach(message => {
        const listItem = document.createElement('li');
        listItem.textContent = message;
        errorList.appendChild(listItem);
    });

    errorDiv.appendChild(errorList);

    // Find the form and insert error before it
    const form = document.querySelector('form');
    const formContainer = form.parentElement;

    // Remove any existing error messages
    const existingErrors = formContainer.querySelector('.alert-danger');
    if (existingErrors) {
        formContainer.removeChild(existingErrors);
    }

    formContainer.insertBefore(errorDiv, form);

    // Scroll to the top of the form to see errors
    window.scrollTo(0, errorDiv.offsetTop - 20);
}

// Confirm account deletion
function confirmDelete(event) {
    if (!confirm('Are you sure you want to delete your account? This action cannot be undone.')) {
        event.preventDefault();
    }
}

// Initialize auto-dismissing alerts
function initAlerts() {
    const alerts = document.querySelectorAll('.alert-success, .alert-danger');

    alerts.forEach(alert => {
        // Auto-dismiss success messages after 5 seconds
        if (alert.classList.contains('alert-success')) {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => {
                    if (alert.parentNode) {
                        alert.parentNode.removeChild(alert);
                    }
                }, 500);
            }, 5000);
        }

        // Add close button to alerts
        const closeButton = document.createElement('button');
        closeButton.innerHTML = '&times;';
        closeButton.style.float = 'right';
        closeButton.style.border = 'none';
        closeButton.style.background = 'none';
        closeButton.style.fontSize = '1.25rem';
        closeButton.style.fontWeight = 'bold';
        closeButton.style.cursor = 'pointer';
        closeButton.style.padding = '0 5px';

        closeButton.addEventListener('click', () => {
            alert.style.opacity = '0';
            setTimeout(() => {
                if (alert.parentNode) {
                    alert.parentNode.removeChild(alert);
                }
            }, 500);
        });

        alert.insertBefore(closeButton, alert.firstChild);

        // Add transition for smooth fade out
        alert.style.transition = 'opacity 0.5s ease';
    });
}