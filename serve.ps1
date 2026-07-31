# 从仓库根目录启动 Hugo 开发服务器
# 用法: .\serve.ps1  或  .\serve.ps1 -Port 1313

param(
    [int]$Port = 1313
)

$blogDir = Join-Path $PSScriptRoot "my-blog"
$baseURL = "http://localhost:$Port/"

if (-not (Test-Path (Join-Path $blogDir "hugo.toml"))) {
    Write-Error "找不到 Hugo 配置文件: $blogDir\hugo.toml"
    exit 1
}

# 释放端口上旧的 hugo 进程，避免连接到错误站点
$existing = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
if ($existing) {
    $procId = $existing.OwningProcess | Select-Object -First 1
    $proc = Get-Process -Id $procId -ErrorAction SilentlyContinue
    if ($proc -and $proc.ProcessName -eq "hugo") {
        Write-Host "正在重启端口 $Port 上的 Hugo 服务..." -ForegroundColor Yellow
        Stop-Process -Id $procId -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1
    }
}

Write-Host ""
Write-Host "  Kieran 的小天地 — 本地预览" -ForegroundColor Cyan
Write-Host "  站点目录: $blogDir" -ForegroundColor Gray
Write-Host "  访问地址: $baseURL" -ForegroundColor Green
Write-Host ""
Write-Host "  注意: 请勿访问 your-blog.vercel.app（那是别人的网站）" -ForegroundColor Yellow
Write-Host "  按 Ctrl+C 停止服务器" -ForegroundColor Gray
Write-Host ""

hugo server -s $blogDir -D --port $Port --baseURL $baseURL --appendPort=false
