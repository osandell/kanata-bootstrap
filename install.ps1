# Kanata Bootstrap Installation Script
# Run with: iwr -useb https://raw.githubusercontent.com/osandell/kanata-bootstrap/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

# Define paths
$installDir = "$env:LOCALAPPDATA\Kanata"
$exePath = "$installDir\kanata.exe"
$configPath = "$installDir\kanata.kbd"

# Create directory if it doesn't exist
New-Item -ItemType Directory -Force -Path $installDir | Out-Null

# Download kanata.exe
Write-Host "Downloading kanata.exe..."
Invoke-WebRequest -Uri "https://github.com/osandell/kanata-bootstrap/raw/main/kanata.exe" -OutFile $exePath

# Download kanata.kbd config
Write-Host "Downloading kanata.kbd config..."
Invoke-WebRequest -Uri "https://github.com/osandell/kanata-bootstrap/raw/main/kanata-windows.kbd" -OutFile $configPath

# Start Kanata
Write-Host "Starting Kanata..."
Start-Process -FilePath $exePath -ArgumentList $configPath -NoNewWindow

Write-Host "Kanata installed and started successfully!"
Write-Host "Installation directory: $installDir"
