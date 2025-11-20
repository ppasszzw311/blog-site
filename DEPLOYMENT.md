# GitHub Pages 部署指南

本指南將協助你將 Hugo 部落格部署到 GitHub Pages。

## 📋 前置準備

1. ✅ GitHub 帳號
2. ✅ Git 已安裝
3. ✅ Hugo 部落格已建立

## 🚀 部署步驟

### 步驟 1: 建立 GitHub Repository

1. 前往 [GitHub](https://github.com/)
2. 點擊右上角的 "+" > "New repository"
3. 填寫 repository 資訊:
   - **Repository name**: 例如 `my-blog` (可以是任何名稱)
   - **Description**: 部落格描述 (可選)
   - **Public**: 選擇 Public (GitHub Pages 免費版需要公開)
   - **不要** 勾選 "Initialize this repository with a README"

### 步驟 2: 更新 hugo.toml

編輯 `hugo.toml`,修改 `baseURL`:

```toml
baseURL = 'https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/'
```

例如:
- Username: `john`
- Repo name: `my-blog`
- baseURL: `https://john.github.io/my-blog/`

**特殊情況**: 如果你的 repository 名稱是 `YOUR_USERNAME.github.io`,則:
```toml
baseURL = 'https://YOUR_USERNAME.github.io/'
```

### 步驟 3: 初始化 Git 並推送

在你的部落格目錄中執行:

```bash
# 如果還沒初始化 git
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Hugo blog setup"

# 設定主分支名稱為 main
git branch -M main

# 添加遠端 repository (替換成你的資訊)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# 推送到 GitHub
git push -u origin main
```

### 步驟 4: 設定 GitHub Pages

1. 前往你的 GitHub repository
2. 點擊 **Settings** (設定)
3. 在左側選單中點擊 **Pages**
4. 在 **Source** 區塊:
   - 選擇 **GitHub Actions** (不是 Deploy from a branch)
5. 儲存設定

### 步驟 5: 等待部署完成

1. 前往 repository 的 **Actions** 頁籤
2. 你會看到一個正在執行的 workflow "Deploy Hugo site to GitHub Pages"
3. 等待綠色勾勾出現 (通常需要 1-2 分鐘)
4. 部署完成後,訪問你的網站:
   - `https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/`

## 🔧 設定評論功能 (Giscus)

### 步驟 1: 啟用 Discussions

1. 前往你的 GitHub repository
2. 點擊 **Settings**
3. 向下捲動到 **Features** 區塊
4. 勾選 **Discussions**

### 步驟 2: 安裝 Giscus App

1. 前往 [Giscus App](https://github.com/apps/giscus)
2. 點擊 **Install**
3. 選擇你的 repository

### 步驟 3: 配置 Giscus

1. 前往 [Giscus 網站](https://giscus.app/zh-TW)
2. 填寫你的 repository: `YOUR_USERNAME/YOUR_REPO_NAME`
3. 選擇 Discussion 分類 (建議選擇 "Announcements")
4. 選擇其他偏好設定
5. 複製生成的配置資訊

### 步驟 4: 更新 hugo.toml

在 `hugo.toml` 的 `[params]` 區塊中添加:

```toml
[params.giscus]
  enable = true
  repo = "YOUR_USERNAME/YOUR_REPO_NAME"
  repoId = "YOUR_REPO_ID"  # 從 Giscus 網站獲取
  category = "Announcements"
  categoryId = "YOUR_CATEGORY_ID"  # 從 Giscus 網站獲取
```

### 步驟 5: 推送更新

```bash
git add hugo.toml
git commit -m "Enable Giscus comments"
git push
```

等待 GitHub Actions 重新部署,評論功能就會啟用!

## 📝 日常使用流程

### 建立新文章

```bash
# 建立新文章
hugo new posts/my-new-article.md

# 編輯文章
# 使用你喜歡的編輯器編輯 content/posts/my-new-article.md

# 本地預覽
hugo server -D

# 訪問 http://localhost:1313 查看效果
```

### 發布文章

1. 確認文章的 `draft: false`
2. 提交並推送:

```bash
git add .
git commit -m "Add new post: my-new-article"
git push
```

3. GitHub Actions 會自動部署,約 1-2 分鐘後文章就會上線!

## 🎨 自訂網站

### 修改網站標題和描述

編輯 `hugo.toml`:

```toml
title = '你的部落格名稱'

[params]
  description = "你的部落格描述"
  author = "你的名字"
```

### 修改首頁歡迎訊息

編輯 `hugo.toml`:

```toml
[params]
  homeInfoParams.Title = "歡迎來到我的部落格 👋"
  homeInfoParams.Content = "這裡分享我的想法和經驗"
```

### 添加社交連結

在 `hugo.toml` 中添加:

```toml
[[params.socialIcons]]
  name = "github"
  url = "https://github.com/YOUR_USERNAME"

[[params.socialIcons]]
  name = "twitter"
  url = "https://twitter.com/YOUR_USERNAME"

[[params.socialIcons]]
  name = "email"
  url = "mailto:your.email@example.com"
```

## 🐛 常見問題

### 問題 1: 網站顯示 404

**解決方法**:
- 檢查 `baseURL` 是否正確
- 確認 GitHub Pages 設定為 "GitHub Actions"
- 等待幾分鐘讓 DNS 生效

### 問題 2: 樣式沒有載入

**解決方法**:
- 檢查 `baseURL` 結尾是否有 `/`
- 清除瀏覽器快取

### 問題 3: 主題沒有顯示

**解決方法**:
```bash
git submodule update --init --recursive
```

### 問題 4: 評論沒有顯示

**解決方法**:
- 確認 repository 是公開的
- 確認已啟用 Discussions
- 檢查 Giscus 配置是否正確

## 📚 更多資源

- [Hugo 官方文件](https://gohugo.io/documentation/)
- [GitHub Pages 文件](https://docs.github.com/en/pages)
- [PaperMod 主題文件](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [Giscus 文件](https://giscus.app/)

## 💡 進階技巧

### 使用自訂網域

1. 在 repository 的 `static/` 目錄下建立 `CNAME` 文件
2. 內容為你的網域名稱,例如: `blog.example.com`
3. 在網域提供商設定 DNS CNAME 記錄指向 `YOUR_USERNAME.github.io`

### 啟用 Google Analytics

在 `hugo.toml` 中添加:

```toml
[params]
  googleAnalytics = "G-XXXXXXXXXX"
```

### 添加 RSS 訂閱

Hugo 預設已啟用 RSS,訂閱連結為:
- `https://YOUR_SITE/index.xml`

---

**祝你部落格之旅順利!** 🎉
