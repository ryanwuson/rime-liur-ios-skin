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

  # ===== 基礎配色系統 =====
  
  customColors: {
    # 啟用自訂配色（false = 使用原版配色）
    enableCustomColors: false,
    
    # 字母鍵配色（Q-P, A-L, Z-M 等26個字母鍵）
    alphabeticButton: {
      light: {
        background: { 
          normal: '#FFFFFF',        # 正常狀態背景色
          highlight: '#ABB0BA'      # 按下狀態背景色
        },
        foreground: { 
          normal: '#000000',        # 正常狀態文字色
          highlight: '#000000'      # 按下狀態文字色
        },
      },
      dark: {
        background: { 
          normal: '#D1D1D165',      # 正常狀態背景色（65為透明度）
          highlight: '#D1D1D624'    # 按下狀態背景色（24為透明度）
        },
        foreground: { 
          normal: '#FFFFFF',        # 正常狀態文字色
          highlight: '#FFFFFF'      # 按下狀態文字色
        },
      },
    },
    
    # 系統功能鍵配色（Shift, Delete, Space, Return 等）
    systemButton: {
      light: {
        background: { 
          normal: '#979faf80',      # 正常狀態背景色（80為透明度）
          highlight: '#FFFFFFE6'    # 按下狀態背景色（E6為透明度）
        },
        foreground: { 
          normal: '#000000',        # 正常狀態文字色
          highlight: '#000000'      # 按下狀態文字色
        },
      },
      dark: {
        background: { 
          normal: '#D1D1D624',      # 正常狀態背景色（24為透明度）
          highlight: '#D1D1D659'    # 按下狀態背景色（59為透明度）
        },
        foreground: { 
          normal: '#FFFFFF',        # 正常狀態文字色
          highlight: '#FFFFFF'      # 按下狀態文字色
        },
      },
    },
    
    # 主題色按鈕配色（Enter 鍵等特殊按鈕）
    colorButton: {
      light: {
        background: { 
          normal: '#979faf80',      # 正常狀態背景色（80為透明度）
          highlight: '#FFFFFFE6'    # 按下狀態背景色（E6為透明度）
        },
        foreground: { 
          normal: '#000000',        # 正常狀態文字色
          highlight: '#000000'      # 按下狀態文字色
        },
      },
      dark: {
        background: { 
          normal: '#D1D1D624',      # 正常狀態背景色（24為透明度）
          highlight: '#D1D1D659'    # 按下狀態背景色（59為透明度）
        },
        foreground: { 
          normal: '#FFFFFF',        # 正常狀態文字色
          highlight: '#FFFFFF'      # 按下狀態文字色
        },
      },
    },
    
    # 鍵盤背景配色
    keyboard: {
      light: {
        background: '#D0D3DA01',    # 鍵盤背景色（01為透明度，幾乎透明）
      },
      dark: {
        background: '#47474701',    # 鍵盤背景色（01為透明度，幾乎透明）
      },
    },
    
    # 滑動提示文字配色與字號
    swipeText: {
      light: {
        upSwipe: '#00000055',       # 上滑提示文字色（黑色55%透明度）
        downSwipe: '#00000055',     # 下滑提示文字色（黑色55%透明度）
      },
      dark: {
        upSwipe: '#FFFFFF55',       # 上滑提示文字色（白色55%透明度）
        downSwipe: '#FFFFFF55',     # 下滑提示文字色（白色55%透明度）
      },
      fontSize: 8,                  # 滑動提示文字大小
    },
    
    # 鍵盤主要文字配色與字號（字母鍵ABCD、數字鍵123、空白鍵提示等）
    keyText: {
      light: {
        primary: '#000000',         # 主要文字色（字母A-Z、數字0-9、空白鍵提示文字）
        secondary: '#666666',       # 次要文字色（保留但目前不使用）
      },
      dark: {
        primary: '#FFFFFF',         # 主要文字色（字母A-Z、數字0-9、空白鍵提示文字）
        secondary: '#CCCCCC',       # 次要文字色（保留但目前不使用）
      },
      primaryFontSize: 21,          # 主要文字大小（字母鍵、數字鍵）
      secondaryFontSize: 14,        # 次要文字大小（空白鍵提示）
    },
    
    # 系統功能鍵文字配色與字號（返回、換行、同音、選定、搜尋等）
    systemKeyText: {
      light: {
        normal: '#000000',          # 系統功能鍵文字色
        highlight: '#000000',       # 按下狀態文字色
      },
      dark: {
        normal: '#FFFFFF',          # 系統功能鍵文字色
        highlight: '#FFFFFF',       # 按下狀態文字色
      },
      fontSize: 16,                 # 系統功能鍵文字大小
    },
    
    # 數字鍵配色與字號（純數字鍵盤）
    numericKeys: {
      light: {
        numbers: '#000000',         # 數字文字色（0-9）
      },
      dark: {
        numbers: '#FFFFFF',         # 數字文字色（0-9）
      },
      numberFontSize: 24,           # 數字字體大小（從參考主題確認為24pt）
    },
    
    # 長按氣泡字號設定
    longPressHint: {
      fontSize: 20,                 # 長按氣泡文字大小
      symbolFontSize: 12,           # 長按氣泡符號大小
    },
    
    # 滑動氣泡字號設定
    swipeHint: {
      fontSize: 18,                 # 滑動氣泡前景文字大小
    },
    
    # 長按符號選單字號設定（hintSymbolsData.libsonnet 使用）
    hintSymbols: {
      actionFontSize: 13,           # 長按符號選單動作文字大小（如「剪下」、「複製」等）
      dateFontSize: 14,             # 長按符號選單日期文字大小（如「時間」、「日期」等）
    },
    
    # 英文鍵盤字號設定
    englishKeyboard: {
      lowercaseFontSize: 23,        # 英文小寫字母字號
      uppercaseFontSize: 21,        # 英文大寫字母字號
      hintFontSize: 26,             # 英文鍵盤提示字號
      spaceFontSize: 15,            # 英文空白鍵文字字號
    },
    
    # 候選字字號設定
    candidates: {
      horizontalIndexFontSize: 12,  # 水平候選字索引字號
      verticalIndexFontSize: 12,    # 垂直候選字索引字號
      textFontSize: 16,             # 候選字文字字號
      commentFontSize: 14,          # 候選字註釋字號
      expandedTextFontSize: 16,     # 展開候選字文字字號
      expandedCommentFontSize: 13,  # 展開候選字註釋字號
    },
    

    
    # 垂直候選控制按鈕字號設定
    verticalCandidateControls: {
      buttonFontSize: 20,           # 垂直候選控制按鈕字號（上下翻頁、返回、退格）
      returnButtonFontSize: 16,     # 垂直候選返回按鈕字號（較小）
    },
  },
  
  # ===== 進階配色系統 =====
  
  advancedColors: {
    # 啟用進階配色（false = 使用原版配色）
    enableAdvancedColors: false,
    
    # 底部邊緣配色（陰影）
    lowerEdge: {
      light: {
        normal: '#9a9c9a',          # 正常狀態底邊緣色（陰影）
        highlight: '#9a9c9a',       # 按下狀態底邊緣色（陰影）
      },
      dark: {
        normal: '#1E1E1E',          # 正常狀態底邊緣色（陰影）
        highlight: '#1D1D1D',       # 按下狀態底邊緣色（陰影）
      },
    },
    
    # 候選字配色
    candidate: {
      light: {
        selectedText: '#000000',    # 選中候選字文字色
        unselectedText: '#000000',  # 未選中候選字文字色
        selectedBackground: '#FFFFFF', # 選中候選字背景色
      },
      dark: {
        selectedText: '#ffffff',    # 選中候選字文字色
        unselectedText: '#ffffff',  # 未選中候選字文字色
        selectedBackground: '#D1D1D165', # 選中候選字背景色（65為透明度）
      },
    },
    
    # 工具列配色與字號
    toolbar: {
      light: {
        textColor: '#000000',       # 工具列文字色（中/英、簡/繁）
        symbolColor: '#666666',     # 工具列符號色
      },
      dark: {
        textColor: '#FFFFFF',       # 工具列文字色（中/英、簡/繁）
        symbolColor: '#CCCCCC',     # 工具列符號色
      },
      textFontSize: 20,             # 工具列文字大小（中/英、簡/繁）
      symbolFontSize: 20,           # 工具列符號大小
    },
    
    # 符號鍵盤配色
    symbolic: {
      light: {
        selectedText: '#000000',    # 選中文字色
        leftBackground: '#979faf80', # 左側背景色（80為透明度）
        leftLowerEdge: '#9a9c9a',   # 左側底邊緣色（陰影）
        rightBackground: '#ffffff', # 右側背景色
        rightLowerEdge: '#88898D40', # 右側底邊緣色（陰影，40為透明度）
      },
      dark: {
        selectedText: '#FFFFFF',    # 選中文字色
        leftBackground: '#D1D1D624', # 左側背景色（24為透明度）
        leftLowerEdge: '#1E1E1E',   # 左側底邊緣色（陰影）
        rightBackground: '#D1D1D165', # 右側背景色（65為透明度）
        rightLowerEdge: '#343941',  # 右側底邊緣色（陰影）
      },
    },
    
    # 面板浮動鍵盤配色
    panel: {
      light: {
        foreground: '#000000',      # 按鍵前景色
      },
      dark: {
        foreground: '#FFFFFF',      # 按鍵前景色
      },
    },
  },
  
  # ===== 配色使用說明 =====
  # 
  # 【開關控制】
  # • enableCustomColors：控制基礎配色（字母鍵、系統鍵、主題鍵、鍵盤背景、滑動提示、按鍵文字、數字鍵）
  # • enableAdvancedColors：控制進階配色（邊緣、候選字、工具列、符號鍵盤等）
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
  # 【配色分類說明】
  # 基礎配色：
  # • alphabeticButton（字母鍵背景）、systemButton（系統鍵背景）、colorButton（主題鍵背景）
  # • keyboard（鍵盤背景）、swipeText（滑動提示文字）、keyText（字母數字文字）
  # • systemKeyText（系統功能鍵文字）、numericKeys（數字鍵）
  # 
  # 進階配色：
  # • lowerEdge（底邊緣陰影）、candidate（候選字）、toolbar（工具列文字和符號）
  # • symbolic（符號鍵盤顏色）、panel（面板）
  # 
  # 【重要配色映射說明】
  # • keyText.primary：字母鍵 A-Z、數字鍵 0-9、數字鍵盤符號區 @%-+、空白鍵提示文字（「蝦米輸入法」、「Easy English」、「English」）
  # • keyText.secondary：空白鍵次要提示文字（保留但目前不使用）
  # • systemKeyText.normal：所有系統功能鍵文字（shift、delete、123、同音、選定、搜尋、返回、換行、鎖定、上下翻頁等）
  # • numericKeys.numbers：數字鍵盤的數字 0-9
  # • swipeText.upSwipe/downSwipe：上滑/下滑提示文字色（已修正為 #00000055 透明度）
  # 
  # 【數字鍵盤符號區說明】
  # • 數字鍵盤符號區（@%-+）使用主要按鍵文字色（keyText.primary）
  # • 如需調整數字鍵盤符號區顏色，請修改 keyText.primary 配色
  # 
  # 【字體與字號配置】
  # • swipeText.fontSize：滑動提示文字大小（8pt）
  # • keyText.primaryFontSize：字母鍵和數字鍵文字大小（A-Z, 0-9）（21pt）
  # • keyText.secondaryFontSize：空白鍵提示文字大小（14pt）
  # • systemKeyText.fontSize：系統功能鍵文字大小（返回、換行、同音、選定、搜尋等）（16pt）
  # • numericKeys.numberFontSize：數字鍵字體大小（0-9）（24pt，已修正）
  # • toolbar.textFontSize：工具列文字大小（中/英、簡/繁）（20pt）
  # • toolbar.symbolFontSize：工具列符號大小（20pt）
  # • longPressHint.fontSize：長按氣泡文字大小（20pt）
  # • longPressHint.symbolFontSize：長按氣泡符號大小（12pt）
  # • swipeHint.fontSize：滑動氣泡前景文字大小（18pt）
  # • hintSymbols.actionFontSize：長按符號選單動作文字大小（如「剪下」、「複製」等）（13pt）
  # • hintSymbols.dateFontSize：長按符號選單日期文字大小（如「時間」、「日期」等）（14pt）
  # • englishKeyboard.lowercaseFontSize：英文小寫字母字號（23pt）
  # • englishKeyboard.uppercaseFontSize：英文大寫字母字號（21pt）
  # • englishKeyboard.hintFontSize：英文鍵盤提示字號（26pt）
  # • englishKeyboard.spaceFontSize：英文空白鍵文字字號（15pt）
  # • candidates.horizontalIndexFontSize：水平候選字索引字號（12pt）
  # • candidates.verticalIndexFontSize：垂直候選字索引字號（12pt）
  # • candidates.textFontSize：候選字文字字號（16pt）
  # • candidates.commentFontSize：候選字註釋字號（14pt）
  # • candidates.expandedTextFontSize：展開候選字文字字號（16pt）
  # • candidates.expandedCommentFontSize：展開候選字註釋字號（13pt）
  # • verticalCandidateControls.buttonFontSize：垂直候選控制按鈕字號（20pt）
  # • verticalCandidateControls.returnButtonFontSize：垂直候選返回按鈕字號（16pt）
  # 
  # 【不可自訂項目】
  # • 數字鍵盤符號區字號：固定為 18pt
  # • 符號鍵盤字號：左側固定為 13pt，右側固定為 16pt
  # • 按鍵前景符號大小：固定為 20pt
  # • 預編輯區字號：固定為 17pt（不開放自訂）
  # 
  # 【不可自訂項目】
  # • 氣泡提示框：使用 hint.png 圖片，無法透過顏色自訂
  # • 長按選單：使用 hint.png 圖片，無法透過顏色自訂
  #
  # 【實用配色範例】
  # 護眼綠色主題：
  #   字母鍵背景 '#E8F5E8'，系統鍵背景 '#D4F1D4'，文字色 '#2E7D32'
  # 深色藍調主題：
  #   字母鍵背景 '#2C3E50'，文字色 '#ECF0F1'，滑動提示 '#BDC3C7'
  # 高對比主題：
  #   字母鍵背景 '#FFFFFF'，文字色 '#000000'，邊緣色 '#333333'
  # 半透明主題：
  #   所有背景色加上透明度 '80'（50%透明）
  # 大字體主題：
  #   primaryFontSize: 22, secondaryFontSize: 18, systemKeyText.fontSize: 20, numberFontSize: 28
  #
}