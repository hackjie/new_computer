#!/bin/bash

# macOS Brew 自动更新脚本
# 用于定时更新 Homebrew 和已安装的应用

set -e  # 遇到错误立即退出

# 日志文件路径
LOG_FILE="$HOME/Library/Logs/brew-update.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# 记录日志函数
log_message() {
    echo "[$TIMESTAMP] $1" >> "$LOG_FILE"
    echo "$1"
}

# 检查是否为 macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    log_message "❌ 此脚本仅适用于 macOS 系统"
    exit 1
fi

log_message "🚀 开始自动更新 Homebrew 和应用..."

# 检查 Homebrew 是否已安装
if ! command -v brew &> /dev/null; then
    log_message "❌ Homebrew 未安装，跳过更新"
    exit 1
fi

# 1. 更新 Homebrew 本身
log_message "📦 更新 Homebrew..."
if brew update >> "$LOG_FILE" 2>&1; then
    log_message "✅ Homebrew 更新完成"
else
    log_message "⚠️  Homebrew 更新失败"
fi

# 2. 升级所有已安装的应用
log_message "🔄 升级已安装的应用..."
if brew upgrade >> "$LOG_FILE" 2>&1; then
    log_message "✅ 应用升级完成"
else
    log_message "⚠️  应用升级失败"
fi

# 3. 清理缓存
log_message "🧹 清理缓存..."
if brew cleanup >> "$LOG_FILE" 2>&1; then
    log_message "✅ 缓存清理完成"
else
    log_message "⚠️  缓存清理失败"
fi

# 4. 检查健康状态
log_message "🏥 检查 Homebrew 健康状态..."
if brew doctor >> "$LOG_FILE" 2>&1; then
    log_message "✅ Homebrew 健康检查完成"
else
    log_message "⚠️  发现 Homebrew 健康问题，请查看日志"
fi

# 5. 显示更新摘要
log_message "📊 更新摘要："
brew outdated | head -10 >> "$LOG_FILE"
if [ $(brew outdated | wc -l) -eq 0 ]; then
    log_message "🎉 所有应用都是最新的！"
else
    log_message "📋 还有 $(brew outdated | wc -l) 个应用可以更新"
fi

log_message "✅ Homebrew 自动更新完成"
echo "----------------------------------------" >> "$LOG_FILE"
