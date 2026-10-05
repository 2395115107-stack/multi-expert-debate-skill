# multi-expert-debate-skill

多专家辩论技能：围绕一个议题召集 3-12 位立场互补甚至对立的虚拟专家，做结构化分析、正面对抗辩论，收敛为可执行的综合结论。适用于架构选型、产品策略、方案评审等复杂决策。

## 仓库结构

```
multi-expert-debate-skill/
├── README.md                       ← 本文件
└── multi-expert-debate/            ← 技能本体（安装这一整个目录）
    ├── SKILL.md                    主流程：Triage → 组团 → 陈述 → 辩论 → 综合结论
    └── references/
        └── role-pool.md            170+ 角色池，按领域分组
```

## 安装

把 `multi-expert-debate/` 整个目录复制到对应客户端的技能目录：

- **ZCode**：`~/.agents/skills/multi-expert-debate/`
- **Claude Code**：`~/.claude/skills/multi-expert-debate/`
- 其他兼容 Agent Skills 规范的客户端同理（技能目录名需与 SKILL.md frontmatter 的 `name` 一致）

## 用法

安装后在对话里说：

- "找几个专家分析一下这个方案"
- "多角度评估一下要不要做 X"
- "组织一场专家辩论：Y"

技能会先 Triage 判断复杂度：简单问题直接回答；中等复杂度走快速版（3-5 位专家陈述 + 综合结论）；重大决策走完整版（8-12 位专家 + 4-6 轮正面对抗辩论）。

## 更新记录

- 2026-10：按标准 Agent Skills 格式重构——技能移入 `multi-expert-debate/` 目录（目录名与 `name` 一致），`REFERENCE.md` 移至 `references/role-pool.md`，角色选择改为以内置角色池为准、不再依赖 `~/.claude/agents/` 本机路径；修正 description 与流程中专家人数不一致的问题。
