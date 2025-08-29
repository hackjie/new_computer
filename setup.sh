#!/bin/bash

# macOS 开发环境一键安装脚本
# 包含：Homebrew, iTerm2, Arc浏览器, Raycast, Obsidian, Chrome, VSCode, Cursor, IINA, uv, Node.js, Oh My Zsh, 定gai

set -e  # 遇到错误立即退出

echo "🚀 开始安装 macOS 开发环境..."

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查是否为 macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${RED}❌ 此脚本仅适用于 macOS 系统${NC}"
    exit 1
fi

# 输出带颜色的消息
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# 1. 安装 Homebrew
echo "📦 正在检查 Homebrew..."
if ! command -v brew &> /dev/null; then
    echo "🔄 正在安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # 添加 Homebrew 到 PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
    print_status "Homebrew 安装完成"
else
    print_status "Homebrew 已安装，跳过"
fi

# 2. 更新 Homebrew
echo "🔄 正在更新 Homebrew..."
brew update
print_status "Homebrew 更新完成"

# 3. 安装 iTerm2
echo "🖥️  正在安装 iTerm2..."
if ! brew list --cask | grep -q iterm2; then
    brew install --cask iterm2
    print_status "iTerm2 安装完成"
else
    print_status "iTerm2 已安装，跳过"
fi

# 4. 安装 Arc 浏览器
echo "🌐 正在安装 Arc 浏览器..."
if ! brew list --cask | grep -q arc; then
    brew install --cask arc
    print_status "Arc 浏览器安装完成"
else
    print_status "Arc 浏览器已安装，跳过"
fi

# 5. 安装 Raycast
echo "🔍 正在安装 Raycast..."
if ! brew list --cask | grep -q raycast; then
    brew install --cask raycast
    print_status "Raycast 安装完成"
else
    print_status "Raycast 已安装，跳过"
fi

# 6. 安装 Obsidian
echo "📝 正在安装 Obsidian..."
if ! brew list --cask | grep -q obsidian; then
    brew install --cask obsidian
    print_status "Obsidian 安装完成"
else
    print_status "Obsidian 已安装，跳过"
fi

# 7. 安装 Google Chrome
echo "🌐 正在安装 Google Chrome..."
if ! brew list --cask | grep -q google-chrome; then
    brew install --cask google-chrome
    print_status "Google Chrome 安装完成"
else
    print_status "Google Chrome 已安装，跳过"
fi

# 8. 安装 Visual Studio Code
echo "💻 正在安装 Visual Studio Code..."
if ! brew list --cask | grep -q visual-studio-code; then
    brew install --cask visual-studio-code
    print_status "Visual Studio Code 安装完成"
else
    print_status "Visual Studio Code 已安装，跳过"
fi

# 9. 安装 Cursor
echo "🖱️  正在安装 Cursor..."
if ! brew list --cask | grep -q cursor; then
    brew install --cask cursor
    print_status "Cursor 安装完成"
else
    print_status "Cursor 已安装，跳过"
fi

# 10. 安装 IINA 播放器
echo "🎬 正在安装 IINA 播放器..."
if ! brew list --cask | grep -q iina; then
    brew install --cask iina
    print_status "IINA 播放器安装完成"
else
    print_status "IINA 播放器已安装，跳过"
fi

# 11. 安装 uv (Python 包管理器)
echo "🐍 正在安装 uv (Python 包管理器)..."
if ! command -v uv &> /dev/null; then
    brew install uv
    print_status "uv 安装完成"
else
    print_status "uv 已安装，跳过"
fi

# 12. 安装 Node.js
echo "📦 正在安装 Node.js..."
if ! command -v node &> /dev/null; then
    brew install node
    print_status "Node.js 安装完成"
else
    print_status "Node.js 已安装，跳过"
fi

# 13. 安装 Oh My Zsh
echo "🔧 正在安装 Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # 安装 Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_status "Oh My Zsh 安装完成"
else
    print_status "Oh My Zsh 已安装，跳过"
fi

# 清理 Homebrew 缓存
echo "🧹 正在清理缓存..."
brew cleanup
print_status "缓存清理完成"

echo ""
echo -e "${GREEN}🎉 所有应用安装完成！${NC}"
echo ""
echo "📋 已安装的应用和配置："
echo "  • Homebrew (包管理器)"
echo "  • iTerm2 (终端)"
echo "  • Arc (浏览器)"
echo "  • Raycast (启动器)"
echo "  • Obsidian (笔记应用)"
echo "  • Google Chrome (浏览器)"
echo "  • Visual Studio Code (代码编辑器)"
echo "  • Cursor (AI 代码编辑器)"
echo "  • IINA (视频播放器)"
echo "  • uv (Python 包管理器)"
echo "  • Node.js (JavaScript 运行时)"
echo "  • Oh My Zsh (zsh 配置框架)"
echo "  • 定时更新 (每天凌晨2点自动更新)"
# 14. 配置定时更新任务
echo "⏰ 配置 Homebrew 定时更新任务..."
PLIST_PATH="$HOME/Library/LaunchAgents/com.brew.update.plist"
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/brew_update.sh"

# 确保 LaunchAgents 目录存在
mkdir -p "$HOME/Library/LaunchAgents"

# 创建 launchd plist 文件
cat > "$PLIST_PATH" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.brew.update</string>
    <key>ProgramArguments</key>
    <array>
        <string>$SCRIPT_PATH</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>2</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
    <key>StandardOutPath</key>
    <string>$HOME/Library/Logs/brew-update.log</string>
    <key>StandardErrorPath</key>
    <string>$HOME/Library/Logs/brew-update.log</string>
    <key>RunAtLoad</key>
    <false/>
</dict>
</plist>
EOF

# 加载 launchd 任务
if launchctl list | grep -q "com.brew.update"; then
    launchctl unload "$PLIST_PATH" 2>/dev/null
fi

launchctl load "$PLIST_PATH"

print_status "Homebrew 定时更新任务配置完成 (每天凌晨2点执行)"

echo ""
echo "💡 建议："
echo "  • 重启终端以使所有更改生效"
echo "  • 首次使用 Cursor 时可能需要登录"
echo "  • 可以根据需要配置各个应用的偏好设置"
echo "  • Homebrew 将在每天凌晨2点自动更新"
echo ""
print_status "安装脚本执行完毕！"
