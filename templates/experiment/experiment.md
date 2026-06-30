# {{实验编号}} {{实验标题}}

> 此文件为模板。创建新实验时复制并填入实际内容。

---

## 实验目标

{{一句话说明本实验要完成什么}}

## 前置条件

- 已完成章节：{{chapter_slug}}
- 工具链要求：{{toolchain}}

## 背景

{{实验背景知识，与 knowledge.md 互补但不重复}}

## 任务

### 任务 1：{{任务名称}}

**输入规格：**
- {{input_spec_1}}
- {{input_spec_2}}

**输出规格：**
- {{output_spec_1}}
- {{output_spec_2}}

**行为描述：**
{{detailed_behavior}}

**约束条件：**
- {{constraint_1}}
- {{constraint_2}}

### 任务 2：{{任务名称}}
（同上）

## 验收标准

- [ ] 任务 1：Testbench 通过
- [ ] 任务 2：波形正确
- [ ] 代码风格符合 COURSE_SPEC 规范
- [ ] 已在长期项目中集成

## 实验产出

| 文件 | 说明 |
|------|------|
| `code/{{module}}.v` | RTL 实现 |
| `code/tb_{{module}}.v` | Testbench |
| `code/{{module}}_wave.vcd` | 仿真波形 |

## 提示

- {{hint_1}}
- {{hint_2}}

## 常见问题

**Q:** {{question_1}}
**A:** {{answer_1}}
