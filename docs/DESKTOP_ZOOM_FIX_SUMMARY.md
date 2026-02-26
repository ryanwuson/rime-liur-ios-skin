# 桌面縮放優化總結

## 問題描述

在桌面瀏覽器縮放到 880px - 769px 寬度範圍時，「工具配置」頁面的「選中工具」區域出現文字被切斷的問題：
- 中文字（如「簡」）被切掉
- Badge 數字被切掉
- 圖標在極窄寬度下也被切掉

但「常用功能」、「編輯功能」、「其他設定」區域顯示正常。

## 根本原因

1. **固定 5 列布局**：`.toolbar-slot-grid` 在所有寬度下都使用 `grid-template-columns: repeat(5, 1fr)`
2. **空間不足**：當容器寬度縮小到 880px 以下時，每個工具卡片的寬度不足以容納中文字
3. **aspect-ratio 限制**：卡片有 `aspect-ratio: 1.2 / 1` 的固定比例，限制了高度調整
4. **overflow: hidden 誤用**：如果在 `.toolbar-slot-card` 上使用 `overflow: hidden`，會切掉使用 `position: absolute` 的 badge

## 解決方案

### 核心策略：分區域優化

在 880px - 769px 範圍內：
- **選中工具區域（`.toolbar-slot-grid`）**：改為 4 列布局
- **常用功能區域（`.tool-cards-grid`）**：保持 5 列布局

### 實施位置

需要在兩個地方添加相同的媒體查詢：

1. **index.html 內聯樣式**（優先級最高）
2. **css/main.css 外部樣式**（作為備份）

### 完整 CSS 代碼

```css
/* 桌面縮放優化：880px - 769px 選中工具改為 4 列 */
@media (max-width: 880px) and (min-width: 769px) {
    .toolbar-grid-container {
        padding: 8px !important;
    }
    
    /* 選中工具：改為 4 列以提供更多空間 */
    .toolbar-slot-grid {
        grid-template-columns: repeat(4, 1fr) !important;
        gap: 8px !important;
    }
    
    /* 常用功能：保持 5 列 */
    .tool-cards-grid {
        grid-template-columns: repeat(5, 1fr) !important;
        gap: 6px !important;
    }
    
    .toolbar-slot-card {
        padding: 6px 4px !important;
    }
    
    .tool-option-card {
        padding: 5px 3px !important;
    }
    
    .slot-badge {
        width: 18px !important;
        height: 18px !important;
        font-size: 10px !important;
        top: -5px !important;
        left: -5px !important;
    }
    
    .toolbar-slot-card .slot-content {
        font-size: 11px !important;
        line-height: 1.2 !important;
        white-space: nowrap !important;
        overflow: hidden !important;
        text-overflow: ellipsis !important;
        max-width: 100% !important;
        padding: 0 3px !important;
    }
    
    .tool-card-label {
        font-size: 9px !important;
        line-height: 1.1 !important;
        white-space: nowrap !important;
        overflow: hidden !important;
        text-overflow: ellipsis !important;
        max-width: 100% !important;
    }
    
    .tool-card-icon {
        font-size: 16px !important;
    }
}
```

## 關鍵技術要點

### 1. 不要在卡片上使用 overflow: hidden

```css
/* ❌ 錯誤：會切掉 badge */
.toolbar-slot-card {
    overflow: hidden !important;
}

/* ✅ 正確：只在內容元素上控制溢出 */
.toolbar-slot-card .slot-content {
    overflow: hidden !important;
    text-overflow: ellipsis !important;
}
```

### 2. 必須明確設置 grid-template-columns

```css
/* ❌ 錯誤：只改 gap 不改列數 */
.toolbar-slot-grid {
    gap: 8px !important;
}

/* ✅ 正確：明確設置列數 */
.toolbar-slot-grid {
    grid-template-columns: repeat(4, 1fr) !important;
    gap: 8px !important;
}
```

### 3. 使用 min-width: 0 允許 Grid 項目縮小

```css
.toolbar-slot-card {
    min-width: 0 !important; /* 允許縮小到比內容更小 */
}
```

### 4. 內容元素需要完整的溢出控制

```css
.slot-content {
    max-width: 100% !important;
    width: 100% !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
    white-space: nowrap !important;
    box-sizing: border-box !important;
}
```

## 為什麼常用功能不需要改為 4 列？

1. **文字較短**：「設定面板」、「收折按鈕」等文字比「簡」字短
2. **有文字標籤**：下方有小字標籤，視覺上更緊湊
3. **圖標為主**：主要依靠圖標識別，文字是輔助

## 測試檢查點

在以下寬度測試「選中工具」區域：
- ✅ 880px：應顯示 4 列，文字完整
- ✅ 850px：應顯示 4 列，文字完整
- ✅ 800px：應顯示 4 列，文字完整
- ✅ 769px：應顯示 4 列，文字完整

確認：
- ✅ Badge 數字不被切掉
- ✅ 中文字（簡、英）完整顯示
- ✅ 圖標不被切掉
- ✅ 常用功能保持 5 列

## 已應用版本

- ✅ docs2/index.html（測試版）
- ✅ docs2/css/main.css（測試版）
- ✅ docs/index.html（主版本）- 完整移植
- ✅ docs/css/main.css（主版本）- 完整移植

## 完整移植內容

### 1. 工具配置優化（880-769px）
- 選中工具改為 4 列布局
- 常用功能保持 5 列布局
- Badge、文字、圖標尺寸優化

### 2. 顏色選擇器優化（1080-769px）
- 1080-769px：中等優化
- 973-769px：加強優化
- 841-769px：激進優化
- 806-769px：最終優化

優化項目：
- 選色框尺寸
- 色碼輸入框寬度和字體
- 透明度拉桿容器和數值顯示
- 標籤文字大小
- 間距和內邊距

### 3. 按鍵布局優化（1011-769px）
- 1011-769px：中等優化
- 841-769px：進一步縮小

優化項目：
- 行卡片間距和內邊距
- 卡片標題字體大小
- 標籤文字大小

### 4. 字體大小控制優化（973-769px）
- size-icon-trigger 尺寸
- size-spacer 寬度（確保對齊）
- SVG 圖標尺寸

## 斷點總覽

| 寬度範圍 | 優化內容 |
|---------|---------|
| 1080-769px | 顏色選擇器基礎優化 |
| 1011-769px | 按鍵布局基礎優化 |
| 973-769px | 顏色選擇器加強 + 字體大小控制 |
| 880-769px | 工具配置改為 4 列 |
| 841-769px | 全面激進優化 |
| 806-769px | 拉桿最終優化 |

## 已應用版本

- ✅ docs2/index.html（測試版）
- ✅ docs2/css/main.css（測試版）
- ✅ docs/index.html（主版本）
- ✅ docs/css/main.css（主版本）

## 經驗教訓

1. **內聯樣式優先級最高**：如果 index.html 中有內聯樣式，外部 CSS 的修改可能不生效
2. **分區域優化**：不同區域的內容特性不同，需要分別優化
3. **避免過度使用 overflow: hidden**：會影響 absolute 定位的元素
4. **Grid 布局需要明確列數**：不能只依賴 gap 和 padding 來解決空間問題
5. **測試實際寬度**：理論計算不如實際測試準確

## 未來優化方向

如果需要支持更窄的寬度（< 769px），可以考慮：
1. 選中工具改為 3 列
2. 常用功能改為 4 列
3. 使用更小的字體和圖標
4. 考慮使用 Container Queries（需要瀏覽器支持）
