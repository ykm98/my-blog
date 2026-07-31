+++
date = '2026-07-28'
draft = false
title = 'Linux 基础命令学习笔记'
tags = ['Linux', '运维', '学习笔记']
categories = ['技术笔记']
+++

## 为什么要学 Linux

作为运维方向的技术人员，Linux 是必须掌握的基础技能。今天开始系统学习 Linux 基础命令。

## 常用文件操作命令

### 1. 查看目录内容

```bash
# 列出当前目录文件
ls

# 显示详细信息
ls -la

# 以人类可读格式显示文件大小
ls -lh
```

### 2. 切换目录

```bash
# 切换到 home 目录
cd ~

# 返回上级目录
cd ..

# 返回上次所在目录
cd -
```

### 3. 创建和删除

```bash
# 创建目录
mkdir myproject

# 创建多级目录
mkdir -p a/b/c

# 删除空目录
rmdir myproject

# 删除文件
rm filename.txt

# 递归删除目录（慎用！）
rm -rf myproject
```

## 文件查看命令

```bash
# 查看文件内容
cat file.txt

# 分页查看
less file.txt

# 查看前 10 行
head file.txt

# 查看后 10 行
tail file.txt

# 实时查看日志
tail -f /var/log/syslog
```

## 学习心得

刚开始学 Linux 命令确实会觉得多，但其实常用的也就几十个。我的学习方法是：

1. **先掌握最常用的 20 个命令**
2. **在实际项目中练习**，而不是死记硬背
3. **遇到不会的就查**，用 `man` 命令或搜索引擎
4. **做好笔记**，把常用的命令记录下来

## 下一步计划

接下来要学习：
- 文件权限管理（chmod、chown）
- 用户管理
- 进程管理
- 网络配置

---

> 学习是一个持续的过程，不要着急，每天进步一点点就好。
