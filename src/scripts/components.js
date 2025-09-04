/**
 * Component Loader
 * Loads common header and footer components into pages
 */

// Function to load HTML content from a file
async function loadComponent(url) {
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return await response.text();
    } catch (error) {
        console.error('Error loading component:', error);
        return '';
    }
}

// Function to set active navigation item
function setActiveNavItem(currentPage) {
    const navLinks = document.querySelectorAll('.s-header__menu-links a');
    navLinks.forEach(link => {
        const li = link.parentElement;
        li.classList.remove('current');

        // Check if this link matches the current page
        const href = link.getAttribute('href');
        if (href === currentPage ||
            (currentPage === 'index.html' && href === '../../index.html') ||
            (currentPage === '' && href === '../../index.html')) {
            li.classList.add('current');
        }
    });
}

// Function to get current page name from URL
function getCurrentPageName() {
    const path = window.location.pathname;
    const fileName = path.split('/').pop();
    return fileName || 'index.html';
}

// Load header component
async function loadHeader() {
    const headerContainer = document.getElementById('header-container');
    if (headerContainer) {
        // Try different path variations based on current location
        let headerHTML = await loadComponent('../components/header.html');
        if (!headerHTML) {
            headerHTML = await loadComponent('./src/components/header.html');
        }
        if (!headerHTML) {
            headerHTML = await loadComponent('../../src/components/header.html');
        }

        if (headerHTML) {
            headerContainer.innerHTML = headerHTML;

            // Set active navigation item after header is loaded
            setTimeout(() => {
                const currentPage = getCurrentPageName();
                setActiveNavItem(currentPage);
            }, 100);
        } else {
            console.error('Could not load header component');
        }
    }
}

// Load footer component
async function loadFooter() {
    const footerContainer = document.getElementById('footer-container');
    if (footerContainer) {
        // Try different path variations based on current location
        let footerHTML = await loadComponent('../components/footer.html');
        if (!footerHTML) {
            footerHTML = await loadComponent('./src/components/footer.html');
        }
        if (!footerHTML) {
            footerHTML = await loadComponent('../../src/components/footer.html');
        }

        if (footerHTML) {
            footerContainer.innerHTML = footerHTML;
        } else {
            console.error('Could not load footer component');
        }
    }
}

// Initialize components when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    loadHeader();
    loadFooter();
});

// Export functions for manual loading if needed
window.ComponentLoader = {
    loadHeader,
    loadFooter,
    setActiveNavItem,
    getCurrentPageName
};
