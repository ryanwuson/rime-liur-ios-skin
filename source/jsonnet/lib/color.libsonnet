// 顏色定義 - 支援統一配色系統
local settings = import '../Settings.libsonnet';

// 獲取按鍵背景配色的輔助函數
local getKeyboardColor = function(keyType, theme, colorType, state)
  if settings.customColors.enableCustomColors then
    local keyboardColors = settings.customColors.keyboardColors;
    local keyConfig = keyboardColors[keyType];
    if keyConfig != null then
      local themeConfig = keyConfig[theme];
      if themeConfig != null then
        local colorConfig = themeConfig[colorType];
        if colorConfig != null then
          if std.isObject(colorConfig) then
            colorConfig[state]
          else
            colorConfig
        else
          null
      else
        null
    else
      null
  else
    null;

// 安全獲取顏色值（支援預設值）
local safeGetColor = function(keyType, theme, colorType, state, defaultColor)
  local customColor = getKeyboardColor(keyType, theme, colorType, state);
  if customColor != null then customColor else defaultColor;

// 獲取陰影配色的輔助函數
local getShadowColor = function(theme, state, defaultColor)
  if settings.customColors.enableCustomColors then
    local shadowConfig = settings.customColors.keyboardColors.shadow;
    if shadowConfig != null then
      local themeConfig = shadowConfig[theme];
      if themeConfig != null then
        local stateColor = themeConfig[state];
        if stateColor != null then stateColor else defaultColor
      else
        defaultColor
    else
      defaultColor
  else
    defaultColor;

// 獲取簡單配色值（無狀態）的輔助函數
local getSimpleColor = function(keyType, theme, colorType, defaultColor)
  if settings.customColors.enableCustomColors then
    local keyboardColors = settings.customColors.keyboardColors;
    local keyConfig = keyboardColors[keyType];
    if keyConfig != null then
      local themeConfig = keyConfig[theme];
      if themeConfig != null then
        local colorValue = themeConfig[colorType];
        if colorValue != null then colorValue else defaultColor
      else
        defaultColor
    else
      defaultColor
  else
    defaultColor;

// 獲取鍵盤背景配色的輔助函數
local getKeyboardBackgroundColor = function(theme, defaultColor)
  if settings.customColors.enableCustomColors then
    local customColor = settings.customColors.keyboardColors.background[theme];
    if customColor != null then customColor else defaultColor
  else
    defaultColor;

// 獲取特殊鍵盤配色的輔助函數
local getSpecialKeyboardColor = function(keyboardType, theme, colorType, defaultColor)
  if settings.customColors.enableCustomColors then
    local specialKeyboards = settings.customColors.specialKeyboards;
    local keyboardConfig = specialKeyboards[keyboardType];
    if keyboardConfig != null then
      local themeConfig = keyboardConfig[theme];
      if themeConfig != null then
        local colorConfig = themeConfig[colorType];
        if colorConfig != null then
          if std.isObject(colorConfig) then
            colorConfig.color
          else
            colorConfig
        else
          defaultColor
      else
        defaultColor
    else
      defaultColor
  else
    defaultColor;

// 獲取互動提示配色的輔助函數
local getInteractionColor = function(colorCategory, theme, colorType, defaultColor)
  if settings.customColors.enableCustomColors then
    local interactionColors = settings.customColors.interactionColors;
    local categoryConfig = interactionColors[colorCategory];
    if categoryConfig != null then
      local themeConfig = categoryConfig[theme];
      if themeConfig != null then
        local colorConfig = themeConfig[colorType];
        if colorConfig != null then colorConfig else defaultColor
      else
        defaultColor
    else
      defaultColor
  else
    defaultColor;

// 獲取介面元素配色的輔助函數
local getInterfaceColor = function(elementType, theme, colorType, defaultColor)
  if settings.customColors.enableCustomColors then
    local interfaceColors = settings.customColors.interfaceColors;
    local elementConfig = interfaceColors[elementType];
    if elementConfig != null then
      local themeConfig = elementConfig[theme];
      if themeConfig != null then
        local colorConfig = themeConfig[colorType];
        if colorConfig != null then colorConfig else defaultColor
      else
        defaultColor
    else
      defaultColor
  else
    defaultColor;

// 獲取符號鍵盤配色的輔助函數
local getSymbolKeyboardColor = function(theme, panelType, colorType, defaultColor)
  if settings.customColors.enableCustomColors then
    local symbolKeyboard = settings.customColors.specialKeyboards.symbolKeyboard;
    if symbolKeyboard != null then
      local themeConfig = symbolKeyboard[theme];
      if themeConfig != null then
        local panelConfig = themeConfig[panelType];
        if panelConfig != null then
          local colorValue = panelConfig[colorType];
          if colorValue != null then colorValue else defaultColor
        else
          defaultColor
      else
        defaultColor
    else
      defaultColor
  else
    defaultColor;

{
  light: {
    // 字母鍵配色 - 支援自訂
    '字母键背景颜色-普通': safeGetColor('letterNumberKeys', 'light', 'background', 'normal', '#FFFFFF'),
    '字母键背景颜色-高亮': safeGetColor('letterNumberKeys', 'light', 'background', 'highlight', '#ABB0BA'),

    // 系統功能鍵配色 - 支援自訂
    '功能键背景颜色-普通': safeGetColor('systemKeys', 'light', 'background', 'normal', '#979faf80'),
    '功能键背景颜色-高亮': safeGetColor('systemKeys', 'light', 'background', 'highlight', '#FFFFFFE6'),

    // 主題色按鈕配色 - 支援自訂
    'enter键背景(蓝色)': safeGetColor('accentKeys', 'light', 'background', 'normal', '#007AFF'),

    // 氣泡提示框配色 - 由圖片控制（hint.png），不支援自訂
    '气泡背景颜色': '#ffffff',
    '气泡边缘颜色': '#606060',
    '气泡高亮颜色': '#007AFF',

    // 底部邊緣配色 - 支援自訂
    '底边缘颜色-普通': getShadowColor('light', 'normal', '#9a9c9a'),
    '底边缘颜色-高亮': getShadowColor('light', 'highlight', '#9a9c9a'),

    // 長按選單配色 - 支援文字顏色自訂
    '长按选中字体颜色': getInteractionColor('bubbles', 'light', 'text', '#FFFFFF'),
    '长按非选中字体颜色': getInteractionColor('bubbles', 'light', 'text', '#000000'),
    '长按选中背景颜色': '#007AFF',
    '长按背景阴影颜色': '#797B7E',
    '长按背景颜色': '#FFFFFF',

    // 候選字配色 - 支援自訂
    '候选字体选中字体颜色': getInterfaceColor('candidates', 'light', 'selectedText', '#000000'),
    '候选字体未选中字体颜色': getInterfaceColor('candidates', 'light', 'unselectedText', '#000000'),
    '选中候选背景颜色': getInterfaceColor('candidates', 'light', 'selectedBackground', '#FFFFFF'),

    // 工具列配色 - 支援自訂
    'toolbar文字按键颜色': getInterfaceColor('toolbar', 'light', 'color', '#666666'),
    'toolbar符号按键颜色': getInterfaceColor('toolbar', 'light', 'color', '#666666'),
    '按下气泡文字颜色': getInteractionColor('bubbles', 'light', 'text', '#000000'),
    '划动气泡文字颜色': getInteractionColor('bubbles', 'light', 'text', '#000000'),

    // 符號鍵盤配色 - 支援自訂
    '符号键盘左侧collection字体颜色': getSymbolKeyboardColor('light', 'leftPanel', 'text', '#000000'),
    '符号键盘右侧collection字体颜色': getSymbolKeyboardColor('light', 'rightPanel', 'text', '#000000'),
    '符号键盘左侧collection背景颜色': getSymbolKeyboardColor('light', 'leftPanel', 'background', '#979faf80'),
    '符号键盘左侧collection背景下边缘颜色': getSymbolKeyboardColor('light', 'leftPanel', 'shadow', '#9a9c9a'),
    '符号键盘右侧collection背景颜色': getSymbolKeyboardColor('light', 'rightPanel', 'background', '#ffffff'),
    '符号键盘右侧collection背景下边缘颜色': getSymbolKeyboardColor('light', 'rightPanel', 'shadow', '#88898D40'),
    '按键边缘颜色': '#C7C7CC',

    // 面板浮動鍵盤配色 - 支援自訂
    '面板按键前景颜色': getInterfaceColor('panels', 'light', 'foreground', '#000000'),
    
    // 按鍵文字配色 - 支援自訂
    '按键前景颜色': getSimpleColor('letterNumberKeys', 'light', 'text', '#000000'),
    '按键文字颜色': getSimpleColor('letterNumberKeys', 'light', 'text', '#000000'),
    '空白键文字颜色': getSimpleColor('spaceKeyText', 'light', 'color', '#000000'),
    '系统功能键文字颜色': getSimpleColor('systemKeys', 'light', 'text', '#000000'),
    '数字键文字颜色': getSpecialKeyboardColor('numericKeyboard', 'light', 'numbers', '#000000'),
    '上滑提示文字颜色': getInteractionColor('swipeHints', 'light', 'upSwipe', '#00000055'),
    '下滑提示文字颜色': getInteractionColor('swipeHints', 'light', 'downSwipe', '#00000055'),
    '工具列文字颜色': getInterfaceColor('toolbar', 'light', 'color', '#666666'),
    '工具列符号颜色': getInterfaceColor('toolbar', 'light', 'color', '#666666'),
    
    // 鍵盤背景配色 - 支援自訂
    '键盘背景颜色': getKeyboardBackgroundColor('light', '#D0D3DA01'),
  },
  dark: {
    // 字母鍵配色 - 支援自訂
    '字母键背景颜色-普通': safeGetColor('letterNumberKeys', 'dark', 'background', 'normal', '#D1D1D165'),
    '字母键背景颜色-高亮': safeGetColor('letterNumberKeys', 'dark', 'background', 'highlight', '#D1D1D624'),

    // 系統功能鍵配色 - 支援自訂
    '功能键背景颜色-普通': safeGetColor('systemKeys', 'dark', 'background', 'normal', '#D1D1D624'),
    '功能键背景颜色-高亮': safeGetColor('systemKeys', 'dark', 'background', 'highlight', '#D1D1D659'),

    // 主題色按鈕配色 - 支援自訂
    'enter键背景(蓝色)': safeGetColor('accentKeys', 'dark', 'background', 'normal', '#007AFF'),

    // 氣泡提示框配色 - 由圖片控制（hint.png），不支援自訂
    '气泡背景颜色': '#6B6B6B',
    '气泡边缘颜色': '#606060',
    '气泡高亮颜色': '#007AFF',

    // 底部邊緣配色 - 支援自訂
    '底边缘颜色-普通': getShadowColor('dark', 'normal', '#1E1E1E'),
    '底边缘颜色-高亮': getShadowColor('dark', 'highlight', '#1D1D1D'),

    // 長按選單配色 - 支援文字顏色自訂
    '长按选中字体颜色': getInteractionColor('bubbles', 'dark', 'text', '#FFFFFF'),
    '长按非选中字体颜色': getInteractionColor('bubbles', 'dark', 'text', '#FFFFFF'),
    '长按选中背景颜色': '#007AFF',
    '长按背景阴影颜色': '#00000050',
    '长按背景颜色': '#6B6B6B',

    // 候選字配色 - 支援自訂
    '候选字体选中字体颜色': getInterfaceColor('candidates', 'dark', 'selectedText', '#ffffff'),
    '候选字体未选中字体颜色': getInterfaceColor('candidates', 'dark', 'unselectedText', '#ffffff'),
    '选中候选背景颜色': getInterfaceColor('candidates', 'dark', 'selectedBackground', '#D1D1D165'),

    // 工具列配色 - 支援自訂
    'toolbar文字按键颜色': getInterfaceColor('toolbar', 'dark', 'color', '#CCCCCC'),
    'toolbar符号按键颜色': getInterfaceColor('toolbar', 'dark', 'color', '#CCCCCC'),
    '按下气泡文字颜色': getInteractionColor('bubbles', 'dark', 'text', '#FFFFFF'),
    '划动气泡文字颜色': getInteractionColor('bubbles', 'dark', 'text', '#FFFFFF'),

    // 符號鍵盤配色 - 支援自訂
    '符号键盘左侧collection字体颜色': getSymbolKeyboardColor('dark', 'leftPanel', 'text', '#FFFFFF'),
    '符号键盘右侧collection字体颜色': getSymbolKeyboardColor('dark', 'rightPanel', 'text', '#FFFFFF'),
    '符号键盘左侧collection背景颜色': getSymbolKeyboardColor('dark', 'leftPanel', 'background', '#D1D1D624'),
    '符号键盘左侧collection背景下边缘颜色': getSymbolKeyboardColor('dark', 'leftPanel', 'shadow', '#1E1E1E'),
    '符号键盘右侧collection背景颜色': getSymbolKeyboardColor('dark', 'rightPanel', 'background', '#D1D1D165'),
    '符号键盘右侧collection背景下边缘颜色': getSymbolKeyboardColor('dark', 'rightPanel', 'shadow', '#343941'),
    '按键边缘颜色': '#C7C7CC',

    // 面板浮動鍵盤配色 - 支援自訂
    '面板按键前景颜色': getInterfaceColor('panels', 'dark', 'foreground', '#FFFFFF'),

    // 按鍵文字配色 - 支援自訂
    '按键前景颜色': getSimpleColor('letterNumberKeys', 'dark', 'text', '#FFFFFF'),
    '按键文字颜色': getSimpleColor('letterNumberKeys', 'dark', 'text', '#FFFFFF'),
    '空白键文字颜色': getSimpleColor('spaceKeyText', 'dark', 'color', '#FFFFFF'),
    '系统功能键文字颜色': getSimpleColor('systemKeys', 'dark', 'text', '#FFFFFF'),
    '数字键文字颜色': getSpecialKeyboardColor('numericKeyboard', 'dark', 'numbers', '#FFFFFF'),
    '上滑提示文字颜色': getInteractionColor('swipeHints', 'dark', 'upSwipe', '#FFFFFF55'),
    '下滑提示文字颜色': getInteractionColor('swipeHints', 'dark', 'downSwipe', '#FFFFFF55'),
    '工具列文字颜色': getInterfaceColor('toolbar', 'dark', 'color', '#CCCCCC'),
    '工具列符号颜色': getInterfaceColor('toolbar', 'dark', 'color', '#CCCCCC'),

    // 鍵盤背景配色 - 支援自訂
    '键盘背景颜色': getKeyboardBackgroundColor('dark', '#47474701'),
  },
}
