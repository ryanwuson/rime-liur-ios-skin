// 英文鍵盤專用 toolbar
// 覆蓋中英切換按鈕：顯示「英」，按下切換回 pinyin 鍵盤
local toolbar = import 'toolbar.libsonnet';
local color = import 'color.libsonnet';

local custom(theme) = {
  // 中英切換按鈕 - 英文鍵盤版本
  // 顯示「中」，按下切換回 pinyin 鍵盤
  toolbarChEnButton: {
    size: { width: '1/10' },
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarChEnButtonForegroundStyle',
    action: {
      keyboardType: 'pinyin',
    },
  },
  // 中英切換按鈕樣式（顯示「中」）
  toolbarChEnButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '中',
    normalColor: color[theme]['toolbar文字按键颜色'],
    highlightColor: color[theme]['toolbar文字按键颜色'],
    fontSize: 20,
    fontWeight: 'light',
  },
};

{
  getToolBar(theme, orientation='portrait'): toolbar.getToolBar(theme, orientation) + custom(theme),
}
