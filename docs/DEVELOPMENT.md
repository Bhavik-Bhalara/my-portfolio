# Development Guide

This guide will help you customize and develop your portfolio website.

## 🚀 Quick Start

### 1. Local Development Server

To run the website locally with live reload:

```bash
# Option 1: Using Node.js (recommended)
npm start

# Option 2: Using Python
python -m http.server 8080

# Option 3: Using PHP
php -S localhost:8080
```

Then open `http://localhost:8080` in your browser.

### 2. File Structure Overview

```
my-portfolio/
├── index.html          # Homepage - main entry point
├── about.html          # About page
├── services.html       # Services/Skills page
├── blog.html          # Blog listing page
├── contact.html       # Contact page
├── single.html        # Single blog post template
├── generic.html       # Generic page template
├── styles.html        # Style guide/components showcase
├── css/
│   ├── styles.css     # Main custom styles
│   └── vendor.css     # Third-party CSS libraries
├── js/
│   ├── main.js        # Main JavaScript functionality
│   └── plugins.js     # JavaScript plugins and libraries
└── images/            # All image assets
```

## ✏️ Customization Steps

### Step 1: Update Personal Information

1. **Homepage (index.html)**:
   - Line 9: Update page title
   - Line 99: Change name from "Monica" to your name
   - Lines 101-104: Update your professional tagline
   - Lines 149-171: Replace lorem ipsum with your bio

2. **About Page (about.html)**:
   - Update all personal information
   - Replace placeholder text with your story
   - Add your skills and experience

3. **Contact Page (contact.html)**:
   - Update contact form action
   - Add your contact information
   - Update social media links

### Step 2: Replace Images

1. **Profile/Hero Images**:
   - Replace `images/intro-bg.jpg` with your photo
   - Update `images/intro-bg@2x.jpg` (high-res version)

2. **Logo**:
   - Replace `images/logo.svg` with your logo
   - Update favicon files in root directory

3. **Client Logos** (if applicable):
   - Replace files in `images/clients/` folder
   - Update references in HTML files

### Step 3: Update Content Sections

1. **Services/Expertise (index.html, lines 230-280)**:
   ```html
   <h3 class="list-items__item-title">Your Service</h3>
   <p>Your service description...</p>
   ```

2. **Testimonials (index.html, lines 390-445)**:
   - Replace with real client testimonials
   - Update client names and companies
   - Replace avatar images

3. **Blog Posts (index.html, lines 498-557)**:
   - Add your actual blog posts
   - Update links to point to your content

### Step 4: Styling Customization

1. **Colors**: Edit `css/styles.css`
   ```css
   :root {
     --color-primary: #your-color;
     --color-secondary: #your-color;
   }
   ```

2. **Fonts**: Update font imports in HTML head
   ```html
   <link href="https://fonts.googleapis.com/css2?family=YourFont" rel="stylesheet">
   ```

3. **Layout**: Modify CSS classes as needed

### Step 5: JavaScript Functionality

1. **Contact Form**: Update form handling in `js/main.js`
2. **Animations**: Customize scroll animations and transitions
3. **Analytics**: Add Google Analytics or other tracking

## 🔧 Advanced Customization

### Adding New Pages

1. Copy `generic.html` as a template
2. Update navigation links in all HTML files
3. Add appropriate CSS styling

### SEO Optimization

1. **Meta Tags**: Update in each HTML file
   ```html
   <meta name="description" content="Your description">
   <meta name="keywords" content="your, keywords">
   ```

2. **Open Graph Tags**:
   ```html
   <meta property="og:title" content="Your Name - Portfolio">
   <meta property="og:description" content="Your description">
   <meta property="og:image" content="path/to/your/image.jpg">
   ```

### Performance Optimization

1. **Image Optimization**:
   - Compress images using tools like TinyPNG
   - Use WebP format for better compression
   - Implement lazy loading for images

2. **CSS/JS Minification**:
   - Minify CSS and JavaScript files for production
   - Combine multiple CSS/JS files

### Adding a Blog System

1. **Static Blog**: Use Jekyll or Hugo for static site generation
2. **Headless CMS**: Integrate with Contentful or Strapi
3. **Simple Blog**: Create individual HTML files for each post

## 🌐 Deployment Options

### GitHub Pages (Free)

1. Go to repository Settings
2. Navigate to Pages section
3. Select source branch (main)
4. Your site will be available at `https://username.github.io/my-portfolio`

### Netlify (Free tier available)

1. Connect your GitHub repository
2. Set build command: `echo "Static site"`
3. Set publish directory: `/`
4. Deploy automatically on git push

### Vercel (Free tier available)

1. Import your GitHub repository
2. Configure as static site
3. Deploy with automatic deployments

### Traditional Hosting

1. Upload files via FTP to your web host
2. Ensure all file paths are correct
3. Test all functionality

## 🐛 Common Issues and Solutions

### Images Not Loading
- Check file paths are correct
- Ensure images are in the correct directory
- Verify image file extensions match HTML references

### CSS Not Applied
- Check CSS file paths in HTML head
- Verify CSS syntax is correct
- Clear browser cache

### JavaScript Not Working
- Check browser console for errors
- Verify JavaScript file paths
- Ensure jQuery is loaded before custom scripts

### Mobile Responsiveness
- Test on various screen sizes
- Use browser developer tools
- Adjust CSS media queries as needed

## 📱 Testing Checklist

- [ ] Test on desktop browsers (Chrome, Firefox, Safari, Edge)
- [ ] Test on mobile devices (iOS Safari, Android Chrome)
- [ ] Test all navigation links
- [ ] Test contact form functionality
- [ ] Verify all images load correctly
- [ ] Check page load speed
- [ ] Validate HTML and CSS
- [ ] Test accessibility features

## 🔄 Maintenance

### Regular Updates
- Keep content fresh and up-to-date
- Add new projects and achievements
- Update contact information as needed
- Monitor and fix broken links

### Security
- Keep any dependencies updated
- Use HTTPS for production sites
- Regularly backup your code

### Analytics
- Monitor site traffic and user behavior
- Track conversion goals (contact form submissions)
- Optimize based on user data

---

Need help? Check the main README.md or create an issue in the repository!
