# Kieran 的个人博客

基于 [Hugo](https://gohugo.io/) + [PaperMod](https://github.com/adityatelange/hugo-PaperMod) 主题，站点源码在 `my-blog/` 目录。

## 快速开始

### 本地预览（推荐）

```powershell
.\serve.ps1
```

浏览器打开：**http://localhost:1313/**

> **重要：** 请勿访问 `your-blog.vercel.app`，那是模板占位地址，指向的是别人的网站（Arif's Blog），不是你的博客。

### 生产构建

```powershell
# 部署到 Vercel 前，换成你的真实域名
.\build.ps1 -BaseURL "https://你的项目名.vercel.app/"
```

## 常见问题

### 刷新后变成 "Arif's Blog" / "Failed to fetch"

**原因：** 之前 `hugo.toml` 里的 `baseURL` 写成了 `https://your-blog.vercel.app/`（占位符），这个地址上是别人的 React 项目，不是你的 Hugo 博客。点击导航或访问该地址就会跳错站。

**已修复：**
- 本地 `baseURL` 改为 `http://localhost:1313/`
- `serve.ps1` 强制使用本地地址
- 新增 `vercel.json`，部署到你自己的 Vercel 项目时会自动使用正确域名

### 正确访问方式

| 场景 | 地址 |
|------|------|
| 本地开发 | http://localhost:1313/ |
| 线上（需自行部署） | 你在 Vercel 创建项目后获得的域名 |

## 部署到 Vercel

1. 将代码推送到 GitHub（`ykm98/my-blog`）
2. 在 [Vercel](https://vercel.com) 导入该仓库
3. 根目录保持默认，会使用根目录的 `vercel.json` 自动构建
4. 部署完成后使用 **Vercel 分配给你的域名** 访问，不要用 `your-blog.vercel.app`

## 项目结构

```
blog/
├── my-blog/              # Hugo 站点
│   ├── content/          # 文章与页面
│   ├── assets/css/       # 毛玻璃主题样式
│   ├── static/           # 头像等静态资源
│   └── hugo.toml         # 站点配置
├── serve.ps1             # 本地开发
├── build.ps1             # 生产构建
└── vercel.json           # Vercel 部署配置
```

## 自定义样式

毛玻璃主题：`my-blog/assets/css/extended/glassmorphism.css`
