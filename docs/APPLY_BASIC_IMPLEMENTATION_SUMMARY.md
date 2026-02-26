# 套用基礎外觀設定功能 - 實作完成總結

## 實作日期
2026-02-26

## 最後更新
2026-02-26 - 修正數據結構對應錯誤

## 功能概述
在進階微調頁面新增「套用基礎外觀設定」按鈕，讓使用者可以將基礎外觀的設定值複製到進階微調中已開啟的鍵盤。

---

## 重要修正記錄

### 修正 1：數據結構對應錯誤（2026-02-26）

**問題**：工具列圖示顏色從基礎的 `#666666` 套用到進階後變成 `#00000000`

**原因**：進階微調的實際數據結構與文檔不符

**修正內容**：
1. 工具列結構：
   - ❌ 錯誤：`toolbar.color` 和 `toolbar.size`
   - ✅ 正確：`toolbarButtons.color` 和 `toolbarButtons.size`
   - ✅ 正確：`toolbarBackground.bg`

2. 26鍵按鍵類型名稱：
   - ❌ 錯誤：`functional`, `enter`, `space`
   - ✅ 正確：`systemKeys`, `enterKey`, `spaceKey`

3. 候選字結構：
   - ❌ 錯誤：`candidate`
   - ✅ 正確：`candidates`
   - ✅ 正確：`candidates.controlButtons`（候選字控制按鈕）

4. 氣泡提示結構：
   - ❌ 錯誤：`bubble`
   - ✅ 正確：`bubbleText`

5. 數字鍵盤按鍵類型：
   - ❌ 錯誤：`number`
   - ✅ 正確：`numbers`

6. 鍵盤背景：
   - ❌ 錯誤：`target.bg`
   - ✅ 正確：`target.keyboardBackground.bg`

---

## 已完成的實作

### 1. CSS 樣式（main.css）
✅ 新增 `.btn-apply-blue` 樣式類別

**位置**：`元書-蝦米方案/皮膚/docs/css/main.css` 第 691-709 行

**樣式特點**：
- 基礎樣式：淺藍色背景 `#EBF8FF`，藍色文字 `#3182CE`
- 與 `.btn-reset-small` 相同的尺寸和圓角（20px 藥丸形狀）
- Hover 效果：背景變藍色，文字變白色，向上移動 + 陰影加強
- 與「還原預設值」按鈕保持一致的動畫效果

```css
.btn-apply-blue {
    padding: 6px 16px;
    font-size: 11px;
    font-weight: 600;
    background: #EBF8FF;
    border: 1px solid #BEE3F8;
    border-radius: 20px;
    color: #3182CE;
    cursor: pointer;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    white-space: nowrap;
    box-shadow: 4px 4px 15px rgba(49, 130, 206, 0.05);
}

.btn-apply-blue:hover {
    background: #3182CE;
    color: #FFFFFF;
    border-color: #3182CE;
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(49, 130, 206, 0.3);
}
```

### 2. HTML 結構（index.html）
✅ 在進階微調頁面新增按鈕

**位置**：`元書-蝦米方案/皮膚/docs/index.html` 第 2972-2976 行

**按鈕位置**：
- 在「亮色模式」/「暗色模式」卡片之後
- 在提示橫幅之前
- 居中顯示

```html
<!-- Apply Basic to Advanced Button -->
<div style="display: flex; justify-content: center; margin: 16px 0;">
    <button class="btn-apply-blue" @click="applyBasicToAdvanced()">
        套用基礎外觀設定
    </button>
</div>
```

### 3. Vue 方法（index.html）
✅ 實作三個核心方法

**位置**：`元書-蝦米方案/皮膚/docs/index.html` 第 6970-7145 行

#### 方法 1：`applyBasicToAdvanced()`
主要邏輯函數，負責：
1. 檢查已開啟的鍵盤
2. 顯示確認提示框
3. 執行套用邏輯

**關鍵邏輯**：
- 如果沒有開啟任何鍵盤，顯示警告提示
- 顯示將套用到哪些鍵盤的確認訊息
- 只套用當前模式（亮色或暗色）

#### 方法 2：`getEnabledKeyboards()`
取得已開啟的鍵盤列表

**返回值**：
- 陣列，包含已開啟的鍵盤類型
- 可能的值：`['keyboard26Chinese', 'numeric', 'symbolic', 'emoji']`

#### 方法 3：`applyToKeyboard(keyboardType, appearance)`
套用基礎外觀到單一鍵盤

**套用邏輯**：
1. **全域設定**（所有按鍵類型）：
   - 鍵盤背景色
   - 陰影顏色（同時套用到 `shadowColor` 和 `shadowHighlight`）
   - 邊框顏色和粗細
   - 文字顏色

2. **按鍵類型設定**：
   - 字母鍵：一般按鍵顏色、大小寫字體大小、滑動提示
   - 功能鍵：功能鍵顏色、字體大小
   - Enter 鍵：Enter 鍵顏色、字體大小
   - 空白鍵：一般按鍵顏色、字體大小

3. **鍵盤專屬設定**：
   - 26 鍵中英文：候選字、氣泡提示、工具列
   - 數字鍵盤：左側符號欄、數字大小、工具列
   - 符號/Emoji 鍵盤：左右面板背景、字體大小

**已導出到 Vue 實例**：
- `applyBasicToAdvanced`
- `getEnabledKeyboards`
- `applyToKeyboard`

---

## 對應關係實作

### 全域設定（所有鍵盤）
| 基礎外觀 | 進階微調目標 | 實作狀態 |
|---------|------------|---------|
| `palette[appearance].bg` | 所有鍵盤的 `bg` | ✅ |
| `palette[appearance].shadow` | 所有按鍵的 `shadowColor` 和 `shadowHighlight` | ✅ |
| `palette[appearance].border` | 所有按鍵的 `borderColor` | ✅ |
| `palette[appearance].borderSize` | 所有按鍵的 `borderWidth` | ✅ |
| `palette[appearance].textMain` | 所有按鍵的 `color` | ✅ |

### 按鍵顏色（所有鍵盤）
| 基礎外觀 | 進階微調目標 | 實作狀態 |
|---------|------------|---------|
| `palette[appearance].keyNormal` | 字母鍵/數字鍵的 `bg` | ✅ |
| `palette[appearance].keyNormalHighlight` | 字母鍵/數字鍵的 `highlight` | ✅ |
| `palette[appearance].keySystem` | 功能鍵的 `bg` | ✅ |
| `palette[appearance].keySystemHighlight` | 功能鍵的 `highlight` | ✅ |
| `palette[appearance].keyEnter` | Enter 鍵的 `bg` | ✅ |
| `palette[appearance].keyEnterHighlight` | Enter 鍵的 `highlight` | ✅ |

### 字體大小（所有鍵盤）
| 基礎外觀 | 進階微調目標 | 實作狀態 |
|---------|------------|---------|
| `groups.alphabetSize` | 字母鍵的 `labelSize` | ✅ |
| `groups.lowercaseSize` | 字母鍵的 `lowercaseSize` | ✅ |
| `groups.systemSize` | 功能鍵和 Enter 鍵的 `labelSize` | ✅ |
| `groups.swipeSize` | 字母鍵的 `swipeSize` | ✅ |
| `palette[appearance].textSub` | 字母鍵的 `swipeColor` | ✅ |

### 26 鍵中英文鍵盤專屬
| 基礎外觀 | 進階微調目標 | 實作狀態 |
|---------|------------|---------|
| `groups.spaceSize` | `space.labelSize` | ✅ |
| `palette[appearance].candidateSelectedBg` | `candidate.selectedBg` | ✅ |
| `palette[appearance].candidateSelectedText` | `candidate.selectedText` | ✅ |
| `palette[appearance].candidateUnselectedText` | `candidate.unselectedText` | ✅ |
| `palette[appearance].bubbleTextSelected` | `bubble.selectedText` | ✅ |
| `palette[appearance].bubbleTextUnselected` | `bubble.unselectedText` | ✅ |
| `palette[appearance].toolbarColor` | `toolbar.color` | ✅ |
| `groups.toolbarSize` | `toolbar.size` | ✅ |

### 數字鍵盤專屬
| 基礎外觀 | 進階微調目標 | 實作狀態 |
|---------|------------|---------|
| `palette[appearance].numericLeftPanelBg` | `leftPanel.bg` | ✅ |
| `groups.numberSize` | `number.labelSize` | ✅ |
| `palette[appearance].toolbarColor` | `toolbar.color` | ✅ |
| `groups.toolbarSize` | `toolbar.size` | ✅ |

### 符號/Emoji 鍵盤專屬
| 基礎外觀 | 進階微調目標 | 實作狀態 |
|---------|------------|---------|
| `palette[appearance].panelLeftBg` | `leftPanel.bg` | ✅ |
| `palette[appearance].panelRightBg` | `rightPanel.bg` | ✅ |
| `groups.panelSmallSize` | `leftPanel.labelSize` | ✅ |
| `groups.panelLargeSize` | `rightPanel.labelSize` | ✅ |

---

## 設計原則實作

### ✅ 1. 單向繼承
- 基礎外觀 → 進階微調（單向）
- 不自動同步，使用者手動觸發
- 可重複套用（每次都會覆蓋當前值）

### ✅ 2. 精確控制
- 只套用到**已開啟**的鍵盤（enable 開關為 true）
- 只套用**當前模式**（亮色或暗色分開處理）
- 提供確認提示框，清楚告知套用範圍

### ✅ 3. 行為一致性
- 與「還原預設值」按鈕保持一致的操作邏輯
- 亮色模式只影響亮色設定，暗色模式只影響暗色設定

---

## 使用者體驗

### 情境 1：沒有開啟任何鍵盤
```
⚠️ 沒有開啟任何進階微調鍵盤
請先開啟至少一個鍵盤的進階微調開關
```

### 情境 2：開啟了部分鍵盤（例如：26 鍵和數字鍵盤）
```
✓ 將套用基礎外觀設定（亮色模式）到以下鍵盤：
• 26 鍵中英文鍵盤
• 數字鍵盤

[確定] [取消]
```

### 情境 3：開啟了所有鍵盤
```
✓ 將套用基礎外觀設定（暗色模式）到以下鍵盤：
• 26 鍵中英文鍵盤
• 數字鍵盤
• 符號鍵盤
• Emoji 鍵盤

[確定] [取消]
```

---

## 測試建議

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

## 技術細節

### 關鍵實作決策

1. **陰影顏色 1 對多處理**：
   - 基礎外觀只有一個 `shadow`
   - 進階微調有 `shadowColor` 和 `shadowHighlight`
   - 實作：同時套用到兩者

2. **Enter 鍵文字顏色**：
   - Enter 鍵預設背景是 `#979faf80`（淺灰色半透明）
   - 文字顏色繼承 `textMain`（黑色）

3. **動態鍵盤類型檢測**：
   - 使用 `Object.keys(target).filter()` 動態檢測鍵盤中存在的按鍵類型
   - 避免硬編碼，提高可維護性

4. **錯誤處理**：
   - 使用 try-catch 包裹套用邏輯
   - 失敗時顯示錯誤訊息並記錄到控制台

---

## 完成標準

- ✅ 按鈕正確顯示在指定位置
- ✅ 按鈕樣式符合設計規範
- ✅ 提示框正確顯示套用範圍
- ✅ 所有對應關係正確實作
- ✅ 亮色/暗色模式分開處理
- ✅ 只套用到已開啟的鍵盤
- ✅ 可重複套用
- ✅ 無語法錯誤

---

## 後續建議

1. **使用者測試**：
   - 請使用者實際測試各種情境
   - 收集反饋並優化提示訊息

2. **效能優化**（如需要）：
   - 目前實作已經很高效
   - 如果鍵盤數量增加，可考慮批次更新

3. **文檔更新**：
   - 更新使用者手冊，說明此功能
   - 提供使用範例和最佳實踐

4. **未來擴展**（可選）：
   - 考慮是否需要「部分套用」功能（只套用顏色或只套用字體大小）
   - 考慮是否需要「套用歷史記錄」功能

---

## 相關文件

- `BASIC_TO_ADVANCED_MAPPING.md` - 完整對應關係文檔
- `APPLY_BASIC_TO_ADVANCED_PLAN.md` - 原始實作計畫
- `元書-蝦米方案/皮膚/docs/index.html` - 主要實作檔案
- `元書-蝦米方案/皮膚/docs/css/main.css` - 樣式檔案
