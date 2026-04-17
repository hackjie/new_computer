# macOS 开发环境一键安装脚本

🚀 一个强大的macOS开发环境自动化安装和维护工具，让你快速搭建完整的开发环境！

## ✨ 功能特性

### 📦 包含的工具
- **包管理器**: Homebrew (macOS包管理器)
- **终端工具**: iTerm2 (高级终端应用)
- **浏览器**: Google Chrome (现代浏览器)
- **生产力工具**: Raycast (强大的启动器), Folo (信息浏览器)
- **笔记工具**: Obsidian (知识管理工具), MWeb Pro (Markdown 写作工具)
- **开发工具**:
  - Visual Studio Code (代码编辑器)
  - Cursor (AI辅助代码编辑器)
  - Android Studio (Android 开发 IDE)
  - Figma (设计工具)
  - SwitchHosts (Hosts 管理工具)
  - yazi (终端文件管理器)
  - Mole (系统清理与卸载)
  - uv (Python包管理器)
  - pnpm (Node.js包管理器)
- **AI工具**: ChatWise (AI聊天机器人), Spokenly (语音转文字AI工具)
- **媒体工具**: IINA (视频播放器), QQ音乐 (音乐播放器)
- **Shell增强**: Oh My Zsh (zsh配置框架), zsh-autosuggestions, zsh-syntax-highlighting
- **字体**: 霞鹜文楷字体 (开源中文字体)
- **自动化维护**: 定时更新功能

### 🤖 智能特性
- ✅ **智能检测**: 自动检测已安装的应用，跳过重复安装
- 🔄 **自动更新**: 每天凌晨2点自动更新Homebrew和所有应用
- 📝 **完整日志**: 详细的执行日志记录
- 🧹 **自动清理**: 安装完成后自动清理缓存
- 🏥 **健康检查**: 包含Homebrew健康状态检查
- 🎯 **错误处理**: 完善的错误处理和提示

## 🚀 快速开始

### 方式一：克隆并运行
```bash
# 克隆仓库
git clone https://github.com/hackjie/new_computer.git
cd new_computer

# 运行安装脚本
./setup.sh
```

## 📋 安装清单

运行脚本后将安装以下应用：

| 类别 | 工具 | 说明 |
|------|------|------|
| 📦 包管理 | Homebrew | macOS包管理器 |
| 🖥️ 终端 | iTerm2 | 高级终端应用 |
| 🌐 浏览器 | Chrome | 现代浏览器 |
| 🔍 生产力 | Raycast, Folo | 启动器和信息工具 |
| 📝 笔记 | Obsidian, MWeb Pro | 知识管理和 Markdown 写作 |
| 💻 编辑器 | VS Code, Cursor | 代码编辑器 |
| 🛠️ 开发 | Android Studio, Figma, SwitchHosts, yazi, Mole | IDE、设计、Hosts、终端文件管理、系统清理 |
| 🤖 AI工具 | ChatWise, Spokenly | AI聊天和语音转文字 |
| 🐍 Python | uv | 现代化Python包管理器 |
| 📦 JavaScript | pnpm | Node.js包管理器 |
| 🎬 媒体 | IINA, QQ音乐 | 视频和音乐播放器 |
| 🔤 字体 | 霞鹜文楷 | 开源中文字体 |
| 🔧 Shell | Oh My Zsh + 插件 | zsh 配置框架及自动补全、语法高亮 |
| ⏰ 自动化 | 定时更新 | 自动维护脚本 |

## 🕐 定时更新功能

脚本会自动配置定时任务，每天凌晨2点执行以下操作：
- 更新Homebrew本身
- 升级所有已安装的应用
- 清理安装缓存
- 执行健康检查
- 生成详细日志

### 查看更新日志
```bash
# 查看最新的更新日志
tail -f ~/Library/Logs/brew-update.log

# 查看特定日期的日志
tail -f ~/Library/Logs/brew-update.log | grep "2024-01-15"
```

### 手动触发更新
```bash
# 手动运行更新脚本
./brew_update.sh
```

## 🎨 自定义配置

### 修改更新时间
编辑 `setup.sh` 中的 `StartCalendarInterval` 配置：
```xml
<key>StartCalendarInterval</key>
<dict>
    <key>Hour</key>
    <integer>2</integer>  <!-- 修改小时 -->
    <key>Minute</key>
    <integer>0</integer>  <!-- 修改分钟 -->
</dict>
```

### 禁用自动更新
```bash
# 停止定时任务
launchctl unload ~/Library/LaunchAgents/com.brew.update.plist

# 重新启用
launchctl load ~/Library/LaunchAgents/com.brew.update.plist
```

### 添加更多工具
在 `setup.sh` 中添加新的安装步骤：
```bash
# 示例：安装其他工具
echo "🔧 正在安装 [工具名]..."
if ! command -v [命令名] &> /dev/null; then
    brew install [工具名]
    print_status "[工具名] 安装完成"
else
    print_status "[工具名] 已安装，跳过"
fi
```

## 📊 日志和监控

### 日志位置
- **安装日志**: 终端输出
- **更新日志**: `~/Library/Logs/brew-update.log`
- **错误日志**: 包含在更新日志中

### 健康检查
脚本会自动运行 `brew doctor` 检查系统健康状态。

## 🔧 故障排除

### 常见问题

**Q: 脚本执行失败？**
A: 确保你有管理员权限，并且网络连接正常。

**Q: 某些应用安装失败？**
A: 检查Homebrew是否正常，尝试手动安装：`brew install [应用名]`

**Q: 定时任务不工作？**
A: 检查launchd状态：`launchctl list | grep brew`

**Q: 如何卸载所有工具？**
```bash
# 停止定时任务
launchctl unload ~/Library/LaunchAgents/com.brew.update.plist

# 卸载应用（谨慎操作）
brew uninstall [应用名]
```

### 调试模式
运行时查看详细输出：
```bash
bash -x ./setup.sh
```

## 🏗️ 项目结构

```
new_computer/
├── setup.sh               # 主安装脚本
├── brew_update.sh         # 定时更新脚本
├── iterm2_profile.plist   # iTerm2 配置文件
└── README.md              # 项目说明
```

## 📈 更新历史

### v1.0.0 (2024-01-XX)
- ✨ 初始版本发布
- 📦 支持12个常用开发工具
- ⏰ 添加定时更新功能
- 📝 完整的日志记录
- 🧹 自动清理功能

## 🤝 贡献指南

欢迎提交Issue和Pull Request！

1. Fork 本仓库
2. 创建特性分支: `git checkout -b feature/amazing-feature`
3. 提交更改: `git commit -m 'Add amazing feature'`
4. 推送分支: `git push origin feature/amazing-feature`
5. 提交Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

感谢所有开源工具的开发者，让我们的开发体验更加美好！

- [Homebrew](https://brew.sh/) - macOS包管理器
- [Oh My Zsh](https://ohmyzsh.org/) - zsh配置框架
- 以及所有包含的优秀工具...

---

## 💡 提示

- 🎯 这个脚本适合新电脑或重置开发环境使用
- 🔄 定时更新会保持你的工具始终最新
- 📚 建议在使用前备份重要数据
- 🚀 享受高效的开发环境！

---

**⭐ 如果这个项目对你有帮助，请给它一个Star！**