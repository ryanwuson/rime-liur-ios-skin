// 顏色定義 - 支援自訂配色系統
local settings = import '../Settings.libsonnet';

// 獲取按鈕配色的輔助函數
local getButtonColor = function(buttonType, theme, colorType, state)
  if settings.customColors.enableCustomColors then
    settings.customColors[buttonType][theme][colorType][state]
  else
    null;  // 返回 null 表示使用原版配色

// 安全獲取顏色值（支援預設值）
local safeGetColor = function(buttonType, theme, colorType, state, defaultColor)
  local customColor = getButtonColor(buttonType, theme, colorType, state);
  if customColor != null then customColor else defaultColor;

// 獲取鍵盤背景配色的輔助函數
local getKeyboardColor = function(theme, defaultColor)
  if settings.customColors.enableCustomColors then
    local customColor = settings.customColors.keyboard[theme].background;
    if customColor != null then customColor else defaultColor
  else
    defaultColor;

// 獲取進階配色的輔助函數
local getAdvancedColor = function(colorCategory, theme, colorType, defaultColor)
  if settings.advancedColors.enableAdvancedColors then
    local advancedColor = settings.advancedColors[colorCategory][theme][colorType];
    if advancedColor != null then advancedColor else defaultColor
  else
    defaultColor;

// 獲取按鍵文字配色的輔助函數
local getKeyTextColor = function(theme, textType, defaultColor)
  if settings.customColors.enableCustomColors then
    local customColor = std.get(settings.customColors.keyText[theme], textType, null);
    if customColor != null then customColor else defaultColor
  else
    defaultColor;

// 獲取系統功能鍵文字配色的輔助函數
local getSystemKeyTextColor = function(theme, state, defaultColor)
  if settings.customColors.enableCustomColors then
    local customColor = std.get(settings.customColors.systemKeyText[theme], state, null);
    if customColor != null then customColor else defaultColor
  else
    defaultColor;

// 獲取數字鍵文字配色的輔助函數
local getNumericKeysTextColor = function(theme, defaultColor)
  if settings.customColors.enableCustomColors then
    local customColor = std.get(settings.customColors.numericKeys[theme], 'numbers', null);
    if customColor != null then customColor else defaultColor
  else
    defaultColor;

// 獲取滑動提示文字配色的輔助函數
local getSwipeTextColor = function(theme, swipeType, defaultColor)
  if settings.customColors.enableCustomColors then
    local customColor = std.get(settings.customColors.swipeText[theme], swipeType, null);
    if customColor != null then customColor else defaultColor
  else
    defaultColor;

// 獲取工具列顏色的輔助函數
local getToolbarColor = function(theme, defaultColor)
  if settings.advancedColors.enableAdvancedColors then
    local customColor = std.get(settings.advancedColors.toolbar[theme], 'color', null);
    if customColor != null then customColor else defaultColor
  else
    defaultColor;

{
  light: {
    // 字母鍵配色 - 支援自訂
    '字母键背景颜色-普通': safeGetColor('alphabeticButton', 'light', 'background', 'normal', '#FFFFFF'),
    '字母键背景颜色-高亮': safeGetColor('alphabeticButton', 'light', 'background', 'highlight', '#ABB0BA'),

    // 系統功能鍵配色 - 支援自訂
    '功能键背景颜色-普通': safeGetColor('systemButton', 'light', 'background', 'normal', '#979faf80'),
    '功能键背景颜色-高亮': safeGetColor('systemButton', 'light', 'background', 'highlight', '#FFFFFFE6'),

    // 主題色按鈕配色 - 支援自訂
    'enter键背景(蓝色)': safeGetColor('colorButton', 'light', 'background', 'normal', '#979faf80'),  // 蝦米：跟功能鍵一樣

    // 氣泡提示框配色 - 由圖片控制（hint.png），不支援自訂
    '气泡背景颜色': '#ffffff',
    '气泡边缘颜色': '#606060',
    '气泡高亮颜色': '#007AFF',

    // 底部邊緣配色 - 支援自訂
    '底边缘颜色-普通': getAdvancedColor('lowerEdge', 'light', 'normal', '#9a9c9a'),
    '底边缘颜色-高亮': getAdvancedColor('lowerEdge', 'light', 'highlight', '#9a9c9a'),

    // 長按選單配色 - 由圖片控制（hint.png），不支援自訂
    '长按选中字体颜色': '#FFFFFF',
    '长按非选中字体颜色': '#000000',
    '长按选中背景颜色': '#007AFF',
    '长按背景阴影颜色': '#797B7E',
    '长按背景颜色': '#FFFFFF',

    // 候選字配色 - 支援自訂
    '候选字体选中字体颜色': getAdvancedColor('candidate', 'light', 'selectedText', '#000000'),
    '候选字体未选中字体颜色': getAdvancedColor('candidate', 'light', 'unselectedText', '#000000'),
    '选中候选背景颜色': getAdvancedColor('candidate', 'light', 'selectedBackground', '#FFFFFF'),

    // 工具列配色 - 支援自訂
    'toolbar文字按键颜色': getToolbarColor('light', '#666666'),  // 工具列統一顏色（文字和符號）
    'toolbar符号按键颜色': getToolbarColor('light', '#666666'),  // 工具列統一顏色（文字和符號）
    '按下气泡文字颜色': '#000000',  // 由圖片控制，不支援自訂
    '划动气泡文字颜色': '#000000',  // 由圖片控制，不支援自訂

    // 符號鍵盤配色 - 支援自訂
    '列表选中字体颜色': getAdvancedColor('symbolic', 'light', 'selectedText', '#000000'),
    '符号键盘左侧collection背景颜色': getAdvancedColor('symbolic', 'light', 'leftBackground', '#979faf80'),
    '符号键盘左侧collection背景下边缘颜色': getAdvancedColor('symbolic', 'light', 'leftLowerEdge', '#9a9c9a'),
    '符号键盘右侧collection背景颜色': getAdvancedColor('symbolic', 'light', 'rightBackground', '#ffffff'),
    '符号键盘右侧collection背景下边缘颜色': getAdvancedColor('symbolic', 'light', 'rightLowerEdge', '#88898D40'),
    '按键边缘颜色': getAdvancedColor('symbolic', 'light', 'buttonBorder', '#C7C7CC'),

    // 面板浮動鍵盤配色 - 支援自訂
    '面板按键前景颜色': getAdvancedColor('panel', 'light', 'foreground', '#000000'),
    
    // 按鍵文字配色 - 支援自訂
    '按键前景颜色': getKeyTextColor('light', 'primary', '#000000'),        // 字母鍵、數字鍵、空白鍵提示文字色（主要使用）
    '按键文字颜色': getKeyTextColor('light', 'primary', '#000000'),        // 字母鍵、數字鍵、空白鍵提示文字色（別名）
    '空白键文字颜色': getKeyTextColor('light', 'secondary', '#666666'),     // 空白鍵次要提示文字色（保留但不使用）
    '系统功能键文字颜色': getSystemKeyTextColor('light', 'normal', '#000000'),  // 系統功能鍵文字色
    '数字键文字颜色': getNumericKeysTextColor('light', '#000000'),          // 數字鍵文字色
    '上滑提示文字颜色': getSwipeTextColor('light', 'upSwipe', '#00000055'),    // 上滑提示文字色（修正為55%透明度）
    '下滑提示文字颜色': getSwipeTextColor('light', 'downSwipe', '#00000055'),  // 下滑提示文字色（修正為55%透明度）
    '工具列文字颜色': getToolbarColor('light', '#666666'),  // 工具列統一顏色（文字和符號）
    '工具列符号颜色': getToolbarColor('light', '#666666'), // 工具列統一顏色（文字和符號）
    
    // 鍵盤背景配色 - 支援自訂
    '键盘背景颜色': getKeyboardColor('light', '#D0D3DA01'),
  },
  dark: {
    // 字母鍵配色 - 支援自訂
    '字母键背景颜色-普通': safeGetColor('alphabeticButton', 'dark', 'background', 'normal', '#D1D1D165'),
    '字母键背景颜色-高亮': safeGetColor('alphabeticButton', 'dark', 'background', 'highlight', '#D1D1D624'),

    // 系統功能鍵配色 - 支援自訂
    '功能键背景颜色-普通': safeGetColor('systemButton', 'dark', 'background', 'normal', '#D1D1D624'),
    '功能键背景颜色-高亮': safeGetColor('systemButton', 'dark', 'background', 'highlight', '#D1D1D659'),

    // 主題色按鈕配色 - 支援自訂
    'enter键背景(蓝色)': safeGetColor('colorButton', 'dark', 'background', 'normal', '#D1D1D624'),  // 蝦米：跟功能鍵一樣

    // 氣泡提示框配色 - 由圖片控制（hint.png），不支援自訂
    '气泡背景颜色': '#6B6B6B',
    '气泡边缘颜色': '#606060',
    '气泡高亮颜色': '#007AFF',

    // 底部邊緣配色 - 支援自訂
    '底边缘颜色-普通': getAdvancedColor('lowerEdge', 'dark', 'normal', '#1E1E1E'),
    '底边缘颜色-高亮': getAdvancedColor('lowerEdge', 'dark', 'highlight', '#1D1D1D'),

    // 長按選單配色 - 由圖片控制（hint.png），不支援自訂
    '长按选中字体颜色': '#FFFFFF',
    '长按非选中字体颜色': '#FFFFFF',
    '长按选中背景颜色': '#007AFF',
    '长按背景阴影颜色': '#00000050',
    '长按背景颜色': '#6B6B6B',

    // 候選字配色 - 支援自訂
    '候选字体选中字体颜色': getAdvancedColor('candidate', 'dark', 'selectedText', '#ffffff'),
    '候选字体未选中字体颜色': getAdvancedColor('candidate', 'dark', 'unselectedText', '#ffffff'),
    '选中候选背景颜色': getAdvancedColor('candidate', 'dark', 'selectedBackground', '#D1D1D165'),

    // 工具列配色 - 支援自訂
    'toolbar文字按键颜色': getToolbarColor('dark', '#CCCCCC'),  // 工具列統一顏色（文字和符號）
    'toolbar符号按键颜色': getToolbarColor('dark', '#CCCCCC'),  // 工具列統一顏色（文字和符號）
    '按下气泡文字颜色': '#FFFFFF',  // 由圖片控制，不支援自訂
    '划动气泡文字颜色': '#FFFFFF',  // 由圖片控制，不支援自訂

    // 符號鍵盤配色 - 支援自訂
    '列表选中字体颜色': getAdvancedColor('symbolic', 'dark', 'selectedText', '#FFFFFF'),
    '符号键盘左侧collection背景颜色': getAdvancedColor('symbolic', 'dark', 'leftBackground', '#D1D1D624'),
    '符号键盘左侧collection背景下边缘颜色': getAdvancedColor('symbolic', 'dark', 'leftLowerEdge', '#1E1E1E'),
    '符号键盘右侧collection背景颜色': getAdvancedColor('symbolic', 'dark', 'rightBackground', '#D1D1D165'),
    '符号键盘右侧collection背景下边缘颜色': getAdvancedColor('symbolic', 'dark', 'rightLowerEdge', '#343941'),
    '按键边缘颜色': getAdvancedColor('symbolic', 'dark', 'buttonBorder', '#C7C7CC'),

    // 面板浮動鍵盤配色 - 支援自訂
    '面板按键前景颜色': getAdvancedColor('panel', 'dark', 'foreground', '#FFFFFF'),

    // 按鍵文字配色 - 支援自訂
    '按键前景颜色': getKeyTextColor('dark', 'primary', '#FFFFFF'),        // 字母鍵、數字鍵、空白鍵提示文字色（主要使用）
    '按键文字颜色': getKeyTextColor('dark', 'primary', '#FFFFFF'),        // 字母鍵、數字鍵、空白鍵提示文字色（別名）
    '空白键文字颜色': getKeyTextColor('dark', 'secondary', '#CCCCCC'),     // 空白鍵次要提示文字色（保留但不使用）
    '系统功能键文字颜色': getSystemKeyTextColor('dark', 'normal', '#FFFFFF'),  // 系統功能鍵文字色
    '数字键文字颜色': getNumericKeysTextColor('dark', '#FFFFFF'),          // 數字鍵文字色
    '上滑提示文字颜色': getSwipeTextColor('dark', 'upSwipe', '#FFFFFF55'),    // 上滑提示文字色（修正為55%透明度）
    '下滑提示文字颜色': getSwipeTextColor('dark', 'downSwipe', '#FFFFFF55'),  // 下滑提示文字色（修正為55%透明度）
    '工具列文字颜色': getToolbarColor('dark', '#CCCCCC'),  // 工具列統一顏色（文字和符號）
    '工具列符号颜色': getToolbarColor('dark', '#CCCCCC'), // 工具列統一顏色（文字和符號）

    // 鍵盤背景配色 - 支援自訂
    '键盘背景颜色': getKeyboardColor('dark', '#47474701'),
  },
}
