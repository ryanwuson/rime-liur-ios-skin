// 符號鍵盤（symbolic）- 橫屏佈局 - 完整移植自好春光26键
local animation = import '../lib/animation.libsonnet';
local color = import '../lib/color.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local others = import '../lib/others.libsonnet';
local utils = import '../lib/utils.libsonnet';

// 符號鍵盤的 keyboardHeight = keyboard高度 + toolbar高度
// 這樣符號鍵盤的頂部才會與中文鍵盤的候選區頂部對齊
// (符號鍵盤沒有 preedit 區域，所以總高度 = 鍵盤總高度 - preedit高度)
local symbolicKeyboardHeight = others['横屏']['keyboard高度'] + others['横屏']['toolbar高度'];

local keyboard(theme) = {
  // 動畫
  ButtonScaleAnimation: animation['26键按键动画'],

  // 行高度樣式
  // 底部行減少 5px (40→35)，分類+內容區增加 5px (144→149)
  // 頂部間距維持不變
  HStackStyle1: { size: { height: '149/190' } },
  HStackStyle2: { size: { height: '35/190' } },

  // 退格按鈕 - 寬度為符號內容區域的 1/4 (77/366)
  backspaceButton: {
    action: 'backspace',
    animation: ['ButtonScaleAnimation'],
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'backspaceButtonForegroundStyle',
    repeatAction: 'backspace',
    size: { width: '77/366' },
  },
  backspaceButtonForegroundStyle: utils.makeSystemImageStyle({
    systemImageName: 'delete.left',
    fontSize: 17,
    normalColor: color[theme]['系统功能键文字颜色'],
    highlightColor: color[theme]['系统功能键文字颜色'],
    center: { y: 0.53 },
  }),

  // 分類數據
  category: collectionData.symbolicCategory,

  // 左側分類列表 - 寬度與九宮格 VStackStyle1 一致 (29/183)
  categoryCollection: {
    backgroundStyle: 'categoryCollectionBackgroundStyle',
    cellStyle: 'categoryCollectionCellStyle',
    dataSource: 'category',
    insets: { top: 6, left: 3, bottom: 6, right: 3 },
    size: { width: '29/183' },
    type: 'classifiedSymbols',
  },
  categoryCollectionBackgroundStyle: utils.makeGeometryStyle({
    cornerRadius: 7,
    insets: { bottom: 5, left: 3, right: 3, top: 5 },
    normalColor: color[theme]['符号键盘左侧collection背景颜色'],
    normalLowerEdgeColor: color[theme]['符号键盘左侧collection背景下边缘颜色'],
    normalShadowColor: color[theme]['底边缘颜色-普通'],
  }),
  categoryCollectionCellBackgroundStyle: utils.makeGeometryStyle({
    cornerRadius: 5,
    insets: { top: 6, left: 6, bottom: 6, right: 6 },
    normalColor: '00000000',
    highlightColor: color[theme]['字母键背景颜色-高亮'],
  }),
  categoryCollectionCellForegroundStyle: utils.makeTextStyle({
    fontSize: fontSize['符号键盘左侧collection前景字体大小'],
    fontWeight: 0,
    normalColor: color[theme]['符号键盘左侧collection字体颜色'],
    highlightColor: color[theme]['符号键盘左侧collection字体颜色'],
  }),
  categoryCollectionCellStyle: {
    backgroundStyle: 'categoryCollectionCellBackgroundStyle',
    foregroundStyle: 'categoryCollectionCellForegroundStyle',
  },

  // 右側符號列表 - 寬度為剩餘部分 (154/183)
  descriptionCollection: {
    backgroundStyle: 'descriptionCollectionBackgroundStyle',
    cellStyle: 'descriptionCollectionCellStyle',
    displaySeparatorLine: false,  // 關閉分隔線
    insets: { bottom: 4, left: 4, right: 4, top: 4 },
    size: { width: '154/183' },
    type: 'subClassifiedSymbols',
  },
  descriptionCollectionBackgroundStyle: utils.makeGeometryStyle({
    cornerRadius: 7,
    insets: { bottom: 5, left: 3, right: 3, top: 5 },
    normalColor: color[theme]['符号键盘右侧collection背景颜色'],
    normalLowerEdgeColor: color[theme]['符号键盘右侧collection背景下边缘颜色'],
  }),
  descriptionCollectionCellForegroundStyle: utils.makeTextStyle({
    fontSize: fontSize['符号键盘右侧collection前景字体大小'],
    fontWeight: 0,
    normalColor: color[theme]['符号键盘右侧collection字体颜色'],
    highlightColor: color[theme]['符号键盘右侧collection字体颜色'],
  }),
  descriptionCollectionCellStyle: {
    foregroundStyle: 'descriptionCollectionCellForegroundStyle',
  },

  // 鍵盤背景
  keyboardBackgroundStyle: utils.makeGeometryStyle({
    normalColor: color[theme]['键盘背景颜色'],
  }),

  // 鍵盤高度 - 等於中文鍵盤總高度減去 insets.top
  keyboardHeight: symbolicKeyboardHeight,

  // 鍵盤佈局
  keyboardLayout: [
    { HStack: { style: 'HStackStyle1', subviews: [{ Cell: 'categoryCollection' }, { Cell: 'descriptionCollection' }] } },
    { HStack: { style: 'HStackStyle2', subviews: [{ Cell: 'returnButton' }, { Cell: 'pageUpButton' }, { Cell: 'pageDownButton' }, { Cell: 'lockButton' }, { Cell: 'backspaceButton' }] } },
  ],

  // 鍵盤樣式 - 頂部間距 3px，讓分類+內容區域與頂部和底部按鈕行的間距相等
  keyboardStyle: {
    backgroundStyle: 'keyboardBackgroundStyle',
    insets: { top: 3 },
  },

  // 鎖定按鈕 - 寬度為符號內容區域的 1/4 (77/366)
  lockButton: {
    action: 'symbolicKeyboardLockStateToggle',
    animation: ['ButtonScaleAnimation'],
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: [
      { conditionKey: '$symbolicKeyboardLockState', conditionValue: false, styleName: 'unlockButtonForegroundStyle' },
      { conditionKey: '$symbolicKeyboardLockState', conditionValue: true, styleName: 'lockButtonForegroundStyle' },
    ],
    size: { width: '77/366' },
  },
  lockButtonForegroundStyle: utils.makeSystemImageStyle({
    systemImageName: 'lock',
    fontSize: 15,
    normalColor: color[theme]['系统功能键文字颜色'],
    highlightColor: color[theme]['系统功能键文字颜色'],
    center: { y: 0.53 },
  }),

  // 下一頁按鈕 - 寬度為符號內容區域的 1/4 (77/366)
  pageDownButton: {
    action: { shortcut: '#subCollectionPageDown' },
    animation: ['ButtonScaleAnimation'],
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'pageDownButtonForegroundStyle',
    size: { width: '77/366' },
  },
  pageDownButtonForegroundStyle: utils.makeSystemImageStyle({
    systemImageName: 'chevron.down',
    fontSize: 15,
    normalColor: color[theme]['系统功能键文字颜色'],
    highlightColor: color[theme]['系统功能键文字颜色'],
    center: { y: 0.53 },
  }),

  // 上一頁按鈕 - 寬度為符號內容區域的 1/4 (77/366)
  pageUpButton: {
    action: { shortcut: '#subCollectionPageUp' },
    animation: ['ButtonScaleAnimation'],
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'pageUpButtonForegroundStyle',
    size: { width: '77/366' },
  },
  pageUpButtonForegroundStyle: utils.makeSystemImageStyle({
    systemImageName: 'chevron.up',
    fontSize: 15,
    normalColor: color[theme]['系统功能键文字颜色'],
    highlightColor: color[theme]['系统功能键文字颜色'],
    center: { y: 0.53 },
  }),

  // 返回按鈕 - 寬度與分類欄一致 (29/183)
  returnButton: {
    action: 'returnLastKeyboard',
    animation: ['ButtonScaleAnimation'],
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'returnButtonForegroundStyle',
    size: { width: '29/183' },
  },
  returnButtonForegroundStyle: utils.makeTextStyle({
    text: '返回',
    fontSize: 16,
    normalColor: color[theme]['系统功能键文字颜色'],
    highlightColor: color[theme]['系统功能键文字颜色'],
  }),

  // 鎖定狀態通知
  symbolicKeyboardLockStateNotification: {
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'lockButtonForegroundStyle',
    lockedState: true,
    notificationType: 'symbolicKeyboardLockedState',
  },

  // 系統按鈕背景
  systemButtonBackgroundStyle: utils.makeGeometryStyle({
    cornerRadius: 7,
    insets: { bottom: 2, left: 2, right: 2, top: 2 },
    normalColor: color[theme]['功能键背景颜色-普通'],
    highlightColor: color[theme]['功能键背景颜色-高亮'],
    normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
    highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
  }),

  // 解鎖按鈕前景
  unlockButtonForegroundStyle: utils.makeSystemImageStyle({
    systemImageName: 'lock.open',
    fontSize: 15,
    normalColor: color[theme]['系统功能键文字颜色'],
    highlightColor: color[theme]['系统功能键文字颜色'],
    center: { y: 0.53 },
  }),

  // 符號數據 - 引用 collectionData
  '常用': collectionData.symbolicDataSource['常用'],
  '一般': collectionData.symbolicDataSource['一般'],
  '括號': collectionData.symbolicDataSource['括號'],
  '引號': collectionData.symbolicDataSource['引號'],
  '豎標': collectionData.symbolicDataSource['豎標'],
  '數學': collectionData.symbolicDataSource['數學'],
  '單位': collectionData.symbolicDataSource['單位'],
  '貨幣': collectionData.symbolicDataSource['貨幣'],
  '分數': collectionData.symbolicDataSource['分數'],
  '上標': collectionData.symbolicDataSource['上標'],
  '下標': collectionData.symbolicDataSource['下標'],
  '注音': collectionData.symbolicDataSource['注音'],
  '拼音': collectionData.symbolicDataSource['拼音'],
  '音標': collectionData.symbolicDataSource['音標'],
  '平假': collectionData.symbolicDataSource['平假'],
  '片假': collectionData.symbolicDataSource['片假'],
  '韓文': collectionData.symbolicDataSource['韓文'],
  '藏文': collectionData.symbolicDataSource['藏文'],
  '希臘': collectionData.symbolicDataSource['希臘'],
  '俄語': collectionData.symbolicDataSource['俄語'],
  '合字': collectionData.symbolicDataSource['合字'],
  '部首': collectionData.symbolicDataSource['部首'],
  '月份': collectionData.symbolicDataSource['月份'],
  '日期': collectionData.symbolicDataSource['日期'],
  '時間': collectionData.symbolicDataSource['時間'],
  '性別': collectionData.symbolicDataSource['性別'],
  '圈英': collectionData.symbolicDataSource['圈英'],
  '圈數': collectionData.symbolicDataSource['圈數'],
  '圈漢': collectionData.symbolicDataSource['圈漢'],
  '圈日': collectionData.symbolicDataSource['圈日'],
  '圈韓': collectionData.symbolicDataSource['圈韓'],
  '括英': collectionData.symbolicDataSource['括英'],
  '括數': collectionData.symbolicDataSource['括數'],
  '括漢': collectionData.symbolicDataSource['括漢'],
  '括韓': collectionData.symbolicDataSource['括韓'],
  '框英': collectionData.symbolicDataSource['框英'],
  '框數': collectionData.symbolicDataSource['框數'],
  '框漢': collectionData.symbolicDataSource['框漢'],
  '點數': collectionData.symbolicDataSource['點數'],
  '羅馬': collectionData.symbolicDataSource['羅馬'],
  '箭頭': collectionData.symbolicDataSource['箭頭'],
  '線段': collectionData.symbolicDataSource['線段'],
  '框線': collectionData.symbolicDataSource['框線'],
  '圓形': collectionData.symbolicDataSource['圓形'],
  '三角': collectionData.symbolicDataSource['三角'],
  '方形': collectionData.symbolicDataSource['方形'],
  '星星': collectionData.symbolicDataSource['星星'],
  '八卦': collectionData.symbolicDataSource['八卦'],
  '易經': collectionData.symbolicDataSource['易經'],
  '音樂': collectionData.symbolicDataSource['音樂'],
  '圖案': collectionData.symbolicDataSource['圖案'],
};

{
  new(theme): keyboard(theme),
}
