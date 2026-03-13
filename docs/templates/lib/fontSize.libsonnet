// 字號定義 - 支援 3 層繼承架構 (Size Templates & Overrides)
local settings = import '../Settings.libsonnet';

// 基礎工具：安全獲取物件屬性，帶預設值
local safeGet(obj, key, default) = if obj != null && std.objectHas(obj, key) then obj[key] else default;

// 核心查找邏輯：Override -> Group -> Default
local getCascadedSize(keyboardType, groupName, templateKey, theme, defaultSize) =
  if settings.customColors.enableCustomColors then
    local groups = settings.customColors.groups;
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3)
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local sizeOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'fontSize', null) else null;
    
    # 如果 sizeOverride 是數字，直接返回；如果是物件（如 {uppercase, lowercase}），返回 null 讓調用者處理
    if sizeOverride != null && std.isNumber(sizeOverride) then sizeOverride
    else (
      # 2. 尋找 Groups (Layer 2 - 尺寸範本) - groups 是亮暗通用的，直接取值
      safeGet(groups, templateKey, defaultSize)
    )
  else
    defaultSize;

// 專門處理小寫字號的邏輯（支援 Layer 3 覆蓋或 Layer 2 的 lowercaseSize）
local getCascadedLowercaseSize(keyboardType, groupName, theme) =
  if settings.customColors.enableCustomColors then
    local groups = settings.customColors.groups;
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3) - 直接指定的 lowercase 值
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local fontSizeOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'fontSize', null) else null;
    local lowercaseOverride = if fontSizeOverride != null && std.isObject(fontSizeOverride) then safeGet(fontSizeOverride, 'lowercase', null) else null;
    
    if lowercaseOverride != null then lowercaseOverride
    else (
      # 2. 使用 Groups (Layer 2) - groups 是亮暗通用的，直接讀取 lowercaseSize
      safeGet(groups, 'lowercaseSize', 23)
    )
  else
    23;  // 預設值

// 專門處理大寫字號的邏輯（支援 Layer 3 覆蓋或 Layer 2 的 alphabetSize）
local getCascadedUppercaseSize(keyboardType, groupName, theme) =
  if settings.customColors.enableCustomColors then
    local groups = settings.customColors.groups;
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3) - 直接指定的 uppercase 值
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local fontSizeOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'fontSize', null) else null;
    local uppercaseOverride = if fontSizeOverride != null && std.isObject(fontSizeOverride) then safeGet(fontSizeOverride, 'uppercase', null) else null;
    
    if uppercaseOverride != null then uppercaseOverride
    else (
      # 2. 使用 Groups (Layer 2) - groups 是亮暗通用的，直接讀取 alphabetSize
      safeGet(groups, 'alphabetSize', 21)
    )
  else
    21;  // 預設值

// 專門獲取簡單屬性的邏輯（如 swipeHint.fontSize）
local getCascadedSimpleProperty(keyboardType, groupName, propertyName, theme, subKey, defaultValue) =
  if settings.customColors.enableCustomColors then
    local groups = settings.customColors.groups;
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local propertyOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, propertyName, null) else null;
    local subKeyValue = if propertyOverride != null && std.isObject(propertyOverride) then safeGet(propertyOverride, subKey, null) else null;
    
    if subKeyValue != null then subKeyValue
    else (
      # 尋找 Groups (Layer 2) - groups 是亮暗通用的，直接取值
      # 對於 swipeHint.fontSize，使用 swipeSize
      if propertyName == 'swipeHint' && subKey == 'fontSize' then
        safeGet(groups, 'swipeSize', defaultValue)
      else
        defaultValue
    )
  else
    defaultValue;

local groupSize(templateKey, defaultSize) =
  if settings.customColors.enableCustomColors then
    # groups 是亮暗通用的，直接取值
    safeGet(settings.customColors.groups, templateKey, defaultSize)
  else
    defaultSize;

// 專門獲取工具列按鈕大小的邏輯（支援 Layer 3 覆蓋）
local getCascadedToolbarButtonSize(keyboardType, theme, defaultSize) =
  if settings.customColors.enableCustomColors then
    local groups = settings.customColors.groups;
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3)
    local kbOverride = safeGet(overrides, keyboardType, null);
    local buttonsOverride = if kbOverride != null then safeGet(kbOverride, 'toolbarButtons', null) else null;
    local themeOverride = if buttonsOverride != null then safeGet(buttonsOverride, theme, null) else null;
    local sizeOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'fontSize', null) else null;
    
    if sizeOverride != null then sizeOverride
    else (
      # 2. 尋找 Groups (Layer 2) - groups 是亮暗通用的，直接取值
      safeGet(groups, 'toolbarSize', defaultSize)
    )
  else
    defaultSize;

{
  // 候選字字號（固定值，不可調整）
  '未展开候选字体选中字体大小': 16,
  '未展开comment字体大小': 14,
  '展开候选字体选中字体大小': 16,
  '展开comment字体大小': 13,
  'preedit区字体大小': 17,

  // 滑動提示文字大小 (支援 Layer 3 的 swipeHint.fontSize)
  '上划文字大小': getCascadedSimpleProperty('keyboard26Chinese', 'alphabet', 'swipeHint', 'light', 'fontSize', 8),
  '下划文字大小': getCascadedSimpleProperty('keyboard26Chinese', 'alphabet', 'swipeHint', 'light', 'fontSize', 8),

  // 氣泡字號 (固定值)
  '划动气泡前景文字大小': 18,
  '长按气泡文字大小': 20,
  '长按气泡sf符号大小': 12,
  '长按符号选单动作文字大小': 13,
  '长按符号选单日期文字大小': 14,

  // 按鍵文字大小 (Cascaded)
  '按键前景文字大小': getCascadedUppercaseSize('keyboard26Chinese', 'alphabet', 'light'),
  '按键前景文字大小-小写': getCascadedLowercaseSize('keyboard26Chinese', 'alphabet', 'light'),
  '按键前景文字大小-大写': getCascadedUppercaseSize('keyboard26Chinese', 'alphabet', 'light'),
  '按键前景文字大小-提示': 26,
  '按键前景sf符号大小': getCascadedSize('keyboard26Chinese', 'systemKeys', 'systemSize', 'light', 16),  // 功能鍵符號 (Shift, 123, Delete, Enter)

  // 工具列字號 (Layer 2)
  'toolbar按键前景sf符号大小': groupSize('toolbarSize', 20),
  'toolbar按键前景文字大小': groupSize('toolbarSize', 20),
  
  // 26 鍵鍵盤工具列按鈕大小 (支援 Layer 3 覆蓋)
  '26键键盘工具列按鈕大小': getCascadedToolbarButtonSize('keyboard26Chinese', 'light', 20),
  
  // 數字鍵盤工具列按鈕大小 (支援 Layer 3 覆蓋)
  '数字键盘工具列按鈕大小': getCascadedToolbarButtonSize('numeric', 'light', 20),

  // 數字鍵盤
  'collection前景字体大小': getCascadedSize('numeric', 'numericSide', 'panelSmallSize', 'light', 18), // 左側符號區
  '数字键盘数字前景字体大小': getCascadedSize('numeric', 'numbers', 'numberSize', 'light', 24),  // 數字 0~9
  '数字键盘功能键字体大小': getCascadedSize('numeric', 'systemKeys', 'systemSize', 'light', 16),  // 系統功能鍵

  // 中文九鍵 (暫保持固定)
  '中文九键字符键前景文字大小': 15,
  '中文九键字根前景文字大小': 10,
  '中文九键划动文字大小': 10,

  // 符號鍵盤 (Cascaded)
  '符號鍵盤左側collection前景字體大小': getCascadedSize('symbolic', 'leftPanel', 'panelSmallSize', 'light', 13),
  '符號鍵盤右側collection前景字體大小': getCascadedSize('symbolic', 'rightPanel', 'panelLargeSize', 'light', 16),
  '符號鍵盤功能键字体大小': getCascadedSize('symbolic', 'systemKeys', 'systemSize', 'light', 16),  // 系統功能鍵

  // Emoji 鍵盤 (Cascaded)
  'emoji鍵盤左側collection前景字體大小': getCascadedSize('emoji', 'leftPanel', 'panelSmallSize', 'light', 13),
  'emoji鍵盤右側collection前景字體大小': getCascadedSize('emoji', 'rightPanel', 'panelLargeSize', 'light', 16),
  'emoji鍵盤功能键字体大小': getCascadedSize('emoji', 'systemKeys', 'systemSize', 'light', 16),  // 系統功能鍵

  // 其他介面
  'panel按键前景文字大小': 12,
  'panel按键前景sf符号大小': 16,
  '英文空白键文字大小': getCascadedSize('keyboard26Chinese', 'spaceKey', 'spaceSize', 'light', 14),
  '水平候选字索引字体大小': 12,
  '垂直候选字索引字体大小': 12,

  // 系統功能鍵字號（包含 Shift, 123, Delete, Enter, 返回, 上捲, 下捲）
  '垂直候选控制按钮字体大小': groupSize('systemSize', 16),
  '垂直候选返回按钮字体大小': groupSize('systemSize', 16),
}
