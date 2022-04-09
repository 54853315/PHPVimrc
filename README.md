# 熊宝的VIM配置


这份Vim配置适合用来开发PHP,GoLang,Vue,Typescript,React。

如果喜欢折腾的话，就一起来玩VIM吧。

![预览](https://www.crazyphper.com/vim_preview/vim_preview.png)

本配置在macbook Pro M1（`Monterey 12.3`）下完成，Vim版本是`VIM -Vi Improved 8.2`。

请使用`brew install vim` 安装huge版本的VIM。从vim8开始，brew所安装的vim自带python3支持，MacOS自带的VIM可没有真彩支持😯。

# 目录

- 安装使用
- 插件依赖说明
  - YouCompleteMe
  - PHPCD
  - 其他插件


## 安装使用

本配置使用[Vundle](https://github.com/VundleVim/Vundle.vim) 进行包管理：

```bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://github.com/54853315/PHPVimrc/blob/master/vimrc/.vimrc > ~/vim/.vimrc

# 安装MacOS运行YCM所需的依赖 ，其他系统依赖如何安装见https://github.com/ycm-core/YouCompleteMe
brew install cmake python go nodejs

#安装TagBar的依赖
brew install ctags-exuberant 

```

打开vim，输入`:PluginInstall`进行安装。


## 插件依赖说明

### YouCompleteMe 

```
The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM core library not detected; you need to compile YCM before
using it. Follow the instructions in the documentation.
```

 前往插件目录`.vim/bundle/YouCompleteMe`，执行安装命令`/usr/bin/python3  ./install.py --all` ，等待安装100%，重新进入vim即可。

> 强烈建议指定python3的路径！

### PHPCD

装过程中, phpcd.vim 本身会 `composer install` 一次. 若失败请手工 cd 到 phpcd.vim 目录去 执行 `composer install`. 

### TagBar

需要安装依赖[Exuberant Ctags](http://ctags.sourceforge.net/) >= 5.5 ， OS X自带的`ctags`不是Exuberant Ctags，需要使用brew安装。

`brew install ctags-exuberant `

