# Codex Prompt: 根据 Architect 审核意见修改

> 当 Architect 驳回章节内容时，使用此 Prompt。

---

## 指令模板

```
Architect 对第 {{chapter_number}} 章 {{chapter_title}} 的审核意见如下：

{{architect_feedback}}

请逐项修改，完成后重新提交审核。

### 修改原则

- 优先修改规范和正确性问题（知识点错误、实验设计不合理）
- 其次修改格式问题（不符合 COURSE_SPEC.md）
- 不修改用户已完成的实验代码
- 修改后更新 CHANGELOG.md 中的 [Unreleased] 部分
```

## 输出

修改完成后输出变更对比：
- 每个问题的修改前/修改后
- 修改的文件列表
