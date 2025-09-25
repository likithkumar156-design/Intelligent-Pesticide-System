# Intelligent Pesticide System - Local Web Server
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Intelligent Pesticide System Website" -ForegroundColor Green  
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

$port = 8000
$url = "http://localhost:$port"

Write-Host "Starting local web server on port $port..." -ForegroundColor Yellow
Write-Host "Your website will be available at: $url" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Red
Write-Host ""

# Set location to script directory
Set-Location $PSScriptRoot

# Try to start browser
try {
    Start-Process $url
    Write-Host "✅ Opening website in your default browser..." -ForegroundColor Green
} catch {
    Write-Host "⚠️ Please manually open: $url" -ForegroundColor Yellow
}

# Start Python HTTP server
try {
    if (Get-Command python -ErrorAction SilentlyContinue) {
        Write-Host "🚀 Starting Python HTTP server..." -ForegroundColor Green
        python -m http.server $port
    } else {
        Write-Host "❌ Python not found!" -ForegroundColor Red
        Write-Host "Alternative: Double-click index.html to open in browser" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
    }
} catch {
    Write-Host "❌ Error starting server: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Alternative: Double-click index.html to open in browser" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
}