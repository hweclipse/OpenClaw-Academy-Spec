# Codex Prompt: 生成章节内容

> 使用此 Prompt 向 Codex 下达生成一章课程的指令。

---

## 指令模板

```
请为 Digital Design 课程生成第 {{chapter_number}} 章：{{chapter_title}}。

### 要求

1. 教材参考：DDCA {{ddca_chapter}}。
2. 创建以下文件：
   - chapters/{{chapter_slug}}/knowledge.md — 知识点讲解
   - chapters/{{chapter_slug}}/practice.md — 练习题（含参考答案）
   - chapters/{{chapter_slug}}/experiment.md — 实验指导（{{experiment_count}} 个实验）
3. 创建实验模板代码：
   - chapters/{{chapter_slug}}/code/ — 实验代码模板（含 `// === BEGIN USER CODE ===` 标记）
   - chapters/{{chapter_slug}}/code/ — Testbench 骨架
4. 遵循 COURSE_SPEC.md 中的所有格式规范。
5. 中文讲解，英文保留技术术语。
6. 更新 Tracker（tracker/progress/digital-design.json）中本章的实验总数。

### 禁止

- 不要生成完整课程，只生成这一章。
- 不要在实验模板中填入完整实现（保留 USER CODE 区域）。
- 不要修改 tracker/logs/ 中的历史日志。
```

## 输出

生成完成后，输出变更报告：
- 创建了哪些文件
- 实验清单
- Tracker 更新内容
