---
title: "Style-components進入維護階段"
date: 2024-04-28
draft: false
tags: ["styled-components", "react", "css-in-js"]
---

# Styled Components News

在近幾年的熱門的樣式解決方案 - Style-components於本月中宣布未來將進入微乎階段(連結)，象徵著在目前的開發生態系，逐漸轉換的一個過程

其中https://fullystacked.net/css-in-js-still-a-thing/這篇文章，主要討論的部份便是如Style-components這樣的Css-In-Js所遇到的難題。
另外一篇在2022年Dcard分享的文章https://medium.com/dcardlab/%E7%82%BA%E4%BB%80%E9%BA%BC%E6%88%91%E5%80%91%E6%B1%BA%E5%AE%9A%E6%94%BE%E6%A3%84-styled-components-%E4%B8%A6%E9%81%B8%E6%93%87-linaria-5c09df5eb7bf
以下對於目前幾種不同主流的在開發時所應用的css管理方法進行分享
CSS的演進：比較傳統與現代方法
在不斷發展的網頁開發領域中，CSS已經歷了重大的變革。從簡單樣式表的早期到我們今天看到的複雜方法，我們設計應用程式的方式持續適應著日益增長的複雜性和不斷變化的開發者需求。本文探討四種主要的CSS方法—傳統CSS、CSS-in-JS、CSS Modules和Atomic CSS—分析它們的優勢、劣勢和理想使用場景。
傳統CSS：基礎
傳統CSS涉及在.css文件中編寫樣式，然後通過<link>標籤或@import語句將它們導入HTML。這種方法數十年來一直是網頁樣式設計的基石，而且理由充分。
傳統CSS以其簡單性脫穎而出。無需額外的庫或構建工具—只需編寫樣式並應用它們。對於剛開始學習的開發者來說，相較於更現代的方法，學習曲線相對平緩。此外，瀏覽器支持是普遍的，消除了兼容性問題。
然而，隨著應用程序複雜度的增加，傳統CSS開始顯露其局限性。全局命名空間意味著樣式容易衝突，而層疊特性雖然強大，但可能導致意外覆蓋。在大型團隊中，追蹤樣式來源變得越來越困難，而且樣式與組件的分離可能會造成維護挑戰。
CSS-in-JS：統一邏輯和樣式
像Styled Components和Emotion這樣的CSS-in-JS庫代表了我們處理樣式方式的哲學轉變。通過直接將CSS嵌入JavaScript中，這些庫在組件和它們的樣式之間創建了緊密的耦合。
最直接的好處是作用域樣式。每個組件接收自己的獨立CSS，幾乎消除了樣式衝突的風險。這種方法還實現了真正的動態樣式設計—樣式可以直接訪問組件的屬性和狀態，允許複雜的響應行為而無需切換類名。

```javascript
// 使用Styled Components的CSS-in-JS範例
const Button = styled.button`
  background-color: ${props => props.primary ? '#4285f4' : 'white'};
  color: ${props => props.primary ? 'white' : '#4285f4'};
  padding: 8px 16px;
  border-radius: 4px;
  transition: all 0.3s ease;
  
  &:hover {
    opacity: 0.8;
  }
`;
```

主要缺點包括運行時成本（雖然最近的實現已有改進）、由於所需庫而增加的包大小，以及對更習慣於傳統CSS的開發人員可能產生的學習曲線。這種方法也傾向於更加框架特定，可能限制了可移植性。
CSS Modules：尋找中間地帶
CSS Modules在傳統CSS和更現代的方法之間提供了一個折衷方案。你仍然編寫正常的CSS文件，但構建過程會自動將類名作用於特定組件，防止全局衝突。
這種方法允許你保持CSS語法的熟悉性，同時獲得組件化的好處。CSS Modules適用於從傳統方法過渡的團隊，並在保持樣式和邏輯關係的同時創建它們之間的清晰分離。

```javascript
/* Button.module.css */
.button {
  padding: 8px 16px;
  border-radius: 4px;
}

.primary {
  background-color: #4285f4;
  color: white;
}

// 在你的組件中
import styles from './Button.module.css';

function Button({ primary }) {
  return (
    <button className={`${styles.button} ${primary ? styles.primary : ''}`}>
      Click Me
    </button>
  );
}
```

主要限制是對webpack等構建工具的依賴，使CSS Modules不太適合較簡單的項目。它們也無法解決CSS固有的所有問題，比如組件間可能存在的樣式重複。
Atomic CSS：組合優於繼承
像Tailwind CSS這樣的Atomic CSS框架採取了根本不同的方法。它們不是圍繞元素或組件組織樣式，而是提供一套全面的實用類，每個類負責單一的CSS屬性或值。
這種方法產生高度可組合的樣式—你通過組合這些原子類而不是編寫自定義CSS來構建界面。產生的HTML可能看起來更冗長，但CSS負載無論項目大小如何都保持穩定，因為你在整個應用程序中重複使用相同的預定義樣式。
```javascript
<!-- 使用Tailwind的Atomic CSS方法 -->
<button class="bg-blue-500 text-white px-4 py-2 rounded hover:opacity-80 transition-opacity">
  Click Me
</button>
```

Atomic CSS通過將選項限制在預定義系統中來強制設計一致性。掌握後也能加快開發速度，因為開發人員花更少的時間編寫和命名自定義CSS類。
主要批評涉及記憶實用類的學習曲線和可能導致的冗長HTML。批評者也指出關注點分離減少了，因為樣式細節直接存在於你的標記中。
做出正確選擇：情境考量
那麼你應該選擇哪種方法呢？與大多數技術決策一樣，情境非常重要。
項目規模
對於小型項目或原型，傳統CSS或Atomic CSS通常提供最快的結果路徑。隨著應用程序的增長，CSS Modules或CSS-in-JS的結構化方法對維護變得越來越有價值。
團隊經驗
擁有強大CSS背景的團隊可能更喜歡CSS Modules作為向基於組件的樣式設計的平緩過渡。專注於JavaScript的團隊通常傾向於CSS-in-JS，因為它有熟悉的範例。
性能考量
傳統CSS可能導致未使用規則的臃腫樣式表。現代方法通常提供更好的樹搖（tree-shaking）和代碼分割能力，儘管CSS-in-JS可能引入其他方法避免的運行時開銷。
設計系統需求
需要嚴格設計一致性的項目通常從Atomic CSS的受限方法中受益。那些需要高度自定義設計的項目可能在CSS-in-JS或傳統方法中找到更多自由。
混合方法：實際現實
在實踐中，許多團隊採用混合方法，利用多種方法的優勢。例如：

使用傳統CSS進行全局樣式和重置 
採用CSS Modules進行特定於組件的樣式設計 
採用Atomic CSS進行常見UI模式和快速開發 
保留CSS-in-JS用於具有複雜、狀態依賴樣式需求的組件 
這種務實的方法認識到每種方法在現代開發者工具包中都有其位置。
結論
CSS方法的發展反映了網頁應用程序日益增長的複雜性和開發團隊的多樣化需求。傳統CSS繼續作為基礎，而較新的方法則解決了擴展、維護和優化樣式的特定挑戰。
與其將這些方法視為競爭替代品，不如將它們視為開發中的互補工具。了解每種方法的優勢和局限性使你能夠根據特定項目需求、團隊組成和性能目標做出明智決策。
隨著網頁開發的不斷發展，我們的樣式方法也將繼續演進。關鍵是保持適應性，為你面臨的每個獨特樣式挑戰選擇正確的工具。

參考資料
* https://calpa.me/blog/styled-components-maintenance-mode/?fbclid=IwY2xjawJXHP5leHRuA2FlbQIxMAABHQ2IBKTmszYiD124w10xTFCyQRAFsSoHiB18hU8CAZ2GEM7msE8iueRNXw_aem_I2s1sS0ciINGcNbD3_y-mQ