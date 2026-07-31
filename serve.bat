@echo off
REM 从仓库根目录启动 Hugo 开发服务器
powershell -ExecutionPolicy Bypass -File "%~dp0serve.ps1" %*
