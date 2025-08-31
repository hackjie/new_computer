#!/bin/bash

# macOS 开发环境一键安装脚本
# 包含：Homebrew, iTerm2, Arc浏览器, Raycast, Obsidian, Chrome, VSCode, Cursor, Zed, ChatWise, IINA, 网易云音乐, MacWhisper, uv, Node.js, Oh My Zsh, Folo, 霞鹜文楷字体, Spokenly, 定时更新脚本

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

# 6. 安装 Notion
echo "📝 正在安装 Notion..."
if ! brew list --cask | grep -q notion; then
    brew install --cask notion
    print_status "Notion 安装完成"
else
    print_status "Notion 已安装，跳过"
fi

# 7. 安装 Obsidian
echo "📝 正在安装 Obsidian..."
if ! brew list --cask | grep -q obsidian; then
    brew install --cask obsidian
    print_status "Obsidian 安装完成"
else
    print_status "Obsidian 已安装，跳过"
fi

# 8. 安装 Folo
echo "📰 正在安装 Folo..."
if ! brew list --cask | grep -q folo; then
    brew install --cask folo
    print_status "Folo 安装完成"
else
    print_status "Folo 已安装，跳过"
fi

# 9. 安装 Google Chrome
echo "🌐 正在安装 Google Chrome..."
if ! brew list --cask | grep -q google-chrome; then
    brew install --cask google-chrome
    print_status "Google Chrome 安装完成"
else
    print_status "Google Chrome 已安装，跳过"
fi

# 10. 安装 Visual Studio Code
echo "💻 正在安装 Visual Studio Code..."
if ! brew list --cask | grep -q visual-studio-code; then
    brew install --cask visual-studio-code
    print_status "Visual Studio Code 安装完成"
else
    print_status "Visual Studio Code 已安装，跳过"
fi

# 11. 安装 Cursor
echo "🖱️  正在安装 Cursor..."
if ! brew list --cask | grep -q cursor; then
    brew install --cask cursor
    print_status "Cursor 安装完成"
else
    print_status "Cursor 已安装，跳过"
fi

# 12. 安装 Zed
echo "⚡ 正在安装 Zed..."
if ! brew list --cask | grep -q zed; then
    brew install --cask zed
    print_status "Zed 安装完成"
else
    print_status "Zed 已安装，跳过"
fi

# 13. 安装 ChatWise
echo "🤖 正在安装 ChatWise..."
if ! brew list --cask | grep -q chatwise; then
    brew install --cask chatwise
    print_status "ChatWise 安装完成"
else
    print_status "ChatWise 已安装，跳过"
fi

# 14. 安装 IINA 播放器
echo "🎬 正在安装 IINA 播放器..."
if ! brew list --cask | grep -q iina; then
    brew install --cask iina
    print_status "IINA 播放器安装完成"
else
    print_status "IINA 播放器已安装，跳过"
fi

# 15. 安装 网易云音乐
echo "🎵 正在安装 网易云音乐..."
if ! brew list --cask | grep -q neteasemusic; then
    brew install --cask neteasemusic
    print_status "网易云音乐安装完成"
else
    print_status "网易云音乐已安装，跳过"
fi

# 16. 安装 MacWhisper
echo "🎙️  正在安装 MacWhisper..."
if ! brew list --cask | grep -q macwhisper; then
    brew install --cask macwhisper
    print_status "MacWhisper 安装完成"
else
    print_status "MacWhisper 已安装，跳过"
fi

# 17. 安装 uv (Python 包管理器)
echo "🐍 正在安装 uv (Python 包管理器)..."
if ! command -v uv &> /dev/null; then
    brew install uv
    print_status "uv 安装完成"
else
    print_status "uv 已安装，跳过"
fi

# 18. 安装 Node.js
echo "📦 正在安装 Node.js..."
if ! command -v node &> /dev/null; then
    brew install node
    print_status "Node.js 安装完成"
else
    print_status "Node.js 已安装，跳过"
fi

# 19. 安装 Oh My Zsh
echo "🔧 正在安装 Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # 安装 Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_status "Oh My Zsh 安装完成"
else
    print_status "Oh My Zsh 已安装，跳过"
fi

# 20. 安装霞鹜文楷字体
echo "✍️  正在安装霞鹜文楷字体..."
if ! brew list --cask | grep -q font-lxgw-wenkai; then
    brew install --cask font-lxgw-wenkai
    print_status "霞鹜文楷字体安装完成"
else
    print_status "霞鹜文楷字体已安装，跳过"
fi

# 21. 安装 Spokenly (语音转文字AI工具)
echo "🎙️  正在安装 Spokenly..."
if ! mas list | grep -q "6740315592"; then
    mas install 6740315592
    print_status "Spokenly 安装完成"
else
    print_status "Spokenly 已安装，跳过"
fi

# 22. 清理 Homebrew 缓存
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
echo "  • Notion (笔记应用)"
echo "  • Obsidian (笔记应用)"
echo "  • Folo (信息浏览器)"
echo "  • Google Chrome (浏览器)"
echo "  • Visual Studio Code (代码编辑器)"
echo "  • Cursor (AI 代码编辑器)"
echo "  • Zed (高性能代码编辑器)"
echo "  • ChatWise (AI 聊天机器人)"
echo "  • IINA (视频播放器)"
echo "  • 网易云音乐 (音乐播放器)"
echo "  • MacWhisper (语音转文字工具)"
echo "  • uv (Python 包管理器)"
echo "  • Node.js (JavaScript 运行时)"
echo "  • Oh My Zsh (zsh 配置框架)"
echo "  • 霞鹜文楷字体 (开源中文字体)"
echo "  • Spokenly (语音转文字AI工具)"
echo "  • 定时更新脚本 (每天凌晨2点自动更新)"
# 23. 创建定时更新脚本
echo "📝 创建 Homebrew 定时更新脚本..."
SCRIPT_DIR="$HOME/.sh"
SCRIPT_PATH="$SCRIPT_DIR/brew_update.sh"

# 创建脚本目录
mkdir -p "$SCRIPT_DIR"

# 创建 brew_update.sh 脚本
cat > "$SCRIPT_PATH" << 'BREW_EOF'
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
BREW_EOF

# 给脚本添加执行权限
chmod +x "$SCRIPT_PATH"
print_status "Homebrew 定时更新脚本创建完成 ($SCRIPT_PATH)"

# 24. 配置定时更新任务
echo "⏰ 配置 Homebrew 定时更新任务..."

# 定义PLIST路径
PLIST_PATH="$HOME/Library/LaunchAgents/com.brew.update.plist"

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
