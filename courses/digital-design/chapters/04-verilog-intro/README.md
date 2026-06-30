# 第 4 章：Verilog 入门

> DDCA Chapter 4: Hardware Description Languages

## 本章目标

- 理解 Verilog 的基本语法结构（module, port, signal）
- 掌握门级建模（gate-level）：`and`, `or`, `not` 原语
- 掌握数据流建模（dataflow）：`assign` 语句和运算符
- 理解 `wire` 和 `reg` 的区别
- 能够编写简单的 Testbench 并分析波形

## 实验

| 编号 | 实验 | 说明 |
|------|------|------|
| E01 | 门级建模 | 用 Verilog 原语描述第 3 章的译码器 |
| E02 | 数据流建模 | 用 `assign` 重写同样的译码器，比较两种风格 |
| E03 | Testbench 入门 | 为译码器编写自验证 Testbench，用 GTKWave 查看波形 |

## 与项目的关系

建立 Verilog 编码习惯，为后续所有 RTL 设计打基础。本章后的所有实验代码均使用 Verilog。
