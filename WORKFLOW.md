# WORKFLOW.md

OpenClaw Academy 工作流程规范 v1.0

---

## 1. 学习模型

所有课程遵循统一的七步学习模型：

```
知识 (Knowledge)
    ↓  阅读知识点文档
练习 (Practice)
    ↓  完成练习题，巩固理解
实验 (Experiment)
    ↓  动手实验，验证理论
项目 (Project)
    ↓  将本章成果集成到长期项目
总结 (Summary)
    ↓  输出本章总结
Review
    ↓  自我审查 + OpenClaw 审查
下一章
```

### 1.1 核心约束

- **任何章节不得跳过实验**
- **实验必须与长期项目关联**（禁止大量互不相关的小实验）
- **一章完成再进入下一章**（增量推进）

---

## 2. 每日工作流

```
┌─────────────────────────────────────┐
│              Morning                 │
├─────────────────────────────────────┤
│ OpenClaw 读取 Tracker               │
│ OpenClaw 制定当日学习计划             │
│ OpenClaw 推送学习任务                 │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│              Daytime                 │
├─────────────────────────────────────┤
│ User 阅读课程文档                     │
│ User 完成实验                         │
│ User Debug + 思考                    │
│ User 提交成果                         │
│ Codex 根据 User 进度更新文档           │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│              Evening                │
├─────────────────────────────────────┤
│ OpenClaw 读取当日学习产出             │
│ OpenClaw 总结学习情况                 │
│ OpenClaw 更新 Tracker 完成状态        │
│ OpenClaw 推送晚间总结                 │
└─────────────────────────────────────┘
```

### 2.1 每日各角色活动

| 时段 | Architect | Codex | OpenClaw | User |
|------|-----------|-------|----------|------|
| Morning | — | — | 制定计划、推送提醒 | 接收计划 |
| Daytime | 审核 Codex 产出（异步） | 维护文档、更新 Tracker（按需） | — | 阅读、实验、Debug、提交 |
| Evening | — | — | 总结、更新状态 | 确认完成状态 |

---

## 3. 每周工作流

```
周一：确定本周学习目标 (OpenClaw + User)
        ↓
周二~周五：阅读 + 实验 (User) / 文档维护 (Codex)
        ↓
周六：项目集成 (User) / Review 准备
        ↓
周日：Review + 输出周报 + 更新 Tracker (OpenClaw)
        ↓
     能力分析 → 建议下周重点
```

### 3.1 每周产出物

| 产出物 | 负责人 | 格式 |
|--------|--------|------|
| 学习周报 | OpenClaw | `tracker/reports/weekly-YYYY-WXX.md` |
| 能力分析 | OpenClaw | `tracker/analytics/capability-YYYY-WXX.md` |
| Tracker 更新 | OpenClaw | `tracker/progress/<course>.json` |
| 变更日志更新 | Codex | `CHANGELOG.md` |

---

## 4. 章节生命周期

一个章节从创建到完成的完整流程：

```
Phase 1: Architect 下达章节设计指令
         ↓
Phase 2: Codex 创建章节目录 + 知识文档 + 实验模板
         ↓  输出变更报告，等待 Architect 审核
         ↓
Phase 3: Architect 审核通过（或驳回修改）
         ↓
Phase 4: User 学习（阅读 → 实验 → Debug）
         ↓
Phase 5: User 提交完成标记
         ↓
Phase 6: OpenClaw Review + 更新 Tracker
         ↓
Phase 7: 章节完成，进入下一章（回到 Phase 1）
```

### 4.1 章节状态机

```
[待设计] → [待开发] → [待审核] → [待学习] → [学习中] → [已完成] → [已 Review]
                                  ↑                      ↓
                                  └── [需修改] ←─────────┘
```

| 状态 | 含义 | 触发者 |
|------|------|--------|
| 待设计 | Architect 尚未下达指令 | — |
| 待开发 | Codex 待创建章节文档 | Architect |
| 待审核 | Codex 已完成，等待 Architect 审核 | Codex |
| 待学习 | 审核通过，User 可以开始学习 | Architect |
| 学习中 | User 正在进行 | User |
| 已完成 | User 提交完成标记 | User |
| 已 Review | OpenClaw 完成 Review | OpenClaw |
| 需修改 | Architect 驳回，Codex 需修改 | Architect |

---

## 5. Agent 协同时序

### 5.1 正常流程（一章的完整协同）

```
Architect:   [设计指令] ────────────────── [审核] ──────── [下章指令]
Codex:               [创建章节] ── [报告] ── [修改?] ── [更新Tracker]
OpenClaw:  [提醒学习] ────────────────────────────── [总结] [周报]
User:                          [阅读] [实验] [Debug] [提交]
```

### 5.2 驳回流程

```
Architect 审核不通过
       ↓
  下达修改指令（指定问题点）
       ↓
  Codex 修改 → 重新提交审核
       ↓
  Architect 再次审核
```

### 5.3 暂停与恢复

```
User 暂停学习
       ↓
OpenClaw 记录暂停点（Tracker 中标记当前章节 + 最后位置）
       ↓
恢复时 OpenClaw 读取暂停点 → 制定恢复计划
```

---

## 6. Review 机制

### 6.1 Review 层级

| Review 类型 | 负责人 | 频率 | 内容 |
|-------------|--------|------|------|
| 实验 Review | User | 每次实验后 | 实验是否通过、理解是否到位 |
| 章节 Review | User + OpenClaw | 每章完成后 | 章节目标是否达成 |
| 每周 Review | OpenClaw | 每周日 | 进度、难点、下周计划 |
| 架构 Review | Architect | 每阶段 | 整体方向是否符合预期 |

### 6.2 Review 检查清单

- [ ] 所有实验是否完成并通过？
- [ ] 项目是否集成本章成果？
- [ ] 知识点是否理解（自查 / 小测验）？
- [ ] Tracker 是否反映真实进度？
- [ ] 是否有遗留问题需要记录？

---

## 7. 阶段流转（项目级）

```
Foundation         ← 当前阶段
    ↓ 基础设施就绪
Curriculum Design  ← Architect 设计课程图谱
    ↓ 课程蓝图批准
Course Generation  ← Codex 逐章生成（增量）
    ↓ 每门课程完成
Integration        ← 跨课程项目集成
    ↓
Maintenance        ← 持续维护 + 新课程
```

每个阶段完成后，Architect 评估并决定是否进入下一阶段。

---

## 8. 修订记录

| 版本 | 日期 | 变更说明 |
|------|------|----------|
| v1.0 | 2026-06-30 | 初始版本，基于 MASTER_PROMPT.md Section 5/6/7 设计 |
