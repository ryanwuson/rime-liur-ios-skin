// Xiami 蝦米輸入法皮膚 - 慣用右手版本
local config = {
  author: 'Ryan',
  name: '蝦米輸入法',
  pinyin: {
    iPhone: {
      portrait: 'pinyin_26_portrait',
      landscape: 'pinyin_26_landscape',
    },
    iPad: {
      portrait: 'pinyin_26_landscape',
      landscape: 'pinyin_26_landscape',
      floating: 'pinyin_26_portrait',
    },
  },
  alphabetic: {
    iPhone: {
      portrait: 'alphabetic_26_portrait',
      landscape: 'alphabetic_26_landscape',
    },
    iPad: {
      portrait: 'alphabetic_26_landscape',
      landscape: 'alphabetic_26_landscape',
      floating: 'alphabetic_26_portrait',
    },
  },
  numeric: {
    iPhone: {
      portrait: 'numeric_9_portrait',
      landscape: 'numeric_9_landscape',
    },
    iPad: {
      portrait: 'numeric_9_portrait',
      landscape: 'numeric_9_landscape',
      floating: 'numeric_9_portrait',
    },
  },
  symbolic: {
    iPhone: {
      portrait: 'symbolic_portrait',
      landscape: 'symbolic_landscape',
    },
    iPad: {
      portrait: 'symbolic_portrait',
      landscape: 'symbolic_landscape',
      floating: 'symbolic_portrait',
    },
  },
  emoji: {
    iPhone: {
      portrait: 'emoji_portrait',
      landscape: 'emoji_landscape',
    },
    iPad: {
      portrait: 'emoji_portrait',
      landscape: 'emoji_landscape',
      floating: 'emoji_portrait',
    },
  },
  panel: {
    iPhone: {
      portrait: 'panel_portrait',
      landscape: 'panel_landscape',
    },
    iPad: {
      portrait: 'panel_portrait',
      landscape: 'panel_landscape',
      floating: 'panel_portrait',
    },
  },
};

local pinyin = import 'keyboard/pinyin_26.jsonnet';
local alphabetic = import 'keyboard/alphabetic_26.jsonnet';
local numericPortrait = import 'keyboard/numeric_9_portrait.jsonnet';
local numericLandscape = import 'keyboard/numeric_9_landscape.jsonnet';
local symbolicPortrait = import 'keyboard/symbolic_portrait.jsonnet';
local symbolicLandscape = import 'keyboard/symbolic_landscape.jsonnet';
local emojiPortrait = import 'keyboard/emoji_portrait.jsonnet';
local emojiLandscape = import 'keyboard/emoji_landscape.jsonnet';
local panel = import 'keyboard/panel.jsonnet';

// 拼音（中文鍵盤）
local lightPinyinPortrait = pinyin.new('light', 'portrait');
local darkPinyinPortrait = pinyin.new('dark', 'portrait');
local lightPinyinLandscape = pinyin.new('light', 'landscape');
local darkPinyinLandscape = pinyin.new('dark', 'landscape');

// 字母（英文鍵盤）
local lightAlphabeticPortrait = alphabetic.new('light', 'portrait');
local darkAlphabeticPortrait = alphabetic.new('dark', 'portrait');
local lightAlphabeticLandscape = alphabetic.new('light', 'landscape');
local darkAlphabeticLandscape = alphabetic.new('dark', 'landscape');

// 數字鍵盤
local lightNumericPortrait = numericPortrait.new('light');
local darkNumericPortrait = numericPortrait.new('dark');
local lightNumericLandscape = numericLandscape.new('light');
local darkNumericLandscape = numericLandscape.new('dark');

// 符號鍵盤
local lightSymbolicPortrait = symbolicPortrait.new('light');
local darkSymbolicPortrait = symbolicPortrait.new('dark');
local lightSymbolicLandscape = symbolicLandscape.new('light');
local darkSymbolicLandscape = symbolicLandscape.new('dark');

// Emoji 鍵盤
local lightEmojiPortrait = emojiPortrait.new('light');
local darkEmojiPortrait = emojiPortrait.new('dark');
local lightEmojiLandscape = emojiLandscape.new('light');
local darkEmojiLandscape = emojiLandscape.new('dark');

// 面板鍵盤
local lightPanelPortrait = panel.new('light', 'portrait');
local darkPanelPortrait = panel.new('dark', 'portrait');
local lightPanelLandscape = panel.new('light', 'landscape');
local darkPanelLandscape = panel.new('dark', 'landscape');

{
  'config.yaml': std.manifestYamlDoc(config, indent_array_in_object=true, quote_keys=false),

  // 拼音鍵盤
  'light/pinyin_26_portrait.yaml': std.toString(lightPinyinPortrait),
  'dark/pinyin_26_portrait.yaml': std.toString(darkPinyinPortrait),
  'light/pinyin_26_landscape.yaml': std.toString(lightPinyinLandscape),
  'dark/pinyin_26_landscape.yaml': std.toString(darkPinyinLandscape),

  // 字母鍵盤
  'light/alphabetic_26_portrait.yaml': std.toString(lightAlphabeticPortrait),
  'dark/alphabetic_26_portrait.yaml': std.toString(darkAlphabeticPortrait),
  'light/alphabetic_26_landscape.yaml': std.toString(lightAlphabeticLandscape),
  'dark/alphabetic_26_landscape.yaml': std.toString(darkAlphabeticLandscape),

  // 數字鍵盤
  'light/numeric_9_portrait.yaml': std.toString(lightNumericPortrait),
  'dark/numeric_9_portrait.yaml': std.toString(darkNumericPortrait),
  'light/numeric_9_landscape.yaml': std.toString(lightNumericLandscape),
  'dark/numeric_9_landscape.yaml': std.toString(darkNumericLandscape),

  // 符號鍵盤
  'light/symbolic_portrait.yaml': std.toString(lightSymbolicPortrait),
  'dark/symbolic_portrait.yaml': std.toString(darkSymbolicPortrait),
  'light/symbolic_landscape.yaml': std.toString(lightSymbolicLandscape),
  'dark/symbolic_landscape.yaml': std.toString(darkSymbolicLandscape),

  // Emoji 鍵盤
  'light/emoji_portrait.yaml': std.toString(lightEmojiPortrait),
  'dark/emoji_portrait.yaml': std.toString(darkEmojiPortrait),
  'light/emoji_landscape.yaml': std.toString(lightEmojiLandscape),
  'dark/emoji_landscape.yaml': std.toString(darkEmojiLandscape),

  // 面板鍵盤
  'light/panel_portrait.yaml': std.toString(lightPanelPortrait),
  'dark/panel_portrait.yaml': std.toString(darkPanelPortrait),
  'light/panel_landscape.yaml': std.toString(lightPanelLandscape),
  'dark/panel_landscape.yaml': std.toString(darkPanelLandscape),
}
