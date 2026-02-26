# 基礎外觀 → 進階微調 對應關係分析（已校正版本）

## 數據結構概覽

### 基礎外觀 (settings.palette[appearance] + settings.groups)
```javascript
// 顏色設定
settings.palette.light = {
    // 全域外觀
    bg: '#ECECEC',           // 鍵盤背景色
    shadow: '#00000040',     // 陰影顏色（同時對應按鍵陰影和按下陰影）
    border: '#00000000',     // 邊框顏色
    borderSize: 0,           // 邊框粗細
    
    // 文字顏色
    textMain: '#000000FF',   // 主文字顏色
    textSub: '#808080FF',    // 滑動提示顏色
    
    // 按鍵顏色
    keyNormal: '#FFFFFFFF',        // 一般按鍵顏色（字母鍵）
    keyNormalHighlight: '#D1D5DBFF', // 一般按鍵按下顏色
    
    // 功能鍵
    keySystem: '#ABB0BAFF',  // 功能鍵顏色
    keySystemHighlight: '#8E9299FF', // 功能鍵按下顏色
    
    // Enter 鍵（預設是灰色，不是藍色！）
    keyEnter: '#979faf80',   // Enter 鍵顏色（灰色半透明）
    keyEnterHighlight: '#8E9299FF', // Enter 鍵按下顏色
    
    // 候選字、氣泡提示、工具列等（不需要繼承到進階）
    candidateSelectedBg: '#D1D5DBFF',
    candidateSelectedText: '#000000FF',
    candidateUnselectedText: '#808080FF',
    bubbleTextSelected: '#3578F5FF',
    bubbleTextUnselected: '#808080FF',
    toolbarColor: '#000000FF'
};

// 字體大小設定
settings.groups = {
    systemSize: 16,      // 功能鍵與 Enter 鍵共用文字大小
    alphabetSize: 24,    // 大寫英文大小
    lowercaseSize: 16,   // 小寫英文大小
    spaceSize: 14,       // 空白鍵字體大小
    swipeSize: 10,       // 滑動提示文字大小
    toolbarSize: 24,     // 工具列圖示大小
    numberSize: 24,      // 數字鍵盤數字大小
    panelSmallSize: 14,  // 符號鍵盤小字
    panelLargeSize: 24   // 符號鍵盤大字
};
```

### 進階微調 (settings.overrides)
進階微調包含 4 種鍵盤類型：
1. `keyboard26Chinese` - 26 鍵中英文鍵盤
2. `keyboardNumeric` - 數字鍵盤
3. `keyboardSymbolic` - 符號鍵盤
4. `emoji` - Emoji 鍵盤

每種鍵盤都有相似的結構，以 keyboard26Chinese 為例：

```javascript
settings.overrides.keyboard26Chinese.light = {
    // 字母鍵（A-Z、逗號、句號）
    alphabet: {
        bg: '#FFFFFFFF',           // 按鍵顏色
        highlight: '#D1D5DBFF',    // 按下顏色
        color: '#000000FF',        // 文字顏色
        labelSize: 24,             // 大寫英文大小
        lowercaseSize: 16,         // 小寫英文大小
        borderColor: '#00000000',  // 邊框顏色
        borderWidth: 0,            // 邊框粗細
        shadowColor: '#00000040',  // 按鍵陰影
        shadowHighlight: '#00000020', // 按下陰影
        swipeColor: '#808080FF',   // 滑動提示顏色
        swipeSize: 10              // 滑動提示文字大小
    },
    
    // 功能鍵（Shift、Delete、123、地球等）
    functional: {
        bg: '#ABB0BAFF',
        highlight: '#8E9299FF',
        color: '#000000FF',
        labelSize: 16,
        borderColor: '#00000000',
        borderWidth: 0,
        shadowColor: '#00000040',
        shadowHighlight: '#00000020'
    },
    
    // Enter 鍵
    enter: {
        bg: '#979faf80',           // 預設是灰色半透明
        highlight: '#8E9299FF',
        color: '#000000FF',        // 黑色文字（因為背景是淺灰色）
        labelSize: 16,
        borderColor: '#00000000',
        borderWidth: 0,
        shadowColor: '#00000040',
        shadowHighlight: '#00000020'
    },
    
    // 空白鍵
    space: {
        bg: '#FFFFFFFF',
        highlight: '#D1D5DBFF',
        color: '#000000FF',
        labelSize: 14,
        borderColor: '#00000000',
        borderWidth: 0,
        shadowColor: '#00000040',
        shadowHighlight: '#00000020'
    }
};
```

---

## 對應關係表（已校正）

### 1. 全域外觀 → 所有鍵盤的所有按鍵類型

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].bg` | `keyboard26Chinese[appearance].bg`<br>`keyboardNumeric[appearance].bg`<br>`keyboardSymbolic[appearance].bg`<br>`emoji[appearance].bg` | 鍵盤背景色套用到所有鍵盤 |
| `palette[appearance].shadow` | **所有鍵盤**的 `alphabet.shadowColor`<br>`alphabet.shadowHighlight`<br>`functional.shadowColor`<br>`functional.shadowHighlight`<br>`enter.shadowColor`<br>`enter.shadowHighlight`<br>等等 | ⚠️ 1對多：單一陰影顏色同時套用到「按鍵陰影」和「按下陰影」 |
| `palette[appearance].border` | **所有鍵盤**的所有按鍵類型的 `borderColor` | 邊框顏色套用到所有按鍵 |
| `palette[appearance].borderSize` | **所有鍵盤**的所有按鍵類型的 `borderWidth` | 邊框粗細套用到所有按鍵 |

### 2. 文字顏色 → 所有鍵盤的按鍵文字

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].textMain` | **所有鍵盤**的 `alphabet.color`<br>`functional.color`<br>`enter.color` | ✅ 主文字顏色套用到所有按鍵（包括 Enter 鍵！） |
| `palette[appearance].textSub` | **所有鍵盤**的 `alphabet.swipeColor` | 滑動提示顏色只套用到字母鍵 |

**✅ 校正 1：Enter 鍵文字顏色要繼承**
- 因為 Enter 鍵預設背景是 `#979faf80`（淺灰色半透明），不是藍色
- 所以文字應該用黑色（`textMain`），不是白色
- **結論**：Enter 鍵的 `color` 要繼承 `textMain`

### 3. 字母鍵 → 所有鍵盤的字母鍵

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].keyNormal` | **所有鍵盤**的 `alphabet.bg` | 一般按鍵顏色 → 字母鍵背景色 |
| `palette[appearance].keyNormalHighlight` | **所有鍵盤**的 `alphabet.highlight` | 一般按鍵按下顏色 → 字母鍵按下色 |
| `groups.alphabetSize` | **所有鍵盤**的 `alphabet.labelSize` | ✅ 大寫英文大小 |
| `groups.lowercaseSize` | **所有鍵盤**的 `alphabet.lowercaseSize` | ✅ 小寫英文大小 |
| `groups.swipeSize` | **所有鍵盤**的 `alphabet.swipeSize` | ✅ 滑動提示文字大小 |

**✅ 校正 2：字母鍵字體大小要繼承**
- 基礎外觀的「26鍵中英文鍵盤與工具列」區塊中有：
  - `groups.alphabetSize` - 大寫英文大小
  - `groups.lowercaseSize` - 小寫英文大小
  - `groups.swipeSize` - 滑動提示文字大小
- **結論**：這些都要繼承到進階微調

### 4. 功能鍵 → 所有鍵盤的功能鍵

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].keySystem` | **所有鍵盤**的 `functional.bg` | 功能鍵顏色 → 功能鍵背景色 |
| `palette[appearance].keySystemHighlight` | **所有鍵盤**的 `functional.highlight` | 功能鍵按下顏色 → 功能鍵按下色 |
| `groups.systemSize` | **所有鍵盤**的 `functional.labelSize` | 功能鍵文字大小 |

### 5. Enter 鍵 → 所有鍵盤的 Enter 鍵

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].keyEnter` | **所有鍵盤**的 `enter.bg` | Enter 鍵顏色 → Enter 鍵背景色 |
| `palette[appearance].keyEnterHighlight` | **所有鍵盤**的 `enter.highlight` | Enter 鍵按下顏色 → Enter 鍵按下色 |
| `groups.systemSize` | **所有鍵盤**的 `enter.labelSize` | Enter 鍵文字大小（與功能鍵共用） |

### 6. 空白鍵 → keyboard26Chinese 的空白鍵

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].keyNormal` | `keyboard26Chinese[appearance].space.bg` | 空白鍵使用一般按鍵顏色 |
| `palette[appearance].keyNormalHighlight` | `keyboard26Chinese[appearance].space.highlight` | 空白鍵按下顏色 |
| `palette[appearance].textMain` | `keyboard26Chinese[appearance].space.color` | 空白鍵文字顏色 |
| `groups.spaceSize` | `keyboard26Chinese[appearance].space.labelSize` | 空白鍵字體大小 |

---

## 特殊鍵盤的對應關係

### 數字鍵盤 (keyboardNumeric)
基礎外觀的「其他鍵盤 > 數字鍵盤」區塊：

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].numericLeftPanelBg` | `keyboardNumeric[appearance].leftPanel.bg` | 左側符號欄背景色 |
| `groups.numberSize` | `keyboardNumeric[appearance].number.labelSize` | 數字大小 |

數字鍵（0-9）的顏色和功能鍵共用基礎外觀的設定。

### 符號 / Emoji 鍵盤 (keyboardSymbolic, emoji)
基礎外觀的「其他鍵盤 > 符號 / Emoji 鍵盤」區塊：

| 基礎外觀 | 進階微調目標 | 說明 |
|---------|------------|------|
| `palette[appearance].panelLeftBg` | `keyboardSymbolic[appearance].leftPanel.bg`<br>`emoji[appearance].leftPanel.bg` | 左側分類欄背景色 |
| `palette[appearance].panelRightBg` | `keyboardSymbolic[appearance].rightPanel.bg`<br>`emoji[appearance].rightPanel.bg` | 右側內容區背景色 |
| `groups.panelSmallSize` | `keyboardSymbolic[appearance].leftPanel.labelSize`<br>`emoji[appearance].leftPanel.labelSize` | 左側分類文字大小 |
| `groups.panelLargeSize` | `keyboardSymbolic[appearance].rightPanel.labelSize`<br>`emoji[appearance].rightPanel.labelSize` | 右側符號/Emoji 大小 |

---

## 完整繼承規則總結

### ✅ 所有鍵盤都要繼承的項目

**全域設定（套用到所有按鍵類型）：**
1. `palette[appearance].bg` → 鍵盤背景色
2. `palette[appearance].shadow` → `shadowColor` 和 `shadowHighlight`（1對多）
3. `palette[appearance].border` → `borderColor`
4. `palette[appearance].borderSize` → `borderWidth`
5. `palette[appearance].textMain` → `color`（所有按鍵的文字顏色，包括 Enter）
6. `palette[appearance].textSub` → `swipeColor`（字母鍵的滑動提示）

**按鍵類型設定：**
- 字母鍵：`keyNormal` → `bg`，`keyNormalHighlight` → `highlight`
- 功能鍵：`keySystem` → `bg`，`keySystemHighlight` → `highlight`
- Enter 鍵：`keyEnter` → `bg`，`keyEnterHighlight` → `highlight`

**字體大小設定：**
- `groups.alphabetSize` → `alphabet.labelSize`
- `groups.lowercaseSize` → `alphabet.lowercaseSize`
- `groups.swipeSize` → `alphabet.swipeSize`
- `groups.systemSize` → `functional.labelSize` 和 `enter.labelSize`

### ✅ 特定鍵盤的專屬繼承

**keyboard26Chinese：**
- `groups.spaceSize` → `space.labelSize`

**keyboardNumeric：**
- `palette[appearance].numericLeftPanelBg` → `leftPanel.bg`
- `groups.numberSize` → `number.labelSize`

**keyboardSymbolic 和 emoji：**
- `palette[appearance].panelLeftBg` → `leftPanel.bg`
- `palette[appearance].panelRightBg` → `rightPanel.bg`
- `groups.panelSmallSize` → `leftPanel.labelSize`
- `groups.panelLargeSize` → `rightPanel.labelSize`

---

## 不需要繼承的項目

### 基礎外觀有，但不需要繼承到進階
1. `candidateSelectedBg` - 候選字選中背景色
2. `candidateSelectedText` - 候選字選中文字色
3. `candidateUnselectedText` - 候選字常態文字色
4. `bubbleTextSelected` - 氣泡提示選中文字色
5. `bubbleTextUnselected` - 氣泡提示常態文字色
6. `toolbarColor` - 工具列圖示顏色
7. `toolbarSize` - 工具列圖示大小

**說明**：這些是候選欄、氣泡提示、工具列的設定，不屬於鍵盤按鍵，不需要繼承到進階微調。

---

## 關鍵校正總結

### ✅ 校正 1：Enter 鍵預設顏色是灰色，不是藍色
- 預設值：`#979faf80`（淺灰色半透明）
- 文字顏色：黑色（繼承 `textMain`）
- **結論**：Enter 鍵的 `color` 要繼承 `textMain`

### ✅ 校正 2：字母鍵字體大小在基礎外觀中存在
- `groups.alphabetSize` - 大寫英文大小
- `groups.lowercaseSize` - 小寫英文大小
- **結論**：這些要繼承到進階微調的 `alphabet.labelSize` 和 `alphabet.lowercaseSize`

### ✅ 校正 3：陰影顏色是 1 對多的關係
- 基礎外觀只有一個 `shadow`
- 進階微調有 `shadowColor` 和 `shadowHighlight`
- **結論**：`shadow` 同時套用到兩者

### ✅ 校正 4：進階微調的鍵盤類型
- ❌ 沒有「26 鍵英文」
- ✅ 有「26 鍵中英文鍵盤」(`keyboard26Chinese`)
- ✅ 有「數字鍵盤」(`keyboardNumeric`)
- ✅ 有「符號鍵盤」(`keyboardSymbolic`)
- ✅ 有「Emoji 鍵盤」(`emoji`)

---

## 建議的實作方式

### 方案 1：單向繼承（基礎 → 進階）
- 提供「套用基礎外觀設定」按鈕
- 點擊後將基礎外觀的值複製到進階微調
- 不自動同步，使用者可以自由修改進階設定

### 方案 2：提供「重置」按鈕
- 每個進階微調卡片都有「還原預設值」按鈕
- 點擊後清除自訂設定，回到預設值
- 預設值可以是基礎外觀的值，也可以是固定的預設值

### 方案 3：首次進入時自動套用
- 當使用者第一次切換到「進階微調」時
- 自動將基礎外觀的值套用到進階微調
- 之後不再自動同步，使用者可以自由修改

**建議採用方案 1 + 方案 2 的組合**：
- 提供手動「套用基礎外觀設定」按鈕（明確的使用者操作）
- 提供「重置」按鈕（清除自訂設定）
- 不自動提示，不自動同步（保持簡潔）
