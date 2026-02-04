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
  
  # 其他範例配置：
  # 編輯功能版：[1, 10, 11, 12, 13, 14, 15, 7, 8, 2]  (面板+編輯功能+符號+emoji+收折)
  # 系統功能版：[1, 21, 22, 23, 24, 25, 7, 8, 9, 2]   (面板+系統功能+符號+emoji+數字+收折)
  # 混合配置版：[1, 10, 11, 21, 3, 4, 5, 6, 7, 2]     (面板+編輯+效能+基本功能+收折)
  # 極簡配置版：[1, 3, 4, 0, 0, 0, 0, 0, 0, 2]        (面板+中英+簡繁+空白+收折)

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

  # ===== 統一配色系統 =====
  
  customColors: {
    # 啟用自訂配色（false = 使用原版配色）
    enableCustomColors: false,
    
    # ===== 主鍵盤配色 =====
    keyboardColors: {
      # 字母數字鍵（A-Z, 0-9）
      letterNumberKeys: {
        light: {
          background: { normal: '#FFFFFF', highlight: '#ABB0BA' },
          text: '#000000',
          fontSize: { 
            primary: 21,    # 數字鍵、大寫字母
            lowercase: 23,  # 小寫字母（中英文統一）
          },
        },
        dark: {
          background: { normal: '#D1D1D165', highlight: '#D1D1D624' },
          text: '#FFFFFF',
          fontSize: { 
            primary: 21,
            lowercase: 23,
          },
        },
      },
      
      # 系統功能鍵（Shift, Delete 等，不含空白鍵和 Return 鍵）
      systemKeys: {
        light: {
          background: { normal: '#979faf80', highlight: '#FFFFFFE6' },
          text: '#000000',
          fontSize: 16,
        },
        dark: {
          background: { normal: '#D1D1D624', highlight: '#D1D1D659' },
          text: '#FFFFFF',
          fontSize: 16,
        },
      },
      
      # Enter 鍵專用（主題色按鈕）
      accentKeys: {
        light: {
          background: { normal: '#007AFF', highlight: '#0056CC' },
          text: '#FFFFFF',
          fontSize: 16,
        },
        dark: {
          background: { normal: '#007AFF', highlight: '#0056CC' },
          text: '#FFFFFF',
          fontSize: 16,
        },
      },
      
      # 空白鍵文字（統一字色和字號，背景色跟隨字母鍵）
      spaceKeyText: {
        light: { color: '#000000', fontSize: 14 },
        dark: { color: '#FFFFFF', fontSize: 14 },
      },
      
      # 英文鍵盤（僅大小寫字母）
      englishKeyboard: {
        light: {
          text: '#000000',  # 大小寫統一字色
          fontSize: { 
            lowercase: 23,  # 小寫字母
            uppercase: 21,  # 大寫字母
          },
        },
        dark: {
          text: '#FFFFFF',
          fontSize: { 
            lowercase: 23,
            uppercase: 21,
          },
        },
      },
      
      # 鍵盤背景與陰影
      background: {
        light: '#D0D3DA01',
        dark: '#47474701',
      },
      shadow: {
        light: { normal: '#9a9c9a', highlight: '#9a9c9a' },
        dark: { normal: '#1E1E1E', highlight: '#1D1D1D' },
      },
    },
    
    # ===== 特殊鍵盤配色 =====
    specialKeyboards: {
      # 數字鍵盤
      numericKeyboard: {
        light: {
          numbers: { color: '#000000', fontSize: 24 },
        },
        dark: {
          numbers: { color: '#FFFFFF', fontSize: 24 },
        },
      },
      
      # 符號鍵盤
      symbolKeyboard: {
        light: {
          leftPanel: { background: '#979faf80', text: '#000000', shadow: '#9a9c9a', fontSize: 13 },
          rightPanel: { background: '#ffffff', text: '#000000', shadow: '#88898D40', fontSize: 16 },
        },
        dark: {
          leftPanel: { background: '#D1D1D624', text: '#FFFFFF', shadow: '#1E1E1E', fontSize: 13 },
          rightPanel: { background: '#D1D1D165', text: '#FFFFFF', shadow: '#343941', fontSize: 16 },
        },
      },
    },
    
    # ===== 互動提示配色 =====
    interactionColors: {
      swipeHints: {
        light: { upSwipe: '#00000055', downSwipe: '#00000055', fontSize: 8 },
        dark: { upSwipe: '#FFFFFF55', downSwipe: '#FFFFFF55', fontSize: 8 },
      },
      bubbles: {
        light: { text: '#000000' },
        dark: { text: '#FFFFFF' },
      },
    },
    
    # ===== 介面元素配色 =====
    interfaceColors: {
      toolbar: {
        light: { color: '#666666', fontSize: 20 },
        dark: { color: '#CCCCCC', fontSize: 20 },
      },
      candidates: {
        light: { selectedText: '#000000', unselectedText: '#000000', selectedBackground: '#FFFFFF' },
        dark: { selectedText: '#ffffff', unselectedText: '#ffffff', selectedBackground: '#D1D1D165' },
      },
      panels: {
        light: { foreground: '#000000' },
        dark: { foreground: '#FFFFFF' },
      },
    },
  },
  
  # ===== 配色使用說明 =====
  # 
  # 【統一配色系統】
  # • enableCustomColors：控制所有自訂配色（按鍵背景、文字顏色、介面元素等）
  #
  # 【顏色格式】
  # • HEX格式：'#FFFFFF'（白色）、'#FF0000'（紅色）
  # • RGBA格式：'#FFFFFF80'（白色50%透明）
  # • 透明度值：00（完全透明）到 FF（完全不透明）
  #   常用透明度：10（6%）、20（12%）、40（25%）、80（50%）、C0（75%）、E0（88%）
  # 
  # 【字號設定】
  # • 字號單位為 pt（點）
  # • 建議範圍：10-30pt
  # • 常用字號：12（小）、14（中）、16（中大）、18（大）、24（特大）
  # 
  # 【主題支援】
  # • light：亮色主題配色
  # • dark：暗色主題配色
  # 
  # ===== 配色區域說明 =====
  # 
  # 【主鍵盤配色 keyboardColors】
  # • letterNumberKeys：字母鍵 A-Z、數字鍵 0-9（空白鍵背景色跟隨此設定）
  # • systemKeys：系統功能鍵（Shift、Delete 等，不含空白鍵和 Return 鍵）
  # • accentKeys：Return 鍵等主題色按鈕
  # • spaceKeyText：空白鍵文字（字色和字號，背景色跟隨字母鍵）
  # • englishKeyboard：英文鍵盤大小寫字母
  # • background：鍵盤整體背景
  # • shadow：按鍵陰影邊緣
  # 
  # 【特殊鍵盤配色 specialKeyboards】
  # • numericKeyboard：數字鍵盤的數字 0-9
  # • symbolKeyboard：符號鍵盤左右兩側面板
  # 
  # 【互動提示配色 interactionColors】
  # • swipeHints：上滑/下滑提示文字
  # • bubbles：長按氣泡、滑動氣泡文字
  # 
  # 【介面元素配色 interfaceColors】
  # • toolbar：工具列按鈕文字和符號
  # • candidates：候選字區域
  # • panels：浮動面板按鍵
  # 
  # ===== 字號配置說明 =====
  # 
  # 【可自訂字號】
  # • letterNumberKeys.fontSize.primary：數字鍵、大寫字母（21pt）
  # • letterNumberKeys.fontSize.lowercase：小寫字母，中英文統一（23pt）
  # • systemKeys.fontSize：系統功能鍵（16pt）
  # • accentKeys.fontSize：Return 鍵等主題色按鈕（16pt）
  # • spaceKeyText.fontSize：空白鍵文字，中英文統一（14pt）
  # • englishKeyboard.fontSize.lowercase：英文小寫字母（23pt）
  # • englishKeyboard.fontSize.uppercase：英文大寫字母（21pt）
  # • numericKeyboard.fontSize：數字鍵盤數字（24pt）
  # • symbolKeyboard.fontSize：符號鍵盤左側（13pt）、右側（16pt）
  # • swipeHints.fontSize：滑動提示文字（8pt）
  # • toolbar.fontSize：工具列統一字號（20pt）
  # 
  # 【固定字號（不可自訂）】
  # • 數字鍵盤符號區（@%-+）：18pt
  # • 按鍵前景符號：20pt
  # • 預編輯區：17pt
  # • 氣泡文字：長按 20pt，滑動 18pt，符號 12pt
  # • 候選字：由元書 App 介面調整
  #
}