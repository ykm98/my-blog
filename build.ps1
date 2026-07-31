# 生产环境构建脚本
# 用法:
#   .\build.ps1                                          # 本地构建
#   .\build.ps1 -BaseURL "https://你的域名.vercel.app/"   # 指定线上地址

param(
    [string]$BaseURL = "http://localhost:1313/"
)

$blogDir = Join-Path $PSScriptRoot "my-blog"

Write-Host "正在构建 Hugo 站点..." -ForegroundColor Cyan
Write-Host "baseURL: $BaseURL" -ForegroundColor Gray

Push-Location $blogDir
hugo --gc --minify --baseURL $BaseURL
$exitCode = $LASTEXITCODE
Pop-Location

if ($exitCode -eq 0) {
    Write-Host "构建成功! 输出目录: my-blog/public/" -ForegroundColor Green
} else {
    Write-Error "构建失败"
}

exit $exitCode
