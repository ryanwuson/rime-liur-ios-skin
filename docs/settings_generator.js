// Settings.libsonnet 生成器
// 將 UI settings 物件轉換為完整的 Jsonnet 格式

/**
 * 生成完整的 Settings.libsonnet 內容
 * @param {Object} settings - UI settings 物件
 * @returns {string} - 完整的 Jsonnet 格式字串
 */
function generateCompleteSettingsLibsonnet(settings) {
    // 輔助函數：格式化顏色值（確保有 # 前綴）
    const formatColor = (color) => {
        if (!color) return '#FFFFFF';
        return color.startsWith('#') ? color : `#${color}`;
    };

    // 輔助函數：生成 advancedRowControl 的某一行
    const generateRowControl = (rowName, rowData, enableAdvancedRowControl) => {
        // 如果總開關關閉，強制返回註解掉的範例
        if (!enableAdvancedRowControl) {
            const examples = {
                row1: `    row1: { 
      # 範例：第一行關閉所有滑動功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: false,   # 關閉下滑動作
      // enableLongPressActions: false,   # 關閉長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: false,        # 隱藏下滑文字
    },`,
                row2: `    row2: { 
      # 範例：第二行僅保留下滑功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: true,    # 保留下滑動作
      // enableLongPressActions: false,   # 關閉長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: true,         # 顯示下滑文字
    },`,
                row3: `    row3: { 
      # 範例：第三行僅保留長按功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: false,   # 關閉下滑動作
      // enableLongPressActions: true,    # 保留長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: false,        # 隱藏下滑文字
    },`,
                row4: `    row4: { 
      # 範例：逗號句號行關閉長按功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,    # 關閉上滑動作
      // enableLongPressActions: false,  # 關閉長按功能
    },`
            };
            return examples[rowName] || `    ${rowName}: { },`;
        }
        
        // 總開關開啟，檢查是否有任何實際設定（不是預設值）
        const hasSettings = rowData && Object.keys(rowData).length > 0 && 
            Object.values(rowData).some(val => val !== undefined);
        
        if (!hasSettings) {
            // 沒有設定，返回註解掉的範例
            const examples = {
                row1: `    row1: { 
      # 範例：第一行關閉所有滑動功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: false,   # 關閉下滑動作
      // enableLongPressActions: false,   # 關閉長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: false,        # 隱藏下滑文字
    },`,
                row2: `    row2: { 
      # 範例：第二行僅保留下滑功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: true,    # 保留下滑動作
      // enableLongPressActions: false,   # 關閉長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: true,         # 顯示下滑文字
    },`,
                row3: `    row3: { 
      # 範例：第三行僅保留長按功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: false,   # 關閉下滑動作
      // enableLongPressActions: true,    # 保留長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: false,        # 隱藏下滑文字
    },`,
                row4: `    row4: { 
      # 範例：逗號句號行關閉長按功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,    # 關閉上滑動作
      // enableLongPressActions: false,  # 關閉長按功能
    },`
            };
            return examples[rowName] || `    ${rowName}: { },`;
        }
        
        // 有設定，生成實際的值
        const lines = [];
        lines.push(`    ${rowName}: {`);
        if (rowData.enableSwipeUpActions !== undefined) {
            lines.push(`      enableSwipeUpActions: ${rowData.enableSwipeUpActions},`);
        }
        if (rowData.enableSwipeDownActions !== undefined) {
            lines.push(`      enableSwipeDownActions: ${rowData.enableSwipeDownActions},`);
        }
        if (rowData.enableLongPressActions !== undefined) {
            lines.push(`      enableLongPressActions: ${rowData.enableLongPressActions},`);
        }
        if (rowData.showSwipeUpText !== undefined) {
            lines.push(`      showSwipeUpText: ${rowData.showSwipeUpText},`);
        }
        if (rowData.showSwipeDownText !== undefined) {
            lines.push(`      showSwipeDownText: ${rowData.showSwipeDownText},`);
        }
        lines.push(`    },`);
        return lines.join('\n');
    };

    // 輔助函數：生成 palette 的某個模式（light 或 dark）
    const generatePaletteMode = (mode, data) => {
        return `      ${mode}: {
        # 基礎底色
        bg: '${formatColor(data.bg)}',
        keyNormal: '${formatColor(data.keyNormal)}',
        keyNormalHighlight: '${formatColor(data.keyNormalHighlight)}',
        keySystem: '${formatColor(data.keySystem)}',
        keySystemHighlight: '${formatColor(data.keySystemHighlight)}',
        keyEnter: '${formatColor(data.keyEnter)}',
        keyEnterHighlight: '${formatColor(data.keyEnterHighlight)}',
        panelLeftBg: '${formatColor(data.panelLeftBg)}',
        panelRightBg: '${formatColor(data.panelRightBg)}',
        numericLeftPanelBg: '${formatColor(data.numericLeftPanelBg)}',
        
        # 文字與圖示顏色
        textMain: '${formatColor(data.textMain)}',
        textSub: '${formatColor(data.textSub)}',
        toolbarColor: '${formatColor(data.toolbarColor)}',
        
        # 候選字顏色
        candidateSelectedText: '${formatColor(data.candidateSelectedText)}',
        candidateUnselectedText: '${formatColor(data.candidateUnselectedText)}',
        candidateSelectedBg: '${formatColor(data.candidateSelectedBg)}',
        
        # 氣泡提示顏色
        bubbleTextSelected: '${formatColor(data.bubbleTextSelected)}',
        bubbleTextUnselected: '${formatColor(data.bubbleTextUnselected)}',
        
        # 輔助效果
        shadow: '${formatColor(data.shadow)}',
        border: '${formatColor(data.border)}',
        borderSize: ${data.borderSize || 0},
      }`;
    };

    // 輔助函數：生成 keyboard26Chinese override
    const generateKeyboard26Override = (data, mode) => {
        if (!data || !data[mode] || !data[mode].alphabet) {
            // 如果沒有資料，返回預設值
            const defaults = mode === 'light' ? {
                bg: '#FFFFFF', highlight: '#ABB0BA', color: '#000000',
                labelSize: 21, lowercaseSize: 23, borderColor: '#FFFFFF',
                borderWidth: 0, shadowColor: '#9a9c9a', shadowHighlight: '#9a9c9a',
                swipeColor: '#00000055', swipeSize: 8
            } : {
                bg: '#D1D1D165', highlight: '#D1D1D624', color: '#FFFFFF',
                labelSize: 21, lowercaseSize: 23, borderColor: '#D1D1D165',
                borderWidth: 0, shadowColor: '#1E1E1E', shadowHighlight: '#1E1E1E',
                swipeColor: '#FFFFFF55', swipeSize: 8
            };
            return `          ${mode}: {
            background: { normal: '${formatColor(defaults.bg)}', highlight: '${formatColor(defaults.highlight)}' },
            text: '${formatColor(defaults.color)}',
            fontSize: { uppercase: ${defaults.labelSize}, lowercase: ${defaults.lowercaseSize} },
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
            shadow: { normal: '${formatColor(defaults.shadowColor)}', highlight: '${formatColor(defaults.shadowHighlight)}' },
            swipeHint: { fontSize: ${defaults.swipeSize}, color: '${formatColor(defaults.swipeColor)}' },
          }`;
        }
        const d = data[mode].alphabet;
        return `          ${mode}: {
            background: { normal: '${formatColor(d.bg)}', highlight: '${formatColor(d.highlight)}' },
            text: '${formatColor(d.color)}',
            fontSize: { uppercase: ${d.labelSize}, lowercase: ${d.lowercaseSize} },
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
            shadow: { normal: '${formatColor(d.shadowColor)}', highlight: '${formatColor(d.shadowHighlight)}' },
            swipeHint: { fontSize: ${d.swipeSize}, color: '${formatColor(d.swipeColor)}' },
          }`;
    };

    const generateSystemKeysOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].systemKeys) {
            const defaults = mode === 'light' ? {
                bg: '#979faf80', highlight: '#FFFFFFE6', color: '#000000',
                labelSize: 16, borderColor: '#FFFFFF', borderWidth: 0,
                shadowColor: '#9a9c9a', shadowHighlight: '#9a9c9a'
            } : {
                bg: '#D1D1D624', highlight: '#D1D1D659', color: '#FFFFFF',
                labelSize: 16, borderColor: '#D1D1D165', borderWidth: 0,
                shadowColor: '#1E1E1E', shadowHighlight: '#1E1E1E'
            };
            return `          ${mode}: {
            background: { normal: '${formatColor(defaults.bg)}', highlight: '${formatColor(defaults.highlight)}' },
            text: '${formatColor(defaults.color)}',
            fontSize: ${defaults.labelSize},
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
            shadow: { normal: '${formatColor(defaults.shadowColor)}', highlight: '${formatColor(defaults.shadowHighlight)}' },
          }`;
        }
        const d = data[mode].systemKeys;
        return `          ${mode}: {
            background: { normal: '${formatColor(d.bg)}', highlight: '${formatColor(d.highlight)}' },
            text: '${formatColor(d.color)}',
            fontSize: ${d.labelSize},
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
            shadow: { normal: '${formatColor(d.shadowColor)}', highlight: '${formatColor(d.shadowHighlight)}' },
          }`;
    };

    const generateEnterKeyOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].enterKey) {
            const defaults = mode === 'light' ? {
                bg: '#979faf80', highlight: '#FFFFFFE6', color: '#000000',
                labelSize: 16, borderColor: '#FFFFFF', borderWidth: 0,
                shadowColor: '#9a9c9a', shadowHighlight: '#9a9c9a'
            } : {
                bg: '#D1D1D165', highlight: '#D1D1D659', color: '#FFFFFF',
                labelSize: 16, borderColor: '#D1D1D165', borderWidth: 0,
                shadowColor: '#1E1E1E', shadowHighlight: '#1E1E1E'
            };
            return `          ${mode}: {
            background: { normal: '${formatColor(defaults.bg)}', highlight: '${formatColor(defaults.highlight)}' },
            text: '${formatColor(defaults.color)}',
            fontSize: ${defaults.labelSize},
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
            shadow: { normal: '${formatColor(defaults.shadowColor)}', highlight: '${formatColor(defaults.shadowHighlight)}' },
          }`;
        }
        const d = data[mode].enterKey;
        return `          ${mode}: {
            background: { normal: '${formatColor(d.bg)}', highlight: '${formatColor(d.highlight)}' },
            text: '${formatColor(d.color)}',
            fontSize: ${d.labelSize},
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
            shadow: { normal: '${formatColor(d.shadowColor)}', highlight: '${formatColor(d.shadowHighlight)}' },
          }`;
    };

    const generateSpaceKeyOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].spaceKey) {
            const defaults = mode === 'light' ? {
                bg: '#FFFFFF', highlight: '#ABB0BA', color: '#000000',
                labelSize: 14, borderColor: '#FFFFFF', borderWidth: 0,
                shadowColor: '#9a9c9a', shadowHighlight: '#9a9c9a'
            } : {
                bg: '#D1D1D165', highlight: '#D1D1D624', color: '#FFFFFF',
                labelSize: 14, borderColor: '#D1D1D165', borderWidth: 0,
                shadowColor: '#1E1E1E', shadowHighlight: '#1E1E1E'
            };
            return `          ${mode}: {
            background: { normal: '${formatColor(defaults.bg)}', highlight: '${formatColor(defaults.highlight)}' },
            text: '${formatColor(defaults.color)}',
            fontSize: ${defaults.labelSize},
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
            shadow: { normal: '${formatColor(defaults.shadowColor)}', highlight: '${formatColor(defaults.shadowHighlight)}' },
          }`;
        }
        const d = data[mode].spaceKey;
        return `          ${mode}: {
            background: { normal: '${formatColor(d.bg)}', highlight: '${formatColor(d.highlight)}' },
            text: '${formatColor(d.color)}',
            fontSize: ${d.labelSize},
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
            shadow: { normal: '${formatColor(d.shadowColor)}', highlight: '${formatColor(d.shadowHighlight)}' },
          }`;
    };

    const generateCandidatesOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].candidates) {
            const defaults = mode === 'light' ? {
                selectedText: '#000000', unselectedText: '#000000', selectedBg: '#FFFFFF',
                controlButtons: { bg: '#FFFFFF', highlight: '#ABB0BA', color: '#000000', labelSize: 16, shadowColor: '#9a9c9a', shadowHighlight: '#9a9c9a' }
            } : {
                selectedText: '#FFFFFF', unselectedText: '#FFFFFF', selectedBg: '#D1D1D165',
                controlButtons: { bg: '#D1D1D165', highlight: '#D1D1D624', color: '#FFFFFF', labelSize: 16, shadowColor: '#1E1E1E', shadowHighlight: '#1E1E1E' }
            };
            return `          ${mode}: {
            selectedText: '${formatColor(defaults.selectedText)}',
            unselectedText: '${formatColor(defaults.unselectedText)}',
            selectedBackground: '${formatColor(defaults.selectedBg)}',
            controlButtons: {
              background: { normal: '${formatColor(defaults.controlButtons.bg)}', highlight: '${formatColor(defaults.controlButtons.highlight)}' },
              text: '${formatColor(defaults.controlButtons.color)}',
              fontSize: ${defaults.controlButtons.labelSize},
              shadow: { normal: '${formatColor(defaults.controlButtons.shadowColor)}', highlight: '${formatColor(defaults.controlButtons.shadowHighlight)}' },
            },
          }`;
        }
        const d = data[mode].candidates;
        const cb = d.controlButtons;
        return `          ${mode}: {
            selectedText: '${formatColor(d.selectedText)}',
            unselectedText: '${formatColor(d.unselectedText)}',
            selectedBackground: '${formatColor(d.selectedBg)}',
            controlButtons: {
              background: { normal: '${formatColor(cb.bg)}', highlight: '${formatColor(cb.highlight)}' },
              text: '${formatColor(cb.color)}',
              fontSize: ${cb.labelSize},
              shadow: { normal: '${formatColor(cb.shadowColor)}', highlight: '${formatColor(cb.shadowHighlight)}' },
            },
          }`;
    };

    const generateBubbleTextOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].bubbleText) {
            const defaults = mode === 'light' ? {
                selected: '#FFFFFF', unselected: '#000000'
            } : {
                selected: '#FFFFFF', unselected: '#FFFFFF'
            };
            return `          ${mode}: {
            selected: '${formatColor(defaults.selected)}',
            unselected: '${formatColor(defaults.unselected)}',
          }`;
        }
        const d = data[mode].bubbleText;
        return `          ${mode}: {
            selected: '${formatColor(d.selected)}',
            unselected: '${formatColor(d.unselected)}',
          }`;
    };

    // 輔助函數：生成 numeric override
    const generateNumericNumbersOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].numbers) {
            const defaults = mode === 'light' ? {
                bg: '#FFFFFF', highlight: '#ABB0BA', color: '#000000',
                labelSize: 24, borderColor: '#FFFFFF', borderWidth: 0,
                shadowColor: '#9a9c9a', shadowHighlight: '#9a9c9a'
            } : {
                bg: '#D1D1D165', highlight: '#D1D1D624', color: '#FFFFFF',
                labelSize: 24, borderColor: '#D1D1D165', borderWidth: 0,
                shadowColor: '#1E1E1E', shadowHighlight: '#1E1E1E'
            };
            return `          ${mode}: {
            background: { normal: '${formatColor(defaults.bg)}', highlight: '${formatColor(defaults.highlight)}' },
            text: '${formatColor(defaults.color)}',
            fontSize: ${defaults.labelSize},
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
            shadow: { normal: '${formatColor(defaults.shadowColor)}', highlight: '${formatColor(defaults.shadowHighlight)}' },
          }`;
        }
        const d = data[mode].numbers;
        return `          ${mode}: {
            background: { normal: '${formatColor(d.bg)}', highlight: '${formatColor(d.highlight)}' },
            text: '${formatColor(d.color)}',
            fontSize: ${d.labelSize},
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
            shadow: { normal: '${formatColor(d.shadowColor)}', highlight: '${formatColor(d.shadowHighlight)}' },
          }`;
    };

    const generateNumericLeftPanelOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].leftPanel) {
            const defaults = mode === 'light' ? {
                bg: '#979faf80', borderColor: '#FFFFFF', borderWidth: 0, shadowColor: '#9a9c9a'
            } : {
                bg: '#D1D1D624', borderColor: '#D1D1D165', borderWidth: 0, shadowColor: '#1E1E1E'
            };
            return `          ${mode}: {
            background: '${formatColor(defaults.bg)}',
            shadow: '${formatColor(defaults.shadowColor)}',
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
          }`;
        }
        const d = data[mode].leftPanel;
        return `          ${mode}: {
            background: '${formatColor(d.bg)}',
            shadow: '${formatColor(d.shadowColor)}',
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
          }`;
    };

    // 輔助函數：生成 symbolic/emoji override
    const generateSymbolicLeftPanelOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].leftPanel) {
            const defaults = mode === 'light' ? {
                bg: '#979faf80', color: '#000000', labelSize: 13,
                shadowColor: '#9a9c9a', borderColor: '#FFFFFF', borderWidth: 0,
                selectedBg: '#FFFFFF'
            } : {
                bg: '#D1D1D624', color: '#FFFFFF', labelSize: 13,
                shadowColor: '#1E1E1E', borderColor: '#D1D1D165', borderWidth: 0,
                selectedBg: '#D1D1D165'
            };
            return `          ${mode}: {
            background: '${formatColor(defaults.bg)}',
            text: '${formatColor(defaults.color)}',
            fontSize: ${defaults.labelSize},
            shadow: '${formatColor(defaults.shadowColor)}',
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
            categoryHighlight: '${formatColor(defaults.selectedBg)}',
          }`;
        }
        const d = data[mode].leftPanel;
        return `          ${mode}: {
            background: '${formatColor(d.bg)}',
            text: '${formatColor(d.color)}',
            fontSize: ${d.labelSize},
            shadow: '${formatColor(d.shadowColor)}',
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
            categoryHighlight: '${formatColor(d.selectedBg)}',
          }`;
    };

    const generateSymbolicRightPanelOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].rightPanel) {
            const defaults = mode === 'light' ? {
                bg: '#FFFFFF', color: '#000000', labelSize: 16,
                shadowColor: '#9a9c9a', borderColor: '#FFFFFF', borderWidth: 0
            } : {
                bg: '#D1D1D165', color: '#FFFFFF', labelSize: 16,
                shadowColor: '#1E1E1E', borderColor: '#D1D1D165', borderWidth: 0
            };
            return `          ${mode}: {
            background: '${formatColor(defaults.bg)}',
            text: '${formatColor(defaults.color)}',
            fontSize: ${defaults.labelSize},
            shadow: '${formatColor(defaults.shadowColor)}',
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
          }`;
        }
        const d = data[mode].rightPanel;
        return `          ${mode}: {
            background: '${formatColor(d.bg)}',
            text: '${formatColor(d.color)}',
            fontSize: ${d.labelSize},
            shadow: '${formatColor(d.shadowColor)}',
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
          }`;
    };

    const generateEmojiRightPanelOverride = (data, mode) => {
        if (!data || !data[mode] || !data[mode].rightPanel) {
            const defaults = mode === 'light' ? {
                bg: '#FFFFFF', labelSize: 16,
                shadowColor: '#9a9c9a', borderColor: '#FFFFFF', borderWidth: 0
            } : {
                bg: '#D1D1D165', labelSize: 16,
                shadowColor: '#1E1E1E', borderColor: '#D1D1D165', borderWidth: 0
            };
            return `          ${mode}: {
            background: '${formatColor(defaults.bg)}',
            fontSize: ${defaults.labelSize},
            shadow: '${formatColor(defaults.shadowColor)}',
            border: { color: '${formatColor(defaults.borderColor)}', size: ${defaults.borderWidth} },
          }`;
        }
        const d = data[mode].rightPanel;
        return `          ${mode}: {
            background: '${formatColor(d.bg)}',
            fontSize: ${d.labelSize},
            shadow: '${formatColor(d.shadowColor)}',
            border: { color: '${formatColor(d.borderColor)}', size: ${d.borderWidth} },
          }`;
    };

    // 開始生成完整的 Settings.libsonnet
    return `#======================================
# 蝦米輸入法皮膚自訂設定檔
# 修改完成後，回到皮膚界面長按皮膚選擇「編譯」生效
#======================================
{
  # ===== 鍵盤佈局設定 =====
  
  # 空白鍵佈局切換
  # 控制第四排按鈕尺寸配置
  # '1': 逗號句號較大，空白鍵較小
  # '2': 逗號句號較小，空白鍵較大
  spaceKeyLayout: '${settings.spaceKeyLayout || '1'}',
  
  # 慣用手設定
  # 控制 z 鍵上滑及長按選項中的單手模式切換方向
  # 'left': 慣用左手（預設）
  # 'right': 慣用右手
  # 注意：橫屏模式下會自動隱藏單手模式選項，不受此設定影響
  handedness: '${settings.handedness || 'left'}',

  # ===== 工具列按鈕配置 =====
  
  # 按鈕編號對應表：
  # 【常用功能 0-9】
  # 0: 空白佔位符        1: 元書設定面板      2: 收折按鈕
  # 3: 中英切換          4: 簡繁切換          5: 常用語面版
  # 6: 剪貼本面版        7: 符號鍵盤          8: Emoji鍵盤        9: 數字鍵盤
  # 【編輯功能 10-19】
  # 10: 全選             11: 複製             12: 剪下            13: 貼上
  # 14: 復原             15: 重做             16: 游標左移        17: 游標右移
  # 18: 左手模式         19: 右手模式
  # 【其他設定 20-25】
  # 20: 效能監控         21: Rime部署         22: 腳本面版        23: 文件管理捷徑
  # 24: 皮膚設定捷徑     25: 皮膚微調捷徑
  #
  # 完全自訂10個按鈕位置（包含面板和收折）
  # 預設配置：[面板] [空 空 中英 簡繁 常用語 剪貼 符號 emoji] [收折]
  toolbarButtons: [${settings.toolbarButtons ? settings.toolbarButtons.join(', ') : '1, 0, 0, 3, 4, 5, 6, 7, 8, 2'}],
  
  # ===== 滑動與長按功能設定 =====
  
  # 全域滑動功能控制
  enableSwipeUpActions: ${settings.enableSwipeUpActions !== undefined ? settings.enableSwipeUpActions : true},
  enableSwipeDownActions: ${settings.enableSwipeDownActions !== undefined ? settings.enableSwipeDownActions : true},
  enableLongPressActions: ${settings.enableLongPressActions !== undefined ? settings.enableLongPressActions : true},
  
  # 滑動提示文字顯示
  showSwipeUpText: ${settings.showSwipeUpText !== undefined ? settings.showSwipeUpText : true},
  showSwipeDownText: ${settings.showSwipeDownText !== undefined ? settings.showSwipeDownText : true},

  # ===== 進階分行控制（進階用戶專用）=====
  # 分行設定會覆蓋全域設定，取消註解「//」即可使用
  # Row1: Q W E R T Y U I O P (10個鍵)
  # Row2: A S D F G H J K L (9個鍵) 
  # Row3: Z X C V B N M (7個鍵)
  # Row4: 逗號、句號 (2個鍵，僅支援長按控制)

  advancedRowControl: {
${generateRowControl('row1', settings.advancedRowControl?.row1, settings.enableAdvancedRowControl)}
${generateRowControl('row2', settings.advancedRowControl?.row2, settings.enableAdvancedRowControl)}
${generateRowControl('row3', settings.advancedRowControl?.row3, settings.enableAdvancedRowControl)}
${generateRowControl('row4', settings.advancedRowControl?.row4, settings.enableAdvancedRowControl)}
  },

  # ===== 核心視覺架構 (3-Layer System) =====
  # 這裡提供強大的皮膚自定義能力，分為三個層級。
  
  customColors: {
    # 啟用自訂配色（false = 使用系統預設主題）
    enableCustomColors: ${settings.enableCustomColors !== undefined ? settings.enableCustomColors : false},

    # 【第一層：調色盤Palette】
    # 定義整套皮膚的色彩底蘊。改動這裡，所有模式會同步反應。
    palette: {
${generatePaletteMode('light', settings.palette?.light || {})}
      ,
${generatePaletteMode('dark', settings.palette?.dark || {})}
    },

    # 【第二層：尺寸範本Size Templates】
    # 僅定義各類別按鍵的預設字號。顏色預設由引擎自動對應調色盤。
    groups: {
      light: {
        alphabetSize: ${settings.groups?.light?.alphabetSize || 21},
        lowercaseSize: ${settings.groups?.light?.lowercaseSize || 23},
        systemSize: ${settings.groups?.light?.systemSize || 16},
        spaceSize: ${settings.groups?.light?.spaceSize || 14},
        numberSize: ${settings.groups?.light?.numberSize || 24},
        panelSmallSize: ${settings.groups?.light?.panelSmallSize || 13},
        panelLargeSize: ${settings.groups?.light?.panelLargeSize || 16},
        toolbarSize: ${settings.groups?.light?.toolbarSize || 20},
        swipeSize: ${settings.groups?.light?.swipeSize || 8},
      },
      dark: {
        alphabetSize: ${settings.groups?.dark?.alphabetSize || 21},
        lowercaseSize: ${settings.groups?.dark?.lowercaseSize || 23},
        systemSize: ${settings.groups?.dark?.systemSize || 16},
        spaceSize: ${settings.groups?.dark?.spaceSize || 14},
        numberSize: ${settings.groups?.dark?.numberSize || 24},
        panelSmallSize: ${settings.groups?.dark?.panelSmallSize || 13},
        panelLargeSize: ${settings.groups?.dark?.panelLargeSize || 16},
        toolbarSize: ${settings.groups?.dark?.toolbarSize || 20},
        swipeSize: ${settings.groups?.dark?.swipeSize || 8},
      },
    },

    # 【第三層：個別鍵盤微調 Overrides】
    # 提供對「特定鍵盤」最細緻的控制權。
    # 所有設定都會覆蓋第1層（Palette）和第2層（Groups）的預設值。
    overrides: {
      # ===== 26鍵中文鍵盤（蝦米輸入） =====
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有 26 鍵鍵盤覆蓋設定
      enable26ChineseOverride: ${settings.overrides?.enable26ChineseOverride || false},
      
      keyboard26Chinese: if self.enable26ChineseOverride then {
        # 字母鍵 (A~Z, 逗號, 句號)
        alphabet: {
${generateKeyboard26Override(settings.overrides?.keyboard26Chinese, 'light')}
          ,
${generateKeyboard26Override(settings.overrides?.keyboard26Chinese, 'dark')}
        },
        
        # 系統功能鍵 (Shift, 123, Delete)
        systemKeys: {
${generateSystemKeysOverride(settings.overrides?.keyboard26Chinese, 'light')}
          ,
${generateSystemKeysOverride(settings.overrides?.keyboard26Chinese, 'dark')}
        },
        
        # Enter 鍵
        enterKey: {
${generateEnterKeyOverride(settings.overrides?.keyboard26Chinese, 'light')}
          ,
${generateEnterKeyOverride(settings.overrides?.keyboard26Chinese, 'dark')}
        },
        
        # Space 鍵
        spaceKey: {
${generateSpaceKeyOverride(settings.overrides?.keyboard26Chinese, 'light')}
          ,
${generateSpaceKeyOverride(settings.overrides?.keyboard26Chinese, 'dark')}
        },
        
        # 候選字區域
        candidates: {
${generateCandidatesOverride(settings.overrides?.keyboard26Chinese, 'light')}
          ,
${generateCandidatesOverride(settings.overrides?.keyboard26Chinese, 'dark')}
        },
        
        # 氣泡文字顏色
        bubbleText: {
${generateBubbleTextOverride(settings.overrides?.keyboard26Chinese, 'light')}
          ,
${generateBubbleTextOverride(settings.overrides?.keyboard26Chinese, 'dark')}
        },
        
        # 鍵盤背景色
        keyboardBackground: {
          light: '${formatColor(settings.overrides?.keyboard26Chinese?.light?.keyboardBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.keyboard26Chinese?.dark?.keyboardBackground?.bg || '#47474701')}',
        },
        
        # 工具列背景色
        toolbarBackground: {
          light: '${formatColor(settings.overrides?.keyboard26Chinese?.light?.toolbarBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.keyboard26Chinese?.dark?.toolbarBackground?.bg || '#47474701')}',
        },
        
        # 工具列按鈕
        toolbarButtons: {
          light: {
            color: '${formatColor(settings.overrides?.keyboard26Chinese?.light?.toolbarButtons?.color || '#666666')}',
            fontSize: ${settings.overrides?.keyboard26Chinese?.light?.toolbarButtons?.size || 20},
          },
          dark: {
            color: '${formatColor(settings.overrides?.keyboard26Chinese?.dark?.toolbarButtons?.color || '#CCCCCC')}',
            fontSize: ${settings.overrides?.keyboard26Chinese?.dark?.toolbarButtons?.size || 20},
          },
        },
      } else {},
      
      # ===== 數字鍵盤 =====
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有數字鍵盤覆蓋設定
      enableNumericOverride: ${settings.overrides?.enableNumericOverride || false},
      
      numeric: if self.enableNumericOverride then {
        numbers: {
${generateNumericNumbersOverride(settings.overrides?.numeric, 'light')}
          ,
${generateNumericNumbersOverride(settings.overrides?.numeric, 'dark')}
        },
        leftPanel: {
${generateNumericLeftPanelOverride(settings.overrides?.numeric, 'light')}
          ,
${generateNumericLeftPanelOverride(settings.overrides?.numeric, 'dark')}
        },
        systemKeys: {
${generateSystemKeysOverride(settings.overrides?.numeric, 'light')}
          ,
${generateSystemKeysOverride(settings.overrides?.numeric, 'dark')}
        },
        enterKey: {
${generateEnterKeyOverride(settings.overrides?.numeric, 'light')}
          ,
${generateEnterKeyOverride(settings.overrides?.numeric, 'dark')}
        },
        keyboardBackground: {
          light: '${formatColor(settings.overrides?.numeric?.light?.keyboardBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.numeric?.dark?.keyboardBackground?.bg || '#47474701')}',
        },
        toolbarBackground: {
          light: '${formatColor(settings.overrides?.numeric?.light?.toolbarBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.numeric?.dark?.toolbarBackground?.bg || '#47474701')}',
        },
        toolbarButtons: {
          light: {
            color: '${formatColor(settings.overrides?.numeric?.light?.toolbarButtons?.color || '#666666')}',
            fontSize: ${settings.overrides?.numeric?.light?.toolbarButtons?.size || 20},
          },
          dark: {
            color: '${formatColor(settings.overrides?.numeric?.dark?.toolbarButtons?.color || '#CCCCCC')}',
            fontSize: ${settings.overrides?.numeric?.dark?.toolbarButtons?.size || 20},
          },
        },
      } else {},
      
      # ===== 符號鍵盤 =====
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有符號鍵盤覆蓋設定
      enableSymbolicOverride: ${settings.overrides?.enableSymbolicOverride || false},
      
      symbolic: if self.enableSymbolicOverride then {
        leftPanel: {
${generateSymbolicLeftPanelOverride(settings.overrides?.symbolic, 'light')}
          ,
${generateSymbolicLeftPanelOverride(settings.overrides?.symbolic, 'dark')}
        },
        rightPanel: {
${generateSymbolicRightPanelOverride(settings.overrides?.symbolic, 'light')}
          ,
${generateSymbolicRightPanelOverride(settings.overrides?.symbolic, 'dark')}
        },
        systemKeys: {
${generateSystemKeysOverride(settings.overrides?.symbolic, 'light')}
          ,
${generateSystemKeysOverride(settings.overrides?.symbolic, 'dark')}
        },
        keyboardBackground: {
          light: '${formatColor(settings.overrides?.symbolic?.light?.keyboardBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.symbolic?.dark?.keyboardBackground?.bg || '#47474701')}',
        },
        toolbarBackground: {
          light: '${formatColor(settings.overrides?.symbolic?.light?.toolbarBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.symbolic?.dark?.toolbarBackground?.bg || '#47474701')}',
        },
        toolbarButtons: {
          light: {
            color: '${formatColor(settings.overrides?.symbolic?.light?.toolbarButtons?.color || '#666666')}',
            fontSize: ${settings.overrides?.symbolic?.light?.toolbarButtons?.size || 20},
          },
          dark: {
            color: '${formatColor(settings.overrides?.symbolic?.dark?.toolbarButtons?.color || '#CCCCCC')}',
            fontSize: ${settings.overrides?.symbolic?.dark?.toolbarButtons?.size || 20},
          },
        },
      } else {},
      
      # ===== Emoji 鍵盤 =====
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有 Emoji 鍵盤覆蓋設定
      enableEmojiOverride: ${settings.overrides?.enableEmojiOverride || false},
      
      emoji: if self.enableEmojiOverride then {
        leftPanel: {
${generateSymbolicLeftPanelOverride(settings.overrides?.emoji, 'light')}
          ,
${generateSymbolicLeftPanelOverride(settings.overrides?.emoji, 'dark')}
        },
        rightPanel: {
${generateEmojiRightPanelOverride(settings.overrides?.emoji, 'light')}
          ,
${generateEmojiRightPanelOverride(settings.overrides?.emoji, 'dark')}
        },
        systemKeys: {
${generateSystemKeysOverride(settings.overrides?.emoji, 'light')}
          ,
${generateSystemKeysOverride(settings.overrides?.emoji, 'dark')}
        },
        keyboardBackground: {
          light: '${formatColor(settings.overrides?.emoji?.light?.keyboardBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.emoji?.dark?.keyboardBackground?.bg || '#47474701')}',
        },
        toolbarBackground: {
          light: '${formatColor(settings.overrides?.emoji?.light?.toolbarBackground?.bg || '#D0D3DA01')}',
          dark: '${formatColor(settings.overrides?.emoji?.dark?.toolbarBackground?.bg || '#47474701')}',
        },
        toolbarButtons: {
          light: {
            color: '${formatColor(settings.overrides?.emoji?.light?.toolbarButtons?.color || '#666666')}',
            fontSize: ${settings.overrides?.emoji?.light?.toolbarButtons?.size || 20},
          },
          dark: {
            color: '${formatColor(settings.overrides?.emoji?.dark?.toolbarButtons?.color || '#CCCCCC')}',
            fontSize: ${settings.overrides?.emoji?.dark?.toolbarButtons?.size || 20},
          },
        },
      } else {}
    }
  }
}
`;
}

// 如果在 Node.js 環境中，導出函數
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { generateCompleteSettingsLibsonnet };
}
