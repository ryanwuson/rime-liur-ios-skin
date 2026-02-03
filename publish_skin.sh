#!/bin/bash

# 設定路徑
SRC_DIR="/Users/ryan/Desktop/RIME蝦米備份/元書-蝦米方案/皮膚/蝦米輸入法"
REPO_DIR="/Users/ryan/Desktop/rime-liur-ios-skin"

echo "🚀 開始同步皮膚專案 (Multi-Branch Mode)..."

# 確保在 source 分支
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "source" ]; then
    echo "🔄 切換到 source 分支..."
    git checkout source
fi

# 1. 同步 Source 檔案 (到 source 分支根目錄)
echo "📦 同步 Source 檔案..."
cp -r "$SRC_DIR/jsonnet" "$REPO_DIR/"
cp "$SRC_DIR/config.yaml" "$REPO_DIR/"
cp "$SRC_DIR/demo.png" "$REPO_DIR/"
cp "$SRC_DIR/README.md" "$REPO_DIR/"
# Source 分支不需要 Settings使用說明.md 如果您想保持乾淨

mkdir -p "$REPO_DIR/light/resources"
mkdir -p "$REPO_DIR/dark/resources"
cp -r "$SRC_DIR/light/resources/"* "$REPO_DIR/light/resources/"
cp -r "$SRC_DIR/dark/resources/"* "$REPO_DIR/dark/resources/"
cp "$SRC_DIR/../蝦米鍵盤增強計畫.md" "$REPO_DIR/"

echo "✅ Source 檔案同步完成 (位於 source 分支)！"
echo "------------------------------------------------------"
echo "請執行："
echo "1. git status (檢查變更)"
echo "2. git add . && git commit -m 'update source'"
echo "3. git push origin source"
echo "------------------------------------------------------"
echo "注意：如果您要發佈 .cskin 到 main 分支，請之後執行："
echo "git checkout main"
