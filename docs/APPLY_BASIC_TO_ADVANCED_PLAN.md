# 套用基礎外觀到進階微調 - 實作計畫

## 功能概述

在進階微調頁面新增「套用基礎外觀設定」按鈕，讓使用者可以將基礎外觀的設定值複製到進階微調中已開啟的鍵盤。

---

## 設計原則

### 1. 單向繼承
- 基礎外觀 → 進階微調（單向）
- 不自動同步，使用者手動觸發
- 可重複套用（每次都會覆蓋當前值）

### 2. 精確控制
- 只套用到**已開啟**的鍵盤（enable 開關為 true）
- 只套用**當前模式**（亮色或暗色分開處理）
- 提供確認提示框，清楚告知套用範圍

### 3. 行為一致性
- 與「還原預設值」按鈕保持一致的操作邏輯
- 亮色模式只影響亮色設定，暗色模式只影響暗色設定

---

## UI 設計

### 按鈕位置
放在進階微調頁面的「亮色模式」/「暗色模式」卡片下方，第一個鍵盤卡片之前。

### 按鈕樣式
- Class: `.btn-apply-blue`
- 基礎樣式：
  - 背景：`#EBF8FF`（淺藍色）
  - 文字：`#3182CE`（藍色）
  - 邊框：`1px solid #BEE3F8`
  - 圓角：`20px`（藥丸形狀）
  - 與 `.btn-reset-small` 相同的尺寸和動畫效果
- Hover 樣式：
  - 背景：`#3182CE`（藍色）
  - 文字：`#FFFFFF`（白色）
  - 向上移動 + 陰影加強

### 按鈕文字
```
套用基礎外觀設定
```

### 提示框設計

#### 情境 1：沒有開啟任何鍵盤
```
⚠️ 沒有開啟任何進階微調鍵盤
請先開啟至少一個鍵盤的進階微調開關
```

#### 情境 2：開啟了部分鍵盤
```
✓ 將套用基礎外觀設定（亮色模式）到以下鍵盤：
• 26 鍵中英文鍵盤
• 數字鍵盤

[確定] [取消]
```

---

## 對應關係

### 全域設定（所有鍵盤）

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].bg` | 所有鍵盤的 `bg` | 鍵盤背景色 |
| `palette[appearance].shadow` | 所有按鍵的 `shadowColor` 和 `shadowHighlight` | 1對多：陰影顏色 |
| `palette[appearance].border` | 所有按鍵的 `borderColor` | 邊框顏色 |
| `palette[appearance].borderSize` | 所有按鍵的 `borderWidth` | 邊框粗細 |
| `palette[appearance].textMain` | 所有按鍵的 `color` | 按鍵文字顏色 |

### 按鍵顏色（所有鍵盤）

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].keyNormal` | 字母鍵/數字鍵的 `bg` | 一般按鍵顏色 |
| `palette[appearance].keyNormalHighlight` | 字母鍵/數字鍵的 `highlight` | 一般按鍵按下顏色 |
| `palette[appearance].keySystem` | 功能鍵的 `bg` | 功能鍵顏色 |
| `palette[appearance].keySystemHighlight` | 功能鍵的 `highlight` | 功能鍵按下顏色 |
| `palette[appearance].keyEnter` | Enter 鍵的 `bg` | Enter 鍵顏色 |
| `palette[appearance].keyEnterHighlight` | Enter 鍵的 `highlight` | Enter 鍵按下顏色 |

### 字體大小（所有鍵盤）

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `groups.alphabetSize` | 字母鍵的 `labelSize` | 大寫英文大小 |
| `groups.lowercaseSize` | 字母鍵的 `lowercaseSize` | 小寫英文大小 |
| `groups.systemSize` | 功能鍵和 Enter 鍵的 `labelSize` | 功能鍵文字大小 |
| `groups.swipeSize` | 字母鍵的 `swipeSize` | 滑動提示文字大小 |
| `palette[appearance].textSub` | 字母鍵的 `swipeColor` | 滑動提示顏色 |

### 26 鍵中英文鍵盤專屬

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `groups.spaceSize` | `space.labelSize` | 空白鍵字體大小 |
| `palette[appearance].keyNormal` | `space.bg` | 空白鍵背景色 |
| `palette[appearance].keyNormalHighlight` | `space.highlight` | 空白鍵按下顏色 |
| `palette[appearance].textMain` | `space.color` | 空白鍵文字顏色 |
| `palette[appearance].candidateSelectedBg` | `candidate.selectedBg` | 候選字選中背景 |
| `palette[appearance].candidateSelectedText` | `candidate.selectedText` | 候選字選中文字 |
| `palette[appearance].candidateUnselectedText` | `candidate.unselectedText` | 候選字常態文字 |
| `palette[appearance].bubbleTextSelected` | `bubble.selectedText` | 氣泡選中文字 |
| `palette[appearance].bubbleTextUnselected` | `bubble.unselectedText` | 氣泡常態文字 |
| `palette[appearance].toolbarColor` | `toolbar.color` | 工具列圖示顏色 |
| `groups.toolbarSize` | `toolbar.size` | 工具列圖示大小 |

### 數字鍵盤專屬

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].numericLeftPanelBg` | `leftPanel.bg` | 左側符號欄背景 |
| `groups.numberSize` | `number.labelSize` | 數字大小 |
| `palette[appearance].toolbarColor` | `toolbar.color` | 工具列圖示顏色 |
| `groups.toolbarSize` | `toolbar.size` | 工具列圖示大小 |

### 符號/Emoji 鍵盤專屬

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].panelLeftBg` | `leftPanel.bg` | 左側分類欄背景 |
| `palette[appearance].panelRightBg` | `rightPanel.bg` | 右側內容區背景 |
| `groups.panelSmallSize` | `leftPanel.labelSize` | 左側分類文字大小 |
| `groups.panelLargeSize` | `rightPanel.labelSize` | 右側符號/Emoji 大小 |

---

## 實作步驟

### 1. CSS 樣式（main.css）
- 新增 `.btn-apply-blue` class
- 與 `.btn-reset-small` 保持一致的尺寸和動畫

### 2. HTML 結構（index.html）
- 在進階微調頁面的「亮色模式」/「暗色模式」卡片後新增按鈕
- 位置：第一個鍵盤卡片（26 鍵中英文鍵盤）之前

### 3. Vue 方法（index.html）
- `applyBasicToAdvanced()`: 主要邏輯函數
  - 檢查已開啟的鍵盤
  - 顯示確認提示框
  - 執行套用邏輯
- `getEnabledKeyboards()`: 取得已開啟的鍵盤列表
- `applyToKeyboard(keyboardType, appearance)`: 套用到單一鍵盤

### 4. 提示框（使用現有 modal 系統）
- 複用現有的 modal-overlay 和 modal-container 樣式
- 動態生成提示內容

---

## 測試檢查清單

### 功能測試
- [ ] 沒有開啟任何鍵盤時，顯示警告提示
- [ ] 開啟 1 個鍵盤時，提示框正確顯示鍵盤名稱
- [ ] 開啟多個鍵盤時，提示框正確顯示所有鍵盤名稱
- [ ] 點擊「確定」後，值正確複製到進階微調
- [ ] 點擊「取消」後，不執行任何操作
- [ ] 可以重複套用，每次都會覆蓋當前值

### 模式測試
- [ ] 亮色模式：只套用亮色設定
- [ ] 暗色模式：只套用暗色設定
- [ ] 切換模式後，套用邏輯正確

### 鍵盤測試
- [ ] 26 鍵中英文鍵盤：所有設定正確套用
- [ ] 數字鍵盤：所有設定正確套用
- [ ] 符號鍵盤：所有設定正確套用
- [ ] Emoji 鍵盤：所有設定正確套用

### 樣式測試
- [ ] 按鈕樣式與「還原預設值」一致
- [ ] 按鈕顏色為藍色系
- [ ] Hover 效果正常
- [ ] 手機版：按鈕可能換行，但不影響功能

---

## 注意事項

1. **不要自動提示或狀態標記**：保持簡潔，不加入「已自訂」badge 或自動提示
2. **保持行為一致**：與「還原預設值」的操作邏輯一致
3. **精確對應**：嚴格按照對應關係表執行，不遺漏任何欄位
4. **錯誤處理**：確保在任何情況下都不會出錯
5. **效能考量**：套用操作應該即時完成，不需要 loading 狀態

---

## 完成標準

- ✅ 按鈕正確顯示在指定位置
- ✅ 按鈕樣式符合設計規範
- ✅ 提示框正確顯示套用範圍
- ✅ 所有對應關係正確實作
- ✅ 亮色/暗色模式分開處理
- ✅ 只套用到已開啟的鍵盤
- ✅ 可重複套用
- ✅ 所有測試項目通過
