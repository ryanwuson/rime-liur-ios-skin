// 滑動樣式生成
local center = import 'center.libsonnet';
local color = import 'color.libsonnet';
local fontSize = import 'fontSize.libsonnet';
local settings = import '../Settings.libsonnet';

// 獲取按鍵所屬的行
local getKeyRow = function(key)
  if std.member(['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'], key) then 'row1'
  else if std.member(['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'], key) then 'row2'
  else if std.member(['z', 'x', 'c', 'v', 'b', 'n', 'm'], key) then 'row3'
  else if std.member([',', '.'], key) then 'row4'
  else null;

// 獲取有效設定值（核心邏輯：分行設定覆蓋全域設定）
local getEffectiveSetting = function(key, settingName)
  local rowName = getKeyRow(key);
  if rowName == null then settings[settingName] else
  local rowSettings = std.get(settings.advancedRowControl, rowName, {});
  // 優先級：分行設定 > 全域設定
  if std.objectHas(rowSettings, settingName) then
    rowSettings[settingName]  // 使用分行設定
  else
    settings[settingName];    // 使用全域設定

// 解析颜色
local pickColors = function(overridesColor, theme)
  if overridesColor == {} then {}
  else {
    normalColor: overridesColor[theme].normalColor,
    highlightColor: overridesColor[theme].highlightColor,
  };

local colorsOrDefault = function(overrides, theme, direction)
  local overridesColor = std.get(overrides, 'color', {});
  local picked = pickColors(overridesColor, theme);
  if picked != {} then picked else { 
    normalColor: if direction == 'up' then color[theme]['上滑提示文字颜色'] else color[theme]['下滑提示文字颜色'], 
    highlightColor: if direction == 'up' then color[theme]['上滑提示文字颜色'] else color[theme]['下滑提示文字颜色'] 
  };

local defaultCenter = function(direction, type)
  local map = {
    up: {
      pinyin: center['上划文字偏移'],
      alphabetic: center['上划文字偏移'],
      number: center['数字键盘上划文字偏移'],
    },
    down: {
      pinyin: center['下划文字偏移'],
      alphabetic: center['下划文字偏移'],
      number: center['数字键盘下划文字偏移'],
    },
  };
  map[direction][type];

local defaultFontSize = function(direction) if direction == 'up' then fontSize['上划文字大小'] else fontSize['下划文字大小'];

local makeTextStyle = function(theme, label, direction, type, overrides={})
  local c = colorsOrDefault(overrides, theme, direction);
  {
    buttonStyleType: 'text',
    text: label.text,
    fontSize: std.get(overrides, 'fontSize', defaultFontSize(direction)),
    normalColor: c.normalColor,
    highlightColor: c.highlightColor,
    center: std.get(overrides, 'center', defaultCenter(direction, type)),
  };

local makeSystemImageStyle = function(theme, label, direction, type, overrides={})
  local c = colorsOrDefault(overrides, theme, direction);
  {
    buttonStyleType: 'systemImage',
    systemImageName: label.systemImageName,
    fontSize: std.get(overrides, 'fontSize', defaultFontSize(direction)),
    normalColor: c.normalColor,
    highlightColor: c.highlightColor,
    center: std.get(overrides, 'center', defaultCenter(direction, type)),
  };

// 根据 key 生成样式名称
local styleName = function(type, key, direction)
  if type == 'number' && std.length(key) == 1
  then 'number' + key + 'Button' + (if direction == 'up' then 'Up' else 'Down') + 'ForegroundStyle'
  else key + 'Button' + (if direction == 'up' then 'Up' else 'Down') + 'ForegroundStyle';

local makeForegroundStyle = function(key, direction, theme, type, data)
  // 使用新的設定檢查邏輯
  local shouldShow = if direction == 'up' then getEffectiveSetting(key, 'showSwipeUpText') else getEffectiveSetting(key, 'showSwipeDownText');
  if !shouldShow then {} else
  local label = std.get(data, 'label', {});
  if std.objectHas(label, 'text') then
    { [styleName(type, key, direction)]: makeTextStyle(theme, label, direction, type, data) }
  else if std.objectHas(label, 'systemImageName') then
    { [styleName(type, key, direction)]: makeSystemImageStyle(theme, label, direction, type, data) }
  else {};

local makeSwipeUpHintForegroundStyle = function(key, direction, theme, type, data)
  // 滑動氣泡樣式只有在啟用上滑功能時才生成
  if !getEffectiveSetting(key, 'enableSwipeUpActions') then {} else
  local label = std.get(data, 'label', {});
  if std.length(key) == 1 && std.objectHas(data, 'label') then
    if std.objectHas(label, 'text') then
    {
      [key + 'ButtonSwipeUpHintForegroundStyle']: {
        buttonStyleType: 'text',
        text: label.text,
        fontSize: fontSize['划动气泡前景文字大小'],
        fontWeight: 'medium',
        normalColor: color[theme]['划动气泡文字颜色'],
        center: center['划动气泡文字偏移'],
      },
    }
    else if std.objectHas(label, 'systemImageName') then
    {
      [key + 'ButtonSwipeUpHintForegroundStyle']: {
        buttonStyleType: 'systemImage',
        systemImageName: label.systemImageName,
        fontSize: fontSize['划动气泡前景文字大小'],
        normalColor: color[theme]['划动气泡文字颜色'],
        center: center['划动气泡文字偏移'],
      },
    }
    else {}
  else {};

local makeSwipeDownHintForegroundStyle = function(key, direction, theme, type, data)
  // 滑動氣泡樣式只有在啟用下滑功能時才生成
  if !getEffectiveSetting(key, 'enableSwipeDownActions') then {} else
  // 優先使用 hintLabel，否則使用 label
  local hintLabel = std.get(data, 'hintLabel', std.get(data, 'label', {}));
  // 支援獨立的氣泡字號設定（hintFontSize），否則使用預設值
  local hintFontSize = std.get(data, 'hintFontSize', fontSize['划动气泡前景文字大小']);
  if std.length(key) == 1 && std.objectHas(hintLabel, 'text') then
  {
    [key + 'ButtonSwipeDownHintForegroundStyle']: {
      buttonStyleType: 'text',
      text: hintLabel.text,
      fontSize: hintFontSize,
      fontWeight: 'medium',
      normalColor: color[theme]['划动气泡文字颜色'],
      center: center['划动气泡文字偏移'],
    },
  } else {};

local processDirection = function(dirData, direction, theme, type)
  std.foldl(
    function(acc, k) acc + makeForegroundStyle(k, direction, theme, type, dirData[k]),
    std.objectFields(dirData),
    {}
  ) +
  if direction == 'up' && (type == 'pinyin' || type == 'alphabetic') then
    std.foldl(
      function(acc, k) acc + makeSwipeUpHintForegroundStyle(k, direction, theme, type, dirData[k]),
      std.objectFields(dirData),
      {}
    )
  else if direction == 'down' && (type == 'pinyin' || type == 'alphabetic') then
    std.foldl(
      function(acc, k) acc + makeSwipeDownHintForegroundStyle(k, direction, theme, type, dirData[k]),
      std.objectFields(dirData),
      {}
    )
  else {};

// params 结构: { swipe_up: {...}, swipe_down: {...}, type: 'pinyin'|'alphabetic'|'number' }
local makeSwipeStyles = function(theme, params)
  local swipe_up = std.get(params, 'swipe_up', {});
  local swipe_down = std.get(params, 'swipe_down', {});
  local type = std.get(params, 'type', '');
  processDirection(swipe_up, 'up', theme, type) +
  processDirection(swipe_down, 'down', theme, type);

{
  makeSwipeStyles: makeSwipeStyles,
  getEffectiveSetting: getEffectiveSetting,  // 導出供其他模組使用
}
