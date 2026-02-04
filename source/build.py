#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
生成 Xiami 皮膚的 YAML 檔案
使用 Python 解析 jsonnet 輸出，避免編碼問題
"""

import subprocess
import json
import os

def main():
    # 切換到 jsonnet 目錄
    script_dir = os.path.dirname(os.path.abspath(__file__))
    jsonnet_dir = os.path.join(script_dir, 'jsonnet')
    
    # 執行 jsonnet
    result = subprocess.run(
        ['jsonnet', 'main.jsonnet'],
        capture_output=True,
        cwd=jsonnet_dir
    )
    
    if result.returncode != 0:
        print(f"jsonnet 執行失敗: {result.stderr.decode('utf-8')}")
        return
    
    # 解析 JSON 輸出
    data = json.loads(result.stdout.decode('utf-8'))
    
    # 寫入檔案
    for filename, content in data.items():
        filepath = os.path.join(script_dir, filename)
        
        # 確保目錄存在
        os.makedirs(os.path.dirname(filepath), exist_ok=True)
        
        # 如果內容是 dict，轉換為 JSON 字串
        if isinstance(content, dict):
            content = json.dumps(content, ensure_ascii=False, indent=2)
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"已生成: {filename}")

if __name__ == '__main__':
    main()
