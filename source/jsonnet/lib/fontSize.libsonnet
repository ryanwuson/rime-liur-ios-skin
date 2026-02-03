// 字號定義 - 支援自訂字號系統
local settings = import '../Settings.libsonnet';

// 獲取自訂字號的輔助函數
local getCustomFontSize = function(fontType, defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors[fontType], 'fontSize', null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取按鍵文字字號的輔助函數
local getKeyTextFontSize = function(sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.keyText, sizeType, null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取系統功能鍵字號的輔助函數
local getSystemKeyTextFontSize = function(defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.systemKeyText, 'fontSize', null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取數字鍵字號的輔助函數
local getNumericKeysFontSize = function(defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.numericKeys, 'numberFontSize', null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取工具列字號的輔助函數
local getToolbarFontSize = function(sizeType, defaultSize)
  if settings.advancedColors.enableAdvancedColors then
    local customSize = std.get(settings.advancedColors.toolbar, sizeType, null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取長按氣泡字號的輔助函數
local getLongPressHintFontSize = function(sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.longPressHint, sizeType, null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取滑動氣泡字號的輔助函數
local getSwipeHintFontSize = function(defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.swipeHint, 'fontSize', null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取長按符號選單字號的輔助函數
local getHintSymbolsFontSize = function(sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.hintSymbols, sizeType, null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取英文鍵盤字號的輔助函數
local getEnglishKeyboardFontSize = function(sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.englishKeyboard, sizeType, null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取候選字字號的輔助函數
local getCandidatesFontSize = function(sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.candidates, sizeType, null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

// 獲取垂直候選控制按鈕字號的輔助函數
local getVerticalCandidateControlsFontSize = function(sizeType, defaultSize)
  if settings.customColors.enableCustomColors then
    local customSize = std.get(settings.customColors.verticalCandidateControls, sizeType, null);
    if customSize != null then customSize else defaultSize
  else
    defaultSize;

{
  // 候選字字號（支援自訂）
  '未展开候选字体选中字体大小': getCandidatesFontSize('textFontSize', 16),
  '未展开comment字体大小': getCandidatesFontSize('commentFontSize', 14),
  '展开候选字体选中字体大小': getCandidatesFontSize('expandedTextFontSize', 16),
  '展开comment字体大小': getCandidatesFontSize('expandedCommentFontSize', 13),
  'preedit区字体大小': 17,

  // 滑動提示文字大小（支援自訂）
  '上划文字大小': getCustomFontSize('swipeText', 8),
  '下划文字大小': getCustomFontSize('swipeText', 8),
  '划动气泡前景文字大小': getSwipeHintFontSize(18),

  // 長按氣泡字號（支援自訂）
  '长按气泡文字大小': getLongPressHintFontSize('fontSize', 20),
  '长按气泡sf符号大小': getLongPressHintFontSize('symbolFontSize', 12),

  // 按鍵文字大小（支援自訂）
  // 蝦米：中文鍵盤（pinyin）字號 21，英文鍵盤（alphabetic）小寫 23、大寫 21
  '按键前景文字大小': getKeyTextFontSize('primaryFontSize', 21),
  '按键前景文字大小-小写': getEnglishKeyboardFontSize('lowercaseFontSize', 23),
  '按键前景文字大小-大写': getEnglishKeyboardFontSize('uppercaseFontSize', 21),
  '按键前景文字大小-提示': getEnglishKeyboardFontSize('hintFontSize', 26),
  '按键前景sf符号大小': 20,

  // 工具列字號（支援自訂）
  'toolbar按键前景sf符号大小': getToolbarFontSize('symbolFontSize', 20),
  'toolbar按键前景文字大小': getToolbarFontSize('textFontSize', 20),

  // 数字键盘
  'collection前景字体大小': 18,  // 數字鍵盤符號區字號（固定值）
  '数字键盘数字前景字体大小': getNumericKeysFontSize(24),

  // 中文九键
  '中文九键字符键前景文字大小': 15,
  '中文九键字根前景文字大小': 10,
  '中文九键划动文字大小': 10,

  // 符号键盘
  '符号键盘左侧collection前景字体大小': 13,  // 符號鍵盤左側字號（固定值）
  '符号键盘右侧collection前景字体大小': 16,  // 符號鍵盤右側字號（固定值）

  // panel键盘
  'panel按键前景文字大小': 12,
  'panel按键前景sf符号大小': 16,

  // 長按符號選單字號（支援自訂）
  '长按符号选单动作文字大小': getHintSymbolsFontSize('actionFontSize', 13),
  '长按符号选单日期文字大小': getHintSymbolsFontSize('dateFontSize', 14),

  // 英文鍵盤空白鍵字號（支援自訂）
  '英文空白键文字大小': getEnglishKeyboardFontSize('spaceFontSize', 15),

  // 候選字索引字號（支援自訂）
  '水平候选字索引字体大小': getCandidatesFontSize('horizontalIndexFontSize', 12),
  '垂直候选字索引字体大小': getCandidatesFontSize('verticalIndexFontSize', 12),

  // 垂直候選控制按鈕字號（支援自訂）
  '垂直候选控制按钮字体大小': getVerticalCandidateControlsFontSize('buttonFontSize', 20),
  '垂直候选返回按钮字体大小': getVerticalCandidateControlsFontSize('returnButtonFontSize', 16),
}
