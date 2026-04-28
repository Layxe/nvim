# ============================
# Dev tools bootstrap script
# ============================

function Command-Exists {
    param ($cmd)
    return $null -ne (Get-Command $cmd -ErrorAction SilentlyContinue)
}

Write-Host "Starting setup..." -ForegroundColor Cyan

# ----------------------------
# Ensure winget exists
# ----------------------------
if (-not (Command-Exists "winget")) {
    Write-Host "winget not found. Please install App Installer from Microsoft Store." -ForegroundColor Red
    exit 1
}

# ----------------------------
# Install Node.js (includes npm)
# ----------------------------
if (-not (Command-Exists "node")) {
    Write-Host "Installing Node.js..." -ForegroundColor Yellow
    winget install -e --id OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements
} else {
    Write-Host "Node.js already installed"
}

# Refresh PATH for current session
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("PATH","User")

# ----------------------------
# Install tree-sitter CLI via npm
# ----------------------------
if (-not (Command-Exists "tree-sitter")) {
    if (Command-Exists "npm") {
        Write-Host "Installing tree-sitter CLI..." -ForegroundColor Yellow
        npm install -g tree-sitter-cli
    } else {
        Write-Host "npm not found. Skipping tree-sitter." -ForegroundColor Red
    }
} else {
    Write-Host "tree-sitter already installed"
}

# ----------------------------
# Install fzf
# ----------------------------
if (-not (Command-Exists "fzf")) {
    Write-Host "Installing fzf..." -ForegroundColor Yellow
    winget install -e --id junegunn.fzf --accept-package-agreements --accept-source-agreements
} else {
    Write-Host "fzf already installed"
}

# ----------------------------
# Install ripgrep
# ----------------------------
if (-not (Command-Exists "rg")) {
    Write-Host "Installing ripgrep..." -ForegroundColor Yellow
    winget install -e --id BurntSushi.ripgrep.MSVC --accept-package-agreements --accept-source-agreements
} else {
    Write-Host "ripgrep already installed"
}

Write-Host "`nReloading PATH..." -ForegroundColor Cyan
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("PATH","User")

# ----------------------------
# Verify installs
# ----------------------------
Write-Host "`nVerifying installations..." -ForegroundColor Cyan

node -v
npm -v
tree-sitter --version
fzf --version
rg --version

Write-Host "`nSetup complete!" -ForegroundColor Green