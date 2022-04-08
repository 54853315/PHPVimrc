# CRAZYPHPERVIMCONFIG


通过配置，使Vim可以看起来像ide一样开发PHP。

如果喜欢折腾的话，就一起来玩VIM吧。

（图稍后放出）

> 本配置是在macOS（Catalina 10.15.3）下完成的，Vim版本是`VIM -Vi Improved 8.2`，因为用到了YCM，所以使用huge版本。

如果macOS系统自带的vim因各种莫名其妙的原因导致python3支持无法启用的话（尤其是使用了5年以上的macOS，会有无数个python版本），建议使用`brew install vim`。从vim8开始，brew所安装的vim自带python3支持。




- 配置PHP环境
- 安装使用
- 插件配置
  - vim-php
  - YouCompleteMe
  - PHPCD
  - 其他插件

## 配置PHP环境

...

## 安装使用

本配置使用[Vundle](https://github.com/VundleVim/Vundle.vim) 进行包管理：

```bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/plugin/Vundle.vim
wget https://github.com/54853315/CRAZYPHPERVIMCONFIG/blob/master/vimrc/.vimrc > ~/vim/.vimrc

```

打开vim，输入`:PluginInstall`进行安装。


## 插件管理

#### not an editor command: PluginInstall

 你可能把`~/.vim/bundle/`下的文件夹全部清空了，执行`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/plugin/Vundle.vim`来将原有的包进行安装。

### YouCompleteMe 

```
The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM core library not detected; you need to compile YCM before
using it. Follow the instructions in the documentation.
```
 前往插件目录`.vim/bundle/YouCompleteMe`，执行安装命令`./install.py`，等待安装100%，重新进入vim即可。


### PHPCD

装过程中, phpcd.vim 本身会 `composer install` 一次. 若失败请手工 cd 到 phpcd.vim 目录去 执行 `composer install`. 

### TagBar

需要安装依赖[Exuberant Ctags](http://ctags.sourceforge.net/) >= 5.5 ， OS X自带的`ctags`不是Exuberant Ctags，需要使用brew安装。

`brew install ctags-exuberant `

