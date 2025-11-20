# 我的 Hugo 部落格

這是一個使用 Hugo 建立的現代化靜態部落格,具有全文搜尋、標籤系統和評論功能。

## ✨ 功能特色

- 🔍 **全文搜尋** - 使用 Fuse.js 實現快速的客戶端搜尋
- 🏷️ **標籤系統** - 完整的標籤和分類支援
- 💬 **評論功能** - 整合 Giscus (基於 GitHub Discussions)
- 📝 **Markdown 支援** - 完整的 Markdown 語法和程式碼高亮
- 🌙 **深色模式** - 自動切換深色/淺色主題
- 📱 **響應式設計** - 完美支援各種裝置
- ⚡ **極快速度** - Hugo 提供毫秒級的建置速度
- 🚀 **自動部署** - 推送到 GitHub 自動部署到 GitHub Pages

## 🚀 快速開始

### 前置需求

- [Hugo Extended](https://gohugo.io/installation/) (v0.152.2 或更高版本)
- [Git](https://git-scm.com/)
- GitHub 帳號

### 本地開發

1. **Clone 此專案**

```bash
git clone https://github.com/ppasszzw311/blog-site.git
cd blog-site
```

2. **初始化子模組 (主題)**

```bash
git submodule update --init --recursive
```

3. **啟動本地伺服器**

```bash
hugo server -D
```

4. **訪問網站**

開啟瀏覽器訪問 `http://localhost:1313`

## 📝 建立新文章

使用以下命令建立新文章:

```bash
hugo new posts/my-new-post.md
```

這會在 `content/posts/` 目錄下建立一個新的 Markdown 文件,包含預設的 Front Matter。

### Front Matter 範例

```yaml
---
title: "文章標題"
date: 2025-11-20T16:00:00+08:00
draft: false
tags: ["標籤1", "標籤2"]
categories: ["分類"]
author: "作者名稱"
description: "文章描述"
---
```

## 🔧 配置

### 基本設定

編輯 `hugo.toml` 文件來修改網站設定:

```toml
baseURL = 'https://ppasszzw311.github.io/blog-site/'
languageCode = 'zh-tw'
title = '我的部落格'
```

### 啟用評論功能

1. **前往 [Giscus 網站](https://giscus.app/zh-TW)**

2. **設定你的 repository**
   - 確保 repository 是公開的
   - 啟用 Discussions 功能
   - 安裝 Giscus app

3. **獲取配置資訊**

4. **更新 `hugo.toml`**

在 `hugo.toml` 的 `[params]` 區塊中添加:

```toml
[params.giscus]
  enable = true
  repo = "ppasszzw311/blog-site"
  repoId = "YOUR_REPO_ID"
  category = "Announcements"
  categoryId = "YOUR_CATEGORY_ID"
```

## 🚀 部署到 GitHub Pages

### 方法一: 使用 GitHub Actions (推薦)

1. **建立 GitHub Repository**

2. **推送程式碼**

```bash
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/ppasszzw311/blog-site.git
git push -u origin main
```

3. **設定 GitHub Pages**

   - 前往 repository 的 Settings > Pages
   - Source 選擇 "GitHub Actions"

4. **等待部署完成**

   GitHub Actions 會自動建置並部署你的網站到 `https://ppasszzw311.github.io/blog-site/`

### 方法二: 手動部署

```bash
hugo --gc --minify
# 將 public/ 目錄的內容部署到你的伺服器
```

## 📁 目錄結構

```
blog-site/
├── .github/
│   └── workflows/
│       └── hugo.yml          # GitHub Actions 部署配置
├── archetypes/               # 文章模板
├── content/
│   ├── posts/                # 部落格文章
│   ├── search/               # 搜尋頁面
│   └── archives/             # 歸檔頁面
├── layouts/
│   └── partials/
│       └── comments.html     # 評論系統
├── static/                   # 靜態資源 (圖片、CSS、JS)
├── themes/
│   └── PaperMod/             # 主題 (git submodule)
└── hugo.toml                 # Hugo 配置文件
```

## 🎨 自訂樣式

在 `assets/css/extended/` 目錄下建立自訂 CSS 文件:

```css
/* assets/css/extended/custom.css */
:root {
    --primary-color: #your-color;
}
```

## 📚 使用的技術

- [Hugo](https://gohugo.io/) - 靜態網站生成器
- [PaperMod](https://github.com/adityatelange/hugo-PaperMod) - Hugo 主題
- [Fuse.js](https://fusejs.io/) - 模糊搜尋函式庫
- [Giscus](https://giscus.app/) - 評論系統
- [GitHub Actions](https://github.com/features/actions) - CI/CD
- [GitHub Pages](https://pages.github.com/) - 網站託管

## 📖 更多資源

- [Hugo 官方文件](https://gohugo.io/documentation/)
- [PaperMod 主題文件](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [Markdown 語法指南](https://www.markdownguide.org/)

## 📄 授權

MIT License

## 🤝 貢獻

歡迎提交 Issues 和 Pull Requests!

---

**享受寫作的樂趣!** ✨
