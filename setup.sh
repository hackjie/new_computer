#!/bin/bash

# macOS 开发环境一键安装脚本
# 包含：Homebrew, iTerm2, Arc浏览器, Raycast, Obsidian, Chrome, VSCode, Cursor, Zed, ChatWise, IINA, 网易云音乐, MacWhisper, uv, Node.js, Oh My Zsh, Folo, 霞鹜文楷字体, Spokenly, 定时更新脚本

# 移除 set -e，让脚本在遇到错误时继续执行而不是退出

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

# 执行命令并处理错误
run_command() {
    local description="$1"
    shift
    echo "🔄 $description..."

    if "$@"; then
        print_status "$description 完成"
        return 0
    else
        print_warning "$description 失败，继续执行..."
        return 1
    fi
}

# 1. 安装 Homebrew
echo "📦 正在检查 Homebrew..."
if ! command -v brew &> /dev/null; then
    if run_command "安装 Homebrew" /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        # 添加 Homebrew 到 PATH
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_status "Homebrew 已安装，跳过"
fi

# 2. 更新 Homebrew
run_command "更新 Homebrew" brew update

# 3. 安装 iTerm2
if ! brew list --cask 2>/dev/null | grep -q iterm2; then
    run_command "安装 iTerm2" brew install --cask iterm2
else
    print_status "iTerm2 已安装，跳过"
fi

# 4. 安装 Arc 浏览器
if ! brew list --cask 2>/dev/null | grep -q arc; then
    run_command "安装 Arc 浏览器" brew install --cask arc
else
    print_status "Arc 浏览器已安装，跳过"
fi

# 5. 安装 Raycast
if ! brew list --cask 2>/dev/null | grep -q raycast; then
    run_command "安装 Raycast" brew install --cask raycast
else
    print_status "Raycast 已安装，跳过"
fi

# 6. 安装 Notion
if ! brew list --cask 2>/dev/null | grep -q notion; then
    run_command "安装 Notion" brew install --cask notion
else
    print_status "Notion 已安装，跳过"
fi

# 7. 安装 Obsidian
if ! brew list --cask 2>/dev/null | grep -q obsidian; then
    run_command "安装 Obsidian" brew install --cask obsidian
else
    print_status "Obsidian 已安装，跳过"
fi

# 8. 安装 Folo
if ! brew list --cask 2>/dev/null | grep -q folo; then
    run_command "安装 Folo" brew install --cask folo
else
    print_status "Folo 已安装，跳过"
fi

# 9. 安装 Google Chrome
if ! brew list --cask 2>/dev/null | grep -q google-chrome; then
    run_command "安装 Google Chrome" brew install --cask google-chrome
else
    print_status "Google Chrome 已安装，跳过"
fi

# 10. 安装 Visual Studio Code
if ! brew list --cask 2>/dev/null | grep -q visual-studio-code; then
    run_command "安装 Visual Studio Code" brew install --cask visual-studio-code
else
    print_status "Visual Studio Code 已安装，跳过"
fi

# 11. 安装 Cursor
if ! brew list --cask 2>/dev/null | grep -q cursor; then
    run_command "安装 Cursor" brew install --cask cursor
else
    print_status "Cursor 已安装，跳过"
fi

# 12. 安装 Zed
if ! brew list --cask 2>/dev/null | grep -q zed; then
    run_command "安装 Zed" brew install --cask zed
else
    print_status "Zed 已安装，跳过"
fi

# 13. 安装 ChatWise
if ! brew list --cask 2>/dev/null | grep -q chatwise; then
    run_command "安装 ChatWise" brew install --cask chatwise
else
    print_status "ChatWise 已安装，跳过"
fi

# 14. 安装 IINA 播放器
if ! brew list --cask 2>/dev/null | grep -q iina; then
    run_command "安装 IINA 播放器" brew install --cask iina
else
    print_status "IINA 播放器已安装，跳过"
fi

# 15. 安装 网易云音乐
if ! brew list --cask 2>/dev/null | grep -q neteasemusic; then
    run_command "安装 网易云音乐" brew install --cask neteasemusic
else
    print_status "网易云音乐已安装，跳过"
fi

# 16. 安装 MacWhisper
if ! brew list --cask 2>/dev/null | grep -q macwhisper; then
    run_command "安装 MacWhisper" brew install --cask macwhisper
else
    print_status "MacWhisper 已安装，跳过"
fi

# 17. 安装 uv (Python 包管理器)
if ! command -v uv &> /dev/null; then
    run_command "安装 uv (Python 包管理器)" brew install uv
else
    print_status "uv 已安装，跳过"
fi

# 18. 安装 Node.js
if ! command -v node &> /dev/null; then
    run_command "安装 Node.js" brew install node
else
    print_status "Node.js 已安装，跳过"
fi

# 19. 安装 Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    run_command "安装 Oh My Zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    print_status "Oh My Zsh 已安装，跳过"
fi

# 20. 安装霞鹜文楷字体
if ! brew list --cask 2>/dev/null | grep -q font-lxgw-wenkai; then
    run_command "安装霞鹜文楷字体" brew install --cask font-lxgw-wenkai
else
    print_status "霞鹜文楷字体已安装，跳过"
fi

# 21. 安装 Spokenly (语音转文字AI工具)
if ! mas list 2>/dev/null | grep -q "6740315592"; then
    run_command "安装 Spokenly" mas install 6740315592
else
    print_status "Spokenly 已安装，跳过"
fi

# 22. 清理 Homebrew 缓存
run_command "清理 Homebrew 缓存" brew cleanup

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
run_command "设置脚本执行权限" chmod +x "$SCRIPT_PATH"

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
if run_command "卸载现有定时任务" launchctl list | grep -q "com.brew.update" && launchctl unload "$PLIST_PATH" 2>/dev/null; then
    echo "已卸载现有定时任务"
fi

if run_command "加载新的定时任务" launchctl load "$PLIST_PATH"; then
    print_status "Homebrew 定时更新任务配置完成 (每天凌晨2点执行)"
fi

echo ""
echo "💡 建议："
echo "  • 重启终端以使所有更改生效"
echo "  • 首次使用 Cursor 时可能需要登录"
echo "  • 可以根据需要配置各个应用的偏好设置"
echo "  • Homebrew 将在每天凌晨2点自动更新"
echo ""
print_status "安装脚本执行完毕！"
