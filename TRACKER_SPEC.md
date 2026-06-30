# TRACKER_SPEC.md

OpenClaw Academy 学习追踪器规范 v1.0

---

## 1. 设计原则

- **机读优先**：核心数据使用 JSON 格式，便于 OpenClaw 解析
- **人读可查**：报告和总结使用 Markdown，User 可直接阅读
- **可版本控制**：纯文本文件，纳入 Git 管理
- **不可变历史**：已完成的记录不得修改（追加新记录代替覆盖）
- **可扩展**：新增字段不破坏已有数据

---

## 2. 目录结构

```
tracker/
├── README.md                       # Tracker 使用说明
│
├── progress/                       # 进度数据（JSON）
│   ├── _schema.json                #   数据模型 schema 定义
│   ├── digital-design.json         #   数字设计课程进度
│   ├── computer-architecture.json  #   计算机体系结构课程进度
│   └── <course-slug>.json          #   每门课程一个文件
│
├── reports/                        # 周报 / 阶段报告（Markdown）
│   ├── weekly-2026-W27.md          #   周报
│   └── phase-foundation.md         #   阶段完成报告
│
├── analytics/                      # 能力分析数据
│   ├── capability-2026-W27.md      #   每周能力分析
│   └── history.md                  #   能力变化历史
│
└── logs/                           # 操作日志（不可变）
    └── <YYYY-MM-DD>.md             #   每日操作日志
```

---

## 3. 数据模型

### 3.1 课程进度文件 schema

文件：`tracker/progress/<course-slug>.json`

```jsonc
{
  "course": "digital-design",           // 课程 slug
  "status": "active",                   // active | paused | completed
  "current_chapter": "03-fsm",          // 当前所在章节 slug（null 表示未开始）
  "started_at": "2026-07-01",           // 课程开始日期
  "updated_at": "2026-07-05T18:30:00",  // 最后更新时间 (ISO 8601)

  "chapters": [
    {
      "slug": "01-combinational-logic",
      "title": "组合逻辑",
      "status": "completed",            // pending | in_progress | completed | skipped
      "started_at": "2026-07-01",
      "completed_at": "2026-07-02",
      "experiments_done": 3,            // 本章完成实验数
      "experiments_total": 3,           // 本章实验总数
      "project_integrated": true,       // 是否集成到长期项目
      "reviewed_by_openclaw": true,     // OpenClaw 是否 Review
      "notes": "组合逻辑基础扎实"         // 可选备注
    }
  ],

  "project_milestones": [
    {
      "slug": "alu-design",
      "title": "ALU 设计",
      "status": "completed",            // pending | in_progress | completed
      "completed_at": "2026-07-03"
    }
  ],

  "metrics": {
    "total_days": 5,                    // 累计学习天数
    "total_experiments": 5,             // 累计完成实验数
    "total_project_milestones": 1,      // 累计完成项目里程碑
    "current_streak": 5                 // 连续学习天数
  }
}
```

### 3.2 章节状态枚举

| 状态 | 含义 | 可变更到 |
|------|------|---------|
| `pending` | 尚未开始 | `in_progress` |
| `in_progress` | 正在学习中 | `completed`, `pending`（暂停回退）|
| `completed` | 已完成学习 | 不可变更（不可变记录） |
| `skipped` | 经 Architect 批准跳过 | 不可变更 |

### 3.3 课程状态枚举

| 状态 | 含义 | 触发条件 |
|------|------|----------|
| `planned` | 已规划，未开始 | Architect 下达课程创建指令 |
| `active` | 正在学习 | User 开始第一章 |
| `paused` | 暂停 | User 暂停学习 |
| `completed` | 全部章节完成 | 所有章节 completed + 最终项目完成 |

---

## 4. 更新规则

### 4.1 更新权限矩阵

| 字段 | Codex | OpenClaw | User | 备注 |
|------|-------|----------|------|------|
| `course.status` | ✗ | ✓ | ✓ | 状态变更 |
| `course.current_chapter` | ✓ | ✗ | ✗ | 由 Codex 在创建章节后设置 |
| `course.started_at` | ✓ | ✗ | ✗ | 课程首次创建时设置 |
| `course.updated_at` | ✓ | ✓ | ✗ | 任何修改时自动更新 |
| `chapter.status` | ✗ | ✓ | ✗ | OpenClaw 根据 User 确认更新 |
| `chapter.experiments_done` | ✗ | ✓ | ✗ | 每日晚间更新 |
| `chapter.project_integrated` | ✗ | ✓ | ✗ | 检查项目代码后有更新 |
| `chapter.reviewed_by_openclaw` | ✗ | ✓ | ✗ | Review 完成后标记 |
| `chapter.notes` | ✗ | ✓ | ✓ | User 可自行添加备注 |
| `project_milestones` | ✓ | ✓ | ✗ | Codex 创建里程碑定义，OpenClaw 更新状态 |
| `metrics` | ✗ | ✓ | ✗ | OpenClaw 每日晚间自动计算 |

### 4.2 更新时机

| 时机 | 更新者 | 更新内容 |
|------|--------|----------|
| 创建新课程时 | Codex | 初始化 JSON 文件 + 填充 chapters 列表 |
| 每日 Morning | OpenClaw | 读取当前状态 |
| 每日 Evening | OpenClaw | 更新 metrics、chapter.status、experiments_done |
| 每章完成时 | OpenClaw | 更新 chapter.completed_at、project_integrated |
| 每周日 | OpenClaw | 生成周报 + 能力分析 |
| 架构调整时 | Codex | 更新 chapters 列表（仅追加，不修改已有记录） |

### 4.3 不可变规则

- 一旦 `chapter.status` 变为 `completed`，该章节记录不可修改
- 每日日志（`logs/`）只追加，不修改
- 历史周报发布后不修改（勘误以新报告形式发布）

---

## 5. 周报规范

### 5.1 文件位置

`tracker/reports/weekly-YYYY-WXX.md`（ISO 周年，如 `weekly-2026-W27.md`）

### 5.2 报告模板

```markdown
# 学习周报 — 2026 年第 27 周

## 本周概要
- 学习天数：X 天
- 完成实验：X 个
- 完成章节：列出
- 项目里程碑：列出

## 各课程进度

### <课程名>
- 当前章节：<章节标题>
- 本周完成：列出完成的内容
- 实验通过率：X/X
- 难点标记：列出

## 下周计划
- 列出目标章节
- 列出目标实验

## 需要关注
- 列出遇到的问题或需要 Architect 介入的事项
```

---

## 6. 能力分析规范

### 6.1 文件位置

`tracker/analytics/capability-YYYY-WXX.md`

### 6.2 评价维度

| 维度 | 数据来源 | 评分方式 |
|------|----------|----------|
| 知识掌握 | 章节 completion 率 | 百分比 |
| 实验能力 | experiments_done / experiments_total | 百分比 |
| 项目能力 | project_milestones 完成率 | 百分比 |
| 学习连续性 | metrics.current_streak | 天数 |
| 学习深度 | 实验 Debug 耗时（User 提供） | 主观 1-5 |
| 薄弱环节 | User 反馈 + 实验失败记录 | 定性 |

### 6.3 能力变化历史

`tracker/analytics/history.md` 以表格记录每周各项指标变化，便于追踪长期趋势。

---

## 7. 迁移与扩展

### 7.1 新增课程

1. 在 `tracker/progress/` 下创建 `<course-slug>.json`
2. 按 schema 填充初始数据
3. 在 `tracker/README.md` 中登记

### 7.2 Schema 变更

- 向后兼容：新字段必须有默认值
- 废弃字段不删除（标记 `_deprecated` 前缀）
- 重大变更时递增 schema 版本号（`_schema.json` 中 `version` 字段）

---

## 8. 操作日志规范

### 8.1 文件位置

`tracker/logs/<YYYY-MM-DD>.md`

### 8.2 日志格式

```markdown
# 操作日志 — 2026-07-01

| 时间 | 操作者 | 操作 | 详情 |
|------|--------|------|------|
| 09:00 | OpenClaw | 制定计划 | 今日目标：完成组合逻辑实验3 |
| 14:30 | Codex | 更新文档 | 修正 knowledge.md 中的真值表错误 |
| 21:00 | OpenClaw | 更新 Tracker | ch01 标记完成 |
```

---

## 9. 修订记录

| 版本 | 日期 | 变更说明 |
|------|------|----------|
| v1.0 | 2026-06-30 | 初始版本，定义数据模型、更新规则、报告规范 |
