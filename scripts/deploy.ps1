param(
  [switch]$Install
)

$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

Write-Host "▶ Installing dependencies..."
npm install

Write-Host "▶ Building production bundle..."
npm run build

Write-Host "▶ Zipping dist/ for upload..."
if (Test-Path dist_upload.zip) { Remove-Item dist_upload.zip -Force }
Compress-Archive -Path dist/* -DestinationPath dist_upload.zip -Force

Write-Host "✅ Done. Upload dist_upload.zip to your CPANEL public_html (extract there)."
