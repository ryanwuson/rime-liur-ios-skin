local animation = import '../lib/animation.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local others = import '../lib/others.libsonnet';
local toolbar = import '../lib/toolbar.libsonnet';
local utils = import '../lib/utils.libsonnet';

// 建立按鈕的函數
local createButton(params={}) =
  local isNumber = std.get(params, 'isNumber', true);
  std.prune({
    // 每個按鈕高度均分為 1/4（40/160）
    size: std.get(params, 'size', { height: '1/4' }),
    bounds: std.get(params, 'bounds'),
    // 數字鍵使用字母鍵背景，功能鍵使用系統鍵背景
    backgroundStyle: if isNumber then 'numberButtonBackgroundStyle' else 'systemButtonBackgroundStyle',
    foregroundStyle: if isNumber then 'number' + params.key + 'ButtonForegroundStyle' else params.key + 'ButtonForegroundStyle',
    action: std.get(params, 'action', { character: params.key }),
    repeatAction: std.get(params, 'repeatAction'),
    // 動畫
    animation: ['ButtonScaleAnimation'],
  });

local keyboard(theme) =
  {
    // 設定鍵盤高度，與中英文鍵盤一致（橫屏）
    preeditHeight: others['横屏']['preedit高度'],
    toolbarHeight: others['横屏']['toolbar高度'],
    keyboardHeight: others['横屏']['keyboard高度'],

    keyboardLayout: [
      {
        VStack: {
          style: 'VStackStyle1',
          subviews: [
            { Cell: 'collection' },
            { Cell: 'symbolButton' },
          ],
        },
      },
      {
        VStack: {
          style: 'VStackStyle2',
          subviews: [
            { Cell: 'number1Button' },
            { Cell: 'number4Button' },
            { Cell: 'number7Button' },
            { Cell: 'returnButton' },
          ],
        },
      },
      {
        VStack: {
          style: 'VStackStyle2',
          subviews: [
            { Cell: 'number2Button' },
            { Cell: 'number5Button' },
            { Cell: 'number8Button' },
            { Cell: 'number0Button' },
          ],
        },
      },
      {
        VStack: {
          style: 'VStackStyle2',
          subviews: [
            { Cell: 'number3Button' },
            { Cell: 'number6Button' },
            { Cell: 'number9Button' },
            { Cell: 'spaceButton' },
          ],
        },
      },
      {
        VStack: {
          style: 'VStackStyle1',
          subviews: [
            { Cell: 'backspaceButton' },
            { Cell: 'periodButton' },
            { Cell: 'equalButton' },
            { Cell: 'enterButton' },
          ],
        },
      },
    ],
    keyboardStyle: {
      backgroundStyle: 'keyboardBackgroundStyle',
    },
    keyboardBackgroundStyle: {
      buttonStyleType: 'geometry',
      normalColor: color[theme]['键盘背景颜色'],
    },
    VStackStyle1: {
      size: {
        width: '29/183',
      },
    },
    VStackStyle2: {
      size: {
        width: '125/549',
      },
    },
    collection: {
      size: {
        height: '3/4',
      },
      backgroundStyle: 'collectionBackgroundStyle',
      cellForegroundStyle: 'collectionCellForegroundStyle',  // 添加自訂前景樣式
      type: 'numericSymbols',  // 使用內建的 numericSymbols 類型
      displaySeparatorLine: false,  // 關閉分隔線
      insets: { top: 8, left: 4, bottom: 4, right: 4 },
      useRimeEngine: true,
    },
    collectionBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 5, left: 3, bottom: 5, right: 3 },
      normalColor: color[theme]['符号键盘左侧collection背景颜色'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['符号键盘左侧collection背景下边缘颜色'],
    },
    collectionCellForegroundStyle: {
      buttonStyleType: 'text',
      normalColor: color[theme]['按键前景颜色'],  // 使用主要按鍵文字色
      highlightColor: color[theme]['按键前景颜色'],
      fontSize: fontSize['collection前景字体大小'],
      fontWeight: 0,
    },

    // 數字按鈕 1-9, 0
    number1Button: createButton(params={ key: '1' }),
    number2Button: createButton(params={ key: '2' }),
    number3Button: createButton(params={ key: '3' }),
    number4Button: createButton(params={ key: '4' }),
    number5Button: createButton(params={ key: '5' }),
    number6Button: createButton(params={ key: '6' }),
    number7Button: createButton(params={ key: '7' }),
    number8Button: createButton(params={ key: '8' }),
    number9Button: createButton(params={ key: '9' }),
    number0Button: createButton(params={ key: '0' }),

    // 功能按鈕
    returnButton: createButton(
      params={
        key: 'return',
        action: { keyboardType: 'symbolic' },  // 改為到符號表
        isNumber: false,
      }
    ),
    returnButtonForegroundStyle: utils.makeTextStyle({
      text: '#+=',  // 改為顯示 #+=
      normalColor: color[theme]['系统功能键文字颜色'],
      highlightColor: color[theme]['系统功能键文字颜色'],
      fontSize: fontSize['按键前景文字大小'] - 5,
    }),

    symbolButton: createButton(
      params={
        key: 'symbol',
        action: 'returnLastKeyboard',  // 改為回到qwer鍵盤
        isNumber: false,
        size: { height: '1/4' },
      }
    ),
    symbolButtonForegroundStyle: utils.makeTextStyle({
      text: '返回',  // 改為顯示 返回
      normalColor: color[theme]['系统功能键文字颜色'],
      highlightColor: color[theme]['系统功能键文字颜色'],
      fontSize: fontSize['按键前景文字大小'] - 5,
    }),

    spaceButton: createButton(
      params={
        key: 'space',
        action: 'space',
        isNumber: false,
      }
    ),
    spaceButtonForegroundStyle: utils.makeTextStyle({
      text: '空格',
      normalColor: color[theme]['系统功能键文字颜色'],
      highlightColor: color[theme]['系统功能键文字颜色'],
      fontSize: fontSize['按键前景文字大小'] - 5,
    }),

    backspaceButton: createButton(
      params={
        key: 'backspace',
        action: 'backspace',
        repeatAction: 'backspace',
        isNumber: false,
      }
    ),
    backspaceButtonForegroundStyle: utils.makeSystemImageStyle({
      systemImageName: 'delete.left',
      normalColor: color[theme]['系统功能键文字颜色'],
      highlightColor: color[theme]['系统功能键文字颜色'],
      fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
      center: { y: 0.53 },
    }),

    periodButton: createButton(
      params={
        key: 'period',
        action: { symbol: '.' },
        isNumber: false,
      }
    ),
    periodButtonForegroundStyle: utils.makeTextStyle({
      text: '.',
      normalColor: color[theme]['系统功能键文字颜色'],
      highlightColor: color[theme]['系统功能键文字颜色'],
      fontSize: fontSize['数字键盘数字前景字体大小'],
    }),

    equalButton: createButton(
      params={
        key: 'equal',
        action: { character: '=' },
        isNumber: false,
      }
    ),
    equalButtonForegroundStyle: utils.makeTextStyle({
      text: '=',
      normalColor: color[theme]['系统功能键文字颜色'],
      highlightColor: color[theme]['系统功能键文字颜色'],
      fontSize: fontSize['collection前景字体大小'],
      fontWeight: 0,
    }),

    enterButton: createButton(
      params={
        key: 'enter',
        action: 'enter',
        isNumber: false,
      }
    ),
    enterButtonForegroundStyle: utils.makeTextStyle({
      text: '換行',
      normalColor: color[theme]['系统功能键文字颜色'],
      highlightColor: color[theme]['系统功能键文字颜色'],
      fontSize: fontSize['按键前景文字大小'] - 5,
    }),

    // 背景樣式
    numberButtonBackgroundStyle: utils.makeGeometryStyle({
      insets: { top: 2, left: 2, bottom: 2, right: 2 },
      normalColor: color[theme]['字母键背景颜色-普通'],
      highlightColor: color[theme]['字母键背景颜色-高亮'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
      highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
    }),

    systemButtonBackgroundStyle: utils.makeGeometryStyle({
      insets: { top: 2, left: 2, bottom: 2, right: 2 },
      normalColor: color[theme]['功能键背景颜色-普通'],
      highlightColor: color[theme]['功能键背景颜色-高亮'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
      highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
    }),

    ButtonScaleAnimation: animation['26键按键动画'],
  };

{
  new(theme):
    keyboard(theme) +
    toolbar.getToolBar(theme, 'landscape') +
    utils.genNumberStyles(theme),
}
