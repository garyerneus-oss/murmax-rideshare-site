@echo off
setlocal enabledelayedexpansion

REM Navigate to project root
cd /d "%~dp0.."

echo ▶ Installing dependencies...
call npm install || goto :error

echo ▶ Building production bundle...
call npm run build || goto :error

echo ▶ Zipping dist/ for upload...
powershell -NoProfile -Command "Compress-Archive -Path dist\* -DestinationPath dist_upload.zip -Force" || goto :error

echo ✅ Done. Upload dist_upload.zip to your CPANEL public_html (extract there).
goto :eof

:error
echo ❌ Deployment script failed.
exit /b 1
