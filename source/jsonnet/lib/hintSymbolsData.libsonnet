// 長按符號數據 - 蝦米專用
// 邏輯：大寫字母 → 上滑符號 → 下滑符號/功能 → 小寫字母
{
  pinyin: {
    // 第一排 Q~P
    q: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``Q' }, label: { text: 'Q' } },
        { action: { character: '!' }, label: { text: '!' } },
        { action: { sendKeys: "`'01" }, label: { text: '1' } },
        { action: { sendKeys: '``q' }, label: { text: 'q' } },
      ],
    },
    w: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``W' }, label: { text: 'W' } },
        { action: { character: '@' }, label: { text: '@' } },
        { action: { sendKeys: "`'02" }, label: { text: '2' } },
        { action: { sendKeys: '``w' }, label: { text: 'w' } },
      ],
    },
    e: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``E' }, label: { text: 'E' } },
        { action: { character: '#' }, label: { text: '#' } },
        { action: { sendKeys: "`'03" }, label: { text: '3' } },
        { action: { sendKeys: '``e' }, label: { text: 'e' } },
      ],
    },
    r: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``R' }, label: { text: 'R' } },
        { action: { symbol: '$' }, label: { text: '$' } },
        { action: { sendKeys: "`'04" }, label: { text: '4' } },
        { action: { sendKeys: '``r' }, label: { text: 'r' } },
      ],
    },
    t: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``T' }, label: { text: 'T' } },
        { action: { character: '%' }, label: { text: '%' } },
        { action: { sendKeys: "`'05" }, label: { text: '5' } },
        { action: { sendKeys: '``t' }, label: { text: 't' } },
      ],
    },
    y: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``Y' }, label: { text: 'Y' } },
        { action: { symbol: '^' }, label: { text: '^' } },
        { action: { sendKeys: "`'06" }, label: { text: '6' } },
        { action: { sendKeys: '``y' }, label: { text: 'y' } },
      ],
    },
    u: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``U' }, label: { text: 'U' } },
        { action: { character: '&' }, label: { text: '&' } },
        { action: { sendKeys: "`'07" }, label: { text: '7' } },
        { action: { sendKeys: '``u' }, label: { text: 'u' } },
      ],
    },
    i: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``I' }, label: { text: 'I' } },
        { action: { character: '*' }, label: { text: '*' } },
        { action: { sendKeys: "`'08" }, label: { text: '8' } },
        { action: { sendKeys: '``i' }, label: { text: 'i' } },
      ],
    },
    o: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``O' }, label: { text: 'O' } },
        { action: { character: '(' }, label: { text: '(' } },
        { action: { sendKeys: "`'09" }, label: { text: '9' } },
        { action: { sendKeys: '``o' }, label: { text: 'o' } },
      ],
    },
    p: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``P' }, label: { text: 'P' } },
        { action: { character: ')' }, label: { text: ')' } },
        { action: { sendKeys: "`'00" }, label: { text: '0' } },
        { action: { sendKeys: '``p' }, label: { text: 'p' } },
      ],
    },

    // 第二排 A~L
    a: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``A' }, label: { text: 'A' } },
        { action: { character: '`' }, label: { text: '`' } },
        { action: { character: '~' }, label: { text: '~' } },
        { action: { sendKeys: '``a' }, label: { text: 'a' } },
      ],
    },
    s: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``S' }, label: { text: 'S' } },
        { action: { character: '-' }, label: { text: '-' } },
        { action: { character: '_' }, label: { text: '_' } },
        { action: { sendKeys: '``s' }, label: { text: 's' } },
      ],
    },
    d: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``D' }, label: { text: 'D' } },
        { action: { character: '=' }, label: { text: '=' } },
        { action: { character: '+' }, label: { text: '+' } },
        { action: { sendKeys: '``d' }, label: { text: 'd' } },
      ],
    },
    f: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``F' }, label: { text: 'F' } },
        { action: { character: '[' }, label: { text: '[' } },
        { action: { character: '{' }, label: { text: '{' } },
        { action: { sendKeys: '``f' }, label: { text: 'f' } },
      ],
    },
    g: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``G' }, label: { text: 'G' } },
        { action: { character: ']' }, label: { text: ']' } },
        { action: { character: '}' }, label: { text: '}' } },
        { action: { sendKeys: '``g' }, label: { text: 'g' } },
      ],
    },
    h: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``H' }, label: { text: 'H' } },
        { action: { symbol: '\\\\' }, label: { text: '\\\\' } },
        { action: { character: '|' }, label: { text: '|' } },
        { action: { sendKeys: '``h' }, label: { text: 'h' } },
      ],
    },
    j: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``J' }, label: { text: 'J' } },
        { action: { character: '/' }, label: { text: '/' } },
        { action: { symbol: '?' }, label: { text: '?' } },
        { action: { sendKeys: '``j' }, label: { text: 'j' } },
      ],
    },
    k: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``K' }, label: { text: 'K' } },
        { action: { character: ';' }, label: { text: '；' } },
        { action: { symbol: '：' }, label: { text: '：' } },
        { action: { sendKeys: '``k' }, label: { text: 'k' } },
      ],
    },
    l: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``L' }, label: { text: 'L' } },
        { action: { character: "'" }, label: { text: "'" } },
        { action: { character: '"' }, label: { text: '"' } },
        { action: { sendKeys: '``l' }, label: { text: 'l' } },
      ],
    },

    // 第三排 Z~M
    z: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``Z' }, label: { text: 'Z' } },
        { action: { shortcut: '#左手模式' }, label: { systemImageName: 'keyboard.onehanded.left' } },
        { action: { shortcut: '#行首' }, label: { text: '句首' }, fontSize: 13 },
        { action: { sendKeys: '``z' }, label: { text: 'z' } },
      ],
    },
    x: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``X' }, label: { text: 'X' } },
        { action: { symbol: '「' }, label: { text: '「' } },
        { action: { shortcut: '#cut' }, label: { text: '剪下' }, fontSize: 13 },
        { action: { sendKeys: '``x' }, label: { text: 'x' } },
      ],
    },
    c: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``C' }, label: { text: 'C' } },
        { action: { symbol: '」' }, label: { text: '」' } },
        { action: { shortcut: '#copy' }, label: { text: '複製' }, fontSize: 13 },
        { action: { sendKeys: '``c' }, label: { text: 'c' } },
      ],
    },
    v: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``V' }, label: { text: 'V' } },
        { action: { character: '<' }, label: { text: '<' } },
        { action: { shortcut: '#paste' }, label: { text: '貼上' }, fontSize: 13 },
        { action: { sendKeys: '``v' }, label: { text: 'v' } },
      ],
    },
    b: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``B' }, label: { text: 'B' } },
        { action: { character: '>' }, label: { text: '>' } },
        { action: 'tab', label: { text: 'Tab' }, fontSize: 13 },
        { action: { sendKeys: '``b' }, label: { text: 'b' } },
      ],
    },
    n: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``N' }, label: { text: 'N' } },
        { action: { shortcut: '#次选上屏' }, label: { text: '2nd' }, fontSize: 13 },
        { action: { shortcut: '#selectText' }, label: { text: '全選' }, fontSize: 13 },
        { action: { sendKeys: '``n' }, label: { text: 'n' } },
      ],
    },
    m: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``M' }, label: { text: 'M' } },
        { action: { shortcut: '#三选上屏' }, label: { text: '3rd' }, fontSize: 13 },
        { action: { shortcut: '#行尾' }, label: { text: '句尾' }, fontSize: 13 },
        { action: { sendKeys: '``m' }, label: { text: 'm' } },
      ],
    },
    // 逗號鍵長按：時間、日期、中文、民國、日本
    comma: {
      selectedIndex: 0,
      size: { width: 40, height: 53 },
      list: [
        { action: { sendKeys: '``/01' }, label: { text: '時間' }, fontSize: 14 },
        { action: { sendKeys: '``/02' }, label: { text: '日期' }, fontSize: 14 },
        { action: { sendKeys: '``/03' }, label: { text: '中文' }, fontSize: 14 },
        { action: { sendKeys: '``/04' }, label: { text: '民國' }, fontSize: 14 },
        { action: { sendKeys: '``/05' }, label: { text: '日本' }, fontSize: 14 },
      ],
    },
    // 句號鍵長按：英文、農曆、組合、時區、節氣
    period: {
      selectedIndex: 4,
      size: { width: 40, height: 53 },
      list: [
        { action: { sendKeys: '``/06' }, label: { text: '英文' }, fontSize: 14 },
        { action: { sendKeys: '``/07' }, label: { text: '農曆' }, fontSize: 14 },
        { action: { sendKeys: '``/08' }, label: { text: '組合' }, fontSize: 14 },
        { action: { sendKeys: '``/09' }, label: { text: '時區' }, fontSize: 14 },
        { action: { sendKeys: '``/10' }, label: { text: '節氣' }, fontSize: 14 },
      ],
    },
  },

  // 英文鍵盤版本 - 使用半形符號和 symbol action
  alphabetic: {
    // 第一排 Q~P
    q: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``Q' }, label: { text: 'Q' } },
        { action: { symbol: '!' }, label: { text: '!' } },
        { action: { sendKeys: "`'01" }, label: { text: '1' } },
        { action: { sendKeys: '``q' }, label: { text: 'q' } },
      ],
    },
    w: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``W' }, label: { text: 'W' } },
        { action: { symbol: '@' }, label: { text: '@' } },
        { action: { sendKeys: "`'02" }, label: { text: '2' } },
        { action: { sendKeys: '``w' }, label: { text: 'w' } },
      ],
    },
    e: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``E' }, label: { text: 'E' } },
        { action: { symbol: '#' }, label: { text: '#' } },
        { action: { sendKeys: "`'03" }, label: { text: '3' } },
        { action: { sendKeys: '``e' }, label: { text: 'e' } },
      ],
    },
    r: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``R' }, label: { text: 'R' } },
        { action: { symbol: '$' }, label: { text: '$' } },
        { action: { sendKeys: "`'04" }, label: { text: '4' } },
        { action: { sendKeys: '``r' }, label: { text: 'r' } },
      ],
    },
    t: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``T' }, label: { text: 'T' } },
        { action: { symbol: '%' }, label: { text: '%' } },
        { action: { sendKeys: "`'05" }, label: { text: '5' } },
        { action: { sendKeys: '``t' }, label: { text: 't' } },
      ],
    },
    y: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``Y' }, label: { text: 'Y' } },
        { action: { symbol: '^' }, label: { text: '^' } },
        { action: { sendKeys: "`'06" }, label: { text: '6' } },
        { action: { sendKeys: '``y' }, label: { text: 'y' } },
      ],
    },
    u: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``U' }, label: { text: 'U' } },
        { action: { symbol: '&' }, label: { text: '&' } },
        { action: { sendKeys: "`'07" }, label: { text: '7' } },
        { action: { sendKeys: '``u' }, label: { text: 'u' } },
      ],
    },
    i: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``I' }, label: { text: 'I' } },
        { action: { symbol: '*' }, label: { text: '*' } },
        { action: { sendKeys: "`'08" }, label: { text: '8' } },
        { action: { sendKeys: '``i' }, label: { text: 'i' } },
      ],
    },
    o: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``O' }, label: { text: 'O' } },
        { action: { symbol: '(' }, label: { text: '(' } },
        { action: { sendKeys: "`'09" }, label: { text: '9' } },
        { action: { sendKeys: '``o' }, label: { text: 'o' } },
      ],
    },
    p: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``P' }, label: { text: 'P' } },
        { action: { symbol: ')' }, label: { text: ')' } },
        { action: { sendKeys: "`'00" }, label: { text: '0' } },
        { action: { sendKeys: '``p' }, label: { text: 'p' } },
      ],
    },

    // 第二排 A~L
    a: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``A' }, label: { text: 'A' } },
        { action: { symbol: '`' }, label: { text: '`' } },
        { action: { symbol: '~' }, label: { text: '~' } },
        { action: { sendKeys: '``a' }, label: { text: 'a' } },
      ],
    },
    s: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``S' }, label: { text: 'S' } },
        { action: { symbol: '-' }, label: { text: '-' } },
        { action: { symbol: '_' }, label: { text: '_' } },
        { action: { sendKeys: '``s' }, label: { text: 's' } },
      ],
    },
    d: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``D' }, label: { text: 'D' } },
        { action: { symbol: '=' }, label: { text: '=' } },
        { action: { symbol: '+' }, label: { text: '+' } },
        { action: { sendKeys: '``d' }, label: { text: 'd' } },
      ],
    },
    f: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``F' }, label: { text: 'F' } },
        { action: { symbol: '[' }, label: { text: '[' } },
        { action: { symbol: '{' }, label: { text: '{' } },
        { action: { sendKeys: '``f' }, label: { text: 'f' } },
      ],
    },
    g: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``G' }, label: { text: 'G' } },
        { action: { symbol: ']' }, label: { text: ']' } },
        { action: { symbol: '}' }, label: { text: '}' } },
        { action: { sendKeys: '``g' }, label: { text: 'g' } },
      ],
    },
    h: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``H' }, label: { text: 'H' } },
        { action: { symbol: '\\\\' }, label: { text: '\\\\' } },
        { action: { symbol: '|' }, label: { text: '|' } },
        { action: { sendKeys: '``h' }, label: { text: 'h' } },
      ],
    },
    j: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``J' }, label: { text: 'J' } },
        { action: { symbol: '/' }, label: { text: '/' } },
        { action: { symbol: '?' }, label: { text: '?' } },
        { action: { sendKeys: '``j' }, label: { text: 'j' } },
      ],
    },
    k: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``K' }, label: { text: 'K' } },
        { action: { symbol: ';' }, label: { text: ';' } },
        { action: { symbol: ':' }, label: { text: ':' } },
        { action: { sendKeys: '``k' }, label: { text: 'k' } },
      ],
    },
    l: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``L' }, label: { text: 'L' } },
        { action: { symbol: "'" }, label: { text: "'" } },
        { action: { symbol: '"' }, label: { text: '"' } },
        { action: { sendKeys: '``l' }, label: { text: 'l' } },
      ],
    },

    // 第三排 Z~M
    z: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``Z' }, label: { text: 'Z' } },
        { action: { shortcut: '#左手模式' }, label: { systemImageName: 'keyboard.onehanded.left' } },
        { action: { shortcut: '#行首' }, label: { text: '句首' }, fontSize: 13 },
        { action: { sendKeys: '``z' }, label: { text: 'z' } },
      ],
    },
    x: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``X' }, label: { text: 'X' } },
        { action: { symbol: '「' }, label: { text: '「' } },
        { action: { shortcut: '#cut' }, label: { text: '剪下' }, fontSize: 13 },
        { action: { sendKeys: '``x' }, label: { text: 'x' } },
      ],
    },
    c: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``C' }, label: { text: 'C' } },
        { action: { symbol: '」' }, label: { text: '」' } },
        { action: { shortcut: '#copy' }, label: { text: '複製' }, fontSize: 13 },
        { action: { sendKeys: '``c' }, label: { text: 'c' } },
      ],
    },
    v: {
      selectedIndex: 0,
      list: [
        { action: { sendKeys: '``V' }, label: { text: 'V' } },
        { action: { symbol: '<' }, label: { text: '<' } },
        { action: { shortcut: '#paste' }, label: { text: '貼上' }, fontSize: 13 },
        { action: { sendKeys: '``v' }, label: { text: 'v' } },
      ],
    },
    b: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``B' }, label: { text: 'B' } },
        { action: { symbol: '>' }, label: { text: '>' } },
        { action: 'tab', label: { text: 'Tab' }, fontSize: 13 },
        { action: { sendKeys: '``b' }, label: { text: 'b' } },
      ],
    },
    n: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``N' }, label: { text: 'N' } },
        { action: { shortcut: '#次选上屏' }, label: { text: '2nd' }, fontSize: 13 },
        { action: { shortcut: '#selectText' }, label: { text: '全選' }, fontSize: 13 },
        { action: { sendKeys: '``n' }, label: { text: 'n' } },
      ],
    },
    m: {
      selectedIndex: 3,
      list: [
        { action: { sendKeys: '``M' }, label: { text: 'M' } },
        { action: { shortcut: '#三选上屏' }, label: { text: '3rd' }, fontSize: 13 },
        { action: { shortcut: '#行尾' }, label: { text: '句尾' }, fontSize: 13 },
        { action: { sendKeys: '``m' }, label: { text: 'm' } },
      ],
    },
    // 逗號鍵長按：時間、日期、中文、民國、日本
    comma: {
      selectedIndex: 0,
      size: { width: 40, height: 53 },
      list: [
        { action: { sendKeys: '``/01' }, label: { text: '時間' }, fontSize: 14 },
        { action: { sendKeys: '``/02' }, label: { text: '日期' }, fontSize: 14 },
        { action: { sendKeys: '``/03' }, label: { text: '中文' }, fontSize: 14 },
        { action: { sendKeys: '``/04' }, label: { text: '民國' }, fontSize: 14 },
        { action: { sendKeys: '``/05' }, label: { text: '日本' }, fontSize: 14 },
      ],
    },
    // 句號鍵長按：英文、農曆、組合、時區、節氣
    period: {
      selectedIndex: 4,
      size: { width: 40, height: 53 },
      list: [
        { action: { sendKeys: '``/06' }, label: { text: '英文' }, fontSize: 14 },
        { action: { sendKeys: '``/07' }, label: { text: '農曆' }, fontSize: 14 },
        { action: { sendKeys: '``/08' }, label: { text: '組合' }, fontSize: 14 },
        { action: { sendKeys: '``/09' }, label: { text: '時區' }, fontSize: 14 },
        { action: { sendKeys: '``/10' }, label: { text: '節氣' }, fontSize: 14 },
      ],
    },
  },
}