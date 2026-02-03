#!/bin/bash

# Rime Skin Deployment Script
# 邏輯：
# 1. 確保在 maintenance 分支
# 2. 將 themes/ 內容發佈到 main 分支根目錄
# 3. 將 source/ 內容發佈到 source 分支根目錄
# 4. 回到 maintenance 分支

echo "🚀 開始發佈皮膚 (Maintenance Mode)..."

# 0. 檢查當前分支
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "maintenance" ]; then
    echo "❌ 錯誤：請在 maintenance 分支執行此腳本。"
    exit 1
fi

echo "⚠️  注意：請確保您已經在 maintenance 分支提交 (commit) 了所有變更！"
# 讀秒讓使用者反悔
sleep 2

# ==========================================
# 1. 發佈 Themes -> Main
# ==========================================
echo "------------------------------------------------------"
echo "📦 正在發佈 Themes 到 main 分支..."

git checkout main
# 同步：從 maintenance 分支的 themes 資料夾取出內容覆蓋當前
git checkout maintenance -- themes
# 將 themes/ 下的內容移動到根目錄
cp -r themes/* .
rm -rf themes

# 安全清除 .DS_Store
find . -name ".DS_Store" -delete

# 提交
git add .
if ! git diff-index --quiet HEAD; then
    git commit -m "Auto-deploy themes from maintenance"
    git push origin main
    echo "✅ main 分支已更新"
else
    echo "👌 main 分支無變更"
fi

# ==========================================
# 2. 發佈 Source -> Source
# ==========================================
echo "------------------------------------------------------"
echo "📦 正在發佈 Source 到 source 分支..."

git checkout source
# 同步：從 maintenance 分支的 source 資料夾取出內容覆蓋當前
git checkout maintenance -- source
# 將 source/ 下的內容移動到根目錄
cp -r source/* .
rm -rf source

# 安全清除 .DS_Store
find . -name ".DS_Store" -delete
# 再次確保腳本不被上傳（雖然已經刪了）
rm -f publish_skin.sh "蝦米鍵盤增強計畫.md"

# 提交
git add .
if ! git diff-index --quiet HEAD; then
    git commit -m "Auto-deploy source from maintenance"
    git push origin source
    echo "✅ source 分支已更新"
else
    echo "👌 source 分支無變更"
fi

# ==========================================
# 3. 收尾
# ==========================================
echo "------------------------------------------------------"
echo "🔄 返回 maintenance 分支..."
git checkout maintenance
echo "🎉 全部發佈完成！"
