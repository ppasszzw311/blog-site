---
title: "Hugo 靜態網站生成器入門指南"
date: 2025-11-20T16:00:00+08:00
draft: false
tags: ["Hugo", "靜態網站", "教學", "Web開發"]
categories: ["技術"]
author: "Your Name"
description: "學習如何使用 Hugo 建立快速、現代化的靜態網站"
---

## 什麼是 Hugo?

**Hugo** 是世界上最快的靜態網站生成器之一,使用 Go 語言編寫。它可以在幾毫秒內生成數千個頁面。

### 為什麼選擇 Hugo?

1. **極快的速度** ⚡
   - 建置速度比其他靜態網站生成器快 10-100 倍
   - 即時預覽,修改後立即看到效果

2. **零依賴** 📦
   - 單一二進制文件,無需安裝 Node.js、Python 等
   - 跨平台支援 (Windows, macOS, Linux)

3. **強大的內容管理** 📚
   - 支援多種內容類型
   - 靈活的分類法 (標籤、分類、系列等)
   - Front Matter 支援 YAML, TOML, JSON

4. **豐富的主題生態** 🎨
   - 數百個免費主題可選
   - 易於自訂和擴展

### 基本使用

#### 建立新網站

```bash
hugo new site my-blog
cd my-blog
```

#### 添加主題

```bash
git init
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```

#### 建立新文章

```bash
hugo new posts/my-first-post.md
```

#### 本地預覽

```bash
hugo server -D
```

訪問 `http://localhost:1313` 即可看到你的網站!

### Front Matter 範例

每篇文章開頭的 YAML 區塊稱為 Front Matter:

```yaml
---
title: "文章標題"
date: 2025-11-20T16:00:00+08:00
draft: false
tags: ["標籤1", "標籤2"]
categories: ["分類"]
description: "文章描述"
---
```

### 常用的 Markdown 語法

#### 標題

```markdown
# H1 標題
## H2 標題
### H3 標題
```

#### 列表

**無序列表:**
- 項目 1
- 項目 2
  - 子項目 2.1
  - 子項目 2.2

**有序列表:**
1. 第一項
2. 第二項
3. 第三項

#### 連結和圖片

```markdown
[連結文字](https://example.com)
![圖片替代文字](image.jpg)
```

#### 引用

> 這是一段引用文字。
> 可以跨越多行。

#### 表格

| 功能 | Hugo | Jekyll | Hexo |
|------|------|--------|------|
| 速度 | ⚡⚡⚡ | ⚡ | ⚡⚡ |
| 易用性 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| 主題 | 豐富 | 豐富 | 豐富 |

### 進階功能

#### Shortcodes

Hugo 提供了許多內建的 shortcodes:

{{< youtube dQw4w9WgXcQ >}}

#### 自訂 CSS

在 `assets/css/extended/` 目錄下建立自訂 CSS 文件。

#### 多語言支援

Hugo 原生支援多語言網站,只需在配置文件中設定即可。

### 部署到 GitHub Pages

1. 建立 GitHub repository
2. 設定 GitHub Actions workflow
3. 推送程式碼
4. 自動部署完成!

### 結論

Hugo 是建立部落格、文件網站、作品集等的絕佳選擇。它快速、靈活且易於使用。

**開始你的 Hugo 之旅吧!** 🚀

---

*有問題嗎?歡迎在下方留言討論!*
