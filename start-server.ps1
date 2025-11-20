# Hugo 部落格啟動腳本

Write-Host "正在啟動 Hugo 開發伺服器..." -ForegroundColor Green
Write-Host ""

# 更新環境變數
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 啟動 Hugo 伺服器
hugo server -D

Write-Host ""
Write-Host "伺服器已停止" -ForegroundColor Yellow
