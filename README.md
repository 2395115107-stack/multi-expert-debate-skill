# multi-expert-debate-skill

多专家辩论技能：围绕一个议题召集 3-12 位立场互补甚至对立的虚拟专家，做结构化分析、正面对抗辩论，收敛为可执行的综合结论。适用于架构选型、产品策略、方案评审等复杂决策。

本仓库同时是一个 **ZCode 插件市场**，下载后无需手动拷贝文件即可安装。

## 安装

### 方式一：ZCode 插件市场（推荐）

1. 下载本仓库（Code → Download ZIP），解压到任意目录
2. 打开 ZCode 的 **插件市场 / Plugin Marketplace**
3. **添加 / Add → 添加插件市场 / Add Plugin Marketplace**，粘贴解压出来的文件夹路径（即包含 `.claude-plugin` 的那层目录）
4. 打开 **个人 / Personal** → 找到 **多专家辩论** → 点击 **安装 / Install**
5. 新建任务，在输入框的技能/插件选择器里选中它即可使用

以后本仓库有更新，重新下载解压后，在 **市场源 → 刷新该市场 → 插件详情 → 更新** 即可升级。

### 方式二：一键脚本（ZCode / Claude Code 通用）

- **Windows**：双击 `install.cmd`
- **macOS / Linux**：`sh install.sh`

脚本会把技能安装到 `~/.agents/skills/multi-expert-debate/` 和 `~/.claude/skills/multi-expert-debate/`，重启客户端生效。

### 方式三：手动复制

把 `multi-expert-debate/skills/multi-expert-debate/` 整个目录复制到你客户端的技能目录（如 ZCode 的 `~/.agents/skills/`、Claude Code 的 `~/.claude/skills/`），目录名保持 `multi-expert-debate` 不变。

## 用法

安装后在对话里说：

- "找几个专家分析一下这个方案"
- "多角度评估一下要不要做 X"
- "组织一场专家辩论：Y"

技能会先 Triage 判断复杂度：简单问题直接回答；中等复杂度走快速版（3-5 位专家陈述 + 综合结论）；重大决策走完整版（8-12 位专家 + 4-6 轮正面对抗辩论）。

## 仓库结构

```
multi-expert-debate-skill/            ← 插件市场根目录（添加市场时粘贴这一层）
├── .claude-plugin/
│   └── marketplace.json              市场清单
├── multi-expert-debate/              插件本体
│   ├── .zcode-plugin/
│   │   └── plugin.json               插件清单
│   └── skills/
│       └── multi-expert-debate/      技能
│           ├── SKILL.md              主流程：Triage → 组团 → 陈述 → 辩论 → 综合结论
│           └── references/
│               └── role-pool.md      170+ 角色池，按领域分组
├── install.cmd / install.sh          一键安装脚本
└── README.md
```

## 更新记录

- 2026-10（2）：打包为 ZCode 插件市场——新增 `.claude-plugin/marketplace.json`、`.zcode-plugin/plugin.json` 和一键安装脚本，支持"下载 → 解压 → 粘贴目录 → 安装"的即用流程。
- 2026-10（1）：按标准 Agent Skills 格式重构——技能移入 `multi-expert-debate/` 目录（目录名与 `name` 一致），角色选择改为以内置角色池为准、不再依赖 `~/.claude/agents/` 本机路径；修正 description 与流程中专家人数不一致的问题。
