#!/bin/bash

# Portfolio Deployment Script
# This script helps deploy your portfolio to various hosting services

echo "🚀 Portfolio Deployment Script"
echo "=============================="

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to deploy to GitHub Pages
deploy_github_pages() {
    echo "📦 Deploying to GitHub Pages..."
    
    if ! command_exists git; then
        echo "❌ Git is not installed. Please install Git first."
        exit 1
    fi
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "❌ Not a git repository. Please run this script from your portfolio directory."
        exit 1
    fi
    
    # Add all changes
    git add .
    
    # Commit changes
    echo "📝 Enter commit message (or press Enter for default):"
    read -r commit_message
    if [ -z "$commit_message" ]; then
        commit_message="Update portfolio content"
    fi
    
    git commit -m "$commit_message"
    
    # Push to main branch
    git push origin main
    
    echo "✅ Deployed to GitHub Pages!"
    echo "🌐 Your site will be available at: https://$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^/]*\)\/\([^.]*\).*/\1.github.io\/\2/')"
}

# Function to build for production
build_production() {
    echo "🔨 Building for production..."
    
    # Create dist directory
    mkdir -p dist
    
    # Copy all files except development files
    rsync -av --exclude='node_modules' --exclude='.git' --exclude='dist' --exclude='*.sh' --exclude='DEVELOPMENT.md' . dist/
    
    echo "✅ Production build created in 'dist' directory"
}

# Function to start local development server
start_dev_server() {
    echo "🖥️  Starting local development server..."
    
    if command_exists npx; then
        echo "Using live-server..."
        npx live-server --port=8080 --open=/index.html
    elif command_exists python3; then
        echo "Using Python 3..."
        python3 -m http.server 8080
    elif command_exists python; then
        echo "Using Python..."
        python -m http.server 8080
    elif command_exists php; then
        echo "Using PHP..."
        php -S localhost:8080
    else
        echo "❌ No suitable server found. Please install Node.js, Python, or PHP."
        exit 1
    fi
}

# Function to optimize images
optimize_images() {
    echo "🖼️  Optimizing images..."
    
    if ! command_exists imageoptim; then
        echo "⚠️  ImageOptim not found. Please install it for image optimization."
        echo "   macOS: brew install imageoptim-cli"
        echo "   Or use online tools like TinyPNG"
        return 1
    fi
    
    find images -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) -exec imageoptim {} \;
    echo "✅ Images optimized!"
}

# Function to validate HTML
validate_html() {
    echo "🔍 Validating HTML..."
    
    if ! command_exists tidy; then
        echo "⚠️  HTML Tidy not found. Skipping HTML validation."
        echo "   Install with: brew install tidy-html5 (macOS) or apt-get install tidy (Ubuntu)"
        return 1
    fi
    
    for file in *.html; do
        echo "Checking $file..."
        tidy -q -e "$file" || echo "⚠️  Issues found in $file"
    done
    
    echo "✅ HTML validation complete!"
}

# Main menu
echo ""
echo "Select an option:"
echo "1) Start local development server"
echo "2) Deploy to GitHub Pages"
echo "3) Build for production"
echo "4) Optimize images"
echo "5) Validate HTML"
echo "6) Exit"
echo ""

read -p "Enter your choice (1-6): " choice

case $choice in
    1)
        start_dev_server
        ;;
    2)
        deploy_github_pages
        ;;
    3)
        build_production
        ;;
    4)
        optimize_images
        ;;
    5)
        validate_html
        ;;
    6)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid option. Please choose 1-6."
        exit 1
        ;;
esac
