+++
date = '2026-07-25'
draft = false
title = 'Docker 入门：我的第一个容器'
tags = ['Docker', '容器', '运维']
categories = ['技术笔记']
+++

## 什么是 Docker

简单来说，Docker 就是一个"打包工具"。它可以把你的应用和所有依赖打包在一起，放到任何机器上都能直接运行，再也不用担心"在我电脑上能跑啊"的问题。

## 安装 Docker

我使用的是 Ubuntu 系统，安装命令：

```bash
# 更新包索引
sudo apt update

# 安装 Docker
sudo apt install docker.io

# 启动 Docker 服务
sudo systemctl start docker

# 设置开机自启
sudo systemctl enable docker
```

## 第一个 Docker 命令

```bash
# 查看 Docker 版本
docker --version

# 运行第一个容器
docker run hello-world
```

当你看到 `Hello from Docker!` 的时候，就说明安装成功了。

## 常用 Docker 命令

```bash
# 查看正在运行的容器
docker ps

# 查看所有容器（包括已停止的）
docker ps -a

# 停止容器
docker stop <容器ID>

# 删除容器
docker rm <容器ID>

# 查看本地镜像
docker images

# 拉取镜像
docker pull <镜像名>
```

## 我的第一个自定义容器

创建一个简单的 Nginx 服务器：

```bash
# 拉取 Nginx 镜像
docker pull nginx

# 运行 Nginx 容器
docker run -d -p 8080:80 --name my-nginx nginx
```

现在访问 `http://localhost:8080` 就能看到 Nginx 的欢迎页面了！

## 遇到的问题

1. **权限问题**：每次都要 sudo，很麻烦
   - 解决：把当前用户加入 docker 组
   ```bash
   sudo usermod -aG docker $USER
   ```

2. **容器启动失败**：端口被占用
   - 解决：换个端口或者停止占用的服务

## 下一步

- 学习 Dockerfile 编写
- 学习 Docker Compose
- 部署一个实际应用

---

> 容器技术是现代运维的必备技能，继续加油！
