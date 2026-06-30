# OpenClaw Academy

AI 驱动的个人学习平台 — 持续演进的知识工程。

---

## 这是什么

OpenClaw Academy 不是一个一次性的课程生成器，而是一个**长期维护的学习平台**。

目标：
- 建立个人知识体系
- 建立完整实验体系
- 建立持续学习能力
- 建立 AI 协同学习流程
- 所有学习成果均可持续维护

## 参与者

| 角色 | 身份 | 职责 |
|------|------|------|
| **Architect** | AI 架构师 | 设计课程体系、制定规范、审核产出 |
| **Codex** | AI 课程工程师 | 创建文档、实验、模板、维护 Tracker |
| **OpenClaw** | AI 学习教练 | 制定计划、跟踪进度、输出报告 |
| **User** | 学习者 | 阅读、实验、Debug、思考、提交 |

详见 [AGENTS.md](AGENTS.md)。

## 当前阶段

**Foundation** — 建立平台基础设施。

已创建：
- 规范文档：AGENTS、PROJECT_STRUCTURE、WORKFLOW、TRACKER_SPEC、COURSE_SPEC
- 目录骨架：courses/、templates/、tracker/、integration/、scripts/、prompts/、docs/
- 模板文件：课程大纲、实验文档、Testbench 骨架、模块骨架

尚未开始：课程内容生成。

## 课程蓝图（未来）

- Digital Design → Mini SoC
- Computer Architecture
- FPGA
- Verilog / SystemVerilog
- RISC-V → 完整 CPU
- OpenHarmony → 可运行系统
- ROS2
- Edge AI
- Agent Engineering
- Embodied AI

## 工作流程

```
Architect 设计 → Codex 构建 → User 学习 → OpenClaw 跟踪 → Review → 循环
```

详见 [WORKFLOW.md](WORKFLOW.md)。

## 目录结构

详见 [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)。

## 哲学

- **Documentation First** — 先规范，再课程，最后实验
- **Experiment Driven** — 任何章节不得跳过实验
- **Project Driven** — 所有课程围绕长期项目
- **Incremental Learning** — 逐章推进，禁止一次生成整个课程
- **Small Commit** — 每完成一个实验一次 Commit，每周一个 Tag
- **Continuous Review** — 持续自我审查 + AI 审查

## 许可证

个人学习项目，保留所有权利。
