# PROJECT_STRUCTURE.md

OpenClaw Academy 仓库目录结构规范 v1.0

---

## 1. 设计原则

- **Documentation First**：每个目录必须有明确的用途说明
- **统一结构**：所有课程遵循相同的内部目录模板
- **可扩展**：新课程直接挂载到 `courses/` 下，不影响已有结构
- **分离关注点**：规范、课程、追踪、模板 各自独立

---

## 2. 顶层目录结构

```
OpenClaw-Academy/
│
├── README.md                 # 项目总览
├── MASTER_PROMPT.md          # 项目章程（只读参考）
├── AGENTS.md                 # Agent 角色定义
├── WORKFLOW.md               # 工作流程规范
├── COURSE_SPEC.md            # 课程结构规范
├── TRACKER_SPEC.md           # 学习追踪器规范
├── PROJECT_STRUCTURE.md      # 本文件 — 目录结构规范
├── CHANGELOG.md              # 项目变更日志
│
├── courses/                  # 课程内容
│   ├── digital-design/       #   数字设计
│   ├── computer-architecture/#   计算机体系结构
│   ├── fpga/                 #   FPGA
│   ├── verilog/              #   Verilog / SystemVerilog
│   ├── riscv/                #   RISC-V
│   ├── openharmony/          #   OpenHarmony
│   ├── ros2/                 #   ROS2
│   ├── edge-ai/              #   Edge AI
│   ├── agent-engineering/    #   Agent Engineering
│   └── embodied-ai/          #   Embodied AI
│
├── shared/                   # 跨课程共享资源
│   ├── tools/                #   共享工具链配置
│   ├── libraries/            #   共享库 / IP Core
│   └── references/           #   共享参考文档 / 书单
│
├── tracker/                  # 学习追踪数据
│   ├── progress/             #   进度文件（每门课程一个）
│   ├── reports/              #   周报 / 月报
│   └── analytics/            #   能力分析数据
│
├── integration/              # 跨课程集成项目
│   ├── mini-soc/             #   Mini SoC（Digital Design 最终项目）
│   └── <future-projects>/    #   未来集成项目
│
├── scripts/                  # 自动化脚本
│   ├── setup/                #   环境初始化
│   ├── build/                #   构建脚本
│   └── check/                #   规范性检查
│
├── templates/                # 可复用模板
│   ├── course/               #   课程目录模板
│   ├── experiment/           #   实验文件模板
│   ├── testbench/            #   Testbench 模板
│   └── module/               #   Verilog 模块模板
│
├── prompts/                  # 可复用 AI Prompt
│   ├── codex/                #   Codex 生成指令
│   ├── openclaw/             #   OpenClaw 分析指令
│   └── architect/            #   Architect 设计指令
│
└── docs/                     # 平台级文档
    ├── guides/               #   使用指南
    ├── decisions/            #   架构决策记录 (ADR)
    └── glossary.md           #   术语表
```

---

## 3. 课程内部统一结构

每门课程（`courses/<course-name>/`）必须遵循以下结构：

```
courses/<course-name>/
│
├── README.md                 # 课程概述（前置要求、目标、项目路径）
├── syllabus.md               # 课程大纲（章节列表 + 依赖关系）
│
├── chapters/                 # 章节内容
│   └── <NN>-<chapter-slug>/  #   两位数字编号 + 短名称
│       ├── README.md         #     章节概述
│       ├── knowledge.md      #     知识点讲解
│       ├── practice.md       #     练习题
│       ├── experiment.md     #     实验指导
│       ├── code/             #     代码文件（模板 + 用户完成）
│       ├── assets/           #     章节配图
│       └── review.md         #     章节总结
│
├── project/                  # 课程长期项目
│   ├── README.md             #   项目概述
│   ├── milestones/           #   里程碑定义
│   └── code/                 #   项目代码仓库
│
├── exams/                    # 阶段测试（可选）
│   └── <NN>-<exam-name>.md   #
│
└── assets/                   # 课程级配图
```

### 3.1 章节编号规则

- 使用两位数字：`01-`, `02-`, ..., `99-`
- slug 使用小写英文 + 连字符：`01-combinational-logic`, `02-sequential-logic`
- 章节顺序由编号决定，依赖关系在 `syllabus.md` 中声明

### 3.2 实验文件规则

- 实验模板：`code/<module>_template.v` 或 `code/<module>_template.sv`
- 用户完成：`code/<module>_done.v`（由 User 填写，Codex 不得修改）
- Testbench：`code/tb_<module>.v`
- 脚本：`code/run.sh` 或 `code/Makefile`

---

## 4. 命名规范

### 4.1 目录名

| 规则 | 示例 |
|------|------|
| 顶层目录：小写英文 + 连字符 | `digital-design/`, `agent-engineering/` |
| 章节编号：两位数字 | `01-`, `02-`, `12-` |
| Markdown 文件：小写英文 + 下划线或连字符 | `knowledge.md`, `project-structure.md` |

### 4.2 文件名

| 规则 | 示例 |
|------|------|
| Verilog 模块：snake_case | `alu.v`, `fifo_controller.sv` |
| Testbench：`tb_` 前缀 | `tb_alu.v`, `tb_fifo_controller.sv` |
| 脚本：描述性名称 | `setup_iverilog.sh`, `run_tb.sh` |

### 4.3 分支与 Tag

| 规则 | 示例 |
|------|------|
| 分支：`feature/<描述>` 或 `course/<课程>/<章节>` | `course/verilog/03-fsm` |
| Tag：`v<课程>-<里程碑>` | `vverilog-ch03-complete` |

---

## 5. assets 管理规则

- 所有图片统一放入所属层级的 `assets/` 目录
- 图片命名：`<上下文>-<描述>.<扩展名>`，如 `alu-block-diagram.png`
- 在 Markdown 中引用：相对路径 `assets/alu-block-diagram.png`
- 禁止外部图床链接（确保离线可用）

---

## 6. 扩展规则

当需要新增课程时：

1. Architect 下达新课程指令
2. Codex 在 `courses/` 下创建课程目录（遵循第 3 节的统一结构）
3. 在 Tracker 中注册新课程
4. 在 `courses/README.md` 中更新课程索引（如有）
5. CHANGELOG 记录新增

目录结构本身不做破坏性修改。

---

## 7. 修订记录

| 版本 | 日期 | 变更说明 |
|------|------|----------|
| v1.0 | 2026-06-30 | 初始版本，基于 MASTER_PROMPT.md Section 4 设计 |
