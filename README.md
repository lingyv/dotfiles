# 我的`.`配置文件
存放💻中的配置文件, 包括`macOS`和`GNU/Linux`, 用于重装系统或配置新电脑时一键恢复使用环境.

# 文件分类
1. 安装软件的脚本:
- `apt.sh` -> linux分支
- `pacman.sh` -> linux分支
- `brew.sh` -> mac分支

2. 链接配置文件的脚本:
- `bootstrap.sh`

3. 配置`Mac`系统的脚本:
- `.osx`

4. 各种配置文件

# 项目结构
项目主要有`master` `linux` `mac`三个分支, 分别用于设置`linux` `maxOS`系统.
- `master`分支存放所有系统共通的配置文件
- 其他分支基于`master`分支作出相应更改

# 配置文件列表
## 共通:
- .aliases 别名配置
- .bash_profile bash配置文件
- .bashrc bash配置文件
- .curlrc curl配置文件
- .editorconfig 编码规范
- .exports 环境变量
- .functions bash函数
- .gdbinit GDB配置
- .gitconfig git配置文件
- .ideavimrc idea插件IdeaVim配置文件
- .inputrc
- .tern-project YouCompleteMe js补全配置文件
- .tmux.conf.local tmux配置文件, 配合github.com/gpakosz/.tmux.git使用
- .vimrc vim配置文件
- .wgetrc wget配置文件
- .zshrc zsh配置文件
- aria2.conf aria2配置文件
- bootstrap.sh 链接配置文件脚本

## macOS
- .osx 配置macOS系统
- brew.sh 安装软件脚本

## linux
- .i3 i3wm配置文件
- pacman.sh ArchLinux软件安装脚本
- apt.sh Ubuntu软件安装脚本
- redpoint.sh ThinkPad小红点设置脚本
- .Xresources URxvt配置文件
