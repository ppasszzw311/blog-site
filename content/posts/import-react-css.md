---
date: 2024-01-04
draft: flase
title: "在React中引入Css的方式"
tags: ["技術", "React", "Css"]
---

> 紀錄自己在開發react時遇到的問題

在在react中的樣式(style)許多種呈現的方式，目前有用到的方式
## 1. import css
在react中引入css檔案，並且透過class的方式，讓節點可以吃到樣式。

```css
.button-search {
    padding: 0.6rem 1.3rem;
    background-color: bg-primary
}
```
實際的使用
```jsx
import "./button.css"
​
const SearchBtn = (props) => {
    return (
        <button className="button-search" ...props>{props.children}</button> 
    )
}
```

## 2. 使用CSS Modules引入
跟上面的方式主要的不同，是透過module的方式來引入css，可解決
1. 確保單個組件（元件）的所有樣式集中在同一個地方
2. 確保元件樣式只應用於該組件，他會在原有的class名稱加入雜湊值，成為獨一無二的樣式。
3. 解決 CSS 全局作用域的問題

實際的做法: 先新增一個 **<styleName>.module.css**的檔案，在裡面加入如
```css
.buttonSearch {
    padding: 0.6rem 1.3rem;
    background-color: bg-primary;
}
```

命名可以使用這種駝峰式的樣式寫法，在引用的時候會比較方便。實際的引入－(如果是使用類似"button-search"的寫法，在使用的時候就需要以 **classes["button-search"]**的方式來寫)
```jsx
import classes from "./button.module.css"
​
const SearchBtn = (props) => {
    return (
        <button className={classes.buttonSearch} ...props>{props.children}</button> 
    )
}
```

> 參考來源:https://molly1024.medium.com/css-modules-%E6%98%AF%E4%BB%80%E9%BA%BC-%E7%82%BA%E4%BB%80%E9%BA%BC%E6%88%91%E8%A6%81%E6%94%B9%E7%94%A8-css-modules-what-is-css-modules-why-should-you-use-it-aeb7d2955c58
或者是結合其他類型的使用，如bootstrap，可另外建立一個變數中，將要引入的樣式class(如bootstrap)，將這個樣式應用在要套用的元件也有相同的效果。

```jsx
import classes from "./button.module.css"
import "bootstrap/dist/bootstrap.css";
​
const SearchBtn = (props) => {
    const btnClass = `btn ${classes.buttonSearch}`
    return (
        <button className={btnClass} ...props>{props.children}</button> 
    )
}
```

## 3. 使用styled components
在介紹react的元件的時候有提到，有一種元件是沒有狀態的，只有提供樣式，這概念很接近styled component則是其進一步的擴展
安裝，請確定有安裝以下套件
```cmd
npm install styled-components
```

> 官方網站說明:https://styled-components.com/docs/basics
前端框架（一）–Styled Component https://hackmd.io/@gBsS-IZnRwict4gxZ0zLhg/SJ9Dfdfcv
使用方式是創建一個裝載樣式的元件，以styled後面加上要寫入的html tag如
```jsx
import styled from "styled-components";
​
// 建立一個按鈕的樣式元件
const Btn = styled.button`
   padding: 0.6rem 1.3rem;
   border: 1px solid black;
   border-radius: 3px;
`;
​
// 可以引用原本的元件，透過props的屬性，做不同樣式的判斷
const SearchBtn = styled(Btn)`
   color: pink;
   background: ${props => porps.primary ? "palevioletred" : "white"}
`
​
const Content = styled.div`
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 3rem;
   width: 100vw;
   height: 300px;
`
​
const Main = () => {
    return (
        <>
        <Btn>基礎的按鈕</Btn>
        <SearchBtn primary />
        <Content>
            <h1>Hello world</h1>
        </Content>
        </>
    )
}​​
```

還有一種，如使用taiwindCSS做原子元件的做法，目前還沒有用過...