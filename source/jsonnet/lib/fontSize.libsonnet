// 字號定義 - 支援統一配色系統
local settings = import '../Settings.libsonnet';

// 獲取鍵盤配色字號的輔助函數
local getKeyboardFontSize = function(keyType, theme, sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local keyboardColors = settings.customColors.keyboardColors;
    local keyConfig = keyboardColors[keyType];
    if keyConfig != null then
      local themeConfig = keyConfig[theme];
      if themeConfig != null then
        local fontSizeConfig = themeConfig.fontSize;
        if fontSizeConfig != null then
          if std.isObject(fontSizeConfig) then
            local sizeValue = fontSizeConfig[sizeType];
            if sizeValue != null then sizeValue else defaultSize
          else
            fontSizeConfig
        else
          defaultSize
      else
        defaultSize
    else
      defaultSize
  else
    defaultSize;

// 獲取簡單字號的輔助函數（無子類型）
local getSimpleFontSize = function(keyType, theme, defaultSize)
  if settings.customColors.enableCustomColors then
    local keyboardColors = settings.customColors.keyboardColors;
    local keyConfig = keyboardColors[keyType];
    if keyConfig != null then
      local themeConfig = keyConfig[theme];
      if themeConfig != null then
        local fontSize = themeConfig.fontSize;
        if fontSize != null then fontSize else defaultSize
      else
        defaultSize
    else
      defaultSize
  else
    defaultSize;

// 獲取特殊鍵盤字號的輔助函數
local getSpecialKeyboardFontSize = function(keyboardType, theme, sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local specialKeyboards = settings.customColors.specialKeyboards;
    local keyboardConfig = specialKeyboards[keyboardType];
    if keyboardConfig != null then
      local themeConfig = keyboardConfig[theme];
      if themeConfig != null then
        local fontSizeConfig = themeConfig[sizeType];
        if fontSizeConfig != null then
          if std.isObject(fontSizeConfig) then
            fontSizeConfig.fontSize
          else
            fontSizeConfig
        else
          defaultSize
      else
        defaultSize
    else
      defaultSize
  else
    defaultSize;

// 獲取互動提示字號的輔助函數
local getInteractionFontSize = function(colorCategory, theme, defaultSize)
  if settings.customColors.enableCustomColors then
    local interactionColors = settings.customColors.interactionColors;
    local categoryConfig = interactionColors[colorCategory];
    if categoryConfig != null then
      local themeConfig = categoryConfig[theme];
      if themeConfig != null then
        local fontSize = themeConfig.fontSize;
        if fontSize != null then fontSize else defaultSize
      else
        defaultSize
    else
      defaultSize
  else
    defaultSize;

// 獲取介面元素字號的輔助函數
local getInterfaceFontSize = function(elementType, theme, defaultSize)
  if settings.customColors.enableCustomColors then
    local interfaceColors = settings.customColors.interfaceColors;
    local elementConfig = interfaceColors[elementType];
    if elementConfig != null then
      local themeConfig = elementConfig[theme];
      if themeConfig != null then
        local fontSize = themeConfig.fontSize;
        if fontSize != null then fontSize else defaultSize
      else
        defaultSize
    else
      defaultSize
  else
    defaultSize;

// 獲取符號鍵盤字號的輔助函數
local getSymbolKeyboardFontSize = function(theme, panelType, defaultSize)
  if settings.customColors.enableCustomColors then
    local symbolKeyboard = settings.customColors.specialKeyboards.symbolKeyboard;
    if symbolKeyboard != null then
      local themeConfig = symbolKeyboard[theme];
      if themeConfig != null then
        local panelConfig = themeConfig[panelType];
        if panelConfig != null then
          local fontSize = panelConfig.fontSize;
          if fontSize != null then fontSize else defaultSize
        else
          defaultSize
      else
        defaultSize
    else
      defaultSize
  else
    defaultSize;

{
  // 候選字字號（元書 App 介面可調整，使用預設值）
  '未展开候选字体选中字体大小': 16,
  '未展开comment字体大小': 14,
  '展开候选字体选中字体大小': 16,
  '展开comment字体大小': 13,
  'preedit区字体大小': 17,

  // 滑動提示文字大小（支援自訂）
  '上划文字大小': getInteractionFontSize('swipeHints', 'light', 8),
  '下划文字大小': getInteractionFontSize('swipeHints', 'light', 8),

  // 氣泡字號（固定值，配合圖形檔氣泡）
  '划动气泡前景文字大小': 18,        # 滑動氣泡前景文字大小（固定值）
  '长按气泡文字大小': 20,           # 長按氣泡文字大小（固定值）
  '长按气泡sf符号大小': 12,         # 長按氣泡符號大小（固定值）
  '长按符号选单动作文字大小': 13,    # 長按符號選單動作文字大小（固定值）
  '长按符号选单日期文字大小': 14,    # 長按符號選單日期文字大小（固定值）

  // 按鍵文字大小（支援自訂）
  '按键前景文字大小': getKeyboardFontSize('letterNumberKeys', 'light', 'primary', 21),
  '按键前景文字大小-小写': getKeyboardFontSize('letterNumberKeys', 'light', 'lowercase', 23),
  '按键前景文字大小-大写': getKeyboardFontSize('englishKeyboard', 'light', 'uppercase', 21),
  '按键前景文字大小-提示': 26,  # 固定值，英文鍵盤沒有提示功能
  '按键前景sf符号大小': 20,

  // 工具列字號（支援自訂）
  'toolbar按键前景sf符号大小': getInterfaceFontSize('toolbar', 'light', 20),
  'toolbar按键前景文字大小': getInterfaceFontSize('toolbar', 'light', 20),

  // 数字键盘
  'collection前景字体大小': 18,  // 數字鍵盤符號區字號（固定值）
  '数字键盘数字前景字体大小': getSpecialKeyboardFontSize('numericKeyboard', 'light', 'numbers', 24),

  // 中文九键
  '中文九键字符键前景文字大小': 15,
  '中文九键字根前景文字大小': 10,
  '中文九键划动文字大小': 10,

  // 符号键盘（支援自訂字號）
  '符号键盘左侧collection前景字体大小': getSymbolKeyboardFontSize('light', 'leftPanel', 13),
  '符号键盘右侧collection前景字体大小': getSymbolKeyboardFontSize('light', 'rightPanel', 16),

  // panel键盘
  'panel按键前景文字大小': 12,
  'panel按键前景sf符号大小': 16,

  // 空白鍵字號（統一支援自訂）
  '英文空白键文字大小': getSimpleFontSize('spaceKeyText', 'light', 14),

  // 候選字索引字號（元書 App 介面可調整，使用預設值）
  '水平候选字索引字体大小': 12,
  '垂直候选字索引字体大小': 12,

  // 垂直候選控制按鈕字號（跟隨系統功能鍵字號）
  '垂直候选控制按钮字体大小': getSimpleFontSize('systemKeys', 'light', 16),
  '垂直候选返回按钮字体大小': getSimpleFontSize('systemKeys', 'light', 16),
}
