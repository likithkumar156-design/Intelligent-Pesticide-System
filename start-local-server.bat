@echo off
echo.
echo ========================================
echo   Intelligent Pesticide System Website
echo ========================================
echo.
echo Starting local web server...
echo Your website will open in your default browser
echo.
echo Press Ctrl+C to stop the server
echo.

cd /d "%~dp0"

:: Try Python 3 first
python -c "import http.server; http.server.test(HandlerClass=http.server.SimpleHTTPRequestHandler, port=8000)" 2>nul
if %errorlevel%==0 goto :end

:: Try Python 2 fallback
python -m SimpleHTTPServer 8000 2>nul
if %errorlevel%==0 goto :end

:: Try PHP if available
php -S localhost:8000 2>nul
if %errorlevel%==0 goto :end

:: Try Node.js if available
node -e "require('http').createServer((req,res)=>{require('fs').createReadStream('./index.html').pipe(res)}).listen(8000)" 2>nul
if %errorlevel%==0 goto :end

echo.
echo ERROR: No web server available!
echo Please install Python, PHP, or Node.js to run local server.
echo.
echo Alternative: Double-click index.html to open in browser
echo.
pause

:end
echo.
echo Server stopped.
pause