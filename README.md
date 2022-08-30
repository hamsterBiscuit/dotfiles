# .files

My DotFiles for macOS

> 本配置参考 [webpro/dotfiles](https://github.com/webpro/dotfiles)
> 配置，非常感谢。

## 特性

* 使用 Makefile 安装软件

* 使用 dotfiles update 升级全部

* 使用 dotfiles -h 查看帮助

## 软件清单

- [Homebrew](https://brew.sh) (packages: [Brewfile](./install/Brewfile))
- [homebrew-cask](https://github.com/Homebrew/homebrew-cask) (packages: [Caskfile](./install/Caskfile))

## 非自动安装软件清单

- [Raycast](https://raycast.com/extensions/github)
- things
- clashx
- spark
- wooshy
- input source pro
- wooshy
- KeyCastr

## 字体

- [SourceCodePro](https://www.nerdfonts.com/font-downloads)

## 安装软件

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/hamsterBiscuit/dotfiles/main/remote-install.sh`"
```

or

```bash
git clone https://github.com/hamsterBiscuit/dotfiles.git ~/.dotfiles
```

```bash
cd ~/.dotfiles
make
```
