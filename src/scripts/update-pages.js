/**
 * Script to update all pages to use common header and footer components
 * This is a Node.js script to be run once to update all pages
 */

const fs = require('fs');
const path = require('path');

// List of pages to update
const pages = [
    'contact.html',
    'technology-stack.html',
    'projects.html',
    'experience.html',
    'education.html'
];

// Function to update a single page
function updatePage(pagePath) {
    try {
        let content = fs.readFileSync(pagePath, 'utf8');
        
        // Replace header section
        const headerRegex = /<!-- # site header[\s\S]*?<\/header> <!-- end s-header -->/;
        const headerReplacement = `<!-- # site header 
        ================================================== -->
        <div id="header-container"></div>`;
        
        content = content.replace(headerRegex, headerReplacement);
        
        // Replace footer section
        const footerRegex = /<!-- # footer[\s\S]*?<\/footer> <!-- end s-footer -->/;
        const footerReplacement = `<!-- # footer 
        ================================================== -->
        <div id="footer-container"></div>`;
        
        content = content.replace(footerRegex, footerReplacement);
        
        // Add components.js script if not already present
        if (!content.includes('components.js')) {
            content = content.replace(
                /<script src="\.\.\/scripts\/main\.js"><\/script>/,
                `<script src="../scripts/main.js"></script>
    <script src="../scripts/components.js"></script>`
            );
        }
        
        // Write the updated content back to the file
        fs.writeFileSync(pagePath, content, 'utf8');
        console.log(`Updated: ${pagePath}`);
        
    } catch (error) {
        console.error(`Error updating ${pagePath}:`, error.message);
    }
}

// Update all pages
const pagesDir = path.join(__dirname, '..', 'pages');
pages.forEach(page => {
    const pagePath = path.join(pagesDir, page);
    updatePage(pagePath);
});

console.log('All pages updated successfully!');
