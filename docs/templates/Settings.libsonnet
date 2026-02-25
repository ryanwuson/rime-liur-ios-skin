#======================================
# 蝦米輸入法皮膚自訂設定檔
# 修改完成後，回到皮膚界面長按皮膚選擇「編譯」生效
#======================================
{
  # ===== 鍵盤佈局設定 =====
  
  # 空白鍵佈局切換
  # 控制第四排按鈕尺寸配置
  # '1': 逗號句號較大，空白鍵較小
  # '2': 逗號句號較小，空白鍵較大
  spaceKeyLayout: '1',
  
  # 慣用手設定
  # 控制 z 鍵上滑及長按選項中的單手模式切換方向
  # 'left': 慣用左手（預設）
  # 'right': 慣用右手
  # 注意：橫屏模式下會自動隱藏單手模式選項，不受此設定影響
  handedness: 'left',

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
  toolbarButtons: [1, 0, 0, 3, 4, 5, 6, 7, 8, 2],
  
  # ===== 滑動與長按功能設定 =====
  
  # 全域滑動功能控制
  enableSwipeUpActions: true,      # 控制上滑動作
  enableSwipeDownActions: true,    # 控制下滑動作
  enableLongPressActions: true,    # 控制長按動作
  
  # 滑動提示文字顯示
  showSwipeUpText: true,           # 顯示上滑提示文字
  showSwipeDownText: true,         # 顯示下滑提示文字

  # ===== 進階分行控制（進階用戶專用）=====
  # 分行設定會覆蓋全域設定，取消註解「//」即可使用
  # Row1: Q W E R T Y U I O P (10個鍵)
  # Row2: A S D F G H J K L (9個鍵) 
  # Row3: Z X C V B N M (7個鍵)
  # Row4: 逗號、句號 (2個鍵，僅支援長按控制)

  advancedRowControl: {
    row1: { 
      # 範例：第一行關閉所有滑動功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: false,   # 關閉下滑動作
      // enableLongPressActions: false,   # 關閉長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: false,        # 隱藏下滑文字
    },
    row2: { 
      # 範例：第二行僅保留下滑功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: true,    # 保留下滑動作
      // enableLongPressActions: false,   # 關閉長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: true,         # 顯示下滑文字
    },
    row3: { 
      # 範例：第三行僅保留長按功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,     # 關閉上滑動作
      // enableSwipeDownActions: false,   # 關閉下滑動作
      // enableLongPressActions: true,    # 保留長按功能
      // showSwipeUpText: false,          # 隱藏上滑文字
      // showSwipeDownText: false,        # 隱藏下滑文字
    },
    row4: { 
      # 範例：逗號句號行關閉長按功能（取消註解「//」即可使用）
      // enableSwipeUpActions: false,    # 關閉上滑動作
      // enableLongPressActions: false,  # 關閉長按功能
    },
  },

  # ===== 核心視覺架構 (3-Layer System) =====
  # 這裡提供強大的皮膚自定義能力，分為三個層級。
  
  customColors: {
    # 啟用自訂配色（false = 使用系統預設主題）
    enableCustomColors: false,

    # 【第一層：調色盤Palette】
    # 定義整套皮膚的色彩底蘊。改動這裡，所有模式會同步反應。
    palette: {
      light: {
        # 基礎底色
        bg: '#D0D3DA01',         // 鍵盤整體背景
        keyNormal: '#FFFFFF',    // 一般按鍵 (白鍵)
        keyNormalHighlight: '#ABB0BA',  // 一般按鍵按下時
        keySystem: '#979faf80',  // 特殊/功能鍵 (灰鍵)
        keySystemHighlight: '#FFFFFFE6',  // 特殊/功能鍵按下時
        keyEnter: '#979faf80',   // Enter 鍵專用
        keyEnterHighlight: '#FFFFFFE6',  // Enter 鍵按下時
        panelLeftBg: '#979faf80',// 符號/Emoji 鍵盤左側欄底色
        panelRightBg: '#FFFFFF', // 符號/Emoji 鍵盤右側欄底色
        numericLeftPanelBg: '#979faf80', // 數字鍵盤左側面板底色    
        
        # 文字與圖示顏色
        textMain: '#000000',     // 主文字 (A-Z, 0-9)
        textSub: '#00000055',    // 滑動提示/次要文字
        toolbarColor: '#666666', // 工具列圖示
        
        # 候選字顏色（分為選中和未選中）
        candidateSelectedText: '#000000',    // 候選字選中文字
        candidateUnselectedText: '#000000',  // 候選字未選中文字
        candidateSelectedBg: '#FFFFFF',      // 候選字選中背景
        
        # 氣泡提示顏色
        bubbleTextSelected: '#FFFFFF',       // 長按氣泡選中文字顏色
        bubbleTextUnselected: '#000000',     // 點按氣泡 + 長按氣泡非選中文字顏色
        
        # 輔助效果 (全域徹底統一)
        shadow: '#9a9c9a',       // 【核心】全鍵盤通用陰影色
        border: '#FFFFFF',       // 按鍵邊框
        borderSize: 0,           // 邊框寬度
      },
      dark: {
        bg: '#47474701',
        keyNormal: '#D1D1D165',
        keyNormalHighlight: '#D1D1D624',  // 一般按鍵按下時
        keySystem: '#D1D1D624',
        keySystemHighlight: '#D1D1D659',  // 特殊/功能鍵按下時
        keyEnter: '#D1D1D624',
        keyEnterHighlight: '#D1D1D659',  // Enter 鍵按下時
        panelLeftBg: '#D1D1D624',
        numericLeftPanelBg: '#D1D1D624', // 數字鍵盤左側面板底色
        panelRightBg: '#D1D1D165',
        textMain: '#FFFFFF',
        textSub: '#FFFFFF55',      // 滑動提示/次要文字
        toolbarColor: '#CCCCCC', // 工具列圖示
        candidateSelectedText: '#FFFFFF',
        candidateUnselectedText: '#FFFFFF',
        candidateSelectedBg: '#D1D1D165',
        bubbleTextSelected: '#FFFFFF',       // 長按氣泡選中文字顏色
        bubbleTextUnselected: '#FFFFFF',     // 點按氣泡 + 長按氣泡非選中文字顏色
        shadow: '#1E1E1E',       // 暗色模式全域統一陰影
        border: '#D1D1D165',     // 按鍵邊框
        borderSize: 0,           // 邊框寬度
      }
    },

    # 【第二層：尺寸範本Size Templates】
    # 僅定義各類別按鍵的預設字號。顏色預設由引擎自動對應調色盤。
    groups: {
      alphabetSize: 21,         // 大寫字母字號
      lowercaseSize: 23,        // 小寫字母字號
      systemSize: 16,           // 功能鍵 (Shift, 123, Delete, Enter, 返回, 上捲, 下捲)
      spaceSize: 14,            // 空白鍵字號
      numberSize: 24,           // 數字鍵盤 0~9 字號
      panelSmallSize: 13,       // 側欄小字 (如符號分類)
      panelLargeSize: 16,       // 內容大字 (如符號內容)
      toolbarSize: 20,          // 工具列圖示大小
      swipeSize: 8,             // 滑動提示字大小
    },

    # 【第三層：個別鍵盤微調 Overrides】
    # 提供對「特定鍵盤」最細緻的控制權。
    # 所有設定都會覆蓋第1層（Palette）和第2層（Groups）的預設值。
    # 
    # 使用方式：將 enable26ChineseOverride 改為 true，即可啟用下方所有設定
    # 不需要逐行取消註解，只要改一個開關即可！
    overrides: {
      # ===== 26鍵中文鍵盤（蝦米輸入） =====
      # 中文和英文鍵盤共用此設定
      # 
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有 26 鍵鍵盤覆蓋設定
      enable26ChineseOverride: false,
      
      keyboard26Chinese: if self.enable26ChineseOverride then {
        # 字母鍵 (A~Z, 逗號, 句號)
        alphabet: {
          light: {
            background: { normal: '#FFFFFF', highlight: '#ABB0BA' },
            text: '#000000',
            fontSize: { uppercase: 21, lowercase: 23 },
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
            swipeHint: { fontSize: 8, color: '#00000055' },
          },
          dark: {
            background: { normal: '#D1D1D165', highlight: '#D1D1D624' },
            text: '#FFFFFF',
            fontSize: { uppercase: 21, lowercase: 23 },
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
            swipeHint: { fontSize: 8, color: '#FFFFFF55' },
          },
        },
        
        # 系統功能鍵 (Shift, 123, Delete)
        systemKeys: {
          light: {
            background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
            text: '#000000',
            fontSize: 16,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D624', highlight: '#D1D1D659' },
            text: '#FFFFFF',
            fontSize: 16,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        
        # Enter 鍵
        enterKey: {
          light: {
            background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
            text: '#000000',
            fontSize: 16,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D165', highlight: '#D1D1D659' },
            text: '#FFFFFF',
            fontSize: 16,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        
        # Space 鍵
        spaceKey: {
          light: {
            background: { normal: '#FFFFFF', highlight: '#ABB0BA' },
            text: '#000000',
            fontSize: 14,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D165', highlight: '#D1D1D624' },
            text: '#FFFFFF',
            fontSize: 14,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        
        # 候選字區域
        candidates: {
          light: {
            selectedText: '#000000',
            unselectedText: '#000000',
            selectedBackground: '#FFFFFF',
            controlButtons: {
              background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
              text: '#000000',
              fontSize: 16,
              shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
            },
          },
          dark: {
            selectedText: '#FFFFFF',
            unselectedText: '#FFFFFF',
            selectedBackground: '#D1D1D165',
            controlButtons: {
              background: { normal: '#D1D1D624', highlight: '#D1D1D659' },
              text: '#FFFFFF',
              fontSize: 16,
              shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
            },
          },
        },
        
        # 氣泡文字顏色
        bubbleText: {
          light: {
            selected: '#FFFFFF',
            unselected: '#000000',
          },
          dark: {
            selected: '#FFFFFF',
            unselected: '#FFFFFF',
          },
        },
        
        # 鍵盤背景色
        keyboardBackground: {
          light: '#D0D3DA01',
          dark: '#1C1C1E01',
        },
        
        # 工具列背景色
        toolbarBackground: {
          light: '#D0D3DA01',
          dark: '#1C1C1E01',
        },
        
        # 工具列按鈕
        toolbarButtons: {
          light: {
            color: '#666666',
            fontSize: 20,
          },
          dark: {
            color: '#CCCCCC',
            fontSize: 20,
          },
        },
      } else {},
      
      # ===== 數字鍵盤 =====
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有數字鍵盤覆蓋設定
      enableNumericOverride: false,
      
      numeric: if self.enableNumericOverride then {
        numbers: {
          light: {
            background: { normal: '#FFFFFF', highlight: '#ABB0BA' },
            text: '#000000',
            fontSize: 24,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D165', highlight: '#D1D1D624' },
            text: '#FFFFFF',
            fontSize: 24,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        leftPanel: {
          light: {
            background: '#979faf80',
            shadow: '#9a9c9a',
            border: { color: '#FFFFFF', size: 0 },
          },
          dark: {
            background: '#D1D1D624',
            shadow: '#1E1E1E',
            border: { color: '#D1D1D165', size: 0 },
          },
        },
        systemKeys: {
          light: {
            background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
            text: '#000000',
            fontSize: 16,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D624', highlight: '#D1D1D659' },
            text: '#FFFFFF',
            fontSize: 16,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        enterKey: {
          light: {
            background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
            text: '#000000',
            fontSize: 16,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D165', highlight: '#D1D1D659' },
            text: '#FFFFFF',
            fontSize: 16,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        keyboardBackground: {
          light: '#D0D3DA01',
          dark: '#1C1C1E01',
        },
        toolbarBackground: {
          light: '#D0D3DA01',
          dark: '#1C1C1E01',
        },
        
        # 工具列按鈕
        toolbarButtons: {
          light: {
            color: '#666666',
            fontSize: 20,
          },
          dark: {
            color: '#CCCCCC',
            fontSize: 20,
          },
        },
      } else {},
      
      # ===== 符號鍵盤 =====
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有符號鍵盤覆蓋設定
      enableSymbolicOverride: false,
      
      symbolic: if self.enableSymbolicOverride then {
        leftPanel: {
          light: {
            background: '#979faf80',
            text: '#000000',
            fontSize: 13,
            shadow: '#9a9c9a',
            border: { color: '#FFFFFF', size: 0 },
            categoryHighlight: '#ABB0BA',
          },
          dark: {
            background: '#D1D1D624',
            text: '#FFFFFF',
            fontSize: 13,
            shadow: '#1E1E1E',
            border: { color: '#D1D1D165', size: 0 },
            categoryHighlight: '#D1D1D659',
          },
        },
        rightPanel: {
          light: {
            background: '#FFFFFF',
            text: '#000000',
            fontSize: 16,
            shadow: '#9a9c9a',
            border: { color: '#FFFFFF', size: 0 },
          },
          dark: {
            background: '#D1D1D165',
            text: '#FFFFFF',
            fontSize: 16,
            shadow: '#1E1E1E',
            border: { color: '#D1D1D165', size: 0 },
          },
        },
        systemKeys: {
          light: {
            background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
            text: '#000000',
            fontSize: 16,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D624', highlight: '#D1D1D659' },
            text: '#FFFFFF',
            fontSize: 16,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        keyboardBackground: {
          light: '#D0D3DA01',
          dark: '#1C1C1E01',
        },
      } else {},
      
      # ===== Emoji 鍵盤 =====
      # 🔧 啟用開關：將 false 改為 true 即可啟用所有 Emoji 鍵盤覆蓋設定
      enableEmojiOverride: false,
      
      emoji: if self.enableEmojiOverride then {
        leftPanel: {
          light: {
            background: '#979faf80',
            text: '#000000',
            fontSize: 13,
            shadow: '#9a9c9a',
            border: { color: '#FFFFFF', size: 0 },
            categoryHighlight: '#ABB0BA',
          },
          dark: {
            background: '#D1D1D624',
            text: '#FFFFFF',
            fontSize: 13,
            shadow: '#1E1E1E',
            border: { color: '#D1D1D165', size: 0 },
            categoryHighlight: '#D1D1D659',
          },
        },
        rightPanel: {
          light: {
            background: '#FFFFFF',
            fontSize: 16,
            shadow: '#9a9c9a',
            border: { color: '#FFFFFF', size: 0 },
          },
          dark: {
            background: '#D1D1D165',
            fontSize: 16,
            shadow: '#1E1E1E',
            border: { color: '#D1D1D165', size: 0 },
          },
        },
        systemKeys: {
          light: {
            background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
            text: '#000000',
            fontSize: 16,
            border: { color: '#FFFFFF', size: 0 },
            shadow: { normal: '#9a9c9a', highlight: '#9a9c9a' },
          },
          dark: {
            background: { normal: '#D1D1D624', highlight: '#D1D1D659' },
            text: '#FFFFFF',
            fontSize: 16,
            border: { color: '#D1D1D165', size: 0 },
            shadow: { normal: '#1E1E1E', highlight: '#1E1E1E' },
          },
        },
        keyboardBackground: {
          light: '#D0D3DA01',
          dark: '#1C1C1E01',
        },
      } else {}
    }
  }
}