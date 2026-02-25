// 顏色定義 - 支援 3 層繼承架構 (Palette, Groups, Overrides)
local settings = import '../Settings.libsonnet';

// 基礎工具：安全獲取物件屬性，帶預設值
local safeGet(obj, key, default) = if obj != null && std.objectHas(obj, key) then obj[key] else default;

// 核心查找邏輯：Override -> Group -> Palette -> Default
// normalOrHighlight: 'normal' 或 'highlight'
local getCascadedColor(keyboardType, groupName, paletteKey, theme, defaultColor, normalOrHighlight='normal') =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local groups = settings.customColors.groups;
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3)
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local bgOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'background', null) else null;
    
    # 檢查 background 是否為嵌套結構 (有 normal/highlight)
    local colorOverride = if bgOverride != null && std.isObject(bgOverride) && std.objectHas(bgOverride, normalOrHighlight) 
                         then bgOverride[normalOrHighlight]
                         else if bgOverride != null && std.isString(bgOverride) then bgOverride
                         else null;
    
    if colorOverride != null then colorOverride
    else (
      # 2. 尋找 Groups (Layer 2) - 顏色已移回 Layer 1
      # 3. 尋找 Palette (Layer 1)
      safeGet(palette, paletteKey, defaultColor)
    )
  else
    defaultColor;

// 專門獲取文字顏色的邏輯
local getCascadedTextColor(keyboardType, groupName, paletteKey, theme, defaultColor) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local groups = settings.customColors.groups;
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local textOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'text', null) else null;
    
    if textOverride != null then textOverride
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, paletteKey, defaultColor)
    )
  else
    defaultColor;

// 專門獲取簡單屬性的邏輯（如 shadow, border 等）
local getCascadedSimpleProperty(keyboardType, groupName, propertyName, theme, paletteKey, defaultValue) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local propertyOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, propertyName, null) else null;
    
    if propertyOverride != null then propertyOverride
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, paletteKey, defaultValue)
    )
  else
    defaultValue;

// 專門獲取嵌套屬性的邏輯（如 swipeHint.color, swipeHint.fontSize）
local getCascadedNestedProperty(keyboardType, groupName, parentProperty, childProperty, theme, paletteKey, defaultValue) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local parentOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, parentProperty, null) else null;
    local childOverride = if parentOverride != null && std.isObject(parentOverride) then safeGet(parentOverride, childProperty, null) else null;
    
    if childOverride != null then childOverride
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, paletteKey, defaultValue)
    )
  else
    defaultValue;

// 專門獲取 shadow 的邏輯（支援 normal/highlight 變體）
local getCascadedShadow(keyboardType, groupName, theme, normalOrHighlight, defaultValue) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local shadowOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'shadow', null) else null;
    
    # 檢查 shadow 是否為嵌套結構 (有 normal/highlight)
    local shadowValue = if shadowOverride != null && std.isObject(shadowOverride) && std.objectHas(shadowOverride, normalOrHighlight)
                       then shadowOverride[normalOrHighlight]
                       else if shadowOverride != null && std.isString(shadowOverride) then shadowOverride
                       else null;
    
    if shadowValue != null then shadowValue
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, 'shadow', defaultValue)
    )
  else
    defaultValue;

// 專門獲取 border.color 的邏輯
local getCascadedBorderColor(keyboardType, groupName, theme, defaultValue) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local borderOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'border', null) else null;
    local colorOverride = if borderOverride != null && std.isObject(borderOverride) then safeGet(borderOverride, 'color', null) else null;
    
    if colorOverride != null then colorOverride
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, 'border', defaultValue)
    )
  else
    defaultValue;

// 專門獲取 border.size 的邏輯
local getCascadedBorderSize(keyboardType, groupName, theme, defaultValue) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local groupOverride = if kbOverride != null then safeGet(kbOverride, groupName, null) else null;
    local themeOverride = if groupOverride != null then safeGet(groupOverride, theme, null) else null;
    local borderOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'border', null) else null;
    local sizeOverride = if borderOverride != null && std.isObject(borderOverride) then safeGet(borderOverride, 'size', null) else null;
    
    if sizeOverride != null then sizeOverride
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, 'borderSize', defaultValue)
    )
  else
    defaultValue;

// 專門獲取候選字顏色的邏輯（支援 Layer 3 覆蓋）
local getCascadedCandidateColor(keyboardType, propertyName, theme, paletteKey, defaultColor) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local candidatesOverride = if kbOverride != null then safeGet(kbOverride, 'candidates', null) else null;
    local themeOverride = if candidatesOverride != null then safeGet(candidatesOverride, theme, null) else null;
    local colorOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, propertyName, null) else null;
    
    if colorOverride != null then colorOverride
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, paletteKey, defaultColor)
    )
  else
    defaultColor;

// 專門獲取長按氣泡文字顏色的邏輯（支援 Layer 3 覆蓋）
local getCascadedBubbleTextColor(keyboardType, colorType, theme, paletteKey, defaultColor) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    local kbOverride = safeGet(overrides, keyboardType, null);
    local bubbleTextOverride = if kbOverride != null then safeGet(kbOverride, 'bubbleText', null) else null;
    local themeOverride = if bubbleTextOverride != null then safeGet(bubbleTextOverride, theme, null) else null;
    local colorOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, colorType, null) else null;
    
    if colorOverride != null then colorOverride
    else (
      # 尋找 Palette (Layer 1)
      safeGet(palette, paletteKey, defaultColor)
    )
  else
    defaultColor;

local paletteShadow(theme, defaultShadow) =
  if settings.customColors.enableCustomColors then
    safeGet(settings.customColors.palette[theme], 'shadow', defaultShadow)
  else
    defaultShadow;

local paletteColor(theme, key, defaultColor) =
  if settings.customColors.enableCustomColors then
    safeGet(settings.customColors.palette[theme], key, defaultColor)
  else
    defaultColor;

// 專門獲取鍵盤背景色的邏輯（支援 Layer 3 覆蓋）
local getCascadedKeyboardBg(keyboardType, theme, defaultColor) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3)
    local kbOverride = safeGet(overrides, keyboardType, null);
    local bgOverride = if kbOverride != null then safeGet(kbOverride, 'keyboardBackground', null) else null;
    local themeBgOverride = if bgOverride != null then safeGet(bgOverride, theme, null) else null;
    
    if themeBgOverride != null then themeBgOverride
    else (
      # 2. 尋找 Palette (Layer 1)
      safeGet(palette, 'bg', defaultColor)
    )
  else
    defaultColor;

// 專門獲取工具列背景色的邏輯（支援 Layer 3 覆蓋）
local getCascadedToolbarBg(keyboardType, theme, defaultColor) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3)
    local kbOverride = safeGet(overrides, keyboardType, null);
    local bgOverride = if kbOverride != null then safeGet(kbOverride, 'toolbarBackground', null) else null;
    local themeBgOverride = if bgOverride != null then safeGet(bgOverride, theme, null) else null;
    
    if themeBgOverride != null then themeBgOverride
    else (
      # 2. 尋找 Palette (Layer 1)
      safeGet(palette, 'bg', defaultColor)
    )
  else
    defaultColor;

// 專門獲取工具列按鈕顏色的邏輯（支援 Layer 3 覆蓋）
local getCascadedToolbarButtonColor(keyboardType, theme, defaultColor) =
  if settings.customColors.enableCustomColors then
    local palette = settings.customColors.palette[theme];
    local overrides = settings.customColors.overrides;
    
    # 1. 優先尋找 Overrides (Layer 3)
    local kbOverride = safeGet(overrides, keyboardType, null);
    local buttonsOverride = if kbOverride != null then safeGet(kbOverride, 'toolbarButtons', null) else null;
    local themeOverride = if buttonsOverride != null then safeGet(buttonsOverride, theme, null) else null;
    local colorOverride = if themeOverride != null && std.isObject(themeOverride) then safeGet(themeOverride, 'color', null) else null;
    
    if colorOverride != null then colorOverride
    else (
      # 2. 尋找 Palette (Layer 1)
      safeGet(palette, 'toolbarColor', defaultColor)
    )
  else
    defaultColor;

{
  light: {
    // === 字母鍵/一般鍵 (keyboard26, numeric) ===
    '字母键背景颜色-普通': getCascadedColor('keyboard26Chinese', 'alphabet', 'keyNormal', 'light', '#FFFFFF', 'normal'),
    '字母键背景颜色-高亮': getCascadedColor('keyboard26Chinese', 'alphabet', 'keyNormalHighlight', 'light', '#ABB0BA', 'highlight'),
    '按键前景颜色': getCascadedTextColor('keyboard26Chinese', 'alphabet', 'textMain', 'light', '#000000'),
    '按键文字颜色': getCascadedTextColor('keyboard26Chinese', 'alphabet', 'textMain', 'light', '#000000'),
    '空白键文字颜色': getCascadedTextColor('keyboard26Chinese', 'spaceKey', 'textMain', 'light', '#000000'),
    '字母键边框顏色-普通': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'light', '#FFFFFF'),
    '字母键边框顏色-高亮': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'light', '#FFFFFF'),
    '字母键边框宽度': getCascadedBorderSize('keyboard26Chinese', 'alphabet', 'light', 0),

    // === 系統功能鍵 ===
    '功能键背景颜色-普通': getCascadedColor('keyboard26Chinese', 'systemKeys', 'keySystem', 'light', '#979faf80', 'normal'),
    '功能键背景颜色-高亮': getCascadedColor('keyboard26Chinese', 'systemKeys', 'keySystemHighlight', 'light', '#FFFFFFE6', 'highlight'),
    '系统功能键文字顏色': getCascadedTextColor('keyboard26Chinese', 'systemKeys', 'textMain', 'light', '#000000'),
    '系统功能键边框顏色-普通': getCascadedBorderColor('keyboard26Chinese', 'systemKeys', 'light', '#FFFFFF'),
    '系统功能键边框顏色-高亮': getCascadedBorderColor('keyboard26Chinese', 'systemKeys', 'light', '#FFFFFF'),
    '系统功能键边框宽度': getCascadedBorderSize('keyboard26Chinese', 'systemKeys', 'light', 0),

    // === Enter 鍵 ===
    'enter键背景颜色-普通': getCascadedColor('keyboard26Chinese', 'enterKey', 'keyEnter', 'light', '#979faf80', 'normal'),
    'enter键背景颜色-高亮': getCascadedColor('keyboard26Chinese', 'enterKey', 'keyEnterHighlight', 'light', '#FFFFFFE6', 'highlight'),
    'enter键文字颜色': getCascadedTextColor('keyboard26Chinese', 'enterKey', 'textMain', 'light', '#000000'),
    'enter键边框顏色-普通': getCascadedBorderColor('keyboard26Chinese', 'enterKey', 'light', '#FFFFFF'),
    'enter键边框顏色-高亮': getCascadedBorderColor('keyboard26Chinese', 'enterKey', 'light', '#FFFFFF'),
    'enter键边框宽度': getCascadedBorderSize('keyboard26Chinese', 'enterKey', 'light', 0),

    // === 數字鍵盤 (九宮格) ===
    '数字键文字颜色': getCascadedTextColor('numeric', 'numbers', 'textMain', 'light', '#000000'),
    '数字键背景颜色-普通': getCascadedColor('numeric', 'numbers', 'keyNormal', 'light', '#FFFFFF', 'normal'),
    '数字键背景颜色-高亮': getCascadedColor('numeric', 'numbers', 'keyNormalHighlight', 'light', '#ABB0BA', 'highlight'),
    '数字键底边缘颜色-普通': getCascadedShadow('numeric', 'numbers', 'light', 'normal', '#9a9c9a'),
    '数字键底边缘颜色-高亮': getCascadedShadow('numeric', 'numbers', 'light', 'highlight', '#9a9c9a'),
    '数字键边框颜色-普通': getCascadedBorderColor('numeric', 'numbers', 'light', '#FFFFFF'),
    '数字键边框颜色-高亮': getCascadedBorderColor('numeric', 'numbers', 'light', '#FFFFFF'),
    '数字键边框宽度': getCascadedBorderSize('numeric', 'numbers', 'light', 0),
    '数字键盘左侧collection背景顏色': getCascadedColor('numeric', 'leftPanel', 'numericLeftPanelBg', 'light', '#979faf80', 'normal'),
    '数字键盘左侧collection背景下边缘顏色': getCascadedSimpleProperty('numeric', 'leftPanel', 'shadow', 'light', 'shadow', '#9a9c9a'),
    '数字键盘左侧collection边框颜色': getCascadedBorderColor('numeric', 'leftPanel', 'light', '#FFFFFF'),
    '数字键盘左侧collection边框宽度': getCascadedBorderSize('numeric', 'leftPanel', 'light', 0),
    
    // 數字鍵盤系統功能鍵 (返回, #+=, 空格, Delete, ., =)
    '数字键盘功能键背景颜色-普通': getCascadedColor('numeric', 'systemKeys', 'keySystem', 'light', '#979faf80', 'normal'),
    '数字键盘功能键背景颜色-高亮': getCascadedColor('numeric', 'systemKeys', 'keySystemHighlight', 'light', '#FFFFFFE6', 'highlight'),
    '数字键盘功能键文字颜色': getCascadedTextColor('numeric', 'systemKeys', 'textMain', 'light', '#000000'),
    '数字键盘功能键底边缘颜色-普通': getCascadedShadow('numeric', 'systemKeys', 'light', 'normal', '#9a9c9a'),
    '数字键盘功能键底边缘颜色-高亮': getCascadedShadow('numeric', 'systemKeys', 'light', 'highlight', '#9a9c9a'),
    '数字键盘功能键边框颜色-普通': getCascadedBorderColor('numeric', 'systemKeys', 'light', '#FFFFFF'),
    '数字键盘功能键边框颜色-高亮': getCascadedBorderColor('numeric', 'systemKeys', 'light', '#FFFFFF'),
    '数字键盘功能键边框宽度': getCascadedBorderSize('numeric', 'systemKeys', 'light', 0),
    
    // 數字鍵盤 Enter 鍵專用
    '数字键盘enter键背景颜色-普通': getCascadedColor('numeric', 'enterKey', 'keyEnter', 'light', '#979faf80', 'normal'),
    '数字键盘enter键背景颜色-高亮': getCascadedColor('numeric', 'enterKey', 'keyEnterHighlight', 'light', '#FFFFFFE6', 'highlight'),
    '数字键盘enter键文字颜色': getCascadedTextColor('numeric', 'enterKey', 'textMain', 'light', '#000000'),
    '数字键盘enter键底边缘颜色-普通': getCascadedShadow('numeric', 'enterKey', 'light', 'normal', '#9a9c9a'),
    '数字键盘enter键底边缘颜色-高亮': getCascadedShadow('numeric', 'enterKey', 'light', 'highlight', '#9a9c9a'),
    '数字键盘enter键边框颜色-普通': getCascadedBorderColor('numeric', 'enterKey', 'light', '#FFFFFF'),
    '数字键盘enter键边框颜色-高亮': getCascadedBorderColor('numeric', 'enterKey', 'light', '#FFFFFF'),
    '数字键盘enter键边框宽度': getCascadedBorderSize('numeric', 'enterKey', 'light', 0),
    
    // 數字鍵盤背景
    '数字键盘背景顏色': getCascadedKeyboardBg('numeric', 'light', '#D0D3DA01'),
    '数字键盘工具列背景顏色': getCascadedToolbarBg('numeric', 'light', '#D0D3DA01'),
    '数字键盘工具列按鈕顏色': getCascadedToolbarButtonColor('numeric', 'light', '#666666'),

    // === 符號鍵盤 (Symbolic) ===
    '符號鍵盤左側collection字體顏色': getCascadedTextColor('symbolic', 'leftPanel', 'textMain', 'light', '#000000'),
    '符號鍵盤右側collection字體顏色': getCascadedTextColor('symbolic', 'rightPanel', 'textMain', 'light', '#000000'),
    '符號鍵盤左側collection背景顏色': getCascadedColor('symbolic', 'leftPanel', 'panelLeftBg', 'light', '#979faf80', 'normal'),
    '符號鍵盤左側collection背景下邊緣顏色': getCascadedSimpleProperty('symbolic', 'leftPanel', 'shadow', 'light', 'shadow', '#9a9c9a'),
    '符號鍵盤左側collection邊框顏色': getCascadedBorderColor('symbolic', 'leftPanel', 'light', '#979faf80'),
    '符號鍵盤左側collection邊框寬度': getCascadedBorderSize('symbolic', 'leftPanel', 'light', 0),
    '符號鍵盤右側collection背景顏色': getCascadedColor('symbolic', 'rightPanel', 'panelRightBg', 'light', '#ffffff', 'normal'),
    '符號鍵盤右側collection背景下邊緣顏色': getCascadedSimpleProperty('symbolic', 'rightPanel', 'shadow', 'light', 'shadow', '#9a9c9a'),
    '符號鍵盤右側collection邊框顏色': getCascadedBorderColor('symbolic', 'rightPanel', 'light', '#ffffff'),
    '符號鍵盤右側collection邊框寬度': getCascadedBorderSize('symbolic', 'rightPanel', 'light', 0),
    '符號鍵盤左側分類選中顏色': getCascadedSimpleProperty('symbolic', 'leftPanel', 'categoryHighlight', 'light', 'keyNormalHighlight', '#ABB0BA'),
    
    // 符號鍵盤系統功能鍵 (返回, 上捲, 下捲, 鎖頭, Delete)
    '符號鍵盤功能键背景颜色-普通': getCascadedColor('symbolic', 'systemKeys', 'keySystem', 'light', '#979faf80', 'normal'),
    '符號鍵盤功能键背景颜色-高亮': getCascadedColor('symbolic', 'systemKeys', 'keySystemHighlight', 'light', '#FFFFFFE6', 'highlight'),
    '符號鍵盤功能键文字颜色': getCascadedTextColor('symbolic', 'systemKeys', 'textMain', 'light', '#000000'),
    '符號鍵盤功能键底边缘颜色-普通': getCascadedShadow('symbolic', 'systemKeys', 'light', 'normal', '#9a9c9a'),
    '符號鍵盤功能键底边缘颜色-高亮': getCascadedShadow('symbolic', 'systemKeys', 'light', 'highlight', '#9a9c9a'),
    '符號鍵盤功能键边框颜色-普通': getCascadedBorderColor('symbolic', 'systemKeys', 'light', '#FFFFFF'),
    '符號鍵盤功能键边框颜色-高亮': getCascadedBorderColor('symbolic', 'systemKeys', 'light', '#FFFFFF'),
    '符號鍵盤功能键边框宽度': getCascadedBorderSize('symbolic', 'systemKeys', 'light', 0),
    
    // 符號鍵盤背景
    '符號键盘背景顏色': getCascadedKeyboardBg('symbolic', 'light', '#D0D3DA01'),

    // === Emoji 鍵盤 (獨立 Override) ===
    'emoji鍵盤左側collection字體顏色': getCascadedTextColor('emoji', 'leftPanel', 'textMain', 'light', '#000000'),
    'emoji鍵盤右側collection字體顏色': getCascadedTextColor('emoji', 'rightPanel', 'textMain', 'light', '#000000'),
    'emoji鍵盤左側collection背景顏色': getCascadedColor('emoji', 'leftPanel', 'panelLeftBg', 'light', '#979faf80', 'normal'),
    'emoji鍵盤左側collection背景下邊緣顏色': getCascadedSimpleProperty('emoji', 'leftPanel', 'shadow', 'light', 'shadow', '#9a9c9a'),
    'emoji鍵盤左側collection邊框顏色': getCascadedBorderColor('emoji', 'leftPanel', 'light', '#979faf80'),
    'emoji鍵盤左側collection邊框寬度': getCascadedBorderSize('emoji', 'leftPanel', 'light', 0),
    'emoji鍵盤右側collection背景顏色': getCascadedColor('emoji', 'rightPanel', 'panelRightBg', 'light', '#ffffff', 'normal'),
    'emoji鍵盤右側collection背景下邊緣顏色': getCascadedSimpleProperty('emoji', 'rightPanel', 'shadow', 'light', 'shadow', '#9a9c9a'),
    'emoji鍵盤右側collection邊框顏色': getCascadedBorderColor('emoji', 'rightPanel', 'light', '#ffffff'),
    'emoji鍵盤右側collection邊框寬度': getCascadedBorderSize('emoji', 'rightPanel', 'light', 0),
    'emoji鍵盤左側分類選中顏色': getCascadedSimpleProperty('emoji', 'leftPanel', 'categoryHighlight', 'light', 'keyNormalHighlight', '#ABB0BA'),
    
    // Emoji 鍵盤系統功能鍵 (返回, 上捲, 下捲, 鎖頭, Delete)
    'emoji鍵盤功能键背景颜色-普通': getCascadedColor('emoji', 'systemKeys', 'keySystem', 'light', '#979faf80', 'normal'),
    'emoji鍵盤功能键背景颜色-高亮': getCascadedColor('emoji', 'systemKeys', 'keySystemHighlight', 'light', '#FFFFFFE6', 'highlight'),
    'emoji鍵盤功能键文字颜色': getCascadedTextColor('emoji', 'systemKeys', 'textMain', 'light', '#000000'),
    'emoji鍵盤功能键底边缘颜色-普通': getCascadedShadow('emoji', 'systemKeys', 'light', 'normal', '#9a9c9a'),
    'emoji鍵盤功能键底边缘颜色-高亮': getCascadedShadow('emoji', 'systemKeys', 'light', 'highlight', '#9a9c9a'),
    'emoji鍵盤功能键边框颜色-普通': getCascadedBorderColor('emoji', 'systemKeys', 'light', '#FFFFFF'),
    'emoji鍵盤功能键边框颜色-高亮': getCascadedBorderColor('emoji', 'systemKeys', 'light', '#FFFFFF'),
    'emoji鍵盤功能键边框宽度': getCascadedBorderSize('emoji', 'systemKeys', 'light', 0),
    
    // Emoji 鍵盤背景
    'emoji键盘背景顏色': getCascadedKeyboardBg('emoji', 'light', '#D0D3DA01'),

    // === 介面與其他 ===
    '底边缘顏色-普通': getCascadedShadow('keyboard26Chinese', 'alphabet', 'light', 'normal', '#9a9c9a'),
    '底边缘顏色-高亮': getCascadedShadow('keyboard26Chinese', 'alphabet', 'light', 'highlight', '#9a9c9a'),
    '边框颜色-普通': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'light', '#FFFFFF'),
    '边框颜色-高亮': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'light', '#FFFFFF'),
    '边框宽度': getCascadedBorderSize('keyboard26Chinese', 'alphabet', 'light', 0),
    '键盘背景顏色': paletteColor('light', 'bg', '#D0D3DA01'),
    '26键键盘背景顏色': getCascadedKeyboardBg('keyboard26Chinese', 'light', '#D0D3DA01'),
    '26键键盘工具列背景顏色': getCascadedToolbarBg('keyboard26Chinese', 'light', '#D0D3DA01'),
    '26键键盘工具列按鈕顏色': getCascadedToolbarButtonColor('keyboard26Chinese', 'light', '#666666'),
    '候選字體選中字體顏色': getCascadedCandidateColor('keyboard26Chinese', 'selectedText', 'light', 'candidateSelectedText', '#000000'),
    '候選字體未選中字體顏色': getCascadedCandidateColor('keyboard26Chinese', 'unselectedText', 'light', 'candidateUnselectedText', '#000000'),
    '選中候選背景顏色': getCascadedCandidateColor('keyboard26Chinese', 'selectedBackground', 'light', 'candidateSelectedBg', '#FFFFFF'),
    'toolbar文字按鍵顏色': paletteColor('light', 'toolbarColor', '#666666'),
    'toolbar符號按鍵顏色': paletteColor('light', 'toolbarColor', '#666666'),
    '工具列文字顏色': paletteColor('light', 'toolbarColor', '#666666'),
    '工具列符號顏色': paletteColor('light', 'toolbarColor', '#666666'),
    '上滑提示文字顏色': getCascadedNestedProperty('keyboard26Chinese', 'alphabet', 'swipeHint', 'color', 'light', 'textSub', '#00000055'),
    '下滑提示文字顏色': getCascadedNestedProperty('keyboard26Chinese', 'alphabet', 'swipeHint', 'color', 'light', 'textSub', '#00000055'),
    
    // 固定值
    '气泡背景顏色': '#ffffff',
    '气泡边缘顏色': '#606060',
    '气泡高亮顏色': '#007AFF',
    '长按选中字体顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'selected', 'light', 'bubbleTextSelected', '#FFFFFF'),
    '长按非选中字体顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'unselected', 'light', 'bubbleTextUnselected', '#000000'),
    '长按选中背景顏色': '#007AFF',
    '长按背景阴影顏色': '#797B7E',
    '长按背景顏色': '#FFFFFF',
    '按键边缘顏色': '#C7C7CC',
    '面板按键前景顏色': '#000000',
    '按下气泡文字顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'unselected', 'light', 'bubbleTextUnselected', '#000000'),
    '划动气泡文字顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'unselected', 'light', 'bubbleTextUnselected', '#000000'),
  },
  dark: {
    // === 字母鍵/一般鍵 (keyboard26, numeric) ===
    '字母键背景颜色-普通': getCascadedColor('keyboard26Chinese', 'alphabet', 'keyNormal', 'dark', '#D1D1D165', 'normal'),
    '字母键背景颜色-高亮': getCascadedColor('keyboard26Chinese', 'alphabet', 'keyNormalHighlight', 'dark', '#D1D1D624', 'highlight'),
    '按键前景颜色': getCascadedTextColor('keyboard26Chinese', 'alphabet', 'textMain', 'dark', '#FFFFFF'),
    '按键文字颜色': getCascadedTextColor('keyboard26Chinese', 'alphabet', 'textMain', 'dark', '#FFFFFF'),
    '空白键文字颜色': getCascadedTextColor('keyboard26Chinese', 'spaceKey', 'textMain', 'dark', '#FFFFFF'),
    '字母键边框顏色-普通': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'dark', '#D1D1D165'),
    '字母键边框顏色-高亮': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'dark', '#D1D1D165'),
    '字母键边框宽度': getCascadedBorderSize('keyboard26Chinese', 'alphabet', 'dark', 0),

    // === 系統功能鍵 ===
    '功能键背景颜色-普通': getCascadedColor('keyboard26Chinese', 'systemKeys', 'keySystem', 'dark', '#D1D1D624', 'normal'),
    '功能键背景颜色-高亮': getCascadedColor('keyboard26Chinese', 'systemKeys', 'keySystemHighlight', 'dark', '#D1D1D659', 'highlight'),
    '系统功能键文字顏色': getCascadedTextColor('keyboard26Chinese', 'systemKeys', 'textMain', 'dark', '#FFFFFF'),
    '系统功能键边框顏色-普通': getCascadedBorderColor('keyboard26Chinese', 'systemKeys', 'dark', '#D1D1D165'),
    '系统功能键边框顏色-高亮': getCascadedBorderColor('keyboard26Chinese', 'systemKeys', 'dark', '#D1D1D165'),
    '系统功能键边框宽度': getCascadedBorderSize('keyboard26Chinese', 'systemKeys', 'dark', 0),

    // === Enter 鍵 ===
    'enter键背景颜色-普通': getCascadedColor('keyboard26Chinese', 'enterKey', 'keyEnter', 'dark', '#D1D1D165', 'normal'),
    'enter键背景颜色-高亮': getCascadedColor('keyboard26Chinese', 'enterKey', 'keyEnterHighlight', 'dark', '#D1D1D659', 'highlight'),
    'enter键文字颜色': getCascadedTextColor('keyboard26Chinese', 'enterKey', 'textMain', 'dark', '#FFFFFF'),
    'enter键边框顏色-普通': getCascadedBorderColor('keyboard26Chinese', 'enterKey', 'dark', '#D1D1D165'),
    'enter键边框顏色-高亮': getCascadedBorderColor('keyboard26Chinese', 'enterKey', 'dark', '#D1D1D165'),
    'enter键边框宽度': getCascadedBorderSize('keyboard26Chinese', 'enterKey', 'dark', 0),

    // === 數字鍵盤 (九宮格) ===
    '数字键文字颜色': getCascadedTextColor('numeric', 'numbers', 'textMain', 'dark', '#FFFFFF'),
    '数字键背景颜色-普通': getCascadedColor('numeric', 'numbers', 'keyNormal', 'dark', '#D1D1D165', 'normal'),
    '数字键背景颜色-高亮': getCascadedColor('numeric', 'numbers', 'keyNormalHighlight', 'dark', '#D1D1D624', 'highlight'),
    '数字键底边缘颜色-普通': getCascadedShadow('numeric', 'numbers', 'dark', 'normal', '#1E1E1E'),
    '数字键底边缘颜色-高亮': getCascadedShadow('numeric', 'numbers', 'dark', 'highlight', '#1E1E1E'),
    '数字键边框颜色-普通': getCascadedBorderColor('numeric', 'numbers', 'dark', '#D1D1D165'),
    '数字键边框颜色-高亮': getCascadedBorderColor('numeric', 'numbers', 'dark', '#D1D1D165'),
    '数字键边框宽度': getCascadedBorderSize('numeric', 'numbers', 'dark', 0),
    '数字键盘左侧collection背景顏色': getCascadedColor('numeric', 'leftPanel', 'numericLeftPanelBg', 'dark', '#D1D1D624', 'normal'),
    '数字键盘左侧collection背景下边缘顏色': getCascadedSimpleProperty('numeric', 'leftPanel', 'shadow', 'dark', 'shadow', '#1E1E1E'),
    '数字键盘左侧collection边框颜色': getCascadedBorderColor('numeric', 'leftPanel', 'dark', '#D1D1D165'),
    '数字键盘左侧collection边框宽度': getCascadedBorderSize('numeric', 'leftPanel', 'dark', 0),
    
    // 數字鍵盤系統功能鍵 (返回, #+=, 空格, Delete, ., =)
    '数字键盘功能键背景颜色-普通': getCascadedColor('numeric', 'systemKeys', 'keySystem', 'dark', '#D1D1D624', 'normal'),
    '数字键盘功能键背景颜色-高亮': getCascadedColor('numeric', 'systemKeys', 'keySystemHighlight', 'dark', '#D1D1D659', 'highlight'),
    '数字键盘功能键文字颜色': getCascadedTextColor('numeric', 'systemKeys', 'textMain', 'dark', '#FFFFFF'),
    '数字键盘功能键底边缘颜色-普通': getCascadedShadow('numeric', 'systemKeys', 'dark', 'normal', '#1E1E1E'),
    '数字键盘功能键底边缘颜色-高亮': getCascadedShadow('numeric', 'systemKeys', 'dark', 'highlight', '#1E1E1E'),
    '数字键盘功能键边框颜色-普通': getCascadedBorderColor('numeric', 'systemKeys', 'dark', '#D1D1D165'),
    '数字键盘功能键边框颜色-高亮': getCascadedBorderColor('numeric', 'systemKeys', 'dark', '#D1D1D165'),
    '数字键盘功能键边框宽度': getCascadedBorderSize('numeric', 'systemKeys', 'dark', 0),
    
    // 數字鍵盤 Enter 鍵專用
    '数字键盘enter键背景颜色-普通': getCascadedColor('numeric', 'enterKey', 'keyEnter', 'dark', '#D1D1D165', 'normal'),
    '数字键盘enter键背景颜色-高亮': getCascadedColor('numeric', 'enterKey', 'keyEnterHighlight', 'dark', '#D1D1D659', 'highlight'),
    '数字键盘enter键文字颜色': getCascadedTextColor('numeric', 'enterKey', 'textMain', 'dark', '#FFFFFF'),
    '数字键盘enter键底边缘颜色-普通': getCascadedShadow('numeric', 'enterKey', 'dark', 'normal', '#1E1E1E'),
    '数字键盘enter键底边缘颜色-高亮': getCascadedShadow('numeric', 'enterKey', 'dark', 'highlight', '#1E1E1E'),
    '数字键盘enter键边框颜色-普通': getCascadedBorderColor('numeric', 'enterKey', 'dark', '#D1D1D165'),
    '数字键盘enter键边框颜色-高亮': getCascadedBorderColor('numeric', 'enterKey', 'dark', '#D1D1D165'),
    '数字键盘enter键边框宽度': getCascadedBorderSize('numeric', 'enterKey', 'dark', 0),
    
    // 數字鍵盤背景
    '数字键盘背景顏色': getCascadedKeyboardBg('numeric', 'dark', '#1C1C1E01'),
    '数字键盘工具列背景顏色': getCascadedToolbarBg('numeric', 'dark', '#1C1C1E01'),
    '数字键盘工具列按鈕顏色': getCascadedToolbarButtonColor('numeric', 'dark', '#CCCCCC'),

    // === 符號鍵盤 (Symbolic) ===
    '符號鍵盤左側collection字體顏色': getCascadedTextColor('symbolic', 'leftPanel', 'textMain', 'dark', '#FFFFFF'),
    '符號鍵盤右側collection字體顏色': getCascadedTextColor('symbolic', 'rightPanel', 'textMain', 'dark', '#FFFFFF'),
    '符號鍵盤左側collection背景顏色': getCascadedColor('symbolic', 'leftPanel', 'panelLeftBg', 'dark', '#D1D1D624', 'normal'),
    '符號鍵盤左側collection背景下邊緣顏色': getCascadedSimpleProperty('symbolic', 'leftPanel', 'shadow', 'dark', 'shadow', '#1E1E1E'),
    '符號鍵盤左側collection邊框顏色': getCascadedBorderColor('symbolic', 'leftPanel', 'dark', '#D1D1D624'),
    '符號鍵盤左側collection邊框寬度': getCascadedBorderSize('symbolic', 'leftPanel', 'dark', 0),
    '符號鍵盤右側collection背景顏色': getCascadedColor('symbolic', 'rightPanel', 'panelRightBg', 'dark', '#D1D1D165', 'normal'),
    '符號鍵盤右側collection背景下邊緣顏色': getCascadedSimpleProperty('symbolic', 'rightPanel', 'shadow', 'dark', 'shadow', '#1E1E1E'),
    '符號鍵盤右側collection邊框顏色': getCascadedBorderColor('symbolic', 'rightPanel', 'dark', '#D1D1D165'),
    '符號鍵盤右側collection邊框寬度': getCascadedBorderSize('symbolic', 'rightPanel', 'dark', 0),
    '符號鍵盤左側分類選中顏色': getCascadedSimpleProperty('symbolic', 'leftPanel', 'categoryHighlight', 'dark', 'keyNormalHighlight', '#D1D1D624'),
    
    // 符號鍵盤系統功能鍵 (返回, 上捲, 下捲, 鎖頭, Delete)
    '符號鍵盤功能键背景颜色-普通': getCascadedColor('symbolic', 'systemKeys', 'keySystem', 'dark', '#D1D1D624', 'normal'),
    '符號鍵盤功能键背景颜色-高亮': getCascadedColor('symbolic', 'systemKeys', 'keySystemHighlight', 'dark', '#D1D1D659', 'highlight'),
    '符號鍵盤功能键文字颜色': getCascadedTextColor('symbolic', 'systemKeys', 'textMain', 'dark', '#FFFFFF'),
    '符號鍵盤功能键底边缘颜色-普通': getCascadedShadow('symbolic', 'systemKeys', 'dark', 'normal', '#1E1E1E'),
    '符號鍵盤功能键底边缘颜色-高亮': getCascadedShadow('symbolic', 'systemKeys', 'dark', 'highlight', '#1E1E1E'),
    '符號鍵盤功能键边框颜色-普通': getCascadedBorderColor('symbolic', 'systemKeys', 'dark', '#D1D1D165'),
    '符號鍵盤功能键边框颜色-高亮': getCascadedBorderColor('symbolic', 'systemKeys', 'dark', '#D1D1D165'),
    '符號鍵盤功能键边框宽度': getCascadedBorderSize('symbolic', 'systemKeys', 'dark', 0),
    
    // 符號鍵盤背景
    '符號键盘背景顏色': getCascadedKeyboardBg('symbolic', 'dark', '#1C1C1E01'),

    // === Emoji 鍵盤 (獨立 Override) ===
    'emoji鍵盤左側collection字體顏色': getCascadedTextColor('emoji', 'leftPanel', 'textMain', 'dark', '#FFFFFF'),
    'emoji鍵盤右側collection字體顏色': getCascadedTextColor('emoji', 'rightPanel', 'textMain', 'dark', '#FFFFFF'),
    'emoji鍵盤左側collection背景顏色': getCascadedColor('emoji', 'leftPanel', 'panelLeftBg', 'dark', '#D1D1D624', 'normal'),
    'emoji鍵盤左側collection背景下邊緣顏色': getCascadedSimpleProperty('emoji', 'leftPanel', 'shadow', 'dark', 'shadow', '#1E1E1E'),
    'emoji鍵盤左側collection邊框顏色': getCascadedBorderColor('emoji', 'leftPanel', 'dark', '#D1D1D624'),
    'emoji鍵盤左側collection邊框寬度': getCascadedBorderSize('emoji', 'leftPanel', 'dark', 0),
    'emoji鍵盤右側collection背景顏色': getCascadedColor('emoji', 'rightPanel', 'panelRightBg', 'dark', '#D1D1D165', 'normal'),
    'emoji鍵盤右側collection背景下邊緣顏色': getCascadedSimpleProperty('emoji', 'rightPanel', 'shadow', 'dark', 'shadow', '#1E1E1E'),
    'emoji鍵盤右側collection邊框顏色': getCascadedBorderColor('emoji', 'rightPanel', 'dark', '#D1D1D165'),
    'emoji鍵盤右側collection邊框寬度': getCascadedBorderSize('emoji', 'rightPanel', 'dark', 0),
    'emoji鍵盤左側分類選中顏色': getCascadedSimpleProperty('emoji', 'leftPanel', 'categoryHighlight', 'dark', 'keyNormalHighlight', '#D1D1D624'),
    
    // Emoji 鍵盤系統功能鍵 (返回, 上捲, 下捲, 鎖頭, Delete)
    'emoji鍵盤功能键背景颜色-普通': getCascadedColor('emoji', 'systemKeys', 'keySystem', 'dark', '#D1D1D624', 'normal'),
    'emoji鍵盤功能键背景颜色-高亮': getCascadedColor('emoji', 'systemKeys', 'keySystemHighlight', 'dark', '#D1D1D659', 'highlight'),
    'emoji鍵盤功能键文字颜色': getCascadedTextColor('emoji', 'systemKeys', 'textMain', 'dark', '#FFFFFF'),
    'emoji鍵盤功能键底边缘颜色-普通': getCascadedShadow('emoji', 'systemKeys', 'dark', 'normal', '#1E1E1E'),
    'emoji鍵盤功能键底边缘颜色-高亮': getCascadedShadow('emoji', 'systemKeys', 'dark', 'highlight', '#1E1E1E'),
    'emoji鍵盤功能键边框颜色-普通': getCascadedBorderColor('emoji', 'systemKeys', 'dark', '#D1D1D165'),
    'emoji鍵盤功能键边框颜色-高亮': getCascadedBorderColor('emoji', 'systemKeys', 'dark', '#D1D1D165'),
    'emoji鍵盤功能键边框宽度': getCascadedBorderSize('emoji', 'systemKeys', 'dark', 0),
    
    // Emoji 鍵盤背景
    'emoji键盘背景顏色': getCascadedKeyboardBg('emoji', 'dark', '#1C1C1E01'),

    // === 介面與其他 ===
    '底边缘顏色-普通': getCascadedShadow('keyboard26Chinese', 'alphabet', 'dark', 'normal', '#1E1E1E'),
    '底边缘顏色-高亮': getCascadedShadow('keyboard26Chinese', 'alphabet', 'dark', 'highlight', '#1E1E1E'),
    '边框颜色-普通': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'dark', '#D1D1D165'),
    '边框颜色-高亮': getCascadedBorderColor('keyboard26Chinese', 'alphabet', 'dark', '#D1D1D165'),
    '边框宽度': getCascadedBorderSize('keyboard26Chinese', 'alphabet', 'dark', 0),
    '键盘背景顏色': paletteColor('dark', 'bg', '#1C1C1E01'),
    '26键键盘背景顏色': getCascadedKeyboardBg('keyboard26Chinese', 'dark', '#1C1C1E01'),
    '26键键盘工具列背景顏色': getCascadedToolbarBg('keyboard26Chinese', 'dark', '#1C1C1E01'),
    '26键键盘工具列按鈕顏色': getCascadedToolbarButtonColor('keyboard26Chinese', 'dark', '#CCCCCC'),
    '候選字體選中字體顏色': getCascadedCandidateColor('keyboard26Chinese', 'selectedText', 'dark', 'candidateSelectedText', '#FFFFFF'),
    '候選字體未選中字體顏色': getCascadedCandidateColor('keyboard26Chinese', 'unselectedText', 'dark', 'candidateUnselectedText', '#FFFFFF'),
    '選中候選背景顏色': getCascadedCandidateColor('keyboard26Chinese', 'selectedBackground', 'dark', 'candidateSelectedBg', '#D1D1D165'),
    'toolbar文字按鍵顏色': paletteColor('dark', 'toolbarColor', '#CCCCCC'),
    'toolbar符號按鍵顏色': paletteColor('dark', 'toolbarColor', '#CCCCCC'),
    '工具列文字顏色': paletteColor('dark', 'toolbarColor', '#CCCCCC'),
    '工具列符號顏色': paletteColor('dark', 'toolbarColor', '#CCCCCC'),
    '上滑提示文字顏色': getCascadedNestedProperty('keyboard26Chinese', 'alphabet', 'swipeHint', 'color', 'dark', 'textSub', '#FFFFFF55'),
    '下滑提示文字顏色': getCascadedNestedProperty('keyboard26Chinese', 'alphabet', 'swipeHint', 'color', 'dark', 'textSub', '#FFFFFF55'),

    // 固定值
    '气泡背景顏色': '#6B6B6B',
    '气泡边缘顏色': '#606060',
    '气泡高亮顏色': '#007AFF',
    '长按选中字体顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'selected', 'dark', 'bubbleTextSelected', '#FFFFFF'),
    '长按非选中字体顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'unselected', 'dark', 'bubbleTextUnselected', '#FFFFFF'),
    '长按选中背景顏色': '#007AFF',
    '长按背景阴影顏色': '#00000050',
    '长按背景顏色': '#6B6B6B',
    '按键边缘顏色': '#C7C7CC',
    '面板按键前景顏色': '#FFFFFF',
    '按下气泡文字顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'unselected', 'dark', 'bubbleTextUnselected', '#FFFFFF'),
    '划动气泡文字顏色': getCascadedBubbleTextColor('keyboard26Chinese', 'unselected', 'dark', 'bubbleTextUnselected', '#FFFFFF'),
  }
}
