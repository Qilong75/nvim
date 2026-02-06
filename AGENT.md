# AI 代理指南

## 项目概述

这是一个基于 **AstroNvim v5** 的 Neovim 配置项目，位于 `~/.config/nvim` 目录。

## 目录结构

```
~/.config/nvim/
├── init.lua              # 主入口文件，引导 lazy.nvim
├── lua/
│   ├── lazy_setup.lua    # lazy.nvim 配置和插件加载顺序
│   ├── community.lua     # AstroCommunity 社区插件导入
│   ├── polish.lua        # 最后执行的自定义 Lua 代码（当前禁用）
│   └── plugins/          # 用户插件配置
│       ├── astrocore.lua # AstroNvim 核心配置
│       ├── astrolsp.lua  # LSP 配置
│       ├── astroui.lua   # UI 配置
│       ├── mason.lua     # Mason 包管理器配置
│       ├── none-ls.lua   # None-ls (null-ls) 配置
│       ├── theme.lua     # 主题配置
│       ├── treesitter.lua# Treesitter 配置
│       └── user.lua      # 用户自定义插件
```

## 插件加载顺序

### 1. 启动阶段 (init.lua)

1. 检查并安装 `lazy.nvim` 插件管理器
2. 将 lazy.nvim 添加到 runtimepath
3. 调用 `require "lazy_setup"` 初始化插件
4. 调用 `require "polish"` 执行后处理

### 2. lazy.nvim 加载顺序 (lazy_setup.lua)

```lua
require("lazy").setup({
  -- 第一优先级：AstroNvim 核心
  { "AstroNvim/AstroNvim", version = "^5", import = "astronvim.plugins" },
  
  -- 第二优先级：社区插件
  { import = "community" },
  
  -- 第三优先级：用户插件
  { import = "plugins" },
})
```

### 3. 禁用的默认插件

为提升性能，以下 Neovim 内置插件被禁用：
- `gzip`
- `netrwPlugin`
- `tarPlugin`
- `tohtml`
- `zipPlugin`

## 插件详情

### 核心框架插件 (AstroNvim 提供)

| 插件 | 说明 |
|------|------|
| `AstroNvim/AstroNvim` | AstroNvim 主框架 |
| `AstroNvim/astrocore` | 核心功能：映射、选项、自动命令 |
| `AstroNvim/astrolsp` | LSP 配置引擎 |
| `AstroNvim/astroui` | UI 配置（颜色、图标、高亮） |

### 主题插件

| 插件 | 说明 | 加载方式 |
|------|------|----------|
| `luisiacc/the-matrix.nvim` | Matrix 黑客帝国主题 | `lazy = false, priority = 1000` |

当前配色方案：`thematrix`

### 用户插件 (user.lua)

| 插件 | 说明 | 加载事件 |
|------|------|----------|
| `andweeb/presence.nvim` | Discord Rich Presence | 默认 |
| `ray-x/lsp_signature.nvim` | 函数签名提示 | `BufRead` |
| `folke/snacks.nvim` | Dashboard 自定义 | 默认 |
| `L3MON4D3/LuaSnip` | 代码片段引擎 | 默认 |
| `windwp/nvim-autopairs` | 自动括号配对 | 默认 |

禁用的插件：
- `max397574/better-escape.nvim`

### 语法与 LSP

| 插件 | 说明 |
|------|------|
| `nvim-treesitter/nvim-treesitter` | 语法高亮和代码解析 |
| `nvimtools/none-ls.nvim` | 格式化和诊断 |

Treesitter 确保安装的解析器：
- `lua`
- `vim`

### AstroCommunity 语言包 (community.lua)

| 语言包 | 说明 |
|--------|------|
| `astrocommunity.pack.lua` | Lua 开发支持 |
| `astrocommunity.pack.go` | Go 开发支持 |

**Go 语言包包含**：
- `gopls` - Go LSP 服务器
- `gofumpt` - Go 代码格式化
- `goimports` - 自动管理 import
- `gomodifytags` - 结构体标签管理
- `impl` - 接口实现生成
- `delve` - Go 调试器
- Treesitter Go 语法支持

### 工具管理 (Mason)

| 插件 | 说明 |
|------|------|
| `WhoIsSethDaniel/mason-tool-installer.nvim` | 自动安装 Mason 包 |

Mason 确保安装的工具：
- `lua-language-server` - Lua LSP
- `stylua` - Lua 格式化
- `debugpy` - Python 调试器
- `tree-sitter-cli` - Tree-sitter CLI

## 关键配置

### Leader 键
- `mapleader = " "` (空格)
- `maplocalleader = ","`

### LSP 功能
- CodeLens: 启用
- Inlay Hints: 禁用
- Semantic Tokens: 启用
- Format on Save: 启用

### 编辑器选项
- 相对行号: 启用
- 绝对行号: 启用
- 自动换行: 禁用
- 拼写检查: 禁用

## 开发规范

### 代码风格

- 使用 Lua 语言编写配置
- 遵循 Neovim Lua API 规范
- 保持代码简洁、模块化

### 插件管理

- 使用 lazy.nvim 作为插件管理器
- 插件配置应放在 `lua/plugins/` 目录下
- 每个插件一个文件，便于管理

### 键位映射

- 使用 `<Leader>` 作为主要前缀键（空格）
- 保持键位映射的一致性和可记忆性
- 在配置中添加描述，方便 which-key 显示

## 常用命令

```bash
# 检查 Neovim 健康状态
nvim --headless "+checkhealth" "+qa"

# 启动 Neovim
nvim

# 以最小配置启动（调试用）
nvim --clean

# 同步插件
nvim "+Lazy sync"
```

## 注意事项

- 修改配置后建议重启 Neovim 以确保生效
- 安装新插件后运行 `:Lazy sync`
- 遇到问题时先运行 `:checkhealth` 检查
- 主题优先级设为 1000，确保最先加载

## AI 代理规则

> **重要**: 每次修改此 Neovim 配置时，必须同步更新本文档 (AGENT.md)，包括但不限于：
> - 添加/删除/修改插件
> - 更改键位映射
> - 修改 LSP 配置
> - 更改主题或 UI 设置
> - 修改 Mason 工具列表
> - 任何其他配置变更
>
> 确保文档始终反映当前配置的真实状态。
