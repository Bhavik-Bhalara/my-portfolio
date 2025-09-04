@echo off
setlocal enabledelayedexpansion

echo 🚀 Portfolio Deployment Script
echo ==============================

:menu
echo.
echo Select an option:
echo 1) Start local development server
echo 2) Deploy to GitHub Pages
echo 3) Build for production
echo 4) Open in browser
echo 5) Exit
echo.

set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto start_server
if "%choice%"=="2" goto deploy_github
if "%choice%"=="3" goto build_production
if "%choice%"=="4" goto open_browser
if "%choice%"=="5" goto exit
echo ❌ Invalid option. Please choose 1-5.
goto menu

:start_server
echo 🖥️  Starting local development server...

where node >nul 2>nul
if %errorlevel%==0 (
    echo Using Node.js live-server...
    npx live-server --port=8080 --open=/index.html
    goto end
)

where python >nul 2>nul
if %errorlevel%==0 (
    echo Using Python...
    python -m http.server 8080
    goto end
)

where php >nul 2>nul
if %errorlevel%==0 (
    echo Using PHP...
    php -S localhost:8080
    goto end
)

echo ❌ No suitable server found. Please install Node.js, Python, or PHP.
pause
goto menu

:deploy_github
echo 📦 Deploying to GitHub Pages...

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Git is not installed. Please install Git first.
    pause
    goto menu
)

git rev-parse --git-dir >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Not a git repository. Please run this script from your portfolio directory.
    pause
    goto menu
)

git add .

set /p commit_message="📝 Enter commit message (or press Enter for default): "
if "%commit_message%"=="" set commit_message=Update portfolio content

git commit -m "%commit_message%"
git push origin main

echo ✅ Deployed to GitHub Pages!
echo 🌐 Check your repository settings to enable GitHub Pages if not already done.
pause
goto menu

:build_production
echo 🔨 Building for production...

if exist dist rmdir /s /q dist
mkdir dist

xcopy /e /i /h /y *.html dist\ >nul
xcopy /e /i /h /y css dist\css\ >nul
xcopy /e /i /h /y js dist\js\ >nul
xcopy /e /i /h /y images dist\images\ >nul
xcopy /e /i /h /y *.png dist\ >nul
xcopy /e /i /h /y *.ico dist\ >nul
xcopy /e /i /h /y *.webmanifest dist\ >nul

echo ✅ Production build created in 'dist' directory
pause
goto menu

:open_browser
echo 🌐 Opening portfolio in browser...
start index.html
goto menu

:exit
echo 👋 Goodbye!
goto end

:end
pause
