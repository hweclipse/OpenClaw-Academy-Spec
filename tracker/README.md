# Tracker — 学习追踪器

## 目录说明

| 目录/文件 | 用途 |
|-----------|------|
| `progress/` | 每门课程的进度数据（JSON），机读 |
| `reports/` | 周报、阶段报告（Markdown），人读 |
| `analytics/` | 能力分析数据 |
| `logs/` | 每日操作日志（不可变，只追加） |

## 数据文件

每门课程对应一个 `progress/<course-slug>.json` 文件。

Schema 定义：`progress/_schema.json`。

## 更新权限

| 角色 | 可更新内容 |
|------|-----------|
| Codex | 创建课程进度文件、初始化章节列表 |
| OpenClaw | 更新章节状态、metrics、生成报告 |
| User | 可添加 notes 备注 |

详见 [TRACKER_SPEC.md](../TRACKER_SPEC.md)。
